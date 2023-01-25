
# Predicting and Analyzing Rental Prices across the United States

## Project Overview
The rental market has been reshaped by coronavirus over the past few years. With inflation surging, interest rates have sky rocketed along with rent. While rental prices all across the United States are likely to increase over the next coming years, some cities have been impacted more than others. 

We would like to help the average American looking to rent understand what markets are in his or her price range. We chose 9 different cities - 3 large, 3 midsize, 3 small - across the US varying in population size based of off the ![United States Census Bureau](https://www.census.gov/). These cities vary from 300,000 population up to 4 million population. From those cities we scraped data of rental listings from craigslist and pulled values such as price, number of bedrooms, square footage, bathrooms, and various amenities. We will be using two Machine Learning Models to assess our results, namely the Random Forest Regressor and Weighted Voting Regressor Model.

## Questions We Hope to Answer 
* How accurately can we predict future housing prices with our machine learning model?
* How do the prices compare with the different amenities, bedroom numbers, square footage, location, etc.?
* How does population affect rental prices?

## Communication protocols

### Individual roles:

 #### Database Management / Integration:
- Pascal, Gabi, Adriana

 #### Machine Learning Models:
- Victor and Mark

#### Presentation / Dashboard:
- Pascal, Gabi, Victor, Mark, Adriana 


## Tools

### Communication
- Slack, Zoom, Google Slides, AWS RDS

### Databases
* Scraping Tools: Python, Jupyter Notebook, Splinter, BeautifulSoup
* Transforming/Cleaning Tools: Pandas, JSON, NumPy, Jupyter Notebook
* Loading Tools: Jupyter Notebook, pgAdmin, AWS RDS

### Machine Learning
* Random Forest Model
* Gradient Boosting Regressor
* Weighted Voting Regressor


### Tableau
* Interactive Elements:
	- Heatmap based on price and city population
	- Map of U.S. showing summary of stats and ML model accuracy etc.


## Databases

![ERD-HousingPrices.PNG](https://github.com/icycake7/main/blob/main/Database%20-%20Load/ERD-HousingPrices.PNG)

## Data Collections - ETL
### Extraction
We scraped the data of home listings across small to large size US cities from craigslist. Using "thedevastator" as sample model, we then proceeded to scrape 2023 "apartments / housing for rent" data from Los Angeles, Chicago, Houston, Austin, Boston, San Francisco, Pittsburgh, Chandler and Spokane.

- San Francisco Sample Dataset Source -https://www.kaggle.com/datasets/thedevastator/scraping-apartments-off-of-craigslist-in-san-fra

A sample data output created while scraping the city of Los Angeles:

![Los Angles](https://github.com/icycake7/main/blob/main/Database%20-%20Extract/losangeles.png)

### Transformation
We cleaned the data using Jupyter Notebook, pandas, JSON, NumPy, RE, DB_PASSWORD, and from SQLAlchemy - create engine. After that, we counted the null values. Since we were not planning on using neighborhood and it contained many null values, we dropped neighborhood and then dropped all null values. After dropping date and title, we checked which columns needed to be converted. Some datasets contained values that were not integers in bedroom, bathroom, and price so we extracted/dropped those values. Then, we counted the number of amenities in each listing using REGEX and created a new row. We also created a City ID column. Finally, we exported the cleaned data into csv files. 

<img width="569" alt="image" src="https://user-images.githubusercontent.com/110864175/214474270-77cec832-d05e-497e-bc74-ef2cbcd8392b.png">


### Loading
We hosted the database on AWS RDS and connected it to pgAdmin. Then created a script to create all the needed tables. After that, we loaded the clean csv data files into pgAdmin and used SQLAlchemy to create a connection string to the database. 

![script.PNG](https://github.com/icycake7/main/blob/main/Database%20-%20Load/script.PNG)

## Machine Learning Component

### Preprocessing:
- Use Imputer to convert NaN to usable values.

### Feature Selection:
- Drop features that are not strongly correlated with target. Maintain as much non-collinearity as possible.
- Use model-bound methods such as feature importance in Random Forest and Gradient Boosting Regressors.

### Data Split
- Default train_test_split settings were applied to create an 80/20 Train/Test set for the preliminary model.

## Model 1: Random Forest Regressor
### Overview

Using a **random forest machine learning model** to predict rental prices from the city datasets that were scraped.

The datasets contained the following features: 
- sqft
- beds
- amenity_count
- CityID

Our target variable is the price

### Why Use Random Forest Regression Model?

- Random forest is an ensemble of the decision trees. It can be used for both classification and regression tasks.
- Random forest helps avoid overfitting which is one of the key problems with decision tree classifiers.
- The model can handle more types of data (continuous and discrete) that other linear regression models cannot. When I previously ran a linear regression model over the same dataset it was only able to render a R squared score of 16%.
- This type of model is data hungry so the more data included the better it works. Knowing this, we wanted to gather as much rental listing data as possible to train the model. 

Scoring is based off negative mean squared error because we are looking for a positive score. So, the more positive the number the better.
The random forest model had an R squared score of about 87%.

![Screenshot 2023-01-23 at 9 55 45 PM](https://user-images.githubusercontent.com/110702997/214209200-6de8fcdd-bb66-4921-b55c-f20f88e95474.png)



After checking how much each feature correlates to the house rental prices the results were surprising. Each feature had a very low correlation to the rent costs as shown below.

![Screenshot 2023-01-22 at 9 06 24 PM](https://user-images.githubusercontent.com/110702997/213960610-7bce84a0-750d-4031-a102-d17ce2c6d662.png)


### Suggestions to Improve the Machine Learning Model

There could be more specific features that would've improved the model. In the first rough draft of the model, I had used one of San Francisco house prices dataset from Kaggle with about 1,000 rows of data. It had more specific features than the ones we used for our final model. The Kaggle data set had features like: Parking, housing type, laundry, and pets. While we had condensed all those features down to one "amenity_count" feature. The Kaggle data set with the random forest model rendered an R squared score of 96%. Now this could be due to overfitting since only one city was used to train the model. Another factor that should be taken into consideration, that we did not apply, is the location of the house. Location as in whether the house was in a "good" area as in if it’s in close proximity to entertainment, major attractions, etc. We also could have used more data for each city, that would've trained the model better. The final random forest model that used all the city data that we web-scraped rendered an accuracy score of 80%. Although it’s not as high as the 96% of the first model it still does a decent job of predicting the **current** rent prices for the cities that were used to train the model.




### Model 2: Weighted Voting Regressor

## Summary

A Voting Regressor was chosen for evaluation in an attempt to improve accuracy over a single estimator. When a Voting Regressor is constructed with a diverse selection of estimators it may produce lower error than any single estimator within it. This is in part a product of the errors made by the individual estimators themselves. If all the estimators are based on the same processs, such as all linear regression models, the types of errors they make will be similar. If instead a diverse set of estimators is employed the types of errors they make will often be different from eachother. This estimator diversity is the key to constructing a Voting Regressor that outpreforms a single estimator and also provides its robustness.

The default implementation of the Voting Regressor in Scikit-Learn uses the mean of the predictions from each estimator. With the assumption that the importance of each estimator is not equal, a weighted average will be applied.

Several models were tested on the training data using cross validation scores with 15 folds to determine the estimated average mean squared error, the standard deviation, and a 95% confidence interval for the mean squared error for each of the 15 scores produced.

Based on these results, 9 models with the lowest mean and standard deviation of the mean squared error were selected. These models were then iteratively tuned using GridSearchCross Validation. The scores of the models were again calculated.

After fitting the best estimators, weights for the Voting Regressor were calculated by minimizing the mean squared errors for each model’s prediction.

Using these weights and the eight estimators, the Voting Regressor model was initialized and trained on the data. It was scored in the same manner as previous models. The r squared value for the training and testing set were then calculated.

### Data Prep

The data includes information from nine cities grouped into three population classes from different regions of the United States. The target variable was price with features: sqft, bedroom, bathroom, pop_class, cityid.

The price was heavily right tailed and a log transformation was used to create a more gaussian shape.

### Pre log Transform

![pre_log](Machine%20Learning/Voting_Regressor//figs/price.png)

### Post log Transform

![exp_pred](Machine%20Learning/Voting_Regressor//figs/log_price.png)


The square footage data had significant outliers as shown below:

![sqft](Machine%20Learning/Voting_Regressor/figs/sqft.png)

Outliers were determined on the basis of 1.5*IQR + third quartile. Lower outliers were negative. All rows containing outlier were dropped from the data.

The correlation was explored through a heatmap, showing that none of the individual features were able to explain the target.

![co](Machine%20Learning/Voting_Regressor//figs/corr_heatmap.png)

Training and test sets were created using Stratified Shuffle Splitting to control for an equal representation of each city. The sampling error as compared to regular Train Test Split is shown in the following table:

![sampling_error](Machine%20Learning/Voting_Regressor/figs/sampling_error.png)

After removing price, the target variable, the training and testing sets were scaled using a RobustScaler. This was chosen over the StandardScaler due to its robustness to outliers. Although many were already eliminated, the RobustScaler further reduced the impact of outlier values.

### Pre Tuning Models

Several regression models were evaluated. Ideally, the Voting Regressor would combine the results of several diverse models. The majority of the selected models fell into the broad categories of tree based and linear. The scores of each model were stored in a Pandas DataFrame and then sorted by average mean squared error and the standard deviation. The top 8 models from the list were chosen for tuning.

![pre_tune](Machine%20Learning/Voting_Regressor/figs/pre_tune_mse.png)

### Post Tuning Models

The models were tuned using Grid Search Cross Validation and scored as before, an example from the code is shown below:

![exp_pred](Machine%20Learning/Voting_Regressor//figs/grid_search_ex.png)

A DataFrame was again generated from these results.


![post_tune](Machine%20Learning/Voting_Regressor//figs/post_tune_mse.png)

Additionally, the Bias and Variance of each model was estimated. These metrics assist in understanding the bias-variance tradeoff for each of the models.

![post_tune_bias_var](Machine%20Learning/Voting_Regressor//figs/bias_var_final_estimators.png)

### Calculating Weights

The objective function to be minimized is the mean squared error (MSE):

$$Obj = {\left(1\over n \right)\sum_{i=1}^n}\left(y_i - w{y_p}^T\right)^2$$

where:
- $n$ = number of estimators
- $y$ = True value
- $w$ = vector containing the weights
- $y_p$ = matrix of predicted values


Constrained by:
$$\sum_{k=1}^n w_k = 1$$
and
$$w_k > 0$$
## Voting Regressor

The voting Regressor was constructed using the calculated weights and the 9 estimators. It was scored in the same manner and performed better than any of the individual models. 

![vrg_cvscore](Machine%20Learning/Voting_Regressor//figs/mod_eval._pre_red.png)

Additionally, the Bias and Variance were estimated:

![bias_var_pre_reduction](Machine%20Learning/Voting_Regressor//figs/bias_var_pre_reduction.png)


The r squared values were then calculated to estimate the percentage of variation explained by the model.


![r2](Machine%20Learning/Voting_Regressor//figs/vrg_r2_pre_reduction.png)


### Reduction in Model Complexity

Although the MSE and r squared values for the training and test sets were not seperated by a large margin, model complexity was reduced in an attempt to reconcile the scores. Out of the nine original estimators included in the Voting Regressor, the five with the highest weights were kept. The structure of the final model is shown below:

![final_structure](Machine%20Learning/Voting_Regressor//figs/final_vrg_structure.png)

The reduced model includes two decision tree based estimators, a k nearest regressor baseed on clusting, a polynomial kernel support vector regressor, and a linear regressor with L1 weighting.

The performance meterics were as follows:

![mod_eval_post_reduction](Machine%20Learning/Voting_Regressor//figs/mod_eval.png)

Estimated Bias and Variance:

![bias_var_post_reduction](Machine%20Learning/Voting_Regressor//figs/bias_var_post_reduction.png)

r squared values:

![r_2_post_reduction](Machine%20Learning/Voting_Regressor//figs/vrg_r2_with_city.png)

Overall, this model with reduced complexity performed better than the original iteration with nine estimators. Further refinement could yield additional benifits.

### Residual Plot

![residuals](Machine%20Learning/Voting_Regressor//figs/residual_plot.png)

### Estimates of Each Model

![mod_est](Machine%20Learning/Voting_Regressor//figs/pred_vs_avg_with_city.png)


## Presentation

- Google Slides: [Presentation](https://docs.google.com/presentation/d/1zto2DDfDRc9m0X1drAQJ9eYMI4gCOl_0CfD11_Fj8GU/edit#slide=id.g1cb5c65843b_0_5)

- Tableau: [Dashboard](https://public.tableau.com/app/profile/icycake25489/viz/PredictingCurrentHousingPricesintheUS/PredictingCurrentHousingPricesintheUS)

## Findings
1. How accurately can we predict future housing prices with our machine learning model.

![Screenshot 2023-01-24 at 9 04 48 PM](https://user-images.githubusercontent.com/110702997/214471208-e77b34a9-51e0-45d8-9e8a-cab894c0d283.png)
The image above shows that after plugging in the inputs into the random forest regression model (number of bedrooms, sqft, number of bathrooms, number of amenities) then you will get a prediction of the price of the monthly rent of the requirements you are looking for. The random forest model rendered an 86% score. Scoring is based off negative mean squared error because we are looking for a positive score. So, the more positive the number the better. 

2. How do the prices compare with the different amenities, bedroom number, sqft, location, etc.?

The correlations suggested that no single feature was strongly associated with a change in the target variable. The correlation of each feature with respect to price is reprinted below.

![corr_wrt_price](Machine%20Learning/Voting_Regressor//figs/corr_with_price_text.png)

As expected, before analysis, the size (sqft) of the property plays the most significant role. The number of bedrooms and bathrooms also play an important role. None of these features is highly explanatory of the target variable.

The number of amenities present at the property was the least correlated feature. Before analysis it was expected that this feature would play a more significant role.

Two features added specifically to the Voting Regressor were the cityid and the pop_class or population group. While weakly correlated, the population grouping demonstrates explanatory power near that of bedrooms and bathrooms. The city identifier, or cityid, was second in predictive power to sqft. This indicates that nuances of each city's rental market or other city specific factors may play a larger role than anticipated.

3. How does population affect the housing prices?

![Screenshot 2023-01-24 at 9 33 40 PM](https://user-images.githubusercontent.com/110702997/214474282-d863ce74-9544-4dd9-965b-0151d4e1760d.png)

The graphs above shows the average prices of monthly rent from each of the 9 cities of our research also along with the population size of each city. You can see that higher populated cities do tend to have higher prices. There are definitely other factors that raise the rental prices that our models didn't pick up due to lack of data. The location could be a major factor in some of the higher prices, for example San Francisco had the most expensive rental price average while Los Angeles was the most populated. San Francisco could be a more desirable place to live in than Los Angeles.

Though population seems to influence average price, without controlling for other factors, there is not a statistically significant difference between the average rent price overall and the average rent prices of the three population groups.

![pop_stats](Machine%20Learning/Voting_Regressor//figs/avg_price_pop_ttest.png)
	
The P-Values have been rounded due to their extremely small size.

