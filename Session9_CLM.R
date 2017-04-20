
# Testing the Central Limit Theorom

# The central limit theorem (CLT) is a statistical theory that 
# states that given a sufficiently large sample size from a 
# population with a finite level of variance, the mean of all 
# samples from the same population will be approximately equal to 
# the mean of the population.

rm(list = ls())

# Set the seed of R's random number generator, 
# which is useful for creating simulations or random objects 
# that can be reproduced.
# example

rnorm(5)
rnorm(5)
rnorm(100)
hist(rnorm(100))

?sample()

set.seed(1)

rnorm(5)

rbinom(10, 1, 0.6)


set.seed(1)

rnorm(5)


# back to example
# generate 100 poisson dist' with variance 4, 8, 16
# Poisson distribution counts the number of times an event
# occurs in an interval
# the interval can be time or volume
# probability of event occuring is the same in each interval
# no. of occurance in one interval is independent of other interval


p1<- rpois(100, 4)
p2<- rpois(100, 8)
p3<- rpois(100, 16)
p1
p2
p3
mean(p1); var(p1)
mean(p2); var(p2)
mean(p3); var(p3)


r1<- rnorm(100, 4)
r2<- rnorm(100, 8)
r3<- rnorm(100, 16)

mean(r1); var(r1)
mean(r2); var(r2)
mean(r3); var(r3)

r1

hist(p1)
hist(r1)
# This means that the poisson dist' cannot be a normal distr'

set.seed(2)
lambda <- 5 # variance for poisson distribution


# Lets make a smaple of size 40 with 1000 trials

n <- 40; rows <- 1000

sim <- rpois(n*rows, lambda)
# in poisson distr' both mean and variance are close to lambda

head(sim, 50)

var(sim)
mean(sim)


hist(sim)
sim
m <- matrix(sim, rows)

m
hist(m)

sample.means <- rowMeans(m)

sample.means


hist(sample.means)

# So the central limit tells us that the distribution of the 
# central means converges on the normal distribution
# Do note that the underlying random variables had a poisson 
# distribution as observed earlier that is right skewed


sample.avg <- mean(sample.means)

# Do note above that the mean of the sample means is close to 
# 5, that is the mean of the poisson distribution = lambda

# Below is the standard deviation of the sample means
sample.sd <- sd(sample.means)


# And below is the theoritcal SD of the poisson distribution
sample.clt <- sqrt(lambda/n)


# Here do note that the sample size is greater than 30,
# which is a thumb rule for normal distribution


n <- 15; rows <- 1000

lambda

sim1 <- rpois(n*rows, lambda)
# in poisson distr' both mean and variance are close to lambda

var(sim1)
mean(sim1)


hist(sim1)
sim1
m1 <- matrix(sim1, rows)

m1
hist(m1)

sample.means1 <- rowMeans(m1)

sample.means1


hist(sample.means1)


mean(sample.means1)

sample.sd <- sd(sample.means1)

sample.sd

sample.clt <- sqrt(lambda/n)

sample.clt



# t distribution 

# test scores of 9 random selected students are
# 
# 83, 73, 62, 63, 71, 77, 77, 59, 92
# 
# we use t dsitribution
# 1. when population SD is unknown
# 2. sample size less than 30
# 
# So both condions are met
# 
# population mean = sample mean = +/- sample error

score <- c(83, 73, 62, 63, 71, 77, 77, 59, 92)

# 99% confidence interval


pt(q = 2.896, df = 8, lower.tail = F)* 2



# t-stat = 2.3; df = 35 (degrees of freedom = 25)
#  one sided p-value 
# Here we are trying to find the value 
# probability of t > 2.3 .. that is area above 2.3

pt(q = 2.3, df = 25, lower.tail = F)


#  two sided p-value 
# area above 2.3 and area below -2.3

pt(q = 2.3, df = 25, lower.tail = F)*2


# confidence interval
# find t value for 95% confidence interval


require(graphics)

1 - pt(1:5, df = 1)
qt(.975, df = c(1:10,20,50,100,1000))

tt <- seq(0, 10, len = 21)
ncp <- seq(0, 6, len = 31)
ptn <- outer(tt, ncp, function(t, d) pt(t, df = 3, ncp = d))
t.tit <- "Non-central t - Probabilities"
image(tt, ncp, ptn, zlim = c(0,1), main = t.tit)
persp(tt, ncp, ptn, zlim = 0:1, r = 2, phi = 20, theta = 200, main = t.tit,
      xlab = "t", ylab = "non-centrality parameter",
      zlab = "Pr(T <= t)")

plot(function(x) dt(x, df = 3, ncp = 2), -3, 11, ylim = c(0, 0.32),
     main = "Non-central t - Density", yaxs = "i")


# 
all_emp <- rnorm(9000, 26000, 2420)


emp_df <- data.frame(c(1:9000), all_emp)

head(emp_df, 20)

 
emp_400 <- sample(emp_df$c.1.9000., size = 400, replace = F)

head(emp_400)

sample_emp_400 <- emp_df[emp_400,]

sample_emp_400

mean(sample_emp_400$all_emp)

mean(pnorm(sample_emp_400$all_emp, mean = 26650))


emp_400_p2 <- sample(emp_df$c.1.9000., size = 400,replace = F)
sample_emp_400_p2 <- emp_df[emp_400_p2,]

mean(sample_emp_400_p2$all_emp)

mean(pnorm(sample_emp_400_p2$all_emp, mean = 26650))

pnorm(1:10, mean = 5)
