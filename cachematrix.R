## So I've used matrix as x, and inv as a vector with no value(as was m in example)
## so by trying to explain the code i can say: set - is the function that passes certain
## argument to x(as we do x <<-y), get is the function that simply gets value of x,
## setinv is a function that passes inversion function to an argument, and getinv - is
## getting a result of this inversion. correct or explain to me in the comments if I'm wrong
## i will be really glad to hear your thoughts.

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
set <- function(y) {
     x <<- y
     inv <<- NULL
}
get <- function() x
setinv <- function(solve) inv <<- solve
getinv <- function() inv
list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## So the function is pretty simple and "if"checks whether matrix is inverted already or no

cacheSolve <- function(x, ...) {
     inv <- x$getinv()
     if(!is.null(inv)) {
          message("getting inversed matrix")
          return(inv)
     }
     mydat <- x$get()
          inv <- solve(mydat, ...)
          x$setinv(inv)
          inv
        ## Returning a matrix that is the inverse of 'x'
}
