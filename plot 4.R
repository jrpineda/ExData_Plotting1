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

########################### PLOT 4

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(house,{
  
  plot(Datetime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
  plot(Datetime, Voltage, type="l", ylab="Voltage",xlab="datetime")
  
  plot(Sub_metering_1~Datetime, type="l", xlab="",ylab="Energy sub metering")
  lines(Sub_metering_2~Datetime, col="red")
  lines(Sub_metering_3~Datetime, col="blue")
  
  legend("topright", inset=0.01, col=c("black", "red", "blue"), lty=1,cex=0.8, box.lty=0, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Datetime, Global_reactive_power, type="l", ylab="Globa_reactive_power", 
       xlab="datetime", ylim=c(0.0, 0.5))    
  dev.off()
})
