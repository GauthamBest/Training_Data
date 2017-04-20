head(galton)

?par
par(mfrow=c(1,2))
hist(galton$child,col="blue",breaks=100)
hist(galton$parent,col="blue",breaks=100)


library(manipulate)
myHist <- function(mu){
    hist(galton$child,col="blue",breaks=100)
    lines(c(mu, mu), c(0, 150),col="red",lwd=5)
    mse <- mean((galton$child - mu)^2)
    text(63, 150, paste("mu = ", mu))
    text(63, 140, paste("MSE = ", round(mse, 2)))
}
manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))


ggplot(galton, aes(galton$parent, galton$child, )) + 
    geom_point(colour = "blue")

ggplot(galton, aes(galton$parent, jitter(galton$child,4), )) + 
    geom_point(colour = "blue")



# Swirl Regression

library(swirl)

install_from_swirl("Regression Models")

swirl()

plot(child~parent, galton)

# jitter - by using R's function "jitter" on the children's heights, we can spread
# out the data to simulate the measurement errors and make high frequency heights
# more visible.
plot(jitter(child,4) ~ parent, galton)

regrline <- lm(child~parent, galton)

abline(regrline, lwd = 3, col = 'red')




