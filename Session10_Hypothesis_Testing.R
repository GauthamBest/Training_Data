
rm(list = ls())

# Hypothesis testing


# seller says mean life of fan > 15000 hrs
# sample test of 40 fans found that mean = 14,900 hrs
# population SD = 110 
# At 0.05 significance level can we reject the seller's claim?

# Null hypothesis states that the seller's claim average life of fan > 15000
# using z test
# first take the SD of the sample
# Population SD
pSD <- 110

# sample size
n <- 100

SDSample <- pSD/sqrt(n)

SDSample 

zres <- (14900 - 15000)/ SDSample

zres

pnorm(zres)

# Here we can observe that the probability (p Value) is very low of getting this
# result. Hence we can reject the null hypothesis that average fan life > 15000


# Lets assume that we do not know the SD of the population and all we 
# have is this sample and
# since sample size is small we will go with ttest


# normal distribution to generate a sample
sampleFan <- rnorm(n = 40, mean = 14900, sd = 110)

sampleFan

summary(sampleFan)

?t.test

ttest <- t.test(sampleFan, mu = 15000, alternate = "l")
    
ttest <- t.test(sampleFan, mu = 14950, alternate = "l")

ttest <- t.test(sampleFan, mu = 14930, alternate = "l")

ttest





# Lengths of a few rivers
# previously held extensive survey of rivers around the world was
# that mean length of rivers is
mu0 <- 650

# dataframe of sample rivers
rivers

?rivers

# means of length of these sample rivers
muTest <- mean(rivers)

muTest


# Below is manual way of testing hypothesis along with plotting
# Using the same rivers example that was done using t test
n <- length(rivers)

# this is the sample size
n

sdTest <- sd(rivers)
sdTest

# standard deviation of sample
sd0 <- sdTest/sqrt(n)
sd0

muTest
mu0

zres <- (muTest - mu0)/ sd0

zres
    
pnorm(zres)

# Since p value is very high, we accept the null hypothesis


# observe that sample mean value is less that previously thought value of 650
# Since all over the world there are thousands of rivers, this sample of rivers 
# is too small so we will use a t distribution test
    
    ?t.test

tResult <- t.test(rivers, mu = 650, alternative = "l")
# *** When p value is low we can reject the null hypothesis ***
# The null hypothesis is that the true avergae size of rivers is 660

tResult <- t.test(rivers, mu = 660, alternative = "l")

tResult    
    
tResult <- t.test(rivers, mu = 659, alternative = "l")
    
    
    
    

    
alpha <- c(0.10, 0.05, 0.01)

alpha

mu0
sd0

# critical values
# qnorm will give me the points on the horizontal axis
cv <- qnorm(alpha, mean = mu0, sd = sd0)

cv

cv[[1]]
# plot on a graph

x<-  round(seq(500 ,650, length.out = 50))
x

y <- dnorm(x, mu0, sd0)

plot(x,y, type = "l")

abline(v = cv[1], col = "red")

abline(v = cv[2], col = "blue")

abline(v = cv[3], col = "green")

# lty = 3 gets a dotted line
abline(v = muTest, col = "black", lty = 3)

zTest <- (muTest - mu0)/ (sdTest/sqrt(n))

zTest

zAlpha <- qnorm(alpha)

zAlpha

