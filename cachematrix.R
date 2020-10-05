## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix<-function(x=matrix()){
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setinverse<-function(solve) m<<- solve
  getinverse<-function() m
  list(set=set, get=get,
       setinverse=setinverse,
       getinverse=getinverse)
}

a<-c(2,-2,4,-5)
M<-matrix(a,ncol = 2,nrow = 2)

a1<-makeCacheMatrix

# This function calculate de inverse of matrix, if exists, and save in cache. 

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
cacheSolve(a1)
