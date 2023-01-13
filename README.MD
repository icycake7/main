### Final Project Overview

+ Selected topic

	Our selected topic is housing prices in San Francisco, Austin, and Boston. 

+ Reason why topic was selected

	Reason why we selected this topic is because of the current state of the housing market with high interest rates and prices.
	Austin, San Francisco, and Boston are cities with rapid home prices increase plus fast population growth as well.

+ Description of the source of data

	The data source we have consists of scraped data of home listings from craiglist. One of the datasets are csv files from kaggle and they have values like 
	price, number of bedrooms, and sqft.
	
	San Francisco Dataset Source -https://www.kaggle.com/datasets/thedevastator/scraping-apartments-off-of-craigslist-in-san-fra

+ Questions hope to answer with the data

	One of the questions we hope to answer is how accuratelty we can predict future housing prices with our machine learning model.
	How do the prices compare with the different amenities, bedroom number, sqft, location etc.? Also does population affect the housing prices?
	







## Machine Learning

Using a **random forest machine learning model** to predict house prices from the city datasets that were scraped. 

The datasets contained the following features: 
- price
- sqft
- beds
- laundry
- pets
- housing_type
- parking 
- hood_district

**drop the hood_district** and **pets** features as it seemed irrelevant and would only confuse the ML model.

After I had to encode the following features as they contained different categorical data. This step is necessary because the ML model needs to work on **numerical data only** for it to function.
- laundry
- housing_type

Once those features were encoded I added them to original dataframe and dropped the original laundry and housing_type columns as they would be unnecessary at this point.

Next, the data was split into training and testing sets. I split 80% of the given data into training the model and the remaining 20% will be used for testing the model. With these sets we can also determine the model's accuracy.

The reason for using the random forest model was due to its high accuracy score of 96%. Random forest uses multiple independent decision trees in parallel to learn from data and accumulates their predictions for an outcome.
