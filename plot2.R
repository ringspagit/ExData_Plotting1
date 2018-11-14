#################################################################################################
## Project	: Module 4 / Week 1 (Plotting - Electric Power Consumption)
## Author	: Paul Ringsted
## Date		: 2018-11-13
#################################################################################################

#################################################################################################
## Function	: plot2()
## Description 	: 2nd plot - Global Active Power by time
#################################################################################################

source('load_power.R')

plot2 <- function(onscreen=FALSE) {
	## Load the file from current working directory
	data <- load_power()

	if (!onscreen) {
		print("Opening PNG file...")
		png(filename="plot2.png")
	}

	plot(data$Date_time, data$Global_active_power,
		type="l",
		xlab="",
		ylab="Global Active Power (kilowatts)"
	)

	if (!onscreen) {
		dev.off()
		print("Closed PNG file")
	}
	
}
