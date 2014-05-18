## Package with functions for caching and manipulating the inverse of an
## input matrix assuming the matrix is invertible.  Relies on and extends
## solve() functionality.

## Creates a special pseudo-"matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

}


##  Computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
