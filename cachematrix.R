## Package with functions for caching and manipulating the inverse of an
## input matrix assuming the matrix is invertible.  Relies on and extends
## solve() functionality.

## Creates a special pseudo-"matrix" object (actually a list of functions)
## that can cache the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
            ### assign a new value, y, to the makeCacheMatrix object 
            x <<- as.matrix(y)
                inv <<- NULL
        }
        get <- function() {
            ### retrieve the value of the matrix provided to
            ### MakeCacheMatrix (or subsequently set with
            ### the $set element)
            x
        }
        setinv <- function(solve) {
            ### use solve() to calculate inverse of matrix provided
            ### or set
            inv <<- solve
        }
        getinv <- function() {
            ### retrieve the value of the inverse of the matrix
            ### from the cache
            inv
        }
       
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Computes the inverse of the special "matrix" returned by a makeCacheMatrix call.
## If the inverse has already been calculated/set (and the matrix has not changed),
## then cacheSolve retrieves the inverse from the cache. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if(!is.null(inv)) {
            ### inv will be null unless $setinv has been
            ### previously invoked, as in a prior invocation
            ### of cacheSolve with no intervening uses of
            ### makeCacheMatrix object's $set element.
            message("getting cached data")
                return(inv)
        }
        ### if inv is NULL, then calculate inverse matrix and
        ### return that matrix.
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv

}
