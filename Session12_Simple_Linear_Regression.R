
# Linear Regression in R

rm(list=ls())

# We will use the lung capacity data that we used for ANOVA testing in the 
# ANOVA class


lungcap <- read.csv(file.choose())

head(lungcap)

attach(lungcap)

lungcap$Gender

Gender

names(lungcap)

summary(lungcap)

str(lungcap)


lungcap$Gender <- factor(Gender)

lungcap$Smoker <- factor(Smoker)


plot(lungcap$Height, LungCapacity, main = "Scatterplot" )




cor(Age, LungCapacity)

plot(lungcap)

pairs(lungcap)

?lm

# Height of a person does not impact Lung capacity - Null - H0

model1 <- lm(LungCapacity ~ Height)

model1

abline(h = mean(LungCapacity), col = "red")

summary(model1)

abline(model1, col = "blue")

y <- -693.509 + 88.222 * 77

predict.lm(model1, newdata = data.frame(Height = 20))

?confint
confint(model1, level = 0.95)

predict.lm(model1, newdata = data.frame(Age = 80))



# Use the command to look at the various user data files and 
# also dataframes available in R
data()

data("airquality")

names(airquality)


head(airquality)

# Visualize if there is a co-relation between Ozone levels and Solar Radiation
plot(airquality$Ozone ~ airquality$Solar.R)

oz<- na.omit(airquality$Ozone) 
sr <- na.omit(airquality$Solar.R)




mean(airquality$Ozone)

mean.ozone <- mean(airquality$Ozone, na.rm = T)

mean.ozone

?abline
abline(h = mean.ozone)

library(ggplot2)

?geom_abline
ggplot(data = airquality, aes(airquality$Solar.R, airquality$Ozone)) +
    geom_point() +
    geom_hline(yintercept = mean.ozone, color = "red")

# Create a model using simple linear regression 
?lm

modelOz <- lm(airquality$Ozone ~ airquality$Solar.R + airquality$Wind + 
                  airquality$Temp)

modelOz1 <- lm(airquality$Ozone ~ airquality$Wind + 
                  airquality$Temp)

summary(modelOz)

summary(modelOz1)

plot(modelOz)

?AIC
AIC(modelOz)

AIC(modelOz1)


# The intercept represents the y intercept = 18.59873 = b0
# airquality$Solar.R  0.12717 represents the coefficient or the slope or
# the increase in Ozone level with increase in Solar radiation

plot(airquality$Ozone ~ airquality$Solar.R)

mean(airquality$Ozone)

abline(h = mean.ozone)

abline(modelOz, col = "red")

ggplot(data = airquality, aes(airquality$Solar.R, airquality$Ozone)) +
    geom_point() +
    geom_hline(yintercept = mean.ozone, color = "red") +
    geom_abline(intercept = 18.59873, slope = 0.12717  )


plot(modelOz)
# Residuals vs fitted shows that the regression line may not be fitted properly 
# as per there is a drop in ozine level at peak radiation
# Residuals are the deviation from the fitted values

# Normal Q-Q represnets the normal distribution.
# The dotted line represents the linear model and the circles 
# represen the deviation from the noirmal distribution


summary(modelOz)

# In the result, the call shows us the function used to derive the model
# Call:
# lm(formula = airquality$Ozone ~ airquality$Solar.R)

fitted.value = fitted(modelOz)
residual= resid(modelOz)

fitted.value

residual

plot(airquality)

dfdata <- data.frame(na.omit(airquality), fitted.value, residual)

predict(modelOz)

# Predict regression with Cars data

mtcars

data()

