# Getting some info about the dataset
View(GymsharkFb) 

# Installing the packages for SA
install.packages("sentimentr")
library(sentimentr)

# It is very simply :-)
# The sentiment_by() function can be called to calculate the average sentiment score of each review. 
# We define senti as an object that saves the results of SA
gymsenti <- sentiment_by(GymsharkFb$comments) 
View(gymsenti)
# Add the average sentiment score to the data frame 'airbnb2’
GymsharkFb$gymsentiment_score <- gymsenti$ave_sentiment
View(gymsenti)

# Topic Modelling
install.packages("stm")
library(stm)

install.packages("tm")
library(tm)

# Add a rank column based on date
# make sure the "date" column is in a correct date column
GymsharkFb$date <- as.Date(GymsharkFb$date) 
# calculate the rank of date ("min" suggests from the earliest to the latest）
GymsharkFb$date_rank <- rank(GymsharkFb$date, ties.method = "min") 
View(GymsharkFb)

gymprocessed <- textProcessor(GymsharkFb$comments, metadata=GymsharkFb)
gymout <- prepDocuments(gymprocessed$documents, gymprocessed$vocab, gymprocessed$meta)

length(gymout$documents)


gym_tm <- stm(gymout$documents, gymout$vocab, K=4, prevalence=~gymsentiment_score+s(date_rank),
            max.em.its=40, data=gymout$meta, init.type="Spectral")


plot(gym_tm, type="summary") # topic proportions/percentages
# Let’s get the top words in each topic

gym_tm$settings$dim$K #Check how many topics



plot(gym_tm, type="labels", topics=c(1,2,3,4), text.cex=1) 


##########################################
## Topic Modelling (II) - Advanced Analysis ##

findThoughts(gym_tm, texts = as.character(meta$comments), n = 2, topics = 1)$docs[[1]]


# Get the proportions of topics
gymproportion <- as.data.frame(colSums(gym_tm$theta/nrow(gym_tm$theta)))
print(gymproportion)

# Research Question 2: 
# What topics are more negative? What topics are more positive?
# The function estimateEffect() helps to analyse the relationship between
# sentiments and topics
gymprep <- estimateEffect(1:4 ~gymsentiment_score+s(date_rank), gym_tm,
                       meta = gymout$meta, uncertainty = "Global")

View(gymprep)

# plot the results using the plot() function
plot(gymprep, covariate = "gymsentiment_score", topics = c(1:4),
     model = gym_tm, method = "difference",
     cov.value1 = "Postive", cov.value2 = "Negative",
     xlab = "More Negative ... More Positive",
     main = "Effect of content sentiment",
     labeltype = "custom", 
     custom.labels = c('Topic 1', 'Topic 2','Topic 3', 'Topic 4'))




# Research Question 3: How the topic changes over time?
# plot the change for topic 1
plot(gymprep, "date_rank", method = "continuous", topics = c(1:4),
     printlegend = TRUE, xaxt = "n",   ylab = "Topic proportion over time", xlab = "time")

