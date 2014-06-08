#Reading the file
hpc <- read.table("household_power_consumption.txt",header=T,sep=";",nrow=-1,as.is=T,na.strings="?")
#subsetting the data needed
hpc <- hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
# converting to Time
hpc$Time <- strptime(paste(hpc$Date,hpc$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
#converting to Data
hpc$Date = as.Date(hpc$Date,"%d/%m/%Y")

#opening the PNG devise
png(filename="plot1.png",width = 480, height = 480, units = "px")
#generating Hisogram
hist(hpc$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
#Close Devise
dev.off()
