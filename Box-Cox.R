#-----------------------------------#
#--- Box-Cox Transformation in R ---#
#-----------------------------------#


# We'll use a data set built into R called "cars"
# Speed and Stopping Distances of Cars from the 1920s.
#Step 1:  plot the data
plot(dist ~ speed, data = cars, xlab = "Speed (mph)", ylab = "Stopping distance (ft)")

#Step 2:  OLS using the lm function
model = lm(dist~speed,data=cars)
summary(model)

library(MASS)
esr <- studres(model)  #extract the externally studentized residuals
plot(esr ~ fitted(model))


library(MASS)
bc = boxcox(lm(dist~speed,data=cars),lambda=seq(0,1,by=.1))
lambda<-bc$x[which.max(bc$y)]

# based on the box-cox transform results, let's try taking the square root of the distnace as our response vaiable
plot(sqrt(dist) ~ speed, data = cars)

model2 = lm(sqrt(dist)~speed,data=cars)
summary(model2)
esr <- studres(model2)  #extract the externally studentized residuals
plot(esr ~ fitted(model2))

model3 = lm(dist~speed^2,data=cars)
summary(model3)
esr <- studres(model3)  #extract the externally studentized residuals
plot(esr ~ fitted(model3))




# Alternate approach: add new columns to the data set
New_cars <- cbind(cars, sqrt(cars$dist)) #add a third column to the data set
names(New_cars)[3] <- "Yprime" # Name the third column
New_model = lm(Yprime~speed,data=New_cars)
summary(New_model)

esr <- studres(New_model)  #extract the externally studentized residuals
plot(esr ~ fitted(New_model))

plot(dist ~ I(speed^2), data=cars)
