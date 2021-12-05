# K-Means Clustering
# Clustering is used to identify patterns in a given data for future analysis.
# We fetch useful information from the data set.
# Here we dont have a dependent variable to predict a certain parameter.

# Importing the dataset
dataset = read.csv('Mall_Customers.csv')
dataset = dataset[4:5] # Selecting 2 columns
# take only the significant data, for eg. we can remove S.No, Customer ID etc.

# No need of splitting data as we dont actually have a test set

# Using the elbow method to find the optimal number of clusters
set.seed(123)
wcss = vector()
for (i in 1:10) 
        wcss[i] <- sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

# Fitting K-Means to the data set
set.seed(29)
kmeans = kmeans(x = dataset, centers = 5)
y_kmeans = kmeans$cluster

# Visualizing the clusters
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
