# plot4.R : An R script to solve Project 1 of Coursera course:
#           "Exploratory Data Analysis".
#           Problem 4: making multiple plots of datetime vs (Global active power,
#           Energy sub metering, Voltage, and Global reactive power). 
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

# Setting plot variables
y1 <- as.character(data$Global_active_power)
y1 <- as.numeric(y1)
sm1 <- as.character(data$Sub_metering_1)
sm1 <- as.numeric(sm1)
sm2 <- as.character(data$Sub_metering_2)
sm2 <- as.numeric(sm2)
sm3 <- data$Sub_metering_3
y2 <- as.character(data$Voltage)
y2 <- as.numeric(y2)
y3 <- as.character(data$Global_reactive_power)
y3 <- as.numeric(y3)

# Plotting multiple graphs
par(mfcol = c(2, 2))
par(mar = c(4, 4, 3, 1))
plot(datetime, y1, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(datetime, sm1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, sm2, col = "red")
lines(datetime, sm3, col = "blue")
legend("topright", legend = names(data)[7:9], col = c("black", "red", "blue"), lty = 1)
plot(datetime, y2, type = "l", xlab = "datetime", ylab = names(data)[5])
plot(datetime, y3, type = "l", xlab = "datetime", ylab = names(data)[4])

# Saving the plot to a file
png("plot4.png")
par(mfcol = c(2, 2))
par(mar = c(4, 4, 3, 1))
plot(datetime, y1, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(datetime, sm1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, sm2, col = "red")
lines(datetime, sm3, col = "blue")
legend("topright", legend = names(data)[7:9], col = c("black", "red", "blue"), lty = 1)
plot(datetime, y2, type = "l", xlab = "datetime", ylab = names(data)[5])
plot(datetime, y3, type = "l", xlab = "datetime", ylab = names(data)[4])
dev.off()
