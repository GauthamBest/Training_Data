#-----------------------------------#
#--- Multiple LS Regression in R ---#
#-----------------------------------#

getwd()

#When importing data, it is best to use .csv format
bodyfat <- read.csv('bodyfat.csv')

#Step 1:  plot the data
plot(bodyfat$BodyFat~bodyfat$Abdomen)

#Step 2:  OLS using the lm function
model = lm(bodyfat$BodyFat~bodyfat$Abdomen)
#here is an alternate form:
model = lm(BodyFat~Abdomen, data = bodyfat)
summary(model)
confint(model, level=0.95)

# AIC - Akaike's Information Criterion
n = nobs(model)
p = length(model$coefficients)
# deviance(model) = residual sum of squares
myAIC = n + n*log(2*pi) + n*log(deviance(model)/n) + 2*(p+1)
# now do the same thing using the built-in AIC function
AIC1 = AIC(model, k=2)

#a different function (extractAIC) differs by an additive constant
myAIC = n*log(deviance(model)/n) + 2*p
extractAIC(model)

# Schwarz's Bayesian Criterion (BIC)
BIC1 = AIC(model, k=log(n))

# Adjusted R^2 - this can also be obtained from summary(model)
R2 = summary(model)$r.squared
adjR2 = R2 - (p-1)/(n-1)*(1-R2)
