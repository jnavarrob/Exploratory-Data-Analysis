# Exploratory and Data Analysis
# Student: Javier Navarro B.
# Date:    June 27, 2017

# Plot 2:  Line -  Daily Global Active Power
# Data preparation for plotting
hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings = "NA", header = TRUE, stringsAsFactors = FALSE, dec = ".")
hpc1 <- subset(hpc, hpc$Date %in% c("1/2/2007","2/2/2007"))
hpc1$datetime <- strptime(paste(hpc1$Date, hpc1$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
hpc1$Global_active_power <- as.numeric(hpc1$Global_active_power)


# png file creation
png(filename = "Plot2.png", width = 480, height = 480)
plot(hpc1$datetime, hpc1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
