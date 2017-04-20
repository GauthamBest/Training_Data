#-----------------------------------#
#--- Ordinary LS Regression in R ---#
#-----------------------------------#


#When importing data, it is best to use .csv format
#Here, I typed in the y-values directly using the Concatonate function c
y = c(4.26, 5.68, 7.24, 4.82, 6.95, 8.81, 8.04, 8.33, 10.84, 7.58, 9.96)
#the x-values are evenly spaced from 4 to 14
x = 4:14 #the column gives an array of all integers from 4 to 14
x = seq(4,14,1)  #you can use the sequence function to do the same thing

#Step 1:  plot the data
plot(y ~ x)

#Step 2:  OLS using the lm function
model = lm(y ~ x)
summary(model)

# Other useful functions 
coefficients(model) # model coefficients
confint(model, level=0.95) # CIs for model parameters 
fitted(model) # predicted values
residuals(model) # raw residuals
anova(model) # anova table 
vcov(model) # covariance matrix for model parameters 
influence(model) # regression diagnostics, including hat matrix

library(MASS)  #for the studres function
studres(model) # externally studentized residuals (from MASS library)


#plot the raw residuals
plot(resid(model) ~ fitted(model), xlab = "Fitted Values", ylab = "Residuals")

#plot the externally studentized residuals (esr)
plot(studres(model) ~ fitted(model),
       xlab = "Fitted Values",
       ylab = "esr"
)

