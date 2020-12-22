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
  # URI decode
  path <- URLdecode(path)
  
  # run local query
  subd_list <- list.dirs(path, recursive = F, full.names = F)
  subd_files <- list.files(path)
  
  if(length(subd_list) == 0 & length(subd_files) == 0){
    return(list(err = "Directory not found"))
  } else {
    if(length(subd_list) == 0){
      return(list(dir = path, subDirs = c(), files = subd_files))
    } else {
      file_list <- setdiff(list.files(path), subd_list)
      return(list(dir = path, subDirs = subd_list, files = file_list))  
    }
  }
}

#* @get /openPath
openPath <- function(path, fname){
  # create shell command
  path_length <- nchar(path)
  if(substr(path, path_length - 1, path_length) != "\\"){
    path <- paste0(path, "\\")
  }
  #print(paste(path, fname, sep = " - "))
  shell_cmd <- paste0("cd ", path, " & ", '"', fname, '"')
  
  # run shell
  shell(shell_cmd, wait = F)
  return(list(dir = path, open = "ok"))
}

#* @assets ../src /
list()

# http://127.0.0.1:8000/dirR?path=C:/Users/nickm/Documents/2_Work