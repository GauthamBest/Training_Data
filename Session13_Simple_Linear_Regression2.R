
# Multiple Linear Regression

rm(list = ls())


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

dummy.code(Startup50$State)

# Dummify
Startup50$State <- ifelse(Startup50$State == 'New York', 1, 0)

cor(Startup50)

attach(Startup50)

# Muliple linear regression
StartModel <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend + State)

summary(StartModel)

str(Startup50)

predict(StartModel)

StartModel_without_Admin <- lm(Profit ~ R.D.Spend + Marketing.Spend)

summary(StartModel_without_Admin)

StartModel_without_Admin <- lm(Profit ~ R.D.Spend)



head(data.frame(Startup50, fitted(StartModel_without_Admin), residuals(StartModel_without_Admin)))


plot(Profit ~ R.D.Spend)

plot(StartModel_without_Admin)
                               