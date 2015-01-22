x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x <- 1:4
lapply(x, runif)

lapply(x. runif, min = 0, max = 10)

x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean) #preserve all the columns and collapse all the rows
apply(x, 1, sum) # preserve all the rows and collapse all the columns
apply(x, 1, quantile, probs = c(0.25, 0.75))

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)
rowMeans(a, dims = 2)

list(rep(1,4), rep(2, 3), rep(3, 2), rep(4, 1))
mapply(rep, 1:4, 4:1)

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <-gl(3, 10)
tapply(x, f, mean)
tapply(x, f, range)

split(x, f)

lapply(split(x, f), mean) #do the same thing as the tapply

#splitting on more than one level
x < rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
interaction(f1, f2)

printmessage <- function(x) {
        if(is.na(x))
                print("x is a missing value!")
        else if(x > 0)
                print("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x)
}

x <- log(-1)
printmessage(x)

#debugging tools in R
#traceback
#debug
#browser
#trace
#recover