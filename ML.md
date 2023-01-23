# Machine Learning Component

## Preprocessing:
- Use Imputer to convert NaN to usable values.
- Encode any remaining categorical variables using dummies or OneHotEncoder.
- Scale the features with StandardScalar

## Feature Selection:
- Drop features that are not strongly correlated with target. Maintain as much non-colinearity as possible.
- Use model-bound methods such as feature importance in Random Forest and Gradient Boosting Regressors.

## Data Split
- Default TrainTestSplit settings were applied to create an 80/20 Train/Test set for the preliminary model.

## Model 1: Random Forest Regressor
### Overview
## Model 2a: Gradient Boosting Regressor
### Overview
## Model 2b: Weighted Voting Regressor
### Overview
The Voting Regressor combines the results of other models and will determine the best prediction for each input as the best prediction made by any of the models. Weights can be assigned to increase or decrease the amount a particular model impacts the results.

For this problem, the goal is to construct a Voting Regressor with weights such that the Mean Squared Error (MSE) of the models is minimizeed.

### Methods
Submodels used in the Voting Regressor:
- Gradient Boosting Regressor
- Elastic Net
- Random Forest Regressor
- 

The weights were calculated based on the following formulation of this quadradic optimization problem:

**** Equation Here ****
