data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   stringsAsFactors = FALSE)

small <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

small$Global_active_power <- as.numeric(small$Global_active_power)

png("plot1.png", width = 480, height = 480)

hist(small$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()
