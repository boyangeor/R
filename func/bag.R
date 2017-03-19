# Bagging
bag <- function(formula, data, classifier, k, ...) {
  
  n <- nrow(data)
  classifier <- match.fun(classifier)
  bcs <- vector(mode="list")
  y <- all.vars(formula)[1]
  
  for (i in 1:k) {
    # sample
    select <- sample(n, n, replace=T)
    
    # train classifier
    #res.classifier <- classifier(formula=formula, data=data[select, ]
     #                            , args)
    res.classifier <- classifier(formula=formula,
                                 data=data[select,], ...)
    classified <- predict(res.classifier, newdata=data[-select, ],
                          type=type)
    bcs[[paste0("Base_", i)]] <- table(classified, data[-select, y])
    
  }
  
  bcs
}

form <- formula("Species ~ .")
bag(formula=form, data=iris, classifier=naiveBayes, k=10, type="class",
    method="class")

