## Draw Plot 3

# Read in the big data file
dat <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

##Convert date and time string columns to a new column
dat$Time2 <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

# The range of dates and times we are interested in
starttime <- strptime("1/2/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
endtime <- strptime("3/2/2007 00:00:00", "%d/%m/%Y %H:%M:%S")

# Select the rows we want
dat <- dat[dat$Time2 >= starttime & dat$Time2 < endtime,]

# Send output to a .png file
png("plot3.png")

with(dat, plot(Time2, Sub_metering_1, 
                type="l", 
                ylab="Energy sub metering", 
                xlab=""))
with(dat, lines(Time2, Sub_metering_2, col="Red"))
with(dat, lines(Time2, Sub_metering_3, col="Blue"))
legend("topright", lwd=1, 
       col=c("Black", "Red", "Blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()