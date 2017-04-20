
#  Data Visualization in R

ls()
rm(list = ls())

ls()




head(mtcars)

attach(mtcars)
plot(wt, mpg) 
abline(lm(mpg~wt))
title("Regression of mpg on weight")
detach(mtcars)
dev.off()


# matplot
FieldGoals

# See how players have been progressing in terms of goals scored
# Run the Basketball script with data set provided in 
# Session 4 ACAD_S3_BasketballData.R

? matplot
matplot(t(FieldGoals), type = "p")


matplot()

matplot(t(FieldGoals), type = "b", pch = 15:18)



matplot(t(FieldGoals), type = "b", pch = 15:18, col = c(1:4, 6))

matplot(t(FieldGoals), type = "l1")

fg<- data.frame(FieldGoals)


head()

t(fg)

qplot(fg[1,], fg[,1], data = fg)

# Uncomment and run below line if using ggplot for the first time
# install.packaage("ggplot2")

library(ggplot2)

head(mpg[1:50,1:9], 50)

mpg[mpg$manufacturer, mpg$displ, mpg$hwy]

mpg

names(mpg)

str(mpg)

# qplot is the basic plotter in ggplot.

qplot(displ, hwy, data = mpg)

qplot(displ, cty, data = mpg, color = drv)

qplot(displ, hwy, data = mpg, color = drv, 
      geom = c("point", "smooth"))

library(dplyr)

a4 <- filter(mpg, mpg$model == "a4")

a4

qplot(displ, cty, data = a4)

qplot(hwy, cty, data = mpg)

# histogram of cars and mileage on highways
qplot(hwy, data = mpg, fill = drv)

# histogram of cars and mileage on highways
qplot(cty, data = mpg, fill = drv)

# facets - multiple plots as shown below based on the drivetrain type
qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 1)

qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2)

qplot(hwy, data = mpg, facets = .~ drv, binwidth = 2)

qplot(cty, data = mpg, facets = .~ drv, binwidth = 2)


# Highway miles per gallon based on the engine size
qplot(displ, hwy, data = mpg, facets = . ~ drv)


## MAACS data
# The maacs.Rda file along with instructions have been 
# provided as part of reference material for this session
## MAACS Cohort

# - Mouse Allergen and Asthma Cohort Study
# - Baltimore children (aged 5 to 17)
# - Persistent asthma, exacerbation in past year
# - Study indoor environment and its relationship with asthma morbidity
# - Recent publication: http://goo.gl/WqE9j8


load("maacs.Rda")

head(maacs, 50)
str(maacs)
# eno: Exhaled nitric oxide; pm25: Fine particulate matter
# mopos: Sensitized to mouse allergen
qplot(eno, data = maacs)

# As the data distribution is not even and there is skewdness in the data
# we will use log function to distribute the data  as below
# and represent it on a hsitogram
qplot(log(eno), data = maacs)

qplot(log(eno), data = maacs, fill = mopos)

# Density smooth
qplot(log(eno), data = maacs, geom = "density")

qplot(log(eno), data = maacs, geom = "density", col = mopos)
# What do you observe in higher values of nitric oxide?

# Scatterplots
qplot(log(pm25), log(eno), data = maacs)

qplot(log(pm25), log(eno), data = maacs, shape = mopos)

qplot(log(pm25), log(eno), data = maacs, color = mopos)

qplot(log(pm25), log(eno), data = maacs, color = mopos, 
      geom = c("point", "smooth"), method = "lm")

qplot(log(pm25), log(eno), data = maacs, geom = c("point", "smooth"), 
      method = "lm", facets = . ~ mopos)

## Basic componets of a ggplot2 plot
# A data frame
# aesthetic mappings: color, size
# geoms: geometric objects like points, lines, shapes
# facets: for conditional plots
# stats: statistical transformations like binning, quantiles, smoothing
# scales: what scale an aesthetic map uses
# coordinate system
# Plot the data -> overlay the summary -> metadata and annotation
head(maacs)

qplot(log(pm25), log(eno), data = maacs, facets = . ~ mopos, 
      geom = c("point", "smooth"), method = "lm")

head(maacs[, 1:3])

g <- ggplot(maacs, aes(log(pm25), log(eno)))
summary(g)
print(g) # no layers in plot
p <- g + geom_point()
print(p)

g + geom_point() # auto-print 
## Adding more layers
g + geom_point() + geom_smooth()
g + geom_point() + geom_smooth(method = "lm")

g + geom_point() + facet_grid(. ~ bmicat) + geom_smooth(method = "lm")
# Annotation
# xlab(), ylab(), labs(), ggtitle()
# Modifying Aesthetics
g + geom_point(color = "steelblue", size = 4,
               alpha = 1 / 2) # sign a constant
g + geom_point(aes(color = bmicat), size = 4, alpha = 1 / 2) # wrap the non-constant
g + geom_point(aes(color = bmicat)) + labs(title = "MAACS Cohort") +
    labs(x = expression("log " * PM[2.5]), y = "Nocturnal Symptoms")
# labs() function for modifying titles and x- y- axis
g + geom_point(aes(color = bmicat), size = 2, alpha = 1/2) +
    geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE)
# Changing the Theme
g + geom_point(aes(color = bmicat)) + theme_bw(base_family = "Times")

## A notes about axis limits
testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50, 2] <- 100 ## Outlier
plot(testdat$x, testdat$y, type = "l", ylim = c(-3, 3))
g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()
g + geom_line() + ylim(-3, 3) # outlier missing
g + geom_line() + coord_cartesian(ylim = c(-3, 3)) # outlier included

# Making No2 Tertiles
cutpoints <- quantile(maacs$logno2_new, seq(0, 1, length = 4), na.rm = T)
maacs$no2dec <- cut(maacs$logno2_new, cutpoints)
levels(maacs$no2dec)

## Final plot
g <- ggplot(maacs, aes(logpm25, NocturnalSympt))
g + geom_point(alpha = 1/3)
+ facet_wrap(bmicat ~ no2dec, nrow = 2, ncol = 4)
+ geom_smooth(method = "lm", se = F, col = "steelblue")
+ theme_bw(base_family = "Avenir", base_size = 10)
+ labs(x = expression("log ") * PM[2.5])
+ labs(y = "Nocturnal Symptoms")
+ labs(title = "MAACS Cohort")