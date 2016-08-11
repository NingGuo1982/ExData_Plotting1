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
## plot1
png("plot1.png", width = 400, height = 400)
hist(finaldata$Global_active_power, col = "red", main= "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()
## plot2
png("plot2.png", width = 400, height = 400)
plot(finaldata$settime,finaldata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
## add X-axial ticks
datepoint<- strptime(c("01/02/2007 00:00:00","02/02/2007 00:00:00","03/02/2007 00:00:00"), "%d/%m/%Y %H:%M:%S")
class(datepoint)
axis.POSIXct(side = 1, at=datepoint, labels = c("Thu","Fri", "Sat"))
dev.off()
## plot3
png("plot3.png", width = 400, height = 400)
plot(finaldata$settime, finaldata$Sub_metering_1, type = "n", xlab ="", ylab = "Energy sub metering")
points(finaldata$settime, finaldata$Sub_metering_1, type = "l", col = "black")
points(finaldata$settime, finaldata$Sub_metering_2, type = "l", col = "red")
points(finaldata$settime, finaldata$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid", col = c("black", "red", "blue"))
axis.POSIXct(side = 1, at=datepoint, labels = c("Thu","Fri", "Sat"))
dev.off()
## plot4
png("plot4.png", width = 400, height = 400)
par(mfrow= c(2,2))
###part1
plot(finaldata$settime,finaldata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
axis.POSIXct(side = 1, at=datepoint, labels = c("Thu","Fri", "Sat"))
###part2
plot(finaldata$settime,finaldata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
axis.POSIXct(side = 1, at=datepoint, labels = c("Thu","Fri", "Sat"))
###part3
plot(finaldata$settime, finaldata$Sub_metering_1, type = "n", xlab ="", ylab = "Energy sub metering")
points(finaldata$settime, finaldata$Sub_metering_1, type = "l", col = "black")
points(finaldata$settime, finaldata$Sub_metering_2, type = "l", col = "red")
points(finaldata$settime, finaldata$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty ="n", lty = "solid", col = c("black", "red", "blue"))
axis.POSIXct(side = 1, at=datepoint, labels = c("Thu","Fri", "Sat"))
###part4
plot(finaldata$settime,finaldata$Global_reactive_power, type = "h", xlab = "datetime", ylab = "Global reactive Power")
axis.POSIXct(side = 1, at=datepoint, labels = c("Thu","Fri", "Sat"))
dev.off()
