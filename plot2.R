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
png("plot2.png", width = 480, height = 480)

# Plot a line chart with 'datetime' on the x-axis and 'Global_active_power' 
# on the y-axis. 
# Type 'l' indicates a line plot. The xlab, ylab, and main arguments 
# are for labeling.
plot(filtered$datetime, filtered$Global_active_power, type = 'l', 
     xlab = "", ylab = "Global Active Power (kilowatts)", main = "")

# Close the graphical device, which saves the plot to the file and stops 
# further plotting to this file.
dev.off()

