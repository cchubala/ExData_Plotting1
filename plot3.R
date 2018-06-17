#Read in data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#Subset data for desired dates: February 1, 2007 through February 2, 2007
data<- data[66637:69516,]

#Create POSIXlt variable for date/time
data$datetime<-paste(data$Date,data$Time)
data$datetime<-strptime(data$datetime,format = "%d/%m/%Y %H:%M:%S")

#Create plot in png device
png(filename="plot3.png")
plot(data$datetime,data$Sub_metering_1, ylab="Energy sub metering",type="l",xlab="")
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)
dev.off()
