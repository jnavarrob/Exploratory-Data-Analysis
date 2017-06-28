# Exploratory and Data Analysis
# Student: Javier Navarro B.
# Date:    June 27, 2017

# Plot 1:  Histogram -  Global Active Power
# Data preparation for plotting
hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings = "NA", header = TRUE, stringsAsFactors = FALSE, dec = ".")
hpc1 <- subset(hpc, hpc$Date %in% c("1/2/2007","2/2/2007"))
hpc1$Date <- strptime(hpc1$Date, format = "%d/%m/%Y")
hpc1$Global_active_power <- as.numeric(hpc1$Global_active_power)

# png file creation
png(filename = "Plot1.png", width = 480, height = 480)
hist(hpc1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
