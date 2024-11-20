
library(datasets) # Initialises the 'dataset' package
iotex <- read.csv('IoTeX.csv') # Gets the dataset from the folder and names the object 'iotex' for userbility
head(iotex) # shows the first 6 rows
summary(iotex) # gives a summary of the dataset

str(iotex) # shows the data type of the data

#The 'Date' Datatype is chr and I want to change this to a date datatype



# Clear environment
rm(list = ls()) 
# Clear packages
detach("package:datasets", unload = TRUE)  # For base
# Clear plots
dev.off()  # But only if there IS a plot
# Clear console
cat("\014")  # ctrl+L
# Clear mind :)
