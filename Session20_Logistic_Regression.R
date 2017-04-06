




######################################################################
### Fitting Logistic Regresion in R
######################################################################

head(mtcars)

?mtcars
str(mtcars)

# VS stands for a Vee type of engine or an S (inline engine) type
# so we are trying to predict a dependent variable that is categorical,
# that is weather the particular car is a Vee type car or S type
# based on independent variables of wt (weight) and disp (displacement)

?glm

# using the glm model function we will try to derive a logistic regression
# since we are trying to predict a Yes/ No kind of situation, we choose 
# family as binomial

attach(mtcars)
vmodel <- glm(formula = vs ~ wt + disp, data = mtcars, family = binomial())

vmodel

summary(vmodel)

head(mtcars, 50)

newdf <- data.frame(wt = 3.15, disp = 140.8)

predict(vmodel, newdata = newdf, type = "response")

# conclusion - The probability of a vehicle having a Vee type engine
# when the weight is 3.15 and displacment as 140.8 is 86.79%

newdf <- data.frame(wt = 4.07, disp = 275)

predict(vmodel, newdata = newdf, type = "response")


# as we change the weight and as displacement increases, the 
# probability of the engine being a Vee type reduces to 22.41%

summary(vmodel)

# Goodness of fit
# Null deviance: 43.86  on 31  degrees of freedom
# Residual deviance: 21.40  on 29  degrees of freedom

# As a thumb rule, lower the deviance better the fitting of the model
# a Null deviance represents how the dependent varible behaves
# at the Y intercept, that is when the forces of indpendent variable (IV)
# are not acting on it
# the residual devianced is the value with the application of Independent
# variables of weight and displacement
# the degrees of freedom fall by 2 as we included 2 IV's
# summary - The model fitting has improved with the inclusion of IV's

# wt           1.62635
# when weight rises by 1, the VS value increaes by log(odds) value of 1.62
# so odds will rise by e to the power 1.62 units (e is the exponent)



######################################################################
### Data Set: Smarket( S&P 500 stock index, 1250 obs, 9 variables)
######################################################################

### Step 1: Load data, and run numerical and graphical summeries 

# run below install for the first time.
# install.packages("ISLR")

library(ISLR)

?Smarket

attach(Smarket)

summary(Smarket)

str(Smarket)

head(Smarket, 10)
tail(Smarket, 10)

cor(Smarket[,-9])

pairs(Smarket)

pairs(Smarket, col = Smarket$Direction)

str(Smarket)


### Step 2: Split the data into training and testing data

training = (Year < 2005)
testing = !training


training_data = Smarket[training, ]
testing_data = Smarket[testing,]

head(training_data)

str(tra)
### Step 3: Fit a logistic regression model using training data

stock_model = glm(Direction ~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume, 
                  data = training_data, family = binomial)

summary(stock_model)

### Step 4: Use the fitted model to do predictions for the test data

model_pred_probs = predict(stock_model, testing_data, type = "response")

model_pred_probs

model_pred_Direction = rep("Down", 252)
contrasts(Direction)




model_pred_Direction[model_pred_probs > 0.5] = "Up"
model_pred_Direction

### Step 5: Create the confusion matrix, and compute the misclassification rate

Direction_testing = Direction[testing]

table(model_pred_Direction, Direction_testing)

mean(model_pred_Direction != Direction_testing)


