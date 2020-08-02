####
## I did set the input x as a matrix
## and set the solved value "v" as a null
## then I changed every reference from "mean" to "solve"

makeCacheMatrix <- function(x = matrix(sample(1:50,4),1,1)) {
  v <- NULL
  set <- function(y) {
    x <<- y
    v <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) v <<- solve
  getsolve <- function() v
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


####
###
## here i have changed the "mean" to "solve" and "f" to "g"       
##

cacheSolve <- function(x, ...) {
  g <- x$getsolve()
  if(!is.null(g)) {
    message("getting inversed matrix")
    return(g)
  }
  data <- x$get()
  g <- solve(data, ...)
  x$setsolve(g)
  g
}

