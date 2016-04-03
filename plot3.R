setwd("~/Data Science/Exploratory Data Analysis/Project1")
variable <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
library(reshape2)
download.file(variable, dst2, mode="wb")
getwd()
dir()
doc<- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
## Concatenate Date and time
doc$DateTime<-paste(doc$Date, doc$Time)
doc$DateTime<-strptime(doc$DateTime, "%d/%m/%Y %H:%M:%S")
## Set up Time frame
start<-which(doc$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
end<-which(doc$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
data2<-doc[start:end,]
## Plot:
plot(data2$DateTime, as.numeric(as.character(data2$Sub_metering_1)),type='l', 
     ylab ="Energy sub metering", xlab="")
lines(data2$DateTime, as.numeric(as.character(data2$Sub_metering_2)),type='l', col='red')
lines(data2$DateTime, data2$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1)
       ,col=c("black","red","blue"))


## Save Script
dev.copy(png,"plot3.png",width = 480, height = 480)
dev.off()
## Verify files
dir()
