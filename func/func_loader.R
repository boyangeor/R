func_loader <- function() {
  for(d in list.dirs("/home/boyangeorgiev/boR/func"))
    for (f in list.files(d, full.names = T))
      # If the file has .R extension AND is not 'func_loader.R',
      # otherwise recursion happens and R blocks
      if (grepl(".*\\.R", basename(f), perl=T) &&
          basename(f) != "func_loader.R")
        source(f)
}
func_loader()
