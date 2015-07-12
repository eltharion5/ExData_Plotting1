## reading data in the working directory

data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

##converting Date to date format
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

## subsetting the data

data<- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

## merging date and time
Date_time <- paste(as.Date(data$Date), data$Time)
data$Date_time <-  strptime(Date_time, "%Y-%m-%d %H:%M:%S")

##creating par
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))


##ploting data 1
with(data,plot(Date_time,Global_active_power,type="l",ylab="Global Active Power",xlab="",))
##ploting data 1
with(data,plot(Date_time,Voltage,type="l",ylab="Voltage",xlab="datetime",))

##ploting data 3
with(data,{plot(Date_time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
           lines(Date_time,Sub_metering_2,col='Red')
           lines(Date_time,Sub_metering_3,col='Blue')})
legend("topright",lty=1, lwd=2.5, col = c("black", "red","blue"), legend = c("Sub_metering_1   ", "Sub_metering_2   ","Sub_metering_3   "),bty="n")

##ploting data 4
with(data,plot(Date_time,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",))


##saving a png copy

##dev.copy(png, file = "plot4.png", height=480, width=480) 
dev.off()