data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   stringsAsFactors = FALSE)

small <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

small$datetime <- strptime(paste(small$Date, small$Time), "%d/%m/%Y %H:%M:%S")

small$Global_active_power   <- as.numeric(small$Global_active_power)
small$Global_reactive_power <- as.numeric(small$Global_reactive_power)
small$Voltage               <- as.numeric(small$Voltage)
small$Sub_metering_1        <- as.numeric(small$Sub_metering_1)
small$Sub_metering_2        <- as.numeric(small$Sub_metering_2)
small$Sub_metering_3        <- as.numeric(small$Sub_metering_3)

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(small$datetime, small$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

plot(small$datetime, small$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

plot(small$datetime, small$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(small$datetime, small$Sub_metering_2, col = "red")
lines(small$datetime, small$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1,
       bty = "n")

plot(small$datetime, small$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()
