
rm(list = ls())


data()

# 
install.packages("caret")

data("cars", package = "caret")


head(cars)

str(cars)

cars_new <- cars;

is.data.frame(cars_new)

cars_new
head(cars_new)
attach(cars_new)

pairs(cars_new)

cars_new$Doors <- NULL
cars_new$Saab <- NULL
cars_new$Saturn <- NULL
cars_new$convertible <- NULL
cars_new$coupe <- NULL
cars_new$wagon <- NULL
cars_new$Buick <- NULL
cars_new$Pontiac <- NULL


pairs(cars_new)


model1 <- lm(Price ~ Mileage + Chevy + Cylinder + Cruise + 
                 Leather + sedan)

summary(model1)

# Pearson's correlation of age 

par()
par(mar = rep(1, 4))

plot(resid(model1) ~ fitted(model1))

par(mfrow = c(2,2) )

plot(model1)

# Transform by doing a 1/ sqrt(price)
model2 <- lm( (1/ sqrt(Price)) ~ Mileage + Chevy +  Cylinder + Cruise + 
                 Leather)

summary(model2)

par(mfrow = c(2,2) )
plot(model2)

# Log Transform
model3 <- lm(log(Price) ~ Mileage + Chevy + Cylinder + Cruise + 
                 Leather)

vcov(model3)

?vcov

summary(model3)



plot(resid(model2) ~ fitted(model2))

plot(resid(model3) ~ fitted(model3))

plot(resid(model1) ~ fitted(model1))


par(mfrow = c(2,2) )
plot(model3)


AIC(model1)
AIC(model2)
AIC(model3)



