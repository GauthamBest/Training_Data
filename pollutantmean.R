# Air pollution data from various locations in US
# write three functions that are meant to interact 
# with dataset that accompanies this assignment. 

# function named 'pollutantmean' calculates the 
# mean of a pollutant (sulfate or nitrate) across a specified 
# list of monitors. The function 'pollutantmean' takes three 
# arguments: 'directory', 'pollutant', and 'id'. 
# Given a vector monitor ID numbers, 'pollutantmean' reads that 
# monitors' particulate matter data from the directory specified 
# in the 'directory' argument and returns the mean of the 
# pollutant across all of the monitors, ignoring any missing 
# values coded as NA.

# pollution function Main

pollutantmean <- function(directory = getwd(), pollutant, id = 1:332) {
    
    setwd(directory)
    
    if (file.exists(getwd())) {
        
        pfiles <- list.files(getwd())
        pdata<- NULL
        for (pfile in pfiles) {
            if (!exists("pdata")) {
                # pfile <- paste(dir, pfile, sep = "/")
                pdata <- read.csv(pfile, header = T)
            } else {
                # pfile <- paste(dir, pfile,sep = "/")
                pdata <- rbind(pdata, read.csv(pfile, header = T))
            }
            
        }
        
        if (pollutant == "sulfate") {
            pdata_new<- filter(pdata, ID %in% id)
            print(mean(pdata_new$sulfate, na.rm = T))
            pdata_new <- NULL
        }
        
        if (pollutant == "nitrate") {
            pdata_new<- filter(pdata, ID %in% id)
            print(mean(pdata_new$nitrate, na.rm = T))
            pdata_new <- NULL
        }
        
    }
    
}
