# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('50_Startups.csv')

# Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Feature Scaling, not required, fitting function takes care of it.
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Multiple Linear Regression to the Training set
# Dot shows that R knows you want to include all the independent variables.
regressor = lm(formula = Profit ~ .,
               data = training_set)
# summary(regressor) in console shows which variable have high statistical significance using **

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)
# y_pred in console shows predictions wrt test set, can be compared with test dataset.