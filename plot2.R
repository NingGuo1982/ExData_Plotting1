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

## plot2
png("plot2.png", width = 400, height = 400)
plot(finaldata$settime,finaldata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
## add X-axial ticks
datepoint<- strptime(c("01/02/2007 00:00:00","02/02/2007 00:00:00","03/02/2007 00:00:00"), "%d/%m/%Y %H:%M:%S")
class(datepoint)
axis.POSIXct(side = 1, at=datepoint, labels = c("Thu","Fri", "Sat"))
dev.off()
