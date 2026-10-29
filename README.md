# Gymshark Social Media Marketing Analytics

Competitor benchmarking of Gymshark against Nike on Instagram and X (07 Feb – 08 Mar 2026), combining engagement, reach and audience metrics with AI-assisted topic modelling and sentiment analysis in R to understand what customers say about the brand.

📄 **[Read the full report (PDF)](report/Gymshark-Social-Media-Marketing-Analytics-Report.pdf)**

## Business Problem
Compared to Nike, how effective is Gymshark's social media strategy at engaging its audience, and what do customers actually think of the brand?

## Data
- **Platforms:** Instagram and X (Twitter)
- **Period:** 07/02/2026 – 08/03/2026
- **Social media metrics:** followers, follower growth, posts, engagement, reach, impressions, audience demographics and Instagram advertisements, taken from publicly available data
- **Customer feedback:** comments on Gymshark's Instagram posts, used for topic modelling and sentiment analysis
- **Privacy note:** raw comments and usernames are not included in this repository.

## Tools Used
- **Claude AI** to group customer comments into topic themes
- **R** for topic modelling and sentiment analysis, used to verify the AI-generated themes

## Approach
- Defined objectives with KPIs:
  1. marketing impact (engagement, reach)
  2. eWOM (advocate influence and impact)
  3. brand image (sentiment ratio, topic trends)
- Ran a social media audit of both brands (content, posting frequency and purpose) and benchmarked engagement, reach, audience demographics and advertising
- Used Claude AI to group Gymshark's Instagram comments into themes, then verified the results with topic modelling and sentiment analysis in R
- Identified four topics and measured sentiment and topic trends over time:
  1. product fit
  2. positive feedback
  3. gym lifestyle
  4. product demand
- Linked the findings to the objectives, built a SWOT analysis and turned the insights into recommendations

## Key Findings
**1.Engagement and reach**

<p align="center">
  <img src="images/instagram-engagement.png" alt="Total engagement (left) and engagement rate by followers (right)" width="700"><br>
  <em>Total engagement (left) and engagement rate by followers (right)</em>
</p>

- Nike has about 298M Instagram followers vs Gymshark's 8.4M, yet Gymshark's Instagram engagement rate is 0.30% vs Nike's 0.02%
- On X, Gymshark's engagement rate is 0.44% vs Nike's 0.08%, despite 386K followers vs 9.6M
- Gymshark's followers comment more: 14,803 comments vs Nike's 9,247, with comments making up 1.57% of its engagement against 0.77% for Nike

**2.Audience and growth**
- Gymshark gained followers on both platforms while Nike lost them over the period
- Gymshark's audience is concentrated in the UK and aged 18–35, while Nike targets wider European markets and ages 18–65+
- Gymshark ran about 523 Instagram ads vs Nike's 227, relying heavily on image-based formats

**3.Customer sentiment (topic modelling and sentiment analysis)**
- Overall brand sentiment is positive, with "positive feedback" the most positive topic, showing strong eWOM

<p align="center">
  <img src="images/sentiment-analysis.png" alt="Sentiment by topic, from more negative to more positive" width="700"><br>
  <em>Sentiment by topic, from more negative to more positive</em>
</p>
  
- Product fit is the main customer concern, with slightly negative sentiment, followed by gym lifestyle

<p align="center">
  <img src="images/topic-modelling.png" alt="Four customer topics identified from Instagram comments" width="700"><br>
  <em>Four customer topics identified from Instagram comments</em>
</p>

- Product demand is the most discussed topic and rises and falls over time, likely tied to promotions and launches

<p align="center">
  <img src="images/topic-proportion-over-time.png" alt="How topic prevalence changes over time" width="700"><br>
  <em>How topic prevalence changes over time</em>
</p>

## Recommendations
1. **Product-focused content:** publish product reviews, sizing guidance, try-on videos and authentic customer feedback to address the product fit concern
2. **Expand collaborations:** partner with well-known fitness personalities and athletes, as Nike does with Olympic athletes, to widen visibility
3. **Increase global audience:** create region-specific campaigns and content for wider age groups and international markets
4. **Encourage user-generated content:** run fitness challenges and repost customer content to build on strong eWOM
5. **Align content with key events:** tie content to seasonal trends and fitness events to lift engagement

## Repository Structure
```
hotel-customer-satisfaction-r/
├── README.md
├── report/        ← full report
├── script/        ← R code
├── data/          ← Gymshark customer feedback dataset
└── images/        ← charts used in this README
```

## How to Run
1. Install R and RStudio
2. Install the packages used in the script: `[sentimentr, stm, tm]`
3. Download the `GymsharkFb.xlsx` dataset from the source above and keep the file in the `data/` folder
4. Open `script/GymsharkFb.R` in RStudio
5. Check that the file path at the top of the script matches your folder, then run it from top to bottom

## Author
Hashen Rathnayake | [LinkedIn](https://www.linkedin.com/in/hashen-rathnayake-074885207/)
