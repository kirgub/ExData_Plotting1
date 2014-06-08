#Reading the file
hpc <- read.table("household_power_consumption.txt",header=T,sep=";",nrow=-1,as.is=T,na.strings="?")
#subsetting the data needed
hpc <- hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
# converting to Time
hpc$Time <- strptime(paste(hpc$Date,hpc$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
#converting to Data
hpc$Date = as.Date(hpc$Date,"%d/%m/%Y")


#opening the PNG devise
png(filename="plot4.png",width = 480, height = 480, units = "px")

# Setting the pallete
par(mfrow = c(2, 2))

#generating the Histogram
hist(hpc$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")

#generating the line plots
with(hpc,plot(Time,Voltage,type="l",ylab="Voltage",xlab="datetime"))


#generating Line plot
with(hpc,plot(Time,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab=""))
with(hpc,lines(Time,Sub_metering_2,col="red"))
with(hpc,lines(Time,Sub_metering_3,col="blue"))
# adding Legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,lwd=2,col=c("black","red","blue"),
       text.col=c("black","red","blue"),cex=0.5)
#generating the line plots
with(hpc,plot(Time,Global_reactive_power,type="l",xlab="datetime"))

#Close Devise
dev.off()