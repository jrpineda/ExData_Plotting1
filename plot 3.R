library(tidyverse)

#First we read the data into R and make adjustments to the Date
#and create a datatime variable for later
#I also make some variables into characters

house <- read.csv("~/household_power_consumption.txt", sep=";", na.strings="?")
house$Date <- as.Date(house$Date, "%d/%m/%Y")
house <- filter(house, Date=="2007-02-01" | Date=="2007-02-02")
datetime <- paste(as.Date(house$Date),house$Time)
house$Datetime <- as.POSIXct(datetime)
GAP <- as.numeric(as.character(house$Global_active_power))

########################### PLOT 3

png("plot3.png", width=480, height=480)
plot(house$Sub_metering_1~house$Datetime, type="l", xlab="",ylab="Global Active Power (kilowatts)")
lines(house$Sub_metering_2~house$Datetime, col="red")
lines(house$Sub_metering_3~house$Datetime, col="blue")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()