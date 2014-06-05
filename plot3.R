
## loading all data into R
data_all <- read.table("household_power_consumption.txt", 
                       header=TRUE, 
                       sep=";", 
                       na.strings="?")

data_all$Date <- as.Date(data_all$Date,"%d/%m/%Y")

## filtering out required data
data_reqd <- data_all[(data_all$Date>="2007-02-01") & (data_all$Date<="2007-02-02"), ]

## creating the plot3.png
png(filename="plot3.png", width=480, height=480, units="px")
with(data_reqd, {
    plot(Sub_metering_1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
    lines(x=Sub_metering_2, col="red")
    lines(x=Sub_metering_3, col="blue")
    })
axis(1, at=c(1, as.integer(nrow(data_reqd)/2), nrow(data_reqd)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
