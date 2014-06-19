## makeCacheMatrix creates 04 functions that are later used by cacheSolve to invert the provided matrix or get the 
## inverted matrix cached

## Set the inverted matrix as null and create the functions that will be used by cacheSolve later

makeCacheMatrix <- function(x = matrix()) {
        ## define the inverted matrix as NULL
        im <- NULL 
        ## function to set the argument x to be used as argument in set() and set the inverted matrix as NULL 
        set <- function(y) {
                x <<- y
                im <<- NULL
        }
        ## function to get the matrix entered as argument in makeCacheMatrix
        get <- function() x
        ## function to set the value of the inverted matrix
        setsolve <- function(solve) im <<- solve
        ## function to get the value of the inverted matrix
        getsolve <- function() im
        ## return a list of functions determined by makeCacheMatrix
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## get the cached value of the inverted matrix. If the cahed value is NULL, then invert the provided matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        im <- x$getsolve()
        ## get cached inverted matrix in case it is not NULL
        if(!is.null(im)) {
                message("getting cached data")
                return(im)
        }
        ## invert the matrix in case cached value is NULL
        data <- x$get()
        im <- solve(data, ...)
        x$setsolve(m)
        im
}
