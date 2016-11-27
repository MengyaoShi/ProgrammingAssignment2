## This cachematrix.R has two functions: makeCacheMatrix can cache inverse of the given matrid x
## And cacheSolve can compute matrix's inverse, however if it's already calculated, cacheSolve can 
## give you inverse from cache. 
## 
##
##
## Simple demo: in R studio, type in 
## A=matrix(c(2,1,1,3,2,1,2,1,2), nrow=3, ncol=3, byrow = TRUE)
## y<-makeCacheMatrix(A)
## cacheSolve(y)
## B<-cacheSolve(y)
## B

## based on printed out message "getting cached data", you can see if inverse of that matrix is calculated
## or it's from cache.



## cache inverse of a give matrix

 makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setinverse<-function(solve) m<<-solve
  getinverse<-function() m
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## calculate inverse of get inverse from cache


 cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m<-x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-solve(data, ...)
  x$setinverse(m)
  m
}


