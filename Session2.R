
# R basics
# Discuss the variable types in R

ls()
rm(list = ls())

ls()

9+7

9+7; 2*4; 15-12

# Data Type Double is default

x<-2
x

typeof(x)

# Data Type Enforcing Integer 
x<-2L
typeof(x)

# Data Type Complex
x<- 2+3i
typeof(x)

# Character data type
x<- "I'm an R programer"
typeof(x)

# Creating a logical data type
a<- 3
b<-5

z <- b > a

z

typeof(z)


typeof(3.5+5L)

n <- T
n<- F

typeof(n)

n<- FALSE
typeof(n)


# Operations using Variables
rm(list = ls())

a<- 20
b<-5

sqrt_val <- sqrt(a+b)
sqrt_val

# Exponent
sqrt_val^2


# Logarithm

log(16, 2)

log2(16)

log(100, 10)

log10(100)

log(25, 5)

log(12345)

log(23456789)

log(2423423456789)



log10_val <- log10(100)    

log10_val

190000e-5

1.9e2



# Vectors

1:10

x<- 1:10
x

x <- c(5, 9, 12)
x

x

x[2:3]

x<- c(3,7,5)
# c represnets Combine
x
# Subset
x[]

y <- c(5,10,15,20,25,30)

x

y[3:5]

y[-1]

y[-2:-5]

cor(x,y)
# observe the error

x<- 18

y<- 3

x%%y

x<- c(10,20,30,40,50,60)
x
y

x[1:6]

x[6:1]

?cor

cor(x,y)

plot(x, y)

cor(x[6:1], y)

plot(x[6:1],y)

plot(x,y)

y

x <- c(1,3, 5, 2, 4)
x

1, 2, 3, 4, 5, 6

mean(x)

median(x)

mean(y)

median(y)

mean_median <- c(2,3,1,5,5,7,8)

1:10
?seq

new_ex <- seq(1, 10, by = 2)

new_ex <- seq(1, 10, length.out = 5)

new_ex

?rnorm

summary(rnorm(10, mean = 20, sd = 20))

rnorm(10, mean = 20, sd = 20)

new_ex <- rnorm(10, mean = 5, sd = 4)

new_ex

median(mean_median)

mean(mean_median)

mean_median

sort(mean_median)

sum(mean_median)/length(mean_median)

mean(mean_median)


median(mean_median)

min(mean_median)
max(mean_median)
range(mean_median)

sum(mean_median)

q<- c(0, 25, 50, 75, 100)

quantile(q)

q<- c(0, 1, 2, 3, 25, 26, 27, 28, 50, 51,52, 53,75,76, 77, 78, 100)

quantile(q)

q<- c(0:100)

q
quantile(q)

# Rank function
x2 <- c(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5)
x2
rank(x2)

## ranks without averaging
rank(x2, ties.method= "first")  # first occurrence wins
rank(x2, ties.method= "last")   #  last occurrence wins
rank(x2, ties.method= "random") # ties broken at random
rank(x2, ties.method= "random") # and again

?rank
# Range

r <- c(-10,0, 10, 20, 30)

range(r)

variance <- c(1:4)

variance

mean(variance)

# Variance
var(variance)
# Square root of variance
sqrt(var(variance))

# Standard devation is equal to square root of variance
sd(variance)



b<- c("one", "two", "three")
b

typeof(b)

class(b)

is.vector(b)

is.matrix(b)

b[1:2]

b[c(1,3)]

b[1];b[3]
# observe error


b[c(1,3)]
# using combine to get the results

c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE)
c

class(c)
typeof(c)

a<- c(1:9)

a< - c(1,3,5,7,9)

# Matrices
# ---------

vect <- c(1,3,4,"abc", TRUE)

vect

m1 <- matrix(1:10, ncol = 2)

m1

mtrx <- matrix(c(1:3), nrow = 3)    

mtrx

mtrx <- matrix(c(1:3), ncol = 3)    

mtrx

mtrx <- matrix(c(1:6), nrow = 3)    

mtrx

mtrx <- matrix(c(1:6), ncol = 3)    

mtrx

mtrx <- matrix(c(1:9), nrow = 3)    

mtrx

mtrx <- matrix(c(1:9), ncol = 3)    

mtrx

class(m1)

# Transpose
t(mtrx)

x<-matrix(c(20,10,80,50,60,100,90,30,40,70,50,60),nrow=3)
x

x[c(1,1)]

rownames(x)<-rownames(x,do.NULL=FALSE,prefix="Test.")

x<-matrix(c(20,10,80,60,100,90,30,40,70,50, 2i),nrow=3)
x
class(x)
typeof(x)

x<-matrix(c(20,10,80,60,100,90,30,40,70,50, "abc"),nrow=3)
x
class(x)
typeof(x)

colnames(X)<- c("a", "b", "c", "d")
x

rownames(X) <- c("r1", "r2", "r3")

x

X <-matrix(c(50, 60 ,40,90,100, 80,50, 90,10, 80,30, 70),nrow=3)

X

typeof(X)

vect[3]
X

X[1,4]

X[2,3]
X

X[,4]

mean(X[,4])

mean(X[3,])

X

Y <- c(50, 90, 120, 140)

is.vector(Y)

X

X <- rbind(X, Y)

X

Z <- c(1,2,3,4)

X <- cbind(X, Z)

X

?apply
apply(X, )

X<- rbind(X, apply(X, 2, mean))

X<- cbind(X, apply(X, 1, mean))

X

mat1 <- matrix((10:14), nrow = 2)

mat1 <- rbind(mat1, c(1))

mat1

X<- rbind(X, c(10,20,30,40))

X

?t

t(mat1)

X<- cbind(X, apply(X, 1, var))

X

vect[1,2]



matdata<- matrix(c(50,60,40,90,100, 80,50, 90,10, 80,30, 70),nrow=4)
matdata
cols<-apply(matdata,2,mean)

cols

sweep(matdata,2,cols)

