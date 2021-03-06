# Clear the workspace
rm(list = ls())

# Load data
dat <- read.table("data/household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat$DateTime <- paste(dat$Date, dat$Time)
dat <- subset(dat, Date >= "2007-02-01" & Date <= "2007-02-02")
dat$DateTime <- strptime(dat$DateTime, format = "%Y-%m-%d %H:%M:%S")

# Produce Plot
png(filename = "plot1.png", width = 480, height = 480)
hist(dat$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", 
     col = "red")
dev.off()

