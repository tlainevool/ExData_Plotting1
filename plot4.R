png(file = "plot4.png")
lines <- read.delim("household_power_consumption.txt", sep = ";", skip=66637, nrows=2881, header = FALSE)
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(lines) <- colNames
lines$DateTime <- strptime(paste(lines$Date, lines$Time), "%d/%m/%Y %H:%M:%S")


par(mfrow=c(2,2))


plot( lines$DateTime, lines$Global_active_power, 
      type = "l",
      ylab = "Global Active Power (kilowatts)",
      xlab = ""
)

plot( lines$DateTime, lines$Voltage, 
      type = "l",
      ylab = "Voltage",
      xlab = "datetime"
)

plot( eData$DateTime, eData$Sub_metering_1,
      type = "l",
      xlab = "",
      ylab = "Energy sub metering"
)
lines(eData$DateTime, eData$Sub_metering_2, type="l", col="red")
lines(eData$DateTime, eData$Sub_metering_3, type="l", col="blue")
legend(x="topright", lty = c(par("lty")), col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lty=0)

plot( lines$DateTime, lines$Global_reactive_power, 
      type = "l",
      ylab = "Global_reactive_power",
      xlab = "datetime"
)


dev.off()

