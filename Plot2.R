#Data Analysis Course Project 1
#Create plot2.png, which is a line plot of Global Active Power.

#Before running this R program, download and unzip -
#"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#into "household_power_consumption.txt" in the same directory as this R file.
myData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                     na.strings="?", stringsAsFactors=FALSE)

#Use only data from Feb. 1, 2007 and Feb. 2, 2007
validData <- myData[myData$Date %in% c("1/2/2007", "2/2/2007"),]

#Set graphics device to png so we write chart directly to png file
png(filename="plot2.png", width=480, height=480)

#Combine separate date and time column data into combined DateTime column.
dates <- validData[,1]
times <- validData[,2]
datetimes <- strptime(paste(dates,times), "%d/%m/%Y %H:%M:%S")

plot(datetimes, validData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()