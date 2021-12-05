# Apriori
# Association rules are for finding out associations/relationships between parameters
# Example- how Amazon suggests what users bought after buying a particular product
# Good for market analysis, for finding useful information from existing relationships.

# Data Preprocessing
# install.packages('arules')
library(arules)
dataset_given = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

# Training Apriori on the dataset

rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2))

# Visualising the results
inspect(sort(rules, by = 'lift')[1:10])
