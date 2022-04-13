#' PoisMLE class definitions
#'
#' Function \code{estimatePois()} generates an object of class PoisMLE.
#'
#' An \code{PoisMLE} class object can have following slots:
#' \itemize{
#' \item \code{y} The original data
#' \item \code{MLE} The maximum likelihood estimator for this dataset
#' \item \code{LL} The log likelihood calculated from the observed data assuming the MLE is correct
#' \item \code{SE} The standard error for the MLE
#' \item \code{SEtype} The method used to calculate the standard error
#' }
#'
#' @author Eunsan Jo \email{ejo@wustl.edu}
#' @rdname PoisMLE
#' @include PoisMLE.R
#' @import methods
#' @importFrom methods callNextMethod new
#' @aliases Poismleclass
#' @export
# I belatedly inserted a lot of 'importsFrom' above according to advices from 'check' function
# PoisMLE as S4 class
setClass(Class="PoisMLE",
         representation = representation(
           y = "numeric",
           MLE = "numeric",
           LL = "numeric",
           SEtype = "character",
           SE = "numeric"
         ),
         prototype = prototype(
           y = numeric(),
           MLE = numeric(),
           LL = numeric(),
           SEtype = character(),
           SE = numeric()
         )
)

# classchecks that prevents any wrong values from being processed
#' @export
setValidity("PoisMLE", function(object){

  y_classtest <- is.numeric(object@y)
  if (!y_classtest){stop("Y must be of numeric class.")}

  MLE_classtest <- is.numeric(object@MLE)
  if (!MLE_classtest){stop("MLE must be of numeric class.")}

  LL_classtest <- is.numeric(object@LL)
  if (!LL_classtest){stop("LL must be of numeric class.")}

  SE_classtest <- is.numeric(object@SE)
  if (!SE_classtest){stop("SE must be of numeric class.")}

  SEtype_classtest <- is.character(object@SEtype)
  if (!SEtype_classtest){stop("SEtype must be of character class.")}

}
)

#' @export
setMethod("initialize", "PoisMLE",
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          }
)


