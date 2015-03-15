# Loads data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="./hpc.zip", method="curl")
unzip("./hpc.zip")
file.remove("./hpc.zip")
header <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
            "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
            "Sub_metering_3")
data <- read.table("./household_power_consumption.txt", sep=";", skip = 66637, 
                   nrows = 2880, col.names = header, colClasses=c(rep('character',2),
                                                                  rep('numeric',7)))
library(lubridate)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data$DateTime<-data$Date + data$Time

# Open png device
png(filename='./plot4.png')

# Build plots
par(mfrow=c(2,2))

# Upper Left Quadrant
plot(data$DateTime, data$Global_active_power,
     ylab='Global Active Power', xlab='', type='l')

# Upper Right Quadrant
plot(data$DateTime, data$Voltage,
     xlab='datetime', ylab='Voltage', type='l')

# Lower Left Quadrant
plot(data$DateTime, data$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid', bty='n')


# Lower Right Quadrant
plot(data$DateTime, data$Global_reactive_power,
     xlab='datetime', ylab='Global_reactive_power', type='l')


# Turn device off
dev.off()