#################################################################################################
## Project	: Module 4 / Week 1 (Plotting - Electric Power Consumption)
## Author	: Paul Ringsted
## Date		: 2018-11-13
## Description	: Function to load and transform electic power consumption data
#################################################################################################

#################################################################################################
## Function	: load_power()
## Description 	: Loads the household_power_consumption.txt file
##		  Filters Feb 1 and Feb 2 data
##		  Transforms Date and Time columns
##		  Returns data frame with the resulting cleaned subset for plotting
#################################################################################################

load_power <- function() {
	## Load the file from current working directory
	filename <- file.path(".","household_power_consumption.txt")
	print(paste("loading file     : ",filename))
	data <- read.csv(filename, sep = ";", na.strings = "?")
	print(paste("file loaded, rows: ",nrow(data), " cols: ",ncol(data)))

	## Subset the rows for 1/2/2007 and 2/2/2007
	feb_data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
	print(paste("file subset, rows: ",nrow(feb_data), " cols: ",ncol(feb_data)))

	## Free up the full data set from memory
	rm(data)

	## Convert date and time columns
	print ("Converting time and date columns....")
	feb_data$Time <- strptime(paste(feb_data$Date,feb_data$Time),"%d/%m/%Y %H:%M:%S")
	feb_data$Date <- as.Date(feb_data$Date,"%d/%m/%Y")
	names(feb_data)[2] <- "Date_time"

	## Return the subset

	print("Done")
	feb_data
}
