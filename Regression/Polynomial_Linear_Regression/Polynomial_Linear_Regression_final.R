# Data Preprocessing Template

# Importing the dataset
dataset_given = read.csv('Position_Salaries.csv')
dataset = dataset_given[, 2:3]

# Splitting the data set into the Training set and Test set NOT REQUIRED
# Since we are predicting a non-linear relationship, its better to have max training data.

# No need of Categorical ENCODING as levels are already provided in the data set.

# Feature Scaling - Linear Regression takes care of it.
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting a Simple Linear Regression for COMPARISON PURPOSE
lin_reg = lm(formula = Salary ~ . , data = dataset)
# check summary(lin_reg)

# Fitting a Polynomial Linear Regression 
dataset$Level_sq = dataset$Level^2 # Similarly we can add a power 3 level if needed.
dataset$Level_cube = dataset$Level^3 # Similarly we can add a power 4 level if needed.
dataset$Level_quattro = dataset$Level^4
poly_reg = lm(formula = Salary ~ ., data = dataset)

# Visualizing the Linear Regression results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Linear Regression)') +
  xlab('Level') +
  ylab('Salary')

# Visualizing the Polynomial Regression results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')

# Visualizing the Regression Model results (for higher resolution and smoother curve)
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(poly_reg,
                                        newdata = data.frame(Level = x_grid,
                                                             Level_sq = x_grid^2,
                                                             Level_cube = x_grid^3,
                                                             Level_quattro = x_grid^4))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')

# Predicting a new result with Linear Regression
predict(lin_reg, data.frame(Level = 6.5))

# Predicting a new result with Polynomial Regression
predict(poly_reg, data.frame(Level = 6.5,
                             Level_sq = 6.5^2,
                             Level_cube = 6.5^3,
                             Level_quattro = 6.5^4))