
## loading all data into R
data_all <- read.table("household_power_consumption.txt", 
                       header=TRUE, 
                       sep=";", 
                       na.strings="?")

data_all$Date <- as.Date(data_all$Date,"%d/%m/%Y")

## filtering out required data
data_reqd <- data_all[(data_all$Date>="2007-02-01") & (data_all$Date<="2007-02-02"), ]
data_reqd$Global_active_power <- as.numeric(as.character(data_reqd$Global_active_power))

## creating the plot1.png
png(filename="plot1.png", width=480, height=480, units="px")
hist(data_reqd$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
