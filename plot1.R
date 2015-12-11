png(file = "plot1.png")
lines <- read.delim("household_power_consumption.txt", sep = ";", skip=66637, nrows=2881, header = FALSE)
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(lines) <- colNames
lines$DateTime <- strptime(paste(lines$Date, lines$Time), "%d/%m/%Y %H:%M:%S")

hist(lines$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     ylim = c(0,1200)
)
dev.off()