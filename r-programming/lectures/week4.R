# week 4

#str function
str(str)
str(lm)

x <- rnorm(100, 2, 4)
summary(x)
str(x)

f <- gl(40, 10)
str(f)
summary(f)

#simulation
#rnorm: generate random normal variates with a given mean and stadard deviation
#dnorm: evaluate the normal probability density at a point (or vector of points)
#pnorm: evaluate the cumulative distribution function for normal distribution
#qnorm: evaluate quantile function (inverse cumulative distribution function)
#rpois: generate random poisson variates with a given rate

set.seed(1)
rnorm(5)

set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

set.seed(20)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)

sample(1:10, 4)
sample(1:10, replace = TRUE)
sample(letters, 5)

# R profiler
system.time()

# elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))
# elapsed time < user time
hilbert <- function(n) {
        i <- 1:n
        1 / outer(i - 1, i, "+")
}
x <- hilbert(1000)
system.time(svd(x))

system.time({
        n <- 1000
        r <- numeric(n)
        for (i in 1:n) {
                x <- rnorm(n)
                r[i] <- mean(x)
        }
})

Rprof()
summaryRprof()
by.total
by.self