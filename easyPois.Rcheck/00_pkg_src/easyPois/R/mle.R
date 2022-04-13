#' Returns Maximum Likelihood of a Poisson Distribution
#'
#' Calculates the maximum likelihood estimator for the given dataset
#'
#' @param y Given observed data
#'
#' @return maximum likelihood estimator for the observed dataset y
#' @author Eunsan Jo <\email{ejo@@wustl.edu}>
#' @seealso \code{logLik}, \code{standardError}
#' @examples
#' y <- sample(x=1:10, size=2000, replace=TRUE)
#' mle(y)
#' @rdname mle
#' @include  mle.R
#' @import methods
#' @aliases poismle
#'
#' @export
#set generic ahead of method
setGeneric(name = "mle",
           def = function(y)
           {standardGeneric("mle")}
)

#method for calculating maximum likelihood
setMethod(f = "mle",
          definition = function(y){
            #function stops if invalid vector is inserted
            if (any(y < 0)) {
              stop("For maximum likelihood, values of y must be greater or equal to 0")
            }

            return(sum(y)/length(y))
          }
)

