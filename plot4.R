
## loading all data into R
data_all <- read.table("household_power_consumption.txt", 
                       header=TRUE, 
                       sep=";", 
                       na.strings="?")

data_all$Date <- as.Date(data_all$Date,"%d/%m/%Y")

## filtering out required data
data_reqd <- data_all[(data_all$Date>="2007-02-01") & (data_all$Date<="2007-02-02"), ]

## creating the plot4.png
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

#1st sub-plot
plot(data_reqd$Global_active_power, type="l", xaxt="n", xlab="", ylab="Global Active Power")
axis(1, at=c(1, as.integer(nrow(data_reqd)/2), nrow(data_reqd)), labels=c("Thu", "Fri", "Sat"))

#2nd sub-plot
plot(data_reqd$Voltage, type="l", xaxt="n", xlab="datetime", ylab="Voltage")
axis(1, at=c(1, as.integer(nrow(data_reqd)/2), nrow(data_reqd)), labels=c("Thu", "Fri", "Sat"))

#3rd sub-plot
with(data_reqd, {
    plot(Sub_metering_1, type="l", xaxt="n", xlab="", ylab="Energy sub metering")
    lines(x=Sub_metering_2, col="red")
    lines(x=Sub_metering_3, col="blue")
})
axis(1, at=c(1, as.integer(nrow(data_reqd)/2), nrow(data_reqd)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0,box.col = "transparent", bg="transparent")

#4th sub-plot
plot(data_reqd$Global_reactive_power, type="l", xaxt="n", xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(1, as.integer(nrow(data_reqd)/2), nrow(data_reqd)), labels=c("Thu", "Fri", "Sat"))

dev.off()
