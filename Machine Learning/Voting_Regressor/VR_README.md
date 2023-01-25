# Items to add to README.md for Voting Regressor Model

## Summary

Several models were tested on the training data using cross validation scores with 15 folds to determine the estimated average mean squared error, the standard deviation, and a 95% confidence interval for the mean squared error for each of the 15 scores produced.

Based on these results, 8 models with the lowest mean and standard deviation of the mean squared error were selected. These models were then iterativley tuned using GridSearchCross Validation. The scores of the models were again calculated.

After fitting the best estimators, weights for the Voting Regressor were calculated by minimizing the mean squared errors for each models prediction.

Using these weights and the eight estimators, the Voting Regressor model was initialized and trained on the data. It was scored in the same manner as previous models. The r squared value for the training and testing set were then calculated.

## Data Prep

The data includes information from nine cities grouped into three population classes from different regions of the United States. For the first model, the city identifier was dropped.

The square footage data had significant outliers as shown below:

![sqft](/figs/sqft.png)

Outliers were determined on the basis of 1.5*IQR + third quartile. Lower outliers were negative. All rows containing outlier were dropped from the data.

Training and test sets were created using Stratified Shuffle Spliting to control for an equal representation of each city. The sampling error as compared to regular Train Test Split is shown in the following table:

![sampling_error](/figs/sampling_error.png)

After removing price, the target variable, the training and testing sets were scaled using a RobustScaler. This was chosen over the StandardScaler due to its robustness to outliers. Although many were already eliminated, the RobustScaler further reduced the impact of outlier values.

## Pre Tuning Models

Several regression models were evaluated. Ideally, the Voting Regressor would combine the results of several diverse models. The majority of the selected models fell into the broad categories of tree based and linear. The scores each model were stored in a Pandas DataFrame and then sorted by average mean squared error and the standard deviation. The top 8 models from the list were chosen for tuning.

![pre_tune](/figs/pre_tune_mse.png)

## Post Tuning Models

The models were tuned using Grid Search Cross Validation and scored as before. A DataFrame was again generated from these results.

![post_tune](/figs/post_tune_mse.png)

## Calculating Weights

The objective funtion to be minimized is the mean squared error (MSE):

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

The voting Regressor was constructed using the calculated weights and the eight estimators. It was scored in the same manner and performed better than any of the individual models. The r squared values were then calculated.

![r2](/figs/vrg_r2.png)

Based on the r squared values, it appears overfitting of the training data may be occuring.

## Expected vs. Predicted Values
![exp_pred](/figs/pred_vs_actual_vrg.png)

## Estimates of Each Model

![mod_est](/figs/pred_vs_avg.png)

## Further Exploration

Although significantly reducing the ability to generalize, including the city identifier in the training data may improve performance. With the same preperation the results are as follows:

The post tuning scores:
![post_tune_city](/figs/post_tune_mse_with_city.png)

The Voting Regressor r squared:
![vot_reg_city](/figs/vrg_r2_with_city.png)

Expected vs. Predicted:
![exp_pred_city](/figs/pred_vs_actual_vrg_with_city.png)

Estimator Predictions:
![mod_est_city](/figs/pred_vs_avg_with_city.png)