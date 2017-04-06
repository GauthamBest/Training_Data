
# Multiple Linear Regression

rm(list = ls())



# cor(lungcap)

head(Startup50)

Startup50 <- read.csv(file.choose())

head(Startup50)

str(Startup50)

levels(Startup50$State)
Startup50$State <- factor(Startup50$State)



# As part of linear regression we would like to observe the impact of RnD spending,
# Administration and Marketing Spending on Profit- which is the Dependent Variable

# Defining the null hypothesis we declare that none of the Independepent Variables
# have any impact on the Profit - H0

# plotting all the corelations on a scatterplot

pairs(Startup50)

# values of R the corelation
cor(Startup50)

cor(Startup50$R.D.Spend, Startup50$Marketing.Spend)

cor(Startup50$R.D.Spend, Startup50$Profit)


head(Startup50)

str(Startup50)

# Dummify
Startup50$State <- ifelse(Startup50$State == 'New York', 1, 0)

cor(Startup50)

attach(Startup50)

# Muliple linear regression
StartModel <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend + State)

summary(StartModel)

str(Startup50)

??VIF
library(car)
?VIF

vif(StartModel)

sqrt(vif(StartModel))

StartModel1 <- lm(Profit ~ R.D.Spend + Marketing.Spend + State)

summary(StartModel1)


resid(StartModel)

# Residuals have a normal distribution
hist(resid(StartModel))


StartModel2 <- lm(Profit ~ R.D.Spend + Marketing.Spend)

summary(StartModel2)


StartModel3 <- lm(Profit ~ R.D.Spend)

summary(StartModel3)


AIC(StartModel3)

AIC(StartModel2)

summary(aov(StartModel2))


predict.lm(StartModel2, data.frame(R.D.Spend = 165349.2, Marketing.Spend = 471784.1))


data.frame(StartModel2$residuals, StartModel2$fitted.values)

plot(StartModel2)

plot(StartModel3)


predict(StartModel)

StartModel_with_Marketing <- lm(Profit ~ R.D.Spend + Marketing.Spend)

summary(StartModel_without_Admin)

StartModel_without_Marketing <- lm(Profit ~ R.D.Spend)



head(data.frame(Startup50, fitted(StartModel_without_Admin), residuals(StartModel_without_Admin)))


plot(Profit ~ R.D.Spend)

plot(StartModel_without_Admin)



plot(resid(StartModel_without_Admin)~fitted(StartModel_without_Admin))

plot(resid(StartModel_without_Admin)~ R.D.Spend)

plot(fitted(StartModel_without_Admin) ~ R.D.Spend)


boxplot(resid(StartModel_without_Admin))


hist(resid(StartModel_without_Admin))

# Akaike's An Information Criterion

StartModel_with_Marketing

AIC(StartModel_with_Marketing)

StartModel_without_Marketing
                             
AIC(StartModel_without_Marketing)  

StartModel

AIC(StartModel)

data()

install.packages("MASS")

library("MASS")

?Aids2

?
head(SP500, 5)
