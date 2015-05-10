filename<-"household_power_consumption.txt"
dat<-read.table(filename,header=TRUE,sep=";",na.strings="?")
dat<-dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
dat<-data.frame(time=strptime(paste(dat[[1]],dat[[2]],sep=","),format="%d/%m/%Y,%H:%M:%S"),dat[,3:9])

png(filename="plot1.png",width = 480, height = 480, units = "px")
par(bg="transparent")
hist(dat$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()

