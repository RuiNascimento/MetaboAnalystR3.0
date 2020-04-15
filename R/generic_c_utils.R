#' MetaboAnalystR: A package for computating the notorious bar statistic.
#'
#' The MetaboAnalystR package provides a pipeline for metabolomics processing.
#' 
#' @section MetaboAnalystR functions:
#' The MetaboAnalystR functions ...
#'
#' @docType package
#' @name MetaboAnalystR
#' @useDynLib MetaboAnalystR, .registration=TRUE, .fixes = "C_"
NULL
#> NULL


C_imodwt_r <- function(y,z,N,j, L, ht, gt, XX){
  .C(C_imodwt, y, z, N, j, 
          L, ht, gt, out=XX, PACKAGE = "MetaboAnalystR")$out
}



C_modwt_r <- function(X,N,j, L, ht, gt,W, V){
  .C(C_modwt, X, N, as.integer(j), L, 
     ht, gt, W = W, V = V, PACKAGE = "MetaboAnalystR")[7:8]
}

