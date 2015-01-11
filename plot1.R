###reading in data
data <- read.table("household_power_consumption.txt", sep=";", h=T, stringsAsFactor=FALSE)
data$date <- as.Date(data$Date , "%d/%m/%Y")
data$Global_active_power=as.numeric(data$Global_active_power)

###subsetting the data
sub_1=subset(data, date=="2007-02-01")
sub_2=subset(data, date=="2007-02-02")
sub=rbind(sub_1, sub_2)

###plot 1
png("plot1.png", height=480, width=480)
with(sub, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()