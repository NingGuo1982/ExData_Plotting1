## set working directory
getwd()
setwd("/Users/GUONING/R/Coursera/Exploratory data analysis with R/Assignments/Course Project 1")
## read data
housecomsumption<- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?" )
dim(housecomsumption)
## select the data with dates 2007-02-01 and 2007-02-02
housecomsumptionselected<- subset(housecomsumption, Date %in% c("01/02/2007","02/02/2007","2/2/2007","1/2/2007"))
dim(housecomsumptionselected)
## change to date and time format
settime<- strptime(paste(housecomsumptionselected$Date,housecomsumptionselected$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
finaldata<- cbind(housecomsumptionselected,settime)
str(finaldata)

## plot3
png("plot3.png", width = 400, height = 400)
plot(finaldata$settime, finaldata$Sub_metering_1, type = "n", xlab ="", ylab = "Energy sub metering")
points(finaldata$settime, finaldata$Sub_metering_1, type = "l", col = "black")
points(finaldata$settime, finaldata$Sub_metering_2, type = "l", col = "red")
points(finaldata$settime, finaldata$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid", col = c("black", "red", "blue"))
datepoint<- strptime(c("01/02/2007 00:00:00","02/02/2007 00:00:00","03/02/2007 00:00:00"), "%d/%m/%Y %H:%M:%S")
axis.POSIXct(side = 1, at=datepoint, labels = c("Thu","Fri", "Sat"))
dev.off()
