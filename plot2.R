data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
data$Time <- paste(data$Date, data$Time)
data$Date <- as.Date(as.character(data$Date), format="%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")
smalldata1 <- data[data$Date=="2007-02-01", ]
smalldata2 <- data[data$Date=="2007-02-02", ]
smalldata <- rbind(smalldata1, smalldata2)
png("plot2.png", width=480, height=480)
plot(smalldata$Time, smalldata$Global_active_power, type="l", 
      ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
