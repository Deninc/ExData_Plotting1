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
png(file = "plot2.png")
plot(dt$DateTime, dt$Global_active_power, 
     type = "l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()