# plot1.R : An R script to solve Project 1 of Coursera course:
#           "Exploratory Data Analysis".
#           Problem 1: making a histogram of Global Active Power.
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

# Plotting the histogram
x1 <- as.character(data$Global_active_power)
x2 <- as.numeric(x1)
hist(x2, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Saving the plot to a file
dev.copy(png, file = "plot1.png")
dev.off()
