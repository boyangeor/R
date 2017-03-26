func_loader <- function(path) {
  for(d in list.dirs(path))
    for (f in list.files(d, full.names = T))
      # If the file has .R extension AND does NOT contain "_nl"
      # ("_nl" for files that should not be loaded by default) 
      # is not 'func_loader.R', otherwise recursion happens and
      # R blocks
      if (grepl(".*\\.R", basename(f), perl=T) &&
          !grepl("_nl", basename(f), perl=T) &&
          basename(f) != "func_loader.R")
        source(f)
}
func_loader(path = "/home/boyangeorgiev/boR/func")
