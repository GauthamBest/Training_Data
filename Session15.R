# Regression Diagnostics

# Data set
library(car)


head(mtcars)

mtcarsNew <- mtcars[, c(1:5)]

mtcarsNew

plot(mtcarsNew)

fit1 <- lm(mpg ~ disp + hp , data = mtcars)

summary(fit1)


fit2 <- lm(mpg ~ disp, data = mtcars)

summary(fit2)


# Backward elimination process

mtcars

mtcarsNew

mtcarsNew <- mtcars[, c(-2)]

mtcarsNew <- mtcarsNew[, c(-13)]

mtcarsNew

fit0 <- lm(mpg ~ ., data = mtcarsNew)

summary(fit0)


# step 2 of backward elimination

fit1 <- lm(mpg ~ disp + hp + wt + qsec + vs + am + gear + carb + cyl4 + cyl6, 
           data = mtcarsNew)

summary(fit1)


# step 3 of backward elimination

fit2 <- lm(mpg ~ disp + hp + wt + qsec + vs + am + gear + carb + cyl6, 
           data = mtcarsNew)

summary(fit2)


# step 4 of backward elimination

fit3 <- lm(mpg ~ disp + hp + wt + qsec + vs + am + carb + cyl6, 
           data = mtcarsNew)

summary(fit3)

# step 5 of backward elimination

fit4 <- lm(mpg ~ disp + hp + wt + qsec + am + carb + cyl6, 
           data = mtcarsNew)

summary(fit4)



fit8 <- lm(mpg ~ hp + wt + cyl6, 
           data = mtcarsNew)

summary(fit8)


fit9 <- lm(mpg ~ hp + wt, 
           data = mtcarsNew)

summary(fit9)

# This model fit 0 is not a good model as none of the IV's show an alternate hypothesis
# of significant impact on DV's 


# since cylinder is a ctegorical data, we need to dummify this

str(mtcars)
mtcars$cyl <- factor((mtcars$cyl))

# dummify
mtcars$cyl4 <- ifelse(mtcars$cyl == 4, 1, 0)

mtcars$cyl6 <- ifelse(mtcars$cyl == 6, 1, 0)

mtcars$cyl8 <- ifelse(mtcars$cyl == 8, 1, 0)



mtcars

fit4 <- lm(mpg ~ disp + wt , data = mtcars)

summary(fit4)

fit5 <- lm(mpg ~ wt, data = mtcars)

summary(fit5)


# Model
fit <- lm(mpg~disp+hp+wt+drat, data=mtcars)

summary(fit)

plot(fit)

mtcars
# Discuss F Statistic

summary(interaction(mtcarsNew$hp, mtcarsNew$disp))

interaction.plot(mtcarsNew$hp, mtcarsNew$disp)

?interaction

summary(fit8)

summary((fit9))

# Test for outliers in the variables used in the model
? outlierTest

outlierTest(fit7)

outlierTest(fit8)

outlierTest(fit9)

hist(mtcarsNew$mpg)

mtcars1 <- mtcarsNew[-20,]

mtcars1

hist(mtcars1$mpg)

# Treating or altering the outlier/extreme values in genuine observations is not 
# a standard operating procedure. 
# However, it is essential to understand their impact on your predictive models.


# Cook's Distance plot
# Data points with large residuals (outliers) and/or high leverage may distort 
# the outcome and accuracy of a regression. 
# Cook's distance measures the effect of deleting a given observation. 
# Points with a large Cook's distance are considered to merit closer examination in the analysis.
# identify D values > 4/(n-k-1) 
cutoff <- 4/((nrow(mtcars)-length(fit9$coefficients)-2)) 

plot(fit, which=4, cook.levels=cutoff)
# Influence Plot 
influencePlot(fit,	id.method="identify", main="Influence Plot", 
              sub="Circle size is proportial to Cook's Distance" )


plot(fit9)

# Normality of Residuals
# qq plot for studentized resid
qqPlot(fit9, main="QQ Plot")
# distribution of studentized residuals
library(MASS)
sresid <- studres(fit) 

sresid

hist(sresid, freq=FALSE, 
     main="Distribution of Studentized Residuals")
xfit<-seq(min(sresid),max(sresid),length=40) 
yfit<-dnorm(xfit) 
lines(xfit, yfit)


# Evaluate homoscedasticity
# non-constant error variance test
ncvTest(fit9)
# plot studentized residuals vs. fitted values 
spreadLevelPlot(fit)

# Evaluate Collinearity
vif(fit9) # variance inflation factors 
sqrt(vif(fit9)) > 2 # problem?

# Evaluate Nonlinearity
# component + residual plot 
crPlots(fit9)
# Ceres plots 
ceresPlots(fit)

# Test for Autocorrelated Errors
durbinWatsonTest(fit)


# Global test of model assumptions
install.packages("gvlma")

library(gvlma)

gvmodel <- gvlma(fit9) 
summary(gvmodel)


