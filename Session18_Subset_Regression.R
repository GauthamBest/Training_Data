#-----------------------------------#
#--- All Subset Regression in R ---#
#-----------------------------------#

rm(list = ls())


# When importing data, it is best to use .csv format
bodyfat <- read.csv(file.choose())

head(bodyfat)

# bodyfat$X <- NULL
# bodyfat$Variable.Details. <- NULL


# All in variables.
lm(bodyfat$BodyFat ~ ., bodyfat)



plot(bodyfat)

pairs(bodyfat)

names(bodyfat)[3] <- "BodyFat"

names(bodyfat)

?
110
910
log(110)

log(910)

log(9910)

log(999910)

log(12)

log(9)

sqrt(1000)


# Level playing field or normalization

model1 = lm(BodyFat ~ Abdomen + Thigh+Knee + Ankle, data = bodyfat)

model2 = lm(BodyFat ~ log(Abdomen) + log(Thigh) + log(Knee) + log(Ankle), data = bodyfat)

summary(model2)

summary(model1)

# OLS using the lm function for the full model
model2 = lm(BodyFat ~ Abdomen+Thigh+Knee+ Ankle, data = bodyfat)

summary(model2)

# OLS using the lm function for the subset model
model1 = lm(BodyFat~Abdomen+Ankle, data = bodyfat)
summary(model1)

# Perform a partial F-test using the anova 
# Null hypothesis:  the extra parameters in the full model 
# have coefficients=0
anova(model1, model2)


# Perform a likelihood ratio test (testing for chi -square distribution)
# Null hypothesis:  the extra parameters in the full model 
# have coefficients=0

install.packages("lmtest")
library(lmtest)

?lrtest

lrtest(model1,model2)


#Since the p-value is small, we can include the extra variable 
# "thigh" in Model2 

#heteroscadasticity-  Variablity of a DV is unequal across a range of Values of IV
# Test for heteroscadasticity indicated by Small p value

par(mfrow=c(2,2))
plot(model1)

?bptest
bptest(model1)

bptest(model2)

head(bodyfat)

mtcars

bodyfat

summary(bodyfat)

lm(BodyFat )

# if heteroscadasticity is observed we need to transform the data

# Regression subset selection including exhaustive search, 
# use the "leaps" package. 

install.packages("leaps")
library(leaps)

bodyfat

# nbest	= number of best subsets of each size to keep in the results (default=1)
# Period notation regresses BodyFat against all the other variables in data set
?regsubsets
leaps<-regsubsets(BodyFat ~ Abdomen+Thigh+Knee+ Ankle, data= bodyfat, nbest = 5, method = "backward")

leaps1<-regsubsets(BodyFat ~ . , data= bodyfat, nbest = 6, method = "backward")

# nbest = 5 is telling the function to pick the 5 best models to compare

# the BodyFat~. is telling that take all independepnt variables and compare them
# against Bodyfat

leaps

# plot against adjusted R square
plot(leaps, scale="adjr2")

plot(leaps1, scale="adjr2")


summary(leaps)



# this period notation regresses BodyFat against all the other variables in the
# data set plus all interactions
leaps<-regsubsets(BodyFat~.^2, data=bodyfat, nbest = 10, method = "exhaustive")
# .^2 indicates 2 factor interactions

# view results 
summary(leaps)

# plot statistic by subset size (rsq, cp, adjr2, bic, rss)
library(car)

?subsets
subsets(leaps, statistic="bic")

subsets(leaps, statistic="bic", ylim = c(-310, -306))

# Smaller the bic value, better the model.


subsets(leaps, statistic="cp")

subsets(leaps, statistic="cp", ylim = c(-5, 10))

subsets(leaps, statistic="cp", ylim = c(-5, 10), xlim = c(2, 10))

# Here it is looking for best model for 1 set, 2 subset, 3 subsets.. etc


# Shows the One best 2 factor model
leaps<-regsubsets(BodyFat~.^2, data=bodyfat, nbest = 1, method = "exhaustive")

# check for adjusted R2
leaps<-regsubsets(BodyFat~., data=bodyfat, nbest = 1, method = "exhaustive")

plot(leaps,scale="adjr2")

subsets(leaps, statistic="rsq")



# stepwizesearch for best regression model
library(MASS)
fit <- lm(BodyFat~., data=bodyfat)
step <- stepAIC(fit, direction="both")
step$anova # display results

