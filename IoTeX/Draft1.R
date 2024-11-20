
library(datasets) # Initialises the 'dataset' package
setwd("~/Library/CloudStorage/OneDrive-UniversityofHertfordshire/Team/Testing") #set the working directory to the github folder which is were the dataset and this file is stored in
iotex <- read.csv('IoTeX.csv') # Gets the dataset from the folder and names the object 'iotex' for userbility
head(iotex) # shows the first 6 rows
summary(iotex) # gives a summary of the dataset

str(iotex) # shows the data type of the data

#The 'Date' Datatype is chr and I want to change this to a date datatype

iotex$Date <- as.Date(iotex$Date) #This takes the date column and coverts it into a 'Date' datatype (Format is YYYY-MM-DD)

str(iotex) # shows Date is converted

#Year need to be extracted from the dataset to help enable to better filtering later on

iotex$Year <- as.numeric(iotex$Date, '%Y') #This does not convert the year into a date format. I want the numerical value to be displayed like '2018'

str(iotex$Year) # check to see is the year was converted into a numeric year value

iotex$Year <- as.numeric(format(iotex$Date, '%Y')) #The number was formatted into a date datatype

str(iotex$Year) # This confirms that the datatype was changed

#I need to add a column for seasons but I need to make a function to check the month in the date column
#then depending on that it will add the corresponding season. 

get_season <- function(date) {                       # defined get_season function
  month <- as.numeric(format(date, "%m"))            # the format() gets the month part of the iotex$Date data and the as.numeric turns the '01' part of the month string into a value of '1'
  if (month %in% c(12, 1, 2)) return("Winter")       # if month is Dec, Jan or Feb then it will return 'Winter' in the row entry
  else if (month %in% c(3, 4, 5)) return("Spring")   # if month is Mar, Apr or May then it will return 'Spring' in the row entry
  else if (month %in% c(6, 7, 8)) return("Summer")   # if month is Jun, Jul or Aug then it will return 'Summer' in the row entry
  else return("Autumn")                              # if month is anything else then it will return 'Autumn' in the row entry
}
iotex$Season <- sapply(iotex$Date, get_season)       # sapply() applies the function to the date column and creates a new column called season
                                                    
str(iotex)                                           # check to see if the seasons column was successfully added to data set








# Clear environment
rm(list = ls()) 
# Clear packages
detach("package:datasets", unload = TRUE)  # For base
# Clear plots
dev.off()  # But only if there IS a plot
# Clear console
cat("\014")  # ctrl+L
# Clear mind :)

