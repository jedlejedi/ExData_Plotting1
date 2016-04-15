# Load the dataset
hpc <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

# Only retain the data for 2007-02-01 and 2007-02-02
hpc <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))

# Create a DateAndTime column containing the date and time of measure in POSIX format
hpc <- transform(hpc, DateAndTime = strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

# Display the plot
par(mfcol = c(2,2), cex = 0.65)

# Plot 1
plot(hpc$DateAndTime, hpc$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(hpc$DateAndTime, hpc$Global_active_power)

# Plot 2
plot(hpc$DateAndTime, hpc$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(hpc$DateAndTime, hpc$Sub_metering_1, col = "black")
lines(hpc$DateAndTime, hpc$Sub_metering_2, col = "red")
lines(hpc$DateAndTime, hpc$Sub_metering_3, col = "blue")

legend(legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), x = "topright", lty = 1, bty = "n", text.width = 80000)

# Plot 3
plot(hpc$DateAndTime, hpc$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(hpc$DateAndTime, hpc$Voltage)

# Plot 4
plot(hpc$DateAndTime, hpc$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(hpc$DateAndTime, hpc$Global_reactive_power)

# Save the chart to a PNG file
dev.copy(device = png, filename = "plot4.png", width = 480, height = 480)
dev.off()