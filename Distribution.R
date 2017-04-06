# Normal distribution and Binomial distribution

rm(list = ls())

?rnorm

hist((round(rnorm(3000 ,800, 60),0)))

plot((round(rnorm(3000 ,80000, 60),0)))


dnorm(-25, 10, 5)

summary(rnorm(100, 50, 10 ))

hist(rnorm(100, 50, 10 ))


rnorm(10, 50, 3)

summary(rnorm(10, 50, 3 ))



rnorm(100)

# Probability of not getting Heads even once out of 5 times 
?dbinom

dbinom(0, 5, 0.5)

# Probability of getting Heads once out of 5 times 

dbinom(1, 5, 0.5)

# Probability of getting Heads twice out of 5 times 

dbinom(0, 10, 0.5)

# Probability of getting Heads 3 times (3 successful)
dbinom(3, size = 5,prob = 0.5)


# Probability of getting Heads 4 times (4 successful)
dbinom(4, size = 5,prob = 0.5)


# Probability of getting Heads 5 times (5 success)
dbinom(5, size = 5,prob = 0.5)

x<- 0:5

x

y<- dbinom(x, size = 5, prob = 0.5)

y
x

?plot

plot(x,y)
     
plot(x,y, type = "b")




# Probability of getting heads 4 or less times

dbinom(0, 5, 0.5) +
dbinom(1, 5, 0.5) +
dbinom(2, 5, 0.5) +
dbinom(3, 5, 0.5) +
dbinom(4, 5, 0.5) 


dbinom(4, 5, 0.5) 

# or

dbinom(0:4, 5, 0.5) 

# or 

sum(dbinom(0:4, 5, 0.5))

# or

# pbinom gives the cumulative Distribution Function
# Lower tail tells R to get the probability for sucessfull 
# heads less than or equal to 4

pbinom(4, 5, 0.5, lower.tail = F)


qbinom(0.9, 5, 0.5)

# 1 coin is tossed 5 times with probability of success as 0.5

rbinom(5, 1, 0.5)
# -----------------------------------------------------

# Normal distribution
# Calculate the probability that x <70 
# when mean = 50 and SD = 10

m = 50


n = 20

dat <- c(10, 20, 21, 24, 30, 46, 50, 60, 75, 80, 86, 90, 100)

dat

summary(dat)

plot(dat, dnorm(dat, mean = 50, sd = 10), type = "b")


y <- rnorm(20, 50, 30)

# Percentage of students scoring 70 marks or MORE
# when the mean score is 50 and the SD is 30
pnorm(70, mean = 50, sd = 20, lower.tail = F)

# less than 70 marks 
pnorm(30, mean = 50, sd = 10, lower.tail = T)


sum(pnorm(y, mean = 50, sd = 30, lower.tail = F))


# for the probability check the expected value . here in marks
qnorm(0.75, mean = 50, sd = 30)

qnorm(0.25, mean = 50, sd = 30)


# Get a list of random phone numbers from your phone
# and import into a data frame as shown below

getwd()
setwd("D:/Official/Data Science/RWORK")
list.files("data/")
phone <- read.csv("data/phone_numbers.csv")

phone



x<- 1:13


phone$sum <- phone$X2+phone$X3+phone$X6+phone$X9

names(phone) <- c("p1", "p2", "p3", "p4", "sum")

phone


hist(phone$sum,xlim = c(0, 36))
# Observe the normal distibution in the plot
# What does it say




# Inverse distribution
# Put in the probability and get the value
qnorm(0.9772499, mean = 50, sd = 10)

qnorm(0.9772499, mean = 3, sd = 1)

?pnorm



pnorm(88, 50, 10, lower.tail = T)


# plot

y<- rnorm(100, mean = 50, sd = 10)
y
x <- 1:100

hist(y)
# Normal distribution
plot(y, dnorm(y,50, 10))


plot(x, dnorm(x,50,10), type = "l")

# Distribution - Left skewed
plot(x, dnorm(x, 75, 10))

# Distribution - Right skewed
plot(x, dnorm(x, 25, 10))

# Kurtosis 
plot(x, dnorm(x,25,2), type = "l")


# Confidence interval is a function of the SD


x<- seq(1, 5, 0.1)

plot(x, pnorm(x,3,0.5))


# Random
plot(x, rnorm(x,0,1))



?sample


lc <- read.csv(file.choose())

lc

boxplot(lc$Smoker~lc$LungCapacity)

plot(lc$Smoker, lc$LungCapacity)


modellc <- aov(lc$LungCapacity ~ lc$Smoker + lc$Gender + lc$Height)

summary(modellc)

plot(lc)

