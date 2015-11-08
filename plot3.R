# the data is from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# reading and format data
setwd("~/expl_data_ass_1/")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
data$Date <-as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")) # delete rows we don't need
data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S") # format the Time column to plot a histogram

# creating a png-file with a plot
setwd("~/expl_data_ass_1/ExData_Plotting1/")
png("plot3.png", width = 480, height = 480)
plot(data$Time, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, type="l", col="red")
lines(data$Time, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
dev.off()
