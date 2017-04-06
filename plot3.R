# Clear the workspace
rm(list = ls())

# Load data
dat <- read.table("data/household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat$DateTime <- paste(dat$Date, dat$Time)
dat <- subset(dat, Date >= "2007-02-01" & Date <= "2007-02-02")
dat$DateTime <- strptime(dat$DateTime, format = "%Y-%m-%d %H:%M:%S")

# Produce Plot
png(filename = "plot3.png", width = 480, height = 480)
plot(dat$DateTime, dat$Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = "", col = "black")
lines(dat$DateTime, dat$Sub_metering_2, type = "l", col = "red")
lines(dat$DateTime, dat$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"))
dev.off()