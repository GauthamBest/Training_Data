
# R basics
# Discuss the variable types in R

# Lets first set the working direcotry and clear all environment variables
getwd()

setwd("D:/Official/Data Science/RWORK")

ls()
rm(list = ls())

ls()

9+7

9+7; 2*4; 15-12; 15/5

# Data Type Double is default

x<-2
x
typeof(x)
typeof(x)

# Data Type Enforcing Integer 
x<-2L
typeof(x)

x<-2.3L

x
typeof(x)

x <- 2147483647L

x

x <- 2147483648

typeof(x)

.Machine$double.xmax
.Machine$integer.max


.Machine$double.xmin


x <- 2147483648L


.Machine$double.xmax

.Machine$double.xmin

x <- 2147483648L

x <- 2147483648

is.integer(x)

is.double(x)


# Data Type Complex

# i = squareroot -1

sqrt(-1)

x<- 2+3i

typeof(x)

# Character data type
x<- "I'm an R programer"
typeof(x)

# Creating a logical data type
a <- 3
b <-5
a
b

z <- b>a

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

ls()

a <- 20
b<-5

?sqrt

sqrt_val <- sqrt(a+b)
sqrt_val

# Exponent
log <- sqrt_val^2

log

# Logarithm

?log
log
`
log(25, 2)

log(16, 2)

2^4

log(100, 10)

10^2

log2(16)

log(16, 2)

log10(16)

log(100, 10)

log10(100)

log(25, 5)


log10_val <- log10(100)    

log10_val

190000e5

1.9e2

signif(123456789, 7)

runif(10)

round(runif(10))

# Vectors

x<- 1

typeof(x)

class(x)

1:10

?seq 

seq(1, 10, by = 5)

seq(10, 20, by = 2)

seq(5, 100, length.out = 25)


x

x<- 1:10

x
is.vector(x)

is.vector(x)

# using combine function
x <- c(1,3, 5, 2, 7, 9)

x

x <-  c(3, 6, 9, 12, 1, 2)

x

# subsetting 

# x[row, col]

x[c(3,5)]

x[-5:-3]

x[c(1,6)]

x[-5:-4]

x
x<- c(3,7,5)
# c represnets Combine
x
# Subset
x[2:3]

y <- c(5,10,15,20,25,30)

x <- c(1,2,3,4,5,6)

y

x

y[3:5]

y[-1]

y[-2:-5]

?plot

plot(x,y)

cor(x,y)
# observe the error

x<- 18

y<- 3

# Modulo or remainder
10%%3

x%%y

x<- c(10,20,30,40,50,60)
y <- c(5,10,15,20,25,30)

x

x[1:6]

x[6:1]

# Corelation
cor(x,y)
plot(x,y)
plot(x[6:1],y)

cor(x[6:1], y)

# Plot and observe negetive and positive corelation
plot(x[6:1],y)


x[6:1]

?plot


plot(x,y, type = "b", ylim = c(0, 50), xlim = c(0, 80))


x <- c(1, 3, 5, 4, 6, 7, 9 , 10)

sort(x)

mean = sum(x)/ 7
mean

mean(x)

median(x)

y


mean(y)

median(y)

test <- c(2,3,1,5,5,7,8)


# Sequence generator

?seq
new_ex <- seq(1, 10, 2)

new_ex

new_ex <- seq(1, 10, length.out = 8)

new_ex

new_ex <- seq(1, 10, length.out = 4)

?rnorm

rnorm(10, mean = 20, sd = 2)

rn <- rnorm(50, mean = 50, sd = 8)

rn

mean(rn)

sd(rn)

rn

?hist

hist(rn)

?rbinom

x<- rbinom(50, 1, 0.3)

x

dbinom(x, 50, 0.5)

rbinom(50, 1, 0.7)

hist(rbinom(50, 1, 0.3))

new_ex <- rnorm(10, mean = 5, sd = 4)

new_ex

new_ex <- rnorm(10, mean = 5, sd = 10)

hist(new_ex)

new_ex <- rnorm(100, mean = 50, sd = 1)

new_ex

plot(new_ex, xlim = c(-20, 120))

median(test)

mean(test)

test

sort(test)

sum(test)/length(test)

mean(test)


rnorm(50, 20, 2)

set.seed(909)


rnorm(10, 20, 2)

set.seed(123456)


rnorm(10, 20, 5)
hist(rnorm(10, 20, 5))

median(test)

min(test)
max(test)
test
range(test)

sum(test)

q <- c(0, 25, 50, 75, 100)

quantile(q)

q<- c(0, 1, 2, 3, 25, 26, 27, 28, 50, 51,52, 53,75,76, 77, 78, 100)

quantile(q)

q<- c(0:70)
q
quantile(q)

# Rank function
x2 <- c(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5)
x2
rank(x2)

?rank

## ranks without averaging
rank(x2, ties.method = "first")  # first occurrence wins
rank(x2, ties.method= "last")   #  last occurrence wins
rank(x2, ties.method= "random") # ties broken at random
rank(x2, ties.method= "random") # and again

# Range

r <- c(-10,0, 10, 20, 30)

range(r)

variance <- c(1:4)

variance

mean(variance)

?var
# Variance
var(variance)
# Square root of variance
sqrt(var(variance))

# Standard devation is equal to square root of variance
sd(variance)

b <- c(1, 2, 3, "abc", 2.5)

b<- c("one", "two", "three")

b

typeof(b)

class(b)

b[1]

b[1];b[3]


b[c(1,3)]
# using combine to get the results

c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE)
c

class(c)
typeof(c)

a<- c(1:9)

a<- c(1,3,5,7,9)

typeof(a)

class(a)

is.vector(a)

# Matrices
# ---------

?matrix

c(1:3)

matrix(1:9, ncol = 9)

mtrx <- matrix(1:6, nrow = 9)    

mtrx

mtrx <- matrix(1:6, ncol = 3)    

mtrx <- matrix(1:6, ncol = 4)

mtrx

mtrx <- matrix(c(1:6), ncol = 3, byrow = T)    

mtrx <- matrix(c(1:6), nrow = 3, byrow = T) 

mtrx

mtrx <- matrix(c(1:6), ncol = 3)    

mtrx

mtrx <- matrix(c(1:9), nrow = 3)    

mtrx

mtrx <- matrix(c(1:9), ncol = 3)    

mtrx

class(mtrx)

mtrx

# Transpose
t(mtrx)

x<- matrix(c(20,10,80,50,60,100,90,30,40,70,50,60),nrow=3)
x

# subsetting
# syntax matrix[row, col]

x[3, 2]

x[c(1,2)]

x[1,2]

x[2,3]

x[,2]

x

?rownames

x

rownames(x) <- c("r1", "r2", "r3")

colnames(x) <- c("c1", "c2", "c3", "c4")

x["r3", "c4"]

rownames(x)<- rownames(x, do.NULL=FALSE, prefix="Test.")

colnames(x)<- colnames(x,do.NULL=FALSE, prefix="Test.")
x

rownames(x) <- c("r1", "r2", "r3", "r4")


x<-matrix(c(20,10,80,60,100,90,30,40,70,50, 2i),nrow=3)
x
class(x)
typeof(x)

x[c("Test.1", "Test.2")]

x<-matrix(c(20,10,80,60,100,90,30,40,70,50, "abc"),nrow=3)
x
class(x)
typeof(x)
x
colnames(x)<- c("a", "b", "c", "d")
x

rownames(x) <- c("r1", "r2", "r3")

x
x["r1", "c"] 

X<-matrix(c(50, 60 ,40,90,100, 80,50, 90,10, 80,30, 70),nrow=3)


typeof(X)

X[4]

X[3,]

X[,4]

mean(X[,4])

mean(X[3,])

X

?rbind

x

x <- rbind(x, c(10,20, 30, 40))

x

?apply

sum(x)

x
apply(x, MARGIN = 2, FUN = mean)

apply( X = x, MARGIN =  2, FUN = sum)

test <- apply( X = x, MARGIN =  2, FUN = sum)
test

x <- rbind(x, test)

x <- cbind(x, test)

x

X<- rbind(X, apply(X, 2, mean))

X<- rbind(X, c(10,20,30,40))

X

X<- cbind(X, apply(X, 1, sd))

X

dimnames(x)

x

matdata<- matrix(c(50,60,40,90,100, 80,50, 90,10, 80,30, 70),nrow=4)
matdata
cols<-apply(matdata,2,mean)

dimnames(matdata)

dimnames(mtrx)

cols

# Continue with data types
# ---------------- Start of session 4 content ------------------- 

ls()

rm(list = ls())


# Creating Arrays
# Create two vectors of different lengths.


vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)

vector1

# Take these 2 vecors and create a Matrix
mtrx <- rbind(vector1, vector2)             
mtrx

mtrx1 <- matrix(data = c(vector1, vector2), nrow = 3)

mtrx1

mtrx1 <- matrix(data = c(vector1, vector2), ncol = 3, byrow = TRUE)

mtrx1

# Assigning Names to the rows and columns
rownames <- c("R1", "R2", "R3")
colnames <- c("C1", "C2", "C3")

dimnames(mtrx1)

rownames(mtrx1) <- c()

# using list function
dimnames(mtrx1) <- list(rownames, colnames)

mtrx1

mtrx1["R1", "C1"]


class(mtrx1)


# Take these vectors as input to the array.
? array

vector1
vector2

mtrx1



result <- array(c(vector1,vector2), dim = c(3,3,3))

result


vector1 <- c(5,9,3,2,1,0)
vector2 <- c(10,11,12,13,14,15,16,17,18)


result <- array(c(vector1,vector2),dim = c(3,3,2))

result

result <- array(c(vector1,vector2),dim = c(2,2,3))

result

result <- array(c(vector1,vector2), c(2,3,3))

result


# Create two vectors of different lengths.
vector1 <- c(5,9,3, 6,7, 8)
vector2 <- c(10,11,12,13,14,15)
column.names <- c("COL1","COL2","COL3")
row.names <- c("ROW1","ROW2","ROW3")
matrix.names <- c("Matrix1","Matrix2")

# Take these vectors as input to the array.
result <- array(c(vector1,vector2), dim = c(3,3,2), 
                dimnames = 
                    list(row.names,column.names,matrix.names))

result
typeof(result)


my.array<-array(0,dim=c(1,2,3))


my.array



# Can array store different data types 
vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)
vector3<- c("abc", "def", "ghi")
matrix.names <- c("Matrix1","Matrix2", "Matrix3")

result1 <- array(c(vector1,vector2, vector3),dim = c(3,3,3), 
                 dimnames = 
                     list(row.names,column.names,matrix.names))

result1

row.names

col.names

matrix.names

result1

typeof(result1)

is.array(result1)



# array of letters and using dim() function to 
# create arrays from Vectors

A <- letters[1:16]

A

is.vector(A)
is.matrix(A)

# splitting a matrix into arrays
dim(A) <- c(2,2,4)

dim(A) <- c(2,2,4)

A
is.matrix(A)
is.array(A)

# Reading from array
# syntax - array[row, col, set]

class(A)

A[,,1:3]

A[,,4]

# A[row, col, set]
A
A[,2,]

A[,2,4]

# -----  Lists -----

mtrx1
A

newList <- list(mtrx1, A)
newList


newList[1]

# Named lists
newList <- list(matrix = mtrx1, ArrayOfLetters = A)
newList$ArrayOfLetters

# subsetting lists
newList[1]

newList["matrix"]

newList["Letters"]

# Adding to existing List
newList$Letters[,,4]

newList$Num <- c(1:10)

newList$Num <- c(1:10)

newList$Num <- NULL

newList$Numbers <- c(1:16)

newList

# Deleting from List
newList$Num <- NULL

newList

letters

which(letters == "k")


# Data frames

d <- c(1,2,3,4)
e <- c("red", "white", "red", NA)
f <- c(TRUE,TRUE,TRUE,FALSE)

typeof(f)

mymatrix <- matrix(data = c(d,e,f), nrow = 4)

mymatrix

myarray <- array(data = c(d,e,f), dim = c(2,2,3))

myarray

data.frame()

?data.frame

mydata <- data.frame(d,e,f)

mydata

mydata[1,2]

# importing a file
mydata <- read.csv(file.choose())

head(mydata, 20)

head(mydata, 2)

tail(mydata, 2)


summary(mydata)

str(mydata)

# Assign variable names
names(mydata) <- c("ID","Color","Passed") 

names(mydata)

dimnames(mydata)

mydata

# Susetting data frame

mydata

mydata[1:3]

mydata[1:3,] 

mydata$price

mydata[mydata$price >= 2964,]

mydata[c("ID","Passed")] 

mydata$Color

mydata[mydata$ID>=4,]



# variable gender with 20 "male" entries and 
# 30 "female" entries using rep() function to repeat

rep(10, 10)

gender <- c(rep("male", 20), rep("female", 30)) 

gender

gender <- factor(gender) 

gender

# stores gender as 20 1s and 30 2s and associates
# 1=female, 2=male internally (alphabetically)
# R now treats gender as a nominal variable 
summary(gender)

# An ordered factor is used to represent an ordinal variable.
# variable rating coded as "large", "medium", "small'

rating <- c("small", "medium", "large")


rating <- ordered(rating)

rating

# Str - Structure
str(rating)

# recodes rating to 1,2,3 and associates
# 1=large, 2=medium, 3=small internally
# R now treats rating as ordinal


matdata<- matrix(c(50,60,40,90,100, 80,50, 90,10, 80,30, 70),nrow=4)

matdata

cols<-apply(matdata,2,mean)

cols

sweep(matdata,2,cols)


