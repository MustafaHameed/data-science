## These functions are used to create a special object that stores a matrix 
## and cache's its inverse.

## The first function, makeCacheMatrix creates a special "matrix" and cache
## its inverse. There are four functions contained in the "matrix":
## 1) set the value of the matrix
## 2) get the value of the matrix
## 3) set the value of the inverse
## 4) get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        
        # set the value of the matrix
        set <- fuction(y) {
                x <<- y
                inverse <<- NULL
        }
        
        # return the value of the matrix
        get <- function() x
        
        #set(cache) the value of the inverse of the matrix
        setinv <- function(z) inverse <<- z
        
        #return the value of the inverse
        getinv <- function() inverse
        
        #return the special "matrix"
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}

## The second function, cacheSolve computes the inverse of the special "matrix"
## returned by makeCacheMatrix. If the inverse has already been calculated (and
## the matrix has not changed), then the cacheSolve should retrieve the inverse
## from the cache.

cacheSolve <- function(x, ...) {
        inverse <- x$getinv()
        
        # if the inverse has already been calculated and cached, return it
        if(!is.null(inverse)) {
                message("getting cached inverse")
                return(inverse)
        }
        
        # otherwise, calculate it using solve() and cache it, then return it
        matrix <- x$get()
        inverse <- solve(matrix, ...)
        x$setinv(inverse)
        inverse
}