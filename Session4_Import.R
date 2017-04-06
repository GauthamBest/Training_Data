
# Reading a csv files


getwd()

?read.csv

telecom <- read.csv("data/telecomCalls.csv")

telecom <- read.csv("data/telecomCalls.csv", sep = "")

telecom


? read.delim

tel_tab <- read.delim("telecomCalls_tab.txt", header = T, sep = "\t")

tel_tab


? read.table

tel_tab <- read.table("telecomCalls_tab.txt", header = T, sep = "\t")

tel_tab


# ODBC

install.packages("RODBC")

library(RODBC)

odbcDataSources()

?odbcConnectExcel

odbcConnectExcel("AmazingMartEU.xls")

odbcConnectExcel2007("AmazingMartEU.xls")

install.packages("gdata")
library(gdata)


# Reading an excel file



library(readxl)

Dat <- read_excel("D:/Official/Data Science/RWORK/Dat (2).xlsx")

head(Dat)

View(Dat)



install.packages("xlsx")

install.packages("rJava")

library(rJava)

library(xlsx)

Amazing <- read.xlsx("AmazingMartEU.xlsx",sheetIndex=1,header=TRUE)

head(Amazing)


# Connecting to a mysql database instance

install.packages("RMySQL")

library(RMySQL)

?RMySQL

# Connecting and listing databases

? dbConnect

ucscDb <- dbConnect(MySQL(), user="genome", 
                    host="genome-mysql.cse.ucsc.edu")

result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);
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







