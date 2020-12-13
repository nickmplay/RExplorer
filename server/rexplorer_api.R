# rexplorer_api.R 

#' @filter cors
cors <- function(req, res) {
  
  res$setHeader("Access-Control-Allow-Origin", "*")
  
  if (req$REQUEST_METHOD == "OPTIONS") {
    res$setHeader("Access-Control-Allow-Methods","*")
    res$setHeader("Access-Control-Allow-Headers", req$HTTP_ACCESS_CONTROL_REQUEST_HEADERS)
    res$status <- 200 
    return(list())
  } else {
    plumber::forward()
  }
  
}

#* @get /dirR
dirR <- function(path){
  # run local query
  subd_list <- list.dirs(path, recursive = F, full.names = F)
  
  if(length(subd_list) == 0){
    return(list(err = "Directory not found"))
  } else {
    file_list <- setdiff(list.files(path), subd_list)
    return(list(dir = path, subDirs = subd_list, files = file_list))
  }
}

#* @assets ../src /
list()

# http://127.0.0.1:8000/dirR?path=C:/Users/nickm/Documents/2_Work