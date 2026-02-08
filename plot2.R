data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   stringsAsFactors = FALSE)

small <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

small$datetime <- strptime(paste(small$Date, small$Time), "%d/%m/%Y %H:%M:%S")

small$Global_active_power <- as.numeric(small$Global_active_power)

png("plot2.png", width = 480, height = 480)

plot(small$datetime, small$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()
