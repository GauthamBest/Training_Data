# Importing data and working with data frames

#  Clear your environment, Copy files to your working directory

ls()
rm(list = ls())

getwd()

setwd("D:/Official/Data Science/RWORK")


# Check if file exists in working directory
list.files()

# Importing data

startup50 <- read.csv("50-Startups.csv")

mydata <- read.csv("50-Startups.csv")

getwd()

mydata <- read.csv(file.choose())

mydata

class(mydata)

is.data.frame(mydata)

#  Exploring the data in the data frame
head(mydata)

head(mydata, n=10)
tail(mydata, n = 20)

nrow(mydata)

ncol(mydata)

plot(mydata)

# Understand the data structure
str(mydata)

cor(mydata$R.D.Spend, mydata$Administration)

#  Data statistics
summary(mydata)


# Recollect the class on vectors and matrix and how we filtered data
head(mydata)

mydata[c(3,5),]

# Get the 3rd row from data set
mydata[3,]

mydata[3:9,]

mydata[c(4,8),]

mydata[5,3]

mydata[,3]

mean(mydata[,3])


is.data.frame(mydata[4,4])

mydata[4,]

# is this a data frame?
is.data.frame(mydata[4,])


# Get the 3rd column
mydata[,3:5, drop = T]


is.data.frame(mydata[,3])

var_check<- mydata[,3, drop = F]
var_check

is.data.frame(var_check)

head(mydata)
# Using $ symbol

mydata[,"Country.Code"]

mydata[3,"Country.Code",]

mydata[3,]

mydata$Country.Code[3]

mydata$Country.Code[3]

mydata$Country.Name

mydata$Country.Name[3]

# Adding a new column
mydata$NewCol <- 1:5

mydata$ratio_newborn_Internt_users <- mydata$Birth.rate/ mydata$Internet.users

mydata$ratio_newborn_Internt_users <- NULL

head(mydata)

mydata

head(mydata, 50)

tail(mydata)

#Drop a column 
mydata$NewCol <- NULL

head(mydata)


# Conditional Filtering of data

mydata$Birth.rate < 15
# Why?

mydata[mydata$Birth.rate <15,]

# Another way

Filter_BR_Less10 <- mydata$Birth.rate <10

mydata[Filter_BR_Less10,]

mydata[Filter_Birth_Rate_Less10,]
    
# Reusable Filter variable.

mydata["Angola",]
#  Why ?

mydata[mydata$Country.Code == "IND",]


# How to filter?
mydata[mydata$Country.Name == "India",]



# Get me High Income countries with birth rate less than 10
head(mydata)

# How I can know all possible domain values of Income Group
?levels

levels(mydata$Income.Group)

mydata[mydata$Income.Group == "High income" & mydata$Birth.rate > 15,]

# Create a new data frame as a subset of existing
mydata_Very_low_income <- mydata[mydata$Income.Group == "Low income" 
                            & mydata$Birth.rate >= 40,]


class(mydata_Very_low_income)


head(mydata_Very_low_income)

nrow(mydata_Very_low_income)

# Creating a new data frame using vectors
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")



my_new_v <- c(1,2,3,4,5)

my_new_v1 <- c("a", "b", "c", "d", "e")

my_new_v2 <- c(T, F, T, F, T)


my_matrix <- matrix(my_new_v, my_new_v1, my_new_v2) 

my_matrix

class(my_new_v)

is.vector(my_new_v)

my_new_df <- data.frame(my_new_v, my_new_v1, my_new_v2)


my_new_df <- data.frame(Num = my_new_v, alpha = my_new_v1, Logical = my_new_v2)

names(my_new_df)


mydata$Country.Code <- NULL

ncol(mydata)

plot(mydata$Birth.rate, mydata$Internet.users)

mydata

plot(mydata)

plot(airquality)



cor(airquality$Ozone, airquality$Temp)

mydata

my_new_df

mynewdf <- data.frame(Country = Countries_2012_Dataset, 
                      Region = Regions_2012_Dataset, 
                      Codes = Codes_2012_Dataset)


head(mynewdf)

is.data.frame(mynewdf)

# Change the column names
colnames(mynewdf) <- c("Country", "Region", "Country_Code")

head(mynewdf)


rm(my_new_df)

my_new_df

# Remove or delete the data frame
rm(mynewdf)

# Re-create the df
mynewdf <- data.frame(Country = Countries_2012_Dataset, 
                      Region = Regions_2012_Dataset, 
                      Country_Code = Codes_2012_Dataset)

head(mynewdf)

remove.packages("reshape")

install.packages("reshape")

library(reshape)

head(mydata_Very_low_income)

