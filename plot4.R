## after downloading the zip file by clicking on it:

unzip("exdata-data-household_power_consumption.zip")
install.packages("read.table")
install.packages("lubridate")
library(lubridate)

data <- read.table("household_power_consumption.txt",sep=";",dec=".",header=TRUE,stringsAsFactors=FALSE,na.strings="?", colClasses=c(rep("character",2), rep("numeric",7)))

## catenate the days column to the dataset
newdata <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

mydate = dmy(newdata$Date) + hms(newdata$Time)

data1 <- cbind(newdata, mydate)

## plot 4
png(filename = "plot4.png",width = 480, height = 480) 
par(mfrow=c(2,2))

with(data1, plot(mydate, Global_active_power, type ="l",xlab="",ylab="Global Active Power"))

with(data1, plot(mydate, Voltage, type ="l", xlab="datetime",ylab="Voltage"))

with(data1, plot(mydate, Sub_metering_1, type ="l", xlab="",ylab="Energy sub metering"))
with(data1, lines(mydate, Sub_metering_2, col = "red"))
with(data1, lines(mydate, Sub_metering_3, col = "blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, col = c("black","red","blue"))

with(data1, plot(mydate, Global_reactive_power, type ="l", xlab="datetime"))

dev.off(which = dev.cur())