rm(list = ls())
ls()

set <- read.csv("dat.csv") 

head(set)

summary(set)

nrow(set)

set[732,2]

set[732,]

# Want to bring only these rows so putting them into an index
ind <- c(605, 3, 321)

set[ind,]

set[-ind,]

set[400:600,]

set[600,]

set[10:20,]

#  get a sample of 4 records in a range of 1 to 10

sample(10, 4, replace = F)


sample(20, 10, replace = F)

?sample

# sample(1000000, 50000)

?sample

set.seed(1234)

sample(1000, 10)

ind <- sample(1000, 500)

ind

set[sample(1000, 500),]

# set[500:1000,]

# Sert is the name of the data frame and [] is used for filtering

sampl

set[ind,]

set

set[]

train_set <- set[ind,]

train_set

test_set <- set[-ind,]

nrow(train_set)

nrow(test_set)

head(test_set)

head(train_set)

summary(train_set)
summary(test_set)
summary(set)

sd(train_set$x); sd(train_set$y)

sd(test_set$x); sd(test_set$y)

# This is the way to take a large data frame and 
# divide it into training and test data set

# Plot the training set

library(ggplot2)

ggplot()+
    geom_point(data = train_set, aes(x,y)) +
    ggtitle('Training Set')


# Plot the test set

ggplot()+
    geom_point(data = test_set, aes(x,y)) +
    ggtitle('Test Set')


# Run Linear Model on Training set

Linear_model_Train <- lm(y~x, data = train_set)

Linear_model_Train

# Now lets put a random number and test the model if it can 
# predict

x<- 9

head(train_set)
?predict

predict(Linear_model_Train, data.frame(x))

head(train_set)

library(dplyr)



x<- c(1,9)

y <- predict(Linear_model_Train, data.frame(x))
x
y

endpoints <- data.frame(x,y)

endpoints


# Applying the linear model to the training set
ggplot()+
    geom_point(data = train_set, aes(x,y)) +
    geom_line(data = endpoints, aes(x,y), color = "red", size = 1.5) +
    ggtitle('Training Set')


# Applying the linear model to the test set

ggplot()+
    geom_point(data = test_set, aes(x,y)) +
    geom_line(data = endpoints, aes(x,y), color = "red", size = 1.5) +
    ggtitle('Test Set')


# Goodness of fit of the line on test data
# (Risidual sum of square or R Square)

# take all the x values from test data

x<- test_set$x

predict(Linear_model_Train, test_set)



# Difference from y and predicted y


mean(sum((test_set$y - 
              predict(Linear_model_Train, test_set))^2))
     

# Mean square error


?sample


