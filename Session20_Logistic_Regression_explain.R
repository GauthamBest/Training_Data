

# Logistic Regression

rm(list = ls())

email <- read.csv(file.choose())


head(email)

str(email)

# Dummify
email$Male <- ifelse(email$Gender == "Male", 1, 0)

email$Female <- ifelse(email$Gender == "Male", 0, 1)

email$Male <- factor(email$Male)

email$Female <- factor(email$Female)

str(email)

# email$TookAction <- factor(email$TookAction)

attach(email)


plot(TookAction ~ Age)
plot(log(TookAction) ~ Age)

abline(lm(log(TookAction)~Age), col = "red")

# Run linear regression
model1 <- lm(TookAction ~ Age + Male)

pairs(email)

plot(model1)

plot(resid(model1) ~ fitted(model1))

summary(model1)

model2 <- lm(TookAction ~ Age + Female)

summary(model2)

data.frame(model2$fitted.values, model2$residuals)

plot(resid(model1) ~ fitted(model1))

# Run logistic regression

?glm

lmodel1 <- glm(formula = TookAction ~ Age + Male, family = binomial)

plot(lmodel1)

plot(resid(lmodel1) ~ fitted(lmodel1))

data.frame(lmodel1$fitted.values, lmodel1$residuals)



