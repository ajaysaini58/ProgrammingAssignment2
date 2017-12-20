## Put comments here that give an overall description of what your
## functions do

## creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inverse_matrix <- NULL
  set <- function(y) {
    x <<- y
    inverse_matrix <<- NULL
  }
  get <- function() x
  set_inverse <- function(inverse) inverse_matrix <<- inverse
  get_inverse <- function()inverse_matrix
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
}

## This function gets the inverse of a matrix from cache. If the inverse of matrix is not
## available in cache, then solve the inverse and store it into cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse_matrix <- x$get_inverse()
  if(!is.null(inverse_matrix)) {
    message("Matrix inverse found in cache. Getting cached data")
    return(inverse_matrix)
}
  get_matrix <- x$get()
  inverse_matrix <- solve(get_matrix, ...)
  x$set_inverse(inverse_matrix)
  inverse_matrix
}
