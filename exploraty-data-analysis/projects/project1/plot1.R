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

# Open png device
png(filename='./plot1.png')

# Build plot
hist(data$Global_active_power, main='Global Active Power',
     xlab='Global Active Power (kilowatts', col='red')

# Turn device off
dev.off()