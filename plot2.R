# plot2.R : An R script to solve Project 1 of Coursera course:
#           "Exploratory Data Analysis".
#           Problem 2: making a line curve of datetime vs Global Active Power.
# Agus Arif, 08-05-2015

# Downloading the dataset and extracting the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./dataset.zip", method = "wget")
unzip("./dataset.zip")
dir()

# Reading the data table
fileName <- "household_power_consumption.txt"
rawData <- read.table(fileName, header = TRUE, sep = ";")
str(rawData)
head(rawData)

# Specifying a particular data to plot
library(dplyr)
beginDate = "1/2/2007"
endDate = "2/2/2007"
data <- filter(rawData, as.character(Date) == beginDate | as.character(Date) == endDate)
head(data)

# Combining the date and time variables
d1 <- as.character(data$Date)
t1 <- as.character(data$Time)
dt <- paste(d1, t1)
datetime <- strptime(dt, format = "%d/%m/%Y %T")

# Plotting the line curve
y1 <- as.character(data$Global_active_power)
y2 <- as.numeric(y1)
plot(datetime, y2, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Saving the plot to a file
dev.copy(png, file = "plot2.png")
dev.off()
