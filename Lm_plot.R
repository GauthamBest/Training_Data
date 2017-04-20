# Simple linear regression

ls()
rm(list = ls())

ls()

list.dirs()

getwd()


dat <- read.csv("data/SalaryData.csv")

dat

summary(dat)

attach(dat)
plot(dat) 
abline(dat$YearsExperience~dat$Salary)    

lm(data = dat, dat$YearsExperience~dat$Salary)

summary(lm(data = dat, dat$YearsExperience~dat$Salary))

plot(lm(data = dat, dat$YearsExperience~dat$Salary))
