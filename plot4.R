#################################################################################################
## Project	: Module 4 / Week 1 (Plotting - Electric Power Consumption)
## Author	: Paul Ringsted
## Date		: 2018-11-13
#################################################################################################

#################################################################################################
## Function	: plot4()
## Description 	: 4th plot - 4x4 panel of various plots
#################################################################################################

source('load_power.R')

plot4 <- function(onscreen=FALSE) {
	## Load the file from current working directory
	data <- load_power()

	if (!onscreen) {
		print("Opening PNG file...")
		png(filename="plot4.png")
	}

	par(mfrow=c(2,2))

	## First panel - same as Plot2
	plot(data$Date_time, data$Global_active_power,
                type="l",
                xlab="",
                ylab="Global Active Power"
        )

	## Second panel - Voltage by Date_Time
	plot(data$Date_time, data$Voltage,
		type = "l",
		xlab = "datetime",
		ylab = "Voltage"
	)

	## Third panel - same as Plot3
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

	## Fourth panel - Global_reactive_power by Date_Time
	plot(data$Date_time, data$Global_reactive_power,
		type = "l",
		xlab = "datetime",
		ylab = "Global_reactive_power"
	)
	
	if (!onscreen) {
		dev.off()
		print("Closed PNG file")
	}
	
}
