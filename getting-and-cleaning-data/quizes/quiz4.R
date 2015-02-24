# Quiz 4
# Problem 1: What is the value of the 123 element of the resulting list?
url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
setwd("~/GitHub/data-science/getting-and-cleaning-data/data/")
download.file(url1, destfile="housingIdaho4.csv", method="curl")
download.file(url2, destfile="housingIdaho4CodeBook.pdf", method="curl")
housingData <- read.table("./housingIdaho4.csv", sep=",", header=T)
split <- strsplit(names(housingData), "\\wgtp")
split[123]

# Problem 2: What is the average? 
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
setwd("~/GitHub/data-science/getting-and-cleaning-data/data/")
download.file(url, destfile="gdp2.csv", method="curl")
data <- read.csv("gdp2.csv", skip = 4, nrows = 215, stringsAsFactors=F)
data <- data[X != ""]
gdp <- as.numeric(gsub(",", "", data$X.4))
mean(gdp, na.rm=T)

# Problem 3: How many countries begin with United?
grep("^United",data$X.3)

# Problem 4: Of the countries for which the end of the fiscal year is available,
# how many end in June? 
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
setwd("~/GitHub/data-science/getting-and-cleaning-data/data/")
download.file(url, destfile="additional.csv", method="curl")
adddata <- read.csv("additional.csv")
mergedData <- merge(data, adddata, by.x = "X", by.y = "CountryCode")
length(grep("^Fiscal year end: June", mergedData$Special.Notes))

# Problem 5: How many values were collected in 2012? How many values were 
# collected on Mondays in 2012?
install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
length(grep("^2012", sampleTimes))
dates <- as.Date(grep("^2012", sampleTimes, value=T))
sum(weekdays(dates)=="Monday")