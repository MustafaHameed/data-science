# Quiz 3
# Problem 1: What are the first 3 values that result?
url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
setwd("~/GitHub/data-science/getting-and-cleaning-data/data/")
download.file(url1, destfile="housingIdaho3.csv", method="curl")
download.file(url2, destfile="housingIdaho3CodeBook.pdf", method="curl")
housingData <- read.table("./housingIdaho3.csv", sep=",", header=T)
head(housingData)
condition <- housingData$ACR == 3 & housingData$AGS == 6
which(condition)

# Problem 2: What are the 30th and 80th quantiles of the resulting data?
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
setwd("~/GitHub/data-science/getting-and-cleaning-data/data/")
download.file(url, destfile="picture.jpg", method="curl")
library(jpeg)
img <- readJPEG("picture.jpg", native=T)
quantile(img, 0.3)
quantile(img, 0.8)

# Problem 3: What is the 13th country in the resulting data frame? 
url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
setwd("~/GitHub/data-science/getting-and-cleaning-data/data/")
download.file(url1, destfile="gdp.csv", method="curl")
download.file(url2, destfile="edu.csv", method="curl")
gdp <- read.csv("gdp.csv", skip=4, stringsAsFactors = FALSE, na.strings=c("","NA"))
gdp <- gdp[X != ""]
edu <- read.csv(read.csv("edu.csv")
head(gdp)
head(edu)
library(dplyr)
mergedData <- merge(gdp, edu, by.x = "X", by.y = "CountryCode")
mergedData[!na, ]
nrow(mergedData[!na, ])
sorted <- arrange(mergedData, desc(as.integer(X.1)))
sorted[13, 1:4]

# Problem 4: What is the average GDP ranking for the "High income: OECD" and 
# "High income: nonOECD" group?
tapply(as.integer(mergedData$X.1), mergedData$Income.Group, mean, na.rm=T)

# Problem 5: How many countries are Lower middle income but among the 38 nations
# with highest GDP?
mergedData <- mergedData[!na,]
quantile <- quantile(as.integer(mergedData$X.1), prob=c(0.2, 0.4, 0.6, 0.8, 1))
top <- mergedData[mergedData$Income.Group == "Lower middle income" & as.integer(mergedData$X.1) < quantile[1],]
nrow(top)