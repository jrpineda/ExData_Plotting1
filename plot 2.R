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

########################### PLOT 2

png("plot2.png", width=480, height=480)
plot(GAP~house$Datetime, type="l", xlab="",
     ylab="Global Active Power (kilowatts")
dev.off()