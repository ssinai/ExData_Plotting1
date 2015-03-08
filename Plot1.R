myData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                     na.strings="?", stringsAsFactors=FALSE)
validData <- myData[myData$Date %in% c("1/2/2007", "2/2/2007"),]

png(filename="plot1.png", width=480, height=480)

hist(validData$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()