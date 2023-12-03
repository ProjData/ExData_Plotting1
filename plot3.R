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
png("plot3.png", width = 480, height = 480)

# Create a line chart using the 'plot' function. 'filtered$datetime' is 
# set as the x-axis, and 'filtered$Sub_metering_1' as the y-axis. 
# 'type = 'l'' indicates that it's a line plot. 
# The x and y labels are set, and the main title is left blank.
plot(filtered$datetime, filtered$Sub_metering_1, type = 'l', 
     xlab = "", ylab = "Energy sub metering", 
     main = "")

# Add additional lines to the existing plot for 'Sub_metering_2' in red color.
# This plots 'Sub_metering_2' data on the same graph with a red line.
lines(filtered$datetime, filtered$Sub_metering_2, type = "l" , col = "red")

# Add additional lines to the existing plot for 'Sub_metering_3' in blue color.
# This adds 'Sub_metering_3' data to the graph with a blue line.
lines(filtered$datetime, filtered$Sub_metering_3, type = "l" , col = "blue")

# Add a legend to the top-right of the plot.
# The legend includes labels for each data series 
# ('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
# and uses corresponding colors (black, red, blue) with a line style (lty) of 1.
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty=1)               

# Close the graphical device, which saves the plot to the file and stops 
# further plotting to this file.
dev.off()





