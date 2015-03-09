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

## plot 3
png(filename = "plot3.png",width = 480, height = 480)  
with(data1, plot(mydate, Sub_metering_1, type ="l", xlab="",ylab="Energy sub metering"))
with(data1, lines(mydate, Sub_metering_2, col = "red"))
with(data1, lines(mydate, Sub_metering_3, col = "blue"))

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, col = c("black","red","blue"))

## dev.copy(png,filename="plot3.png",width=480,height=480)
dev.off(which = dev.cur())