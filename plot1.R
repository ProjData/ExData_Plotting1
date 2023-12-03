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

# Set up the graphics device to output a PNG file with the specified 
# width and height.
png("plot1.png", width = 480, height = 480)

# Create a histogram of the 'Global_active_power' column from 
# the filtered dataset. 
# The as.numeric function is used to ensure the data is treated as numeric.
# The xlab and main arguments provide labels for the x-axis and the title 
# of the histogram.
hist(as.numeric(filtered$Global_active_power), 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Close the graphical device, which saves the plot to the file and stops 
# further plotting to this file.
dev.off()

