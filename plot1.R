##Read subset of dataset that contains February 1st and February 2nd data
allData <- read.csv("household_power_consumption.txt", nrows = 70000, sep = ";")

##Subset the read data to extract only data from Feb 1st and 2nd
workData <- subset(allData, Date %in% c("1/2/2007","2/2/2007"))

##Remove the first variable
rm(allData)

##Stores the Global Active Power column as a numeric vector to allow histogram plotting
gap <- as.numeric(workData$Global_active_power)

#Histogram plotting and PNG file creation
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(gap, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()