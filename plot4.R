# Import the dataset from a text file, specifying the delimiter as a semicolon 
# and specifying the first row as the headers.
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# specify the format of the date as day/month/year.
data$Date <- strptime(data$Date, "%d/%m/%Y")

# Transform the 'Date' column to Date class 
data$Date <- as.Date(data$Date)

# Filter the dataset to include only the rows where the 'Date' is 
# either 2007-02-01 or 2007-02-02.
filtered <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

# Create a new column 'datetime' in the filtered dataset by concatenating 
# 'Date' and 'Time' columns.
filtered$datetime <- paste(filtered$Date, filtered$Time)

# specifying the format as year-month-day hours:minutes:seconds.
filtered$datetime <- strptime(filtered$datetime, "%Y-%m-%d %H:%M:%S")

# Set up the graphics device to output a PNG file with the specified 
# width and height.
png("plot4.png", width = 480, height = 480)

# Set the plotting parameters to arrange the following plots 
# in a 2x2 grid layout.
# This means there will be four plots in total, arranged in 
# two rows and two columns.
par(mfrow = c(2, 2))

# Create the first plot: a line chart of 'Global_active_power' 
# against 'datetime'.
# The x-axis label is empty, y-axis label is set to "Global Active Power", 
# and the main title is left blank.
plot(filtered$datetime, filtered$Global_active_power, type = 'l', 
     xlab = "", ylab = "Global Active Power", 
     main = "")

# Create the second plot: a line chart of 'Voltage' against 'datetime'.
# The x-axis label is set to "datetime", y-axis label to "Voltage", 
# and the main title is left blank.
plot(filtered$datetime, filtered$Voltage, type = 'l', 
     xlab = "datetime", ylab = "Voltage", 
     main = "")

# Create the third plot: a line chart of 'Sub_metering_1' against 'datetime'.
# Additional lines for 'Sub_metering_2' (in red) and 
# 'Sub_metering_3' (in blue) are added to this plot.
# The x-axis label is empty, y-axis label is "Energy sub metering", 
# and the main title is left blank.
plot(filtered$datetime, filtered$Sub_metering_1, type = 'l', 
     xlab = "", ylab = "Energy sub metering", 
     main = "")
lines(filtered$datetime, filtered$Sub_metering_2, type = "l", col = "red")
lines(filtered$datetime, filtered$Sub_metering_3, type = "l", col = "blue")

# Add a legend to the top-right of the third plot without 
# a box around it (bty="n").
# The legend includes labels for '
# Sub_metering_1', 'Sub_metering_2', and 'Sub_metering_3',
# with corresponding colors (black, red, blue), a line style (lty) of 1.
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty=1, bty="n")  

# Create the fourth plot: a line chart of 'Global_reactive_power' 
# against 'datetime'.
# The x-axis label is "datetime", y-axis label is "Global Reactive Power", 
# and the main title is left blank.
plot(filtered$datetime, filtered$Global_reactive_power, type = 'l', 
     xlab = "datetime", ylab = "Global Reactive Power", 
     main = "")

# Close the graphical device, which saves the plot to the file and stops 
# further plotting to this file.
dev.off()