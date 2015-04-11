data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(as.character(data$Date), format="%d/%m/%Y")
smalldata1 <- data[data$Date=="2007-02-01", ]
smalldata2 <- data[data$Date=="2007-02-02", ]
smalldata <- rbind(smalldata1, smalldata2)
png("plot1.png", width=480, height=480)
hist(smalldata$Global_active_power, col="red", main="Global Active Power", 
      xlab ="Global Active Power (kilowatts)")
dev.off()




