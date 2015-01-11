##Reading in data
data <- read.table("household_power_consumption.txt", sep=";", h=T, stringsAsFactor=FALSE)
data$date <- as.Date(data$Date , "%d/%m/%Y")
data$Global_active_power=as.numeric(data$Global_active_power)

##Subsetting the data
sub_1=subset(data, date=="2007-02-01")
sub_2=subset(data, date=="2007-02-02")
sub=rbind(sub_1, sub_2)
sub_date=transform(sub, datetimes=paste(date, Time))
sub_date=transform(sub_date, datetime=strptime(datetimes, "%Y-%m-%d %H:%M:%S"))
sub_date$Voltage=as.numeric(sub_date$Voltage)
sub_date$Global_reactive_power=as.numeric(sub_date$Global_reactive_power)
sub_date$Sub_metering_1=as.numeric(sub_date$Sub_metering_1)
sub_date$Sub_metering_2=as.numeric(sub_date$Sub_metering_2)
sub_date$Sub_metering_3=as.numeric(sub_date$Sub_metering_3)

###Plot 3
png("plot3.png", height=480, width=480)
with(sub_date, plot(datetime, Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(sub_date, lines(datetime, Sub_metering_1, col="black"))
with(sub_date, lines(datetime, Sub_metering_2, col="red"))
with(sub_date, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()