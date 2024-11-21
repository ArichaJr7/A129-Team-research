
iotex <- read.csv('IoTeX.csv') # Gets the dataset from the folder and names the object 'iotex' for userbillity
head(iotex) # shows the first 6 rows
summary(iotex) # gives a summary of the dataset
str(iotex) # shows the data type of the data

#The 'Date' Datatype is chr and I want to change this to a date datatype

iotex$Date <- as.Date(iotex$Date) #This takes the date column and coverts it into a 'Date' datatype (Format is YYYY-MM-DD)
str(iotex) # shows Date is converted

#Year need to be extracted from the dataset to help enable to better filtering later on
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
head(iotex)                                          # Check the first few rows of the modified dataset
table(iotex$Season)                                  # Confirm the distribution of seasons


iotex$Daily_Change <- iotex$Close - iotex$Open       # Daily Price Change column was added taking the 'Open' price away from the 'Close' price
str(iotex)                                           # Check to ensure column was added correctly


a <- iotex$Daily_Change                                         # Extract the data


hist(a,                                                         # Create a histogram
     30,                                                        # num of bins
     freq = FALSE,                                              # Set to density not freqency
     main = "Histogram of Daily Price Change with Bell Curve",  # Title
     xlab = "Daily Price Change",                               # X-axis label
     ylab = "Density",  # Update label to reflect density       # Y-axis label
     col = "azure")

# Calculate the mean and standard deviation
mn <- mean(a)                                                   # Mean of daily price change
std_dev <- sd(a)                                                # Standard deviation of daily price change


x <- seq(min(a), max(a), length.out = 250)                      # Define the x range for the bell curve


yn <- dnorm(x, mean = mn, sd = std_dev)                         # Generate normal distribution values


lines(x, yn, col = "red", lwd = 2)                              # Add the bell curve to the histogram


