# Importing data and working with data frames

#  Clear your environment, Copy files to your working directory

ls()
rm(list = ls())
getwd()

head(AmazingMart)

str(AmazingMart)

AmazingMart$`Ship Mode` <- factor(AmazingMart$`Ship Mode`)


AmazingMart$Region <- factor(AmazingMart$Region)


# Check if file exists in working directory
list.files()

# Importing data
getwd()

setwd("D:/Official/Data Science/RWORK")

mydata <- AmazingMart[1:100, 1:5]
is.data.frame(mydata)

mydata

mydata <- read.csv("DemographicData.csv")

class(mydata)

#  Exploring the data in the data frame
head(mydata)

head(mydata, n=10)

tail(mydata, n = 2)

# Birth rate calculation - (Number of births * 1000) / estimated population 
# That is the number of births per thousand people for a given year

# total number of rows and columns
nrow(mydata)

ncol(mydata)

# Understand the data structure
str(mydata)

# factor(mydata$fraudRisk)

is.data.frame(mydata[1,3, drop = F])


is.vector(mydata[1,3, drop = T])

mydata[1,3, drop = F]

mydata[1,3, drop = T]

is.data.frame(mydata[1:2,3:5])

head(mydata)

mydata[1, 1:3, drop = TRUE]


is.data.frame(mydata[1:2,3:5, drop = F])


#  Data statistics
summary(mydata)


# Recollect the class on vectors and matrix and how we filtered data
head(mydata)

# Get the 3rd row from data set
mydata[3,]

mydata[3:9,]

mydata[c(4,8),]

mydata[4,4]

is.data.frame(mydata[4,4])
is.vector(mydata[4,4])

is.factor(mydata[4,4])

class(mydata[4,4])

mydata[4,]

# is this a data frame?
is.data.frame(mydata[4,])


# Get the 3rd column
mydata[,3]


is.data.frame(mydata[,3])

is.vector(mydata[,3])

mydata[,3, drop = F]

var_check<- mydata[,3, drop = F]
var_check

is.data.frame(var_check)

head(mydata)
# Using $ symbol
mydata
mydata[6,"balance"]

mydata[3,"Country.Code",]

mydata$balance[11]

mydata$Country.Code[3]

mydata$Country.Name

mydata$Country.Name[3]

# Adding a new column
mydata$NewCol <- 1:11

mydata$Newcol <- 1:10

mydata

head(mydata, 50)

tail(mydata)

#Drop a column 
mydata$Newcol <- NULL

mydata$Newcol <- NULL


head(mydata)

# order data

attach(mydata)




mydata$`Order Date`

?order
mydata[order(numTrans, decreasing = T),]

mydata[order(mydata$Birth.rate),]

balanceIndex <- order(mydata$balance, decreasing = T)

balanceIndex

mydata[balanceIndex,]

str(mydata)

mydata[mydata$Country == "France",]

mydata[mydata$`Order Date` >= '2011-03-14' & mydata$Country == "France",]

# Conditional Filtering of data

num_trans_25 <- mydata$numTrans >= 25

mydata[mydata$numTrans >= 25,]
# Why?

mydata[num_trans_25,]

mydata[mydata$Birth.rate <10,]

# Another way

Filter_Birth_Rate_Less10 <- mydata$Birth.rate <10

mydata[Filter_Birth_Rate_Less10,]
    
# Reusable Filter variable.

mydata["Angola",]
#  Why ?

# How to filter?
mydata[mydata$Country.Name == "India",]


# Get me High Income countries with birth rate less than 10
head(mydata)

# How I can know all possible domain values of Income Group
levels(mydata$Income.Group)

mydata[mydata$Income.Group == "High income" 
       & mydata$Birth.rate < 10,]

mydata[state > 3 & gender == 2,]

# Create a new data frame as a subset of existing
mydata_Very_low_income <- mydata[mydata$Income.Group == "Low income" 
                            & mydata$Birth.rate >= 40,]

head(mydata_Very_low_income)

nrow(mydata_Very_low_income)

# Creating a new data frame using vectors
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")

mydata[row, col]

mydata[mydata$custID == 1,]

Regions_2012_Dataset

is.vector(Regions_2012_Dataset)

mynewdf <- data.frame(Countries_2012_Dataset, 
                      Regions_2012_Dataset, 
                      Codes_2012_Dataset)

mynewdf

mynewdf <- data.frame(Country = Countries_2012_Dataset, 
                      Region = Regions_2012_Dataset, 
                      Codes = Codes_2012_Dataset)


