# read in the entire data
dt <- read.table("household_power_consumption.txt", 
                 header=TRUE, sep=";", dec=".", 
                 stringsAsFactors=FALSE, na.strings= "?",
                 colClasses=c(rep("character", 2), rep("numeric", 7)))

library(lubridate)
# convert date, time and subset the right data
dt$Date <- dmy(dt$Date)
dt <- dt[dt$Date >= ymd("2007-2-1") & dt$Date <= ymd("2007-2-2"), ]

# plot to png file
png(file = "plot1.png")
hist(dt$Global_active_power, 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", 
     col="Red", 
     main="Global Active Power")
dev.off()