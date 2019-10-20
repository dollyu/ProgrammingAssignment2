
## Caching the Inverse of a Matrix
## Below are two functions that are used to cache the inverse of a matrix

## First function: makeCacheMatrix
## This first function, creates a special matrix object that can cache its inverse

    makeCacheMatrix <- function(x = matrix()) {

	i <- NULL
	set <- function(y) {
	        x <<- y
	        i <<- NULL
    	}
    	get <- function() x
    	setinverse <- function(inverse) i <<- inverse
    	getinverse <- function() i
    	list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
    }

## Second function: cacheSolve
## This second function, computes the inverse of the special matrix returned by makeCacheMatrix

    cacheSolve <- function(x, ...) {
	i <- x$getinverse()
	if(!is.null(i)) {
        	message("getting cached data.")
        	return(i)
    	}
    	data <- x$get()
    	i <- solve(data)
    	x$setinverse(i)
    	i
    }


## Proof runs

## > x <-makeCacheMatrix(matrix(c(1,0,0,0,2,0,0,0,3),ncol=3,nrow=3))
## > x$get()
##      [,1] [,2] [,3]
## [1,]    1    0    0
## [2,]    0    2    0
## [3,]    0    0    3

## First run - no cache
## > cacheSolve(x)
##      [,1] [,2]      [,3]
## [1,]    1  0.0 0.0000000
## [2,]    0  0.5 0.0000000
## [3,]    0  0.0 0.3333333

## Second run - retrieving from cache
## > cacheSolve(x)
## getting cached data.
##      [,1] [,2]      [,3]
## [1,]    1  0.0 0.0000000
## [2,]    0  0.5 0.0000000
## [3,]    0  0.0 0.3333333


