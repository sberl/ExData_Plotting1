## Draw Plot2.png

## Draw Plot 2

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
png("plot2.png")

plot(dat1$Time2, dat1$Global_active_power,
     type="l",
     ylab="Global Active Power",
     xlab="")

dev.off()