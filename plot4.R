#Read in data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#Subset data for desired dates: February 1, 2007 through February 2, 2007
data<- data[66637:69516,]

#Create POSIXlt variable for date/time
data$datetime<-paste(data$Date,data$Time)
data$datetime<-strptime(data$datetime,format = "%d/%m/%Y %H:%M:%S")

#Create plots in png device
png(filename="plot4.png")
par(mfcol=c(2,2),mar=c(4,4,2,1),oma=c(4,1,1,1))

#Upper left plot
plot(data$datetime,data$Global_active_power, ylab="Global Active Power",type="l",xlab="")

#Lower left plot
plot(data$datetime,data$Sub_metering_1, ylab="Energy sub metering",type="l",xlab="")
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,bty="n")

#Upper right plot
plot(data$datetime,data$Voltage, ylab="Voltage",type="l",xlab="datetime")

#Lower right plot
plot(data$datetime,data$Global_reactive_power, ylab="Global_reactive_power",type="l",xlab="datetime")

dev.off()
