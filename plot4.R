# read in the entire data
dt <- read.table("household_power_consumption.txt", 
                 header=TRUE, sep=";", dec=".", 
                 stringsAsFactors=FALSE, na.strings= "?",
                 colClasses=c(rep("character", 2), rep("numeric", 7)))

library(lubridate)
# convert date, time and subset the right data

dt <- dt[dt$Date == "1/2/2007" | dt$Date == "2/2/2007", ]
dt$DateTime = paste(dt$Date, dt$Time, sep=" ")
dt$DateTime <- dmy_hms(dt$DateTime)

# plot to png file
png(file = "plot4.png")
# divide to 2 row 2 column
par(mfrow=c(2,2), mar=c(5,5,2,2))
with(dt, {
    # plot 1
    plot(dt$DateTime, dt$Global_active_power, type = "l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    
    # plot 2
    plot(dt$DateTime, dt$Voltage, type="l", 
         xlab="datetime", ylab="Voltage")
    
    # plot 3
    with(dt, plot(DateTime, Sub_metering_1, type="l", col="Black", 
                  xlab="", ylab="Energy Sub Metering"))
    with(dt, lines(DateTime, Sub_metering_2, type="l",col="Red"))
    with(dt, lines(DateTime, Sub_metering_3, type="l", col="Blue"))
    legend("topright", col=c("Black", "Blue", "Red"), lwd=1, lty=1,
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    # plot 4
    plot(dt$DateTime, dt$Global_reactive_power, type="l", 
         xlab="datetime", ylab="Global_reactive_power")
})
dev.off()