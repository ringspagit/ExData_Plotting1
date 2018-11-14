#################################################################################################
## Project	: Module 4 / Week 1 (Plotting - Electric Power Consumption)
## Author	: Paul Ringsted
## Date		: 2018-11-13
#################################################################################################

#################################################################################################
## Function	: plot1()
## Description 	: 1st plot - histogram of Global Active Power
#################################################################################################

source('load_power.R')

plot1 <- function(onscreen=FALSE) {
	## Load the file from current working directory
	data <- load_power()

	if (!onscreen) {
		print("Opening PNG file...")
		png(filename="plot1.png")
	}

	hist(data$Global_active_power,
		col="red",
		xlab="Global Active Power (kilowatts)",
		ylab="Frequency",
		main="Global Active Power"
	)

	if (!onscreen) {
		dev.off()
		print("Closed PNG file")
	}
	
}
