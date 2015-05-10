filename<-"household_power_consumption.txt"
dat<-read.table(filename,header=TRUE,sep=";",na.strings="?")
dat<-dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
dat<-data.frame(time=strptime(paste(dat[[1]],dat[[2]],sep=","),format="%d/%m/%Y,%H:%M:%S"),dat[,3:9])

png(filename="plot4.png",width = 480, height = 480, units = "px")
par(bg="transparent",mfrow=c(2,2))

plot(dat$time,dat$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(dat$time,dat$Global_active_power)

plot(dat$time,dat$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(dat$time,dat$Voltage)

plot(dat$time,dat$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(dat$time,dat$Sub_metering_1,col="black")
lines(dat$time,dat$Sub_metering_2,col="red")
lines(dat$time,dat$Sub_metering_3,col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid",col=c("black","red","blue"),bty="n")

plot(dat$time,dat$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(dat$time,dat$Global_reactive_power)

dev.off()

