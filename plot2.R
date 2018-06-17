#Read in data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#Subset data for desired dates: February 1, 2007 through February 2, 2007
data<- data[66637:69516,]

#Create POSIXlt variable for date/time
data$datetime<-paste(data$Date,data$Time)
data$datetime<-strptime(data$datetime,format = "%d/%m/%Y %H:%M:%S")

#Create plot in png device
png(filename="plot2.png")
plot(data$datetime,data$Global_active_power, ylab="Global Active Power (kilowatts)",type="l",xlab="")
dev.off()