?reshape
?rename

head(mydata)

mydata_new <- rename(mydata, c("ages"="age"))

colnames(mydata)

mydata_new

head(mydata)

names <- c("john", "tim", "andy")
ages <- c(50, 46, 25)

mydata <- data.frame(names,ages)

mydata

mydata <- rename(mydata,c(ages="age"))

mydata_Very_low_income <- 
    rename(mydata_Very_low_income, c(Income.Group = "Income_Group"))

rename(mtcars, c(wt = "weight", cyl = "cylinders"))

names(mydata_Very_low_income)

mydata_Very_low_income <- 
    rename(mydata_Very_low_income, 
           c("Birth.rate" = "Birth_Rate", 
             "Country.Code" = "Country_Code"))

names(mydata_Very_low_income)

head(mydata_Very_low_income)


names(mydata_Very_low_income)[1:5] <-
    paste(names(mydata_Very_low_income), 1:5, sep = "_")
    
names(mydata_Very_low_income)


# Merge

Ord_Detail <- read.csv("OrderDetail.csv")

Ord_Brk <- read.csv("OrderBreakdown.csv")


head(Ord_Detail)


colnames(Ord_Brk)

head(Ord_Detail, n = 10)

head(Ord_Brk, n = 10)

?merge

merge(x = Ord_Detail, y =  Ord_Brk, by = c("Order.ID", "Order.ID"))


merge(Ord_Detail, Ord_Brk, by = c("Order.ID", "Order.ID"))

Ord_Inner_join <- merge(Ord_Detail, Ord_Brk, 
                        by = c("Order.ID", "Order.ID"))


head(Ord_Inner_join)

head(Ord_Brk)


colnames(Ord_Brk)

# Rename the columns in Ord_Brk table
colnames(Ord_Brk)[1:5] <-
    paste(names(Ord_Brk), 1:5, sep = "_")

# If column in second table is different then below code has to be run
Ord_Inner_join <- merge(Ord_Detail, Ord_Brk, by.x = "Order.ID", by.y = "Order.ID_1") 

head(Ord_Inner_join)
                        
Ord_Inner_join <- merge(Ord_Detail, Ord_Brk, 
                        by.x = "Order.ID", by.y = "Order.ID_1")


head(Ord_Inner_join)

head(Ord_Brk)

# Left outer Join 
    
Ord_Brk[!Ord_Brk$Order.ID == "IT-2011-2942451",]

ord_brk_test <- Ord_Brk[!Ord_Brk$Order.ID == "IT-2011-2942451",]

head(ord_brk_test)

ord_brk_test[ord_brk_test$Order.ID == "IT-2011-2942451"]

# equi join (inner join)
ord_test <- merge(Ord_Detail, 
                  ord_brk_test, by = c("Order.ID", "Order.ID"))


head(ord_test, 9)

ord_test[ord_test$Order.ID == "IT-2011-2942451"]

# left outer join
ord_LOJ <- merge(Ord_Detail, 
                  ord_brk_test, by = c("Order.ID", "Order.ID"), 
                  all.x = TRUE)


ord_LOJ[ord_LOJ$Order.ID == "IT-2011-2942451",]



ord_detail_test <- Ord_Detail[!Ord_Detail$Order.ID == "IT-2011-2942451",]


# Right outer join
ord_ROJ <- merge(ord_detail_test, Ord_Brk, 
                 by = c("Order.ID", "Order.ID"), all.y = T)

ord_ROJ[ord_ROJ$Order.ID == "IT-2011-2942451",]


ord_test[ord_test$Order.ID == "IT-2011-2942451"]

order_outer_join <- merge(Ord_Detail, ord_brk_test, 
                          by = c("Order.ID", "Order.ID"))

order_outer_join[order_outer_join$Order.ID == "IT-2011-2942451",]

order_outer_join <- merge(Ord_Detail, ord_brk_test, 
                          by = c("Order.ID", "Order.ID"), all.x = TRUE)

head(order_outer_join)

order_outer_join[order_outer_join$Order.ID == "IT-2011-2942451",]


head(Ord_Detail)

# Right Outer Join

ord_dtl_test <- Ord_Detail[!Ord_Detail$Order.ID == "ES-2011-3848439",]

order_join_test <- merge(ord_dtl_test, Ord_Brk, 
                          by = c("Order.ID", "Order.ID"))

order_join_test[order_join_test$Order.ID == "ES-2011-3848439",]

order_join_test1 <- merge(ord_dtl_test, Ord_Brk, 
                         by = c("Order.ID", "Order.ID"), all.y = T)

order_join_test1[order_join_test1$Order.ID == "ES-2011-3848439",]


head(order_join_test1)

# Full outer join
# Hint - Use parameter all = T instead of all.x or all.y


# dplyr

# The airquality dataset below contains information about 
# air quality measurements in New York from May 1973 - Sep 1973.
head(airquality, 50)


remove.packages("dplyr")

install.packages("dplyr")

library(dplyr)




# one of the most used functions of dplyr is the filter function 
# gives an easier way of subseting data

data()

euro

?airquality

airquality

airquality[, c(4:6)]

nrow(airquality)

head(airquality)

airquality[airquality$Temp > 70,]

airquality[airquality$Temp > 70,]

install.packages("dplyr")

library(dplyr)

?filter

filter(.data = airquality, airquality$Month == 5)

filter(.data = airquality, Month == 9 & Day == 1)

filter70 <- filter(airquality, Temp > 70)

filter(.data = airquality, filter70)

filter70

filter(airquality, Month == 5)

airquality[airquality$Month == 5,]



filter(airquality, Temp > 80 & Month >= 9)

plot(airquality)

startup50

pairs(startup50)

mtcars
filter(.data = mtcars, mpg > 21)

airquality

# Mutate is used to add new variables or column to the data
# Lets add a calculated column to represent temp in degree celcuis

newairq <- mutate(.data = airquality, TempInC = round((Temp - 32) * 5/9,2))



head(newairq)

newairq

# summarise function is used to summarise 
# multiple values into a single value

summarise(.data = airquality, mean(Ozone))

summarise(airquality, mean(Ozone, na.rm = T))

# Group_by function is used to group data by one or more variables.


summarise(group_by(airquality, Month), mean(Ozone, na.rm = T))

group_by(airquality, Temp)

filter(airquality, Month == 5 & (Temp > 55 & Temp < 67))

# Using mtcars dataset
mtcars

str(mtcars)

pairs(mtcars)

by_cyl <- group_by(mtcars, cyl)
by_cyl

summarise(by_cyl, mean(disp), mean(hp), mean(mpg))

filter(by_cyl, disp == max(disp))


# sample function is used to select random rows from a table. 
sample_n(airquality, size = 10)

sample_frac(airquality, size = 0.01)

# count  
count(airquality, Month)

# arrange
?arrange
head(arrange(airquality, desc(Month), desc(Day)), 50)

# Pipe using the %>%

airquality %>% 
    filter(Month != 5) %>% 
    group_by(Month) %>% 
    summarise(mean(Temp, na.rm = TRUE))


# sqldf

# remove.packages("sqldf")
install.packages("sqldf")

library(sqldf)

head(airquality)

sqldf('select * from airquality order by "Month" desc limit 20')

sqldf('select * from airquality where Temp > 91 and Month = 9')

head(mtcars)


# Connecting to a mysql database instance

install.packages("RMySQL")

library(RMySQL)

?RMySQL

# Connecting and listing databases

? dbConnect

ucscDb <- dbConnect(MySQL(), user="genome", 
                    host="genome-mysql.cse.ucsc.edu")

result <- dbGetQuery(ucscDb,"show databases;"); 

dbDisconnect(ucscDb);
result

# List the tables for database hg19 

hg19 <- dbConnect(MySQL(),user="genome", db="hg19",
                  host="genome-mysql.cse.ucsc.edu")

? dbListTables

allTables <- dbListTables(hg19)

length(allTables)
allTables[1:20]

# List the fields for table affyU133Plus2

dbListFields(hg19,"affyU133Plus2")

# Run queries on the table
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

dbGetQuery(hg19, "select * from affyU133Plus2 limit 10")

# Read from the table

affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData, 5)

warnings()

## Select a specific subset

# Send the query to the database and store the result in a variable

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches 
                     between 1 and 3")

typeof(query)
class(query)

? fetch
# fetch or dbfetch opens the query object just like a cursor in stored procedures
affyMis <- fetch(query); quantile(affyMis$misMatches)

affyMisSmall <- fetch(query,n=10); dbClearResult(query);

dim(affyMisSmall)

head(affyMis)

head(affyMisSmall)

# Don't forget to close the connection!

dbDisconnect(hg19)


# Note: Use care while executing below code

con <- dbConnect(MySQL(),
                 user="user_id", password="password",
                 dbname="my_db", host="localhost")
on.exit(dbDisconnect(con))

sql <- sprintf("insert into <table_Name>
               (column1, column2)
               values (%d, '%s');",
               column1_value, column2_value)

rs <- dbSendQuery(con, sql)

dbClearResult(rs)

id <- dbGetQuery(con, "select last_insert_id();")[1,1]

return(id)

