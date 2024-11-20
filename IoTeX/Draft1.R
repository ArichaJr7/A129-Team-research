
library(datasets) # Initialises the 'dataset' package
setwd("~/Library/CloudStorage/OneDrive-UniversityofHertfordshire/Team/Testing")
iotex <- read.csv('IoTeX.csv') # Gets the dataset from the folder and names the object 'iotex' for userbility
head(iotex) # shows the first 6 rows
summary(iotex) # gives a summary of the dataset

str(iotex) # shows the data type of the data

#The 'Date' Datatype is chr and I want to change this to a date datatype

iotex$Date <- as.Date(iotex$Date) #This takes the date column and coverts it into a 'Date' datatype (Format is YYYY-MM-DD)

str(iotex) # shows Date is converted

#Year need to be extracted from the dataset to help enable to better filtering later on

iotex$Year <- as.numeric(iotex$Date, '%Y') #This does not convert the year into a date format. I want the numerical value to be displayed like '2018'

str(iotex$Year) #num

iotex$Year <- as.numeric(format(iotex$Date, '%Y')) #The number was formatted into a date datatype

str(iotex$Year) # This confirms that the datatype was changed

#I need to add a column for seasons but I need to make a function to check the month in the date column
#then depending on that it will add the corresponding season. 
get_season <- function(date){
  
}








# Clear environment
rm(list = ls()) 
# Clear packages
detach("package:datasets", unload = TRUE)  # For base
# Clear plots
dev.off()  # But only if there IS a plot
# Clear console
cat("\014")  # ctrl+L
# Clear mind :)
