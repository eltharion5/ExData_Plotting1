## reading data in the working directory

data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

##converting Date to date format
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

## subsetting the data

data<- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

## merging date and time
Date_time <- paste(as.Date(data$Date), data$Time)
data$Date_time <-  strptime(Date_time, "%Y-%m-%d %H:%M:%S")
##ploting data
with(data,plot(Date_time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",))

##saving a png copy

dev.copy(png, file = "plot2.png", height=480, width=480) 
dev.off()