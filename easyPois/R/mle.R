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
#' y = c(1:10)
#' mle(y)
#' @rdname mle
#' @include  mle.R
#' @import methods
#' @aliases poismle
#'
#' @export
setGeneric(name = "mle",
           def = function(y)
           {standardGeneric("mle")}
)

setMethod(f = "mle",
          definition = function(y){
            if (any(y < 0)) {
              stopI("For maximum likelihood, values of y must be greater or equal to 0")
            }

            return(sum(y)/length(y))
          }
)

