##Readin in data
data <- read.table("household_power_consumption.txt", sep=";", h=T, stringsAsFactor=FALSE)
data$date <- as.Date(data$Date , "%d/%m/%Y")
data$Global_active_power=as.numeric(data$Global_active_power)

###Subsetting the data
sub_1=subset(data, date=="2007-02-01")
sub_2=subset(data, date=="2007-02-02")
sub=rbind(sub_1, sub_2)
sub_date=transform(sub, datetimes=paste(date, Time))
sub_date=transform(sub_date, datetime=strptime(datetimes, "%Y-%m-%d %H:%M:%S"))

##Plot 2
png("plot2.png", height=480, width=480)
with(sub_date, plot(datetime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(sub_date, lines(datetime, Global_active_power))
dev.off()