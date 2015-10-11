# Reading the data from the file
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,quote="",na.strings="?",stringsAsFactors=FALSE)
data1 <- data

#Converting the Date field into Data Format
data1$Date <- as.Date(data1$Date,"%d/%m/%Y")


#Loading the dplyr package for subsetting
library("dplyr")

#Subsetting the required data
data2 <- filter(data1,Date == "2007-02-01" | Date == "2007-02-02")

#Loading the lubridate package for getting datetime
library(lubridate)
data2$datetime <- paste(data2$Date,data2$Time,sep=" ")
data2$datetime <- ymd_hms(data2$datetime)

#Removing the unwanted datasets
rm(data)
rm(data1)


#Plotting the Data
par(bg="white")
plot(data2$datetime,data2$Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file = "plot2.png",height = 480 , width =480)
dev.off()
dev.off()