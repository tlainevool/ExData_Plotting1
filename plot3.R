png(file = "plot3.png")
eData <- read.delim("household_power_consumption.txt", sep = ";", skip=66637, nrows=2881, header = FALSE)
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(eData) <- colNames
eData$DateTime <- strptime(paste(eData$Date, eData$Time), "%d/%m/%Y %H:%M:%S")

plot( eData$DateTime, eData$Sub_metering_1,
      type = "l",
      xlab = "",
      ylab = "Energy sub metering"
)
lines(eData$DateTime, eData$Sub_metering_2, type="l", col="red")
lines(eData$DateTime, eData$Sub_metering_3, type="l", col="blue")
legend(x="topright", lty = c(par("lty")), col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