head(mynewdf)

is.data.frame(mynewdf)

colnames(mynewdf)

# Change the column names
colnames(mynewdf) <- c("Country", "Region", "Country_Code")

# change the name of a single column
colnames(mynewdf)[3] <- c("Country_Code")

head(mynewdf)



# Remove or delete the data frame
rm(mynewdf)

mynewdf

# Re-create the df
mynewdf <- data.frame(Country = Countries_2012_Dataset, 
                      Region = Regions_2012_Dataset, 
                      Country_Code = Codes_2012_Dataset)

head(mynewdf)

# 
install.packages("reshape")

library(reshape)

head(mydata_Very_low_income)

mydata 

mydata
    
rename(mydata, c("custID" = "Cust_ID"))

mydata <- rename(mydata, c("custID" = "custID1"))


mydata_Very_low_income <- 
    rename(mydata_Very_low_income, c("Income.Group" = "Income_Group"))

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

list.files()

Ord_Detail <- read.csv("OrderDetail.csv")

class(Ord_Detail)

Ord_Brk <- read.csv("OrderBreakdown.csv")

write.csv(mydata, file = "mydata.txt")


colnames(Ord_Brk)

head(Ord_Detail, n = 10)

head(Ord_Brk, n = 10)

?merge

merge(Ord_Detail, Ord_Brk, by = c("Order.ID", "Order.ID"))

Ord_Inner_join <- merge(Ord_Detail, Ord_Brk, 
                        by = c("Order.ID", "Order.ID"))

head(Ord_Inner_join)

head(Ord_Inner_join[,c(1:3, 10:15)], 10)



head(Ord_Inner_join)

head(Ord_Brk)

# Left outer Join 
    
ord_brk_test <- Ord_Brk[!Ord_Brk$Order.ID == "IT-2011-2942451",]

head(ord_brk_test)

ord_brk_test[ord_brk_test$Order.ID == "IT-2011-2942451"]

# equi join
ord_test <- merge(Ord_Detail, 
                  ord_brk_test, by = c("Order.ID", "Order.ID"))


head(ord_LOJ, 15)

head(Ord_Detail)

head(ord_brk_test)

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

?dplyr

# The airquality dataset below contains information about 
# air quality measurements in New York from May 1973 - Sep 1973.
head(airquality, 50)



data()

WorldPhones


# remove.packages("dplyr")

install.packages("dplyr")

library(dplyr)

attach(airquality)

airquality$Wind

airquality[Temp == 67,]

filter(.data = airquality, Month == 5)

filter(airquality, Temp > 70)

filter(airquality, Month == 5)

airquality[airquality$Month == 5,]

# one of the most used functions of dplyr is the filter function 
# gives an easier way of subseting data


filter(airquality, Temp > 70)

filter(airquality, Temp > 80 & Month > 5)


# Mutate is used to add new variables or column to the data
# Lets add a calculated column to represent temp in degree celcuis

head(airquality)

newaq <- mutate(.data = airquality, TempInC = round((Temp - 32) * 5/9, 2))


newaq

# summarise function is used to summarise 
# multiple values into a single value

mean(Ozone, na.rm = T)

summarise(airquality, mean(Ozone, na.rm = T))

# Group_by function is used to group data by one or more variables.

group_Month <- group_by(.data = airquality, Month)

summarise(group_Month, mean(Ozone, na.rm = T))

groupby_Month <- group_by(airquality, Month)

?group_by

mtcars

by_cyl <- group_by(mtcars, cyl)
by_cyl

summarise(by_cyl, mean(disp), mean(hp), mean(mpg))

filter(by_cyl, disp == max(disp))



nrow(airquality)
nrow(groupby_Month)

filter(.data = groupby_Month, Month > 5)

filter(airquality, Month == 5 & (Temp > 55 & Temp < 67))

nrow(mtcars)

head(mtcars)

sample_frac(mtcars, 0.5)

sample_n(mtcars, size = 5)

# sample function is used to select random rows from a table. 
sample_n(airquality, size = 10)

sample_frac(airquality, size = 0.01)

sample_frac(airquality, size = 0.05)

# count  
count(airquality, Month)

# arrange

head(arrange(airquality, desc(Month), Day), 50)

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

sqldf('select * from airquality order by "Month" desc limit 300')

sqldf('select * from airquality order by "Wind" desc limit 20')


c(1L, "abc", TRUE)

getwd()

list.files()


list

