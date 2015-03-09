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

## plot 2
  
with(data1, plot(mydate, Global_active_power, type ="l", xlab="",ylab="Global Active Power (kilowatts)"))
dev.copy(png,filename="plot2.png",width=480,height=480)
dev.off(which = dev.cur())