##Read subset of dataset that contains February 1st and February 2nd data
allData <- read.csv("household_power_consumption.txt", nrows = 70000, sep = ";")

##Subset the read data to extract only data from Feb 1st and 2nd
workData <- subset(allData, Date %in% c("1/2/2007","2/2/2007"))

##Remove the first variable
rm(allData)

##Creates a variable that stores the date & time data for plotting
datetime <- paste(workData$Date, workData$Time)
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

#Histogram plotting and PNG file creation
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(x = datetime, y = workData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = datetime, y = workData$Sub_metering_2, col = "red")
lines(x = datetime, y = workData$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1)
dev.off()