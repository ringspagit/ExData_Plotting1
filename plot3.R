#################################################################################################
## Project	: Module 4 / Week 1 (Plotting - Electric Power Consumption)
## Author	: Paul Ringsted
## Date		: 2018-11-13
#################################################################################################

#################################################################################################
## Function	: plot3()
## Description 	: 3rd plot - Sub metering by time
#################################################################################################

source('load_power.R')

plot3 <- function(onscreen=FALSE) {
	## Load the file from current working directory
	data <- load_power()

	if (!onscreen) {
		print("Opening PNG file...")
		png(filename="plot3.png")
	}

	plot(data$Date_time,data$Sub_metering_1,
		type="l",
		col="black",
		xlab="",
		ylab="Energy sub metering"
	)

	points(data$Date_time,data$Sub_metering_2,
		type="l",
		col="red"
	)

	points(data$Date_time,data$Sub_metering_3,
		type="l",
		col="blue"
	)

	legend("topright",
		lty=1,
		col=c("black","red","blue"),
		legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

	if (!onscreen) {
		dev.off()
		print("Closed PNG file")
	}
	
}
