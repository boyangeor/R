att.check <- function() {
  
}

col.check <- function(x, na.rm) {
  
  
  if (is.numeric(x)) {
    c(min(x, na.rm=na.rm), mean(x, na.rm=na.rm), max(x, na.rm=na.rm))
  }
  else if (is.factor(x) | is.character(x)) {
    
  }
}

gini <- function(x) {
  prop <- x / sum(x)
  1 - sum(prop ^ 2)
}
