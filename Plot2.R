
myData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                     na.strings="?", stringsAsFactors=FALSE)
validData <- myData[myData$Date %in% c("1/2/2007", "2/2/2007"),]

dates <- validData[,1]
times <- validData[,2]

datetimes <- paste(dates, times)
newdates <- strptime(datetimes, "%d/%m/%Y %H:%M:%S")
validData$DateTime <- newdates

png(filename="plot2.png", width=480, height=480)

plot(validData$DateTime, validData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()