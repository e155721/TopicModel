readFile <- function(dir) 
{
  fileVec <- list.files(file.path(getwd(),dir),
                        pattern=".txt",
                        full.names=T)
  len <- length(fileVec)
  file <- list(1:len)
  for (i in 1:len) {
    file[i] <- read_file(paste(fileVec[i]))
  }
  return(file)
}
