DisplayCmatrix <-
function(table = "MP"){
  if(table == "MP"){
    Cmatrix <- read.csv(file = system.file("Cmatrix.mp.csv", package = "SAGA"), row.names=1)[, -1]
  }else{
    cat("No genetic contribution table was found matching your argument")
  }
  return(Cmatrix)
}
