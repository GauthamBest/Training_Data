
pnorm(50, 45, 8, lower.tail = F)

rnorm(1:400, 38, 6)



# Sampling from a population
sample(1:10, size = 100, replace = T)

# Normal population of numbers

rnorm(100, mean = 50, sd = 10)

rep(1,100)

x<- rep(1,100)

y<- rnorm(100, mean = 50, sd = 10)


dat <- data.frame(x,y)

dat

x<- 1
y<- 50
mean <- data.frame(x,y)

mean

library(ggplot2)

ggplot()+
    geom_point(data = dat, aes(x,y)) +
    geom_point(data = mean, aes(x,y), 
               size = 10, color = "red")


x <- seq(-30,30,1)
x


plot(x=x, y=dnorm(x, mean=0, sd=10), type='l')


# Binomial distribution

x <- seq(0,20,1)
x
y=dbinom(x,20,1)

y

plot(x=x, y=dbinom(x,20,0.5))

    
# Geometric distribution

x<- c(0,1,1,1,0,0,0,1,1,0)

x<- -10:10

y<- dgeom(x, prob = 0.5)


p<- pgeom(x, prob = 0.5)

plot(y)

plot(p)


log(67)
