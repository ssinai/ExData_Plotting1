#Data Analysis Course Project 1
#Create plot1.png, which is a histogram of global gctive data.

#Before running this R program, download and unzip -
#"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#into "household_power_consumption.txt" in the same directory as this R file.
myData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                     na.strings="?", stringsAsFactors=FALSE)

#Use only data from Feb. 1, 2007 and Feb. 2, 2007
validData <- myData[myData$Date %in% c("1/2/2007", "2/2/2007"),]

#Set graphics device to png so we write chart directly to png file
png(filename="plot1.png", width=480, height=480)

#Create the chart
hist(validData$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()