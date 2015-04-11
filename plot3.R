data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
data$Time <- paste(data$Date, data$Time)
data$Date <- as.Date(as.character(data$Date), format="%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")
smalldata1 <- data[data$Date=="2007-02-01", ]
smalldata2 <- data[data$Date=="2007-02-02", ]
smalldata <- rbind(smalldata1, smalldata2)
png("plot3.png", width=480, height=480)
plot(smalldata$Time, smalldata$Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(smalldata$Time, smalldata$Sub_metering_2, col="red")
lines(smalldata$Time, smalldata$Sub_metering_3, col="blue")
legend ("topright", lty=1, col=c("black","red","blue"), 
      legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
