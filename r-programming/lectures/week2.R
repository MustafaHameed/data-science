make.power <- function(n) {
        pow <- function(x) {
                x^n
        }
        pow
}

y <- 10

f <- function(x) {
        y <- 2
        y^2 + g(x) ##dynamic scoping - y is found in the environment in which the function was called
}

g <- function(x) {
        x*y ##lexical scoping - y is found in global environment which is 10
}

##Dates in R
x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))

##Times in R
x <- Sys.time()
x ##already in 'POSIXct' format
unclass(x)
x$sec
p <- as.POSIXlt(x)
names(unclass(p))
p$sec

datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)

##leap year, time zone...
x <- as.Date("2012-03-01") 
y <- as.Date("2012-02-28")
x-y
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x