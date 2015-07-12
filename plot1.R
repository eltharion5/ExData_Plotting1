## reading data in the working directory

data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

##converting Date to date format
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

## subsetting the data

data<- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

##plotting the plot on 
hist(data$Global_active_power,main="Global Active Power",col="Red",xlab="Global Active Power (kilowatts)",ylab="Frequency")

##saving a png copy

dev.copy(png, file = "plot1.png", height=480, width=480) 
dev.off()