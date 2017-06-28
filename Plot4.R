# Exploratory and Data Analysis
# Student: Javier Navarro B.
# Date:    June 27, 2017

# Plot 4:  4 charts in a box
# Data preparation for plotting
hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings = "NA", header = TRUE, stringsAsFactors = FALSE, dec = ".")
hpc1 <- subset(hpc, hpc$Date %in% c("1/2/2007","2/2/2007"))
hpc1$datetime <- strptime(paste(hpc1$Date, hpc1$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
hpc1$Global_active_power <- as.numeric(hpc1$Global_active_power)
hpc1$Sub_metering_1 <- as.numeric(hpc1$Sub_metering_1)
hpc1$Sub_metering_2 <- as.numeric(hpc1$Sub_metering_2)
hpc1$Sub_metering_3 <- as.numeric(hpc1$Sub_metering_3)
hpc1$Global_reactive_power <- as.numeric(hpc1$Global_reactive_power)
hpc1$Voltage <- as.numeric(hpc1$Voltage)

# png file creation
png(filename = "Plot4.png", width = 480, height = 480)
par(mfcol=c(2,2), mar=c(4,4,2,2))

# Plot Global_Active_Power
plot(hpc1$datetime, hpc1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Plot Energy sub metering
plot(hpc1$datetime, hpc1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(hpc1$datetime, hpc1$Sub_metering_2, type = "l", xlab = "", ylab = "", col = "red")
points(hpc1$datetime, hpc1$Sub_metering_3, type = "l", xlab = "", ylab = "", col = "blue")
legend("topright", lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

# Plot Voltage
plot(hpc1$datetime, hpc1$Voltage, type = "l", xlab = "", ylab = "Voltage")

# Plot Global_reactive_power
plot(hpc1$datetime, hpc1$Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power")


dev.off()