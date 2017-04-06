
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

is.matrix(mtrx)

mtrx1 <- matrix(data = c(vector1, vector2), nrow = 2)

mtrx1

# Assigning Names to the rows and columns
row.names <- c("R1", "R2")
col.names <- c("C1", "C2", "C3", "C4", "C5")

dimnames(mtrx1)

dimnames(mtrx1) <- list(row.names, col.names)

mtrx1

mtrx1["R1", "C1"]


class(mtrx1)

?array


# Take these vectors as input to the array.
result <- array(c(vector1,vector2), dim = c(3,2,2))

result


vector1 <- c(5,9,3,2,1,0)
vector2 <- c(10,11,12,13,14,15,16,17,18)


result <- array(c(vector1,vector2),dim = c(3,3,3))

result

result <- array(c(vector1,vector2),dim = c(2,2,3))

result

result <- array(c(vector1,vector2), c(2,3,3))

result


# Create two vectors of different lengths.
vector1 <- c(5,9,3)
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
matrixn.names <- c("Matrix1","Matrix2", "Matrix3")

result1 <- array(c(vector1,vector2),dim = c(3,3,2), 
                dimnames = 
                    list(row.names,column.names,matrix.names))

result1

typeof(result1)

is.array(result1)



result1 <- array(c(vector1,vector2, vector3),dim = c(3,3,3), 
                 dimnames = 
                     list(row.names,column.names,matrixn.names))




# array of letters and using dim() function to 
# create arrays from Vectors

?letters
A<- letters[1:16]

A

is.vector(A)
is.matrix(A)

?dim
dim(A)

dim(A) <- c(2,2,4)

A
is.matrix(A)
is.array(A)

# Reading from array
A[,,1:2]

A[,,4]

A[row, col, set]

A[,2,]

A[,2,4]

#  Lists

mtrx1
A

newList <- list(mtrx1, A)
newList

is.list(newList)

newList[2]

newList

newList <- list(matrix = mtrx1, Letters = A)
newList

newList$Letters


newList[1]


newList["matrix"]

newList["Letters"]

# Adding to existing List
newList$Numbers <- c(1:16)

newList

# Deleting from List
newList$Numbers <- NULL

newList


# Data frames

d <- c(1,2,3,4)
e <- c("red", "white", "red", NA)
f <- c(TRUE,TRUE,TRUE,FALSE)

typeof(d)

mymatrix <- matrix(data = c(d,e,f), nrow = 4)

mymatrix

myarray <- array(data = c(d,e,f), dim = c(2,2,3))

myarray

mydata <- data.frame(d,e,f)

mydata


mydata <- read.csv(file.choose())

mydata <- read.csv(file.choose())

head(mydata, 10)

head(mydata)

tail(mydata)


summary(mydata)

str(mydata)

mydata$Year.of.release <- factor(mydata$Year.of.release)

# Assign variable names
names(mydata) <- c("ID","Color","Passed") 

names(mydata)

mydata

# Susetting data frame

mydata[1:3]

mydata[3,] 

mydata[c("ID","Passed")] 

mydata$Color

mydata[mydata$ID>=4,]




# variable gender with 20 "male" entries and 
# 30 "female" entries using rep() function to repeat

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


