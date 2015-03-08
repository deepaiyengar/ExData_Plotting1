## after downloading the zip file by clicking on it:
  
unzip("exdata-data-household_power_consumption.zip")
install.packages("read.table")

data <- read.table("household_power_consumption.txt",sep=";",dec=".",header=TRUE,stringsAsFactors=FALSE,na.strings="?", colClasses=c(rep("character",2), rep("numeric",7)))

## catenate the days column to the dataset
newdata <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

days_data <- weekdays(as.Date(newdata$Date,'%d/%m/%Y'))

wdaynewdata <- cbind(newdata, days_data)

## plot 1 
  
hist(wdaynewdata$Global_active_power, xlab="Global Active Power (kilowatts)", col = "red", main="Global Active Power", ylim=c(0,1200))
dev.copy(png,filename="plot1.png",width=480,height=480)
dev.off(which = dev.cur())