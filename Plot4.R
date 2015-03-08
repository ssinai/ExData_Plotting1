
myData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                     na.strings="?", stringsAsFactors=FALSE)
validData <- myData[myData$Date %in% c("1/2/2007", "2/2/2007"),]

dates <- validData[,1]
times <- validData[,2]

datetimes <- paste(dates, times)
newdates <- strptime(datetimes, "%d/%m/%Y %H:%M:%S")
validData$DateTime <- newdates

png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(validData$DateTime, validData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(validData$DateTime, validData$Voltage, type="l", ylab="Voltage", xlab="datetime")


plot(validData$DateTime, validData$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")

lines(validData$DateTime, validData$Sub_metering_1, type="l", col="black")
lines(validData$DateTime, validData$Sub_metering_2, type="l", col="red")
lines(validData$DateTime, validData$Sub_metering_3, type="l", col="blue")

legend("topright", col=c("black", "red", "blue"), bty="n", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(validData$DateTime, validData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()