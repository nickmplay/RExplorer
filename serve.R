# serve.R
library(plumber)
r <- plumb("./server/rexplorer_api.R") # api.R for example
r$run(port = 8000)