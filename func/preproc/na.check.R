na.check <- function(x) {
  # Expects data.frame, returns information about the distribution
  # of missing values
  # fo is a formula (not all cols might be worth checking for NAs)
  if (!is.data.frame(x))
    stop("The argument's class is not 'data.frame'")
  
  
  rn <- paste0(seq_len(ncol(x)), ". ", names(x))
  m <- matrix(NA, ncol(x), 2, dimnames=list(rn, c("total", "pctg")))
  na.m <- is.na(x)
  m[, "total"] <- colSums(na.m)
  m[, "pctg"] <- round((m[, "total"] / nrow(x)) * 100, 1)
  
  na.cols <- m[, "total"] > 0
  list(nna.cols = sum(na.cols), na.cols = names(x)[na.cols] , m = m,
       na.cor = round(cor(na.m[, na.cols]), 2))
  
  # git test
}