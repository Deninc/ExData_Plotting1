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
png(file = "plot3.png")
with(dt, plot(DateTime, Sub_metering_1, type="l", col="Black", 
              xlab="", ylab="Energy Sub Metering"))
# lines add plot to the created one
with(dt, lines(DateTime, Sub_metering_2, type="l",col="Red"))
with(dt, lines(DateTime, Sub_metering_3, type="l", col="Blue"))
# lwd=1 and lty=1 for the line legend
legend("topright", col=c("Black", "Blue", "Red"), lwd=1, lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()