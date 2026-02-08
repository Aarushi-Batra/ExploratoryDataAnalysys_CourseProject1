data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   stringsAsFactors = FALSE)

small <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

small$datetime <- strptime(paste(small$Date, small$Time), "%d/%m/%Y %H:%M:%S")

small$Sub_metering_1 <- as.numeric(small$Sub_metering_1)
small$Sub_metering_2 <- as.numeric(small$Sub_metering_2)
small$Sub_metering_3 <- as.numeric(small$Sub_metering_3)

png("plot3.png", width = 480, height = 480)

plot(small$datetime, small$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")

lines(small$datetime, small$Sub_metering_2, col = "red")

lines(small$datetime, small$Sub_metering_3, col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1)

dev.off()
