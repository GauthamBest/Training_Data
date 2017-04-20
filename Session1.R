
# Environment variables and setting working directory

sales <- 1000000

profit = NULL

profit <- 20000

rm(profit)


?ls

sales

x <- 3
x
x <- 3

X <- 5
y <- 5

# This is to assign values to Z - By Abhinav on 6/04/2017 at 12:15 PM

z <- x * y

abc <- lm(formula = , subset = )


ls()


getwd()


setwd("D:/Official/Data Science/RWORK")

read.csv("newcustomer.csv")


# Your first R program

x <- "Hello World !!"
x <- 20203L

newvar <- 202

typeof(newvar)

x <- 1L

typeof(x)

new <- "Today the temperature is 25 degrees"

newvar <- "1234ABC"

typeof(newvar)


x <- "Hello World !!"

y <- "My Name is Gautham and I'm an R Programer"
y

z <- x+y

z

x <- 123
# Merge can merge non numeric data types

z<- merge(x,y)

z <- x || || y

z

ls()

rm(list = ls())

?rm



rm("x")

rm(list = "x")



ls()

rm(list = ls())

ls()


# Install packages
install.packages("ggplot2")

search()


# (Press Cntrl + Shift + C to create a comment)
# Real life example 
# Does a better clarity of diamonds always mean a better price
# -----------------------------------------------------------


library("ggplot2")

mydata <- read.csv(file.choose())

mydata$
# Generate a graph showing price vs Carat

ggplot(data = mydata, aes(x = mydata$carat, y = mydata$price)) +
    geom_point()

ggplot(data = mydata, aes(x= carat, y = price, color = "red")) +
    geom_point()

ggplot(data = mydata, aes(x= carat, y = price, color = clarity)) +
    geom_point()


# Add clarity to graph by assigning Variable Clarity to color
ggplot(data = mydata, aes(x= carat,  y = price, color = clarity)) +
    # geom_point()+
    geom_line()

# Improve the transperancy of the color
ggplot(data = mydata, aes(x= carat, color = clarity)) +
    geom_point(alpha = 0.4)

# Let us remove the statistically insignificant data and restrict x axis to around 3.3
ggplot(data = mydata[mydata$carat <3.3,]
       , aes(x= carat, y = price, color = clarity)) +
    geom_point(alpha = 0.4)


# Let us add the smoothers to show the patterns
ggplot(data = mydata[mydata$carat <3.3,]
       , aes(x= carat, y = price, color = clarity)) +
    geom_point(alpha = 0.4)+
    geom_smooth()

# Does a better clarity of diamonds always mean a better price?
# Complete ----------------------------------------------------


# plyr package
# -------------

library(plyr)

a2 <- array(data= 1:9, dim=c(3,3))
a2

a_ply(.data = a2, .margins = 1, .fun = print)

head(mtcars)

ddply(.data = mtcars, .(cyl, am), function(x) .fun = print(head(x)))

ddply(.data = mtcars, .(cyl), function(x) mean(x$hp))

ddply(.data = mtcars, .(cyl,am), function(x) mean(x$mpg))


# Reshape 

head(mtcars)

head(t(mtcars))

# Forecast 

library(Forecast)

install.packages("forecast")

library(forecast)


# example use of time series
# --------------------------

ts(1:24, frequency = 12, start = c(1950, 1))

time1 <-ts(1:24, frequency = 12, start = c(1950, 1))

time1

plot(time1)
forecast(time1, 12)

mynorm <- round(rnorm(1:72, n = 72))

# myvector <- ts(1:72, frequency = 12, start = c(2009,1), frequency = 12)

myts <- ts(mynorm, start=c(2009, 1), end=c(2014, 12), frequency=12)
myts
myts2 <- window(myts, start=c(2014, 6), end=c(2014, 12)) 

myts2

plot(myts)

plot(forecast(myts, 36), shadecols="green")


# Seasonal decomposition
fit <- stl(myts, s.window="period")
plot(fit)

# additional plots
monthplot(myts)
seasonplot(myts)


data()

mtcars

# swirl. First 
install.packages("swirl")


library(swirl)

swirl()

# Learn the Data Analysis coursde on swirl

# To clear the consolr on the right side press cntrl+L
