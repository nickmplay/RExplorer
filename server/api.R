# api.R 
#* @get /add
add <- function(x, y){
  return(as.numeric(x) + as.numeric(y))
}
#* @get /add2
add2 <- function(x, y){ 
  list(result = as.numeric(x) + as.numeric(y))
}