# Load the dataset
hpc <- read.csv("household_power_consumption.txt", sep = ";")

# Only retain the data for 2007-02-01 and 2007-02-02
hpc <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))

# Convert Global_active_power column into a numeric
hpc <- transform(hpc, Global_active_power = as.numeric(as.character(Global_active_power)))

# Display the histogram
hist(hpc3$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Save the chart to a PNG file
dev.copy(device = png, filename = "plot1.png", width = 480, height = 480)
dev.off()