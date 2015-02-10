# Quiz 1
# Problem 1
setwd("~/GitHub/data-science/getting-and-cleaning-data/data/")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="./housingIdaho.csv", method="curl")
list.files()
housingData <- read.table("./housingIdaho.csv", sep=",", header=T)
head(housingData)
dim(housingData)
match <- housingData$VAL==24
sum(match, rm.na=T)

# Problem 2
housingData$FES

# Problem 3
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile="./naturalGas.xlsx", method="curl")
dateDownloaded <- date()
library(xlsx)
list.files()
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("naturalGas.xlsx", sheetIndex=1, header=T, colIndex=colIndex, rowIndex=rowIndex)
head(dat)
sum(dat$Zip*dat$Ext,na.rm=T)

# Problem 4
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
library(XML)
doc <- xmlTreeParse(fileUrl, useInternal=T)
doc
rootNode <- xmlRoot(doc)
rootNode
xmlName(rootNode)
names(rootNode)
sum(xpathSApply(rootNode, "//zipcode", xmlValue)==21231)

# Problem 5
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile="./housingIdaho2.csv", method="curl")
library(data.table)
DT <- fread("housingIdaho2.csv")

#A
st = proc.time()
for (i in 1:100){
        mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
}
print (proc.time() - st)

#B
st = proc.time()
for (i in 1:100){
        mean(DT$pwgtp15,by=DT$SEX)
}
print (proc.time() - st)

#C
st = proc.time()
for (i in 1:100){
        rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
}
print (proc.time() - st)

#D
st = proc.time()
for (i in 1:100){
        DT[,mean(pwgtp15),by=SEX]
}
print (proc.time() - st)

#E
st = proc.time()
for (i in 1:100){
        tapply(DT$pwgtp15,DT$SEX,mean)
}
print (proc.time() - st)

#F
st = proc.time()
for (i in 1:100){
        sapply(split(DT$pwgtp15,DT$SEX),mean)
}
print (proc.time() - st)