
# Predicting and Analyzing Rent Prices across the United States

## Project Overview
The rental market has been reshaped by coronavirus over the past few years. With inflation surging, interest rates have sky roketed along with rent. While rental prices all across America are likely to increase over the next coming years, some cities have been impacted more than others. 

We would like to help the average american looking where to rent understand what markets are in his or her price range. We chose 9 different cities - 3 large, 3 midsize, 3 smaller across the US varing in population size based of off the United States Census Bureau. These cities vary from 300,000 population up to 4 million population. From those cities we scraped data of home listings from craigslist and pulled values such as price, number of bedrooms, sqft, bathrooms, etc. We will be using a Machine Learning Model Random Forest Regressor to Weighted Voting Regressor. 

## Questions We Hope to Answer 
* How accurately can we predict future housing prices with our machine learning model.
* How do the prices compare with the different amenities, bedroom number, sqft, location, etc?
* How does population affect the housing prices?

## Communication protocols
### Tools: 
- Slack, Zoom, Google Slides, AWS RDS

### Individual roles:

 #### Dabasebase Management / Integration:
- Pascal, Gabi, Adriana

 #### Machine Learning:
- Victor and Mark

#### Presenatation / Dashboard:
- Pascal, Gabi, Victor, Mark, Adriana 


## Tools
### Databases
* Scraping Tools: Python, Jupyter Notebook, Splinter, BeautifulSoup
* Transforming/Cleaning Tools: Pandas, JSON, Numpy, Jupyter Notebook
* Loading Tools: Jupyter notebook, pgAdmin, AWS RDS

### Machine Learning
* Random Forest Model
* Gradient Boosting Regressor
* Weighted Voting Regressor


### Tableau
* Interactive Elements:
	- Heatmap based on price and city population
	- Map of U.S. showing summary of stats and ML model accuracy etc.


## Databases

![ERD-HousingPrices](ERD-HousingPrices.PNG)

## Data Collections - ETL
### Extraction
We scraped the data of home listings across small to large size US cities from craigslist. Using "thedevastator" as sample model, we then proceeded to scrape 2022-2023 "apartments / housing for rent" data from Los Angeles, Chicago, Houston, Austin,  Boston, San Francisco, Pittsburgh, Chandler and Spokane.

- San Francisco Dataset Source -https://www.kaggle.com/datasets/thedevastator/scraping-apartments-off-of-craigslist-in-san-fra

### Transformation
We cleaned the data using pandas. We Counted the number of amenities in each listing, dropped null rows, ensured there were no duplicates, converted the data types, dropped unimportant information, and exported the cleaned data into csv files. 

### Loading
We hosted the database on AWS RDS and connected it to pgAdmin. Then loaded the clean csv data files into pgAdmin and used SQLAlchemy to create a connection string to the database. 

## Machine Learning Component

### Preprocessing:
- Use Imputer to convert NaN to usable values.
- Encode any remaining categorical variables using dummies or OneHotEncoder.
- Scale the features with StandardScalar

### Feature Selection:
- Drop features that are not strongly correlated with target. Maintain as much non-colinearity as possible.
- Use model-bound methods such as feature importance in Random Forest and Gradient Boosting Regressors.

### Data Split
- Default TrainTestSplit settings were applied to create an 80/20 Train/Test set for the preliminary model.

## Model 1: Random Forest Regressor
### Overview

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

## Model 2: Weighted Voting Regressor



## Presentation

- Link to our presentation https://docs.google.com/presentation/d/1zto2DDfDRc9m0X1drAQJ9eYMI4gCOl_0CfD11_Fj8GU/edit#slide=id.g1cb5c65843b_0_5

- Tableau: "Predicting and Analyzing Rent Prices.twb" file located in the code section under Dashboard.

## Findings

	
