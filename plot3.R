# plot3.R : An R script to solve Project 1 of Coursera course:
#           "Exploratory Data Analysis".
#           Problem 3: making line curves of datetime vs Energy sub metering.
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

# Plotting three line curves
sm1 <- as.character(data$Sub_metering_1)
sm1 <- as.numeric(sm1)
sm2 <- as.character(data$Sub_metering_2)
sm2 <- as.numeric(sm2)
sm3 <- data$Sub_metering_3
plot(datetime, sm1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, sm2, col = "red")
lines(datetime, sm3, col = "blue")
legend("topright", legend = names(data)[7:9], col = c("black", "red", "blue"), lty = 1)

# Saving the plot to a file
png("plot3.png")
plot(datetime, sm1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, sm2, col = "red")
lines(datetime, sm3, col = "blue")
legend("topright", legend = names(data)[7:9], col = c("black", "red", "blue"), lty = 1)
dev.off()
