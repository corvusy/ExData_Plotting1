filename<-"household_power_consumption.txt"
dat<-read.table(filename,header=TRUE,sep=";",na.strings="?")
dat<-dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
dat<-data.frame(time=strptime(paste(dat[[1]],dat[[2]],sep=","),format="%d/%m/%Y,%H:%M:%S"),dat[,3:9])

png(filename="plot3.png",width = 480, height = 480, units = "px")
par(bg="transparent")
plot(dat$time,dat$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(dat$time,dat$Sub_metering_1,col="black")
lines(dat$time,dat$Sub_metering_2,col="red")
lines(dat$time,dat$Sub_metering_3,col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid",col=c("black","red","blue"))
dev.off()

