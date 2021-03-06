## Caching the Inverse of a Matrix
## A pair of functions that cache the inverse of a matrix.

## makeCacheMatrix
## This function creates a special "matrix" object that can cache its inverse.
## It is recommended to store its result in a variable.
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {				## allows to set a new
                x <<- y					## matrix
                inv <<- NULL
        }
        get <- function() x				## prints x

        setinverse <- function(inverse) inv <<- inverse	## cache the inverse

        getinverse <- function() inv			## prints the inverse
							## of x.

        list(set = set, get = get,			## returns the special
             setinverse = setinverse,			## 'matrix'	
             getinverse = getinverse)
}


## cacheSolve
## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then the cachesolve retrieves the inverse from the
## cache.
cacheSolve <- function(x, ...) {
        inv <- x$getinverse()				 ## stores inverse
							 ## matrix in 'inv'
        if(!is.null(inv)) {				  
                message("getting cached inverse matrix") ## if there is already
                return(inv)				 ## an inverse, shows it
        }						 
        data <- x$get()
        inv <- solve(data, ...)				 ## computes the inverse

        x$setinverse(inv)				 ## fix the inverse to
							 ## the special 'matrix'

        inv						 ## prints the inverse
}
