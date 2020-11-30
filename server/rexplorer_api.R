# rexplorer_api.R 
#* @get /dirR
dirR <- function(path){
  subd_list <- list.dirs(path, recursive = F, full.names = F)
  file_list <- setdiff(list.files(path), subd_list)
  list(dir = path, subDirs = subd_list, files = file_list)
}

#* @assets ../src /
list()

# C:\Users\nickm\Documents\2_Work