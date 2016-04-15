# Load the dataset
hpc <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

# Only retain the data for 2007-02-01 and 2007-02-02
hpc <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))

# Create a DateAndTime column containing the date and time of measure in POSIX format
hpc <- transform(hpc, DateAndTime = strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

# Display the plot
par(mfcol = c(1,1), cex = 0.75)

plot(hpc$DateAndTime, hpc$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(hpc$DateAndTime, hpc$Global_active_power)

# Save the chart to a PNG file
dev.copy(device = png, filename = "plot2.png", width = 480, height = 480)
dev.off()