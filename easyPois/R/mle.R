#' Returns Maximum Likelihood of a Poisson Distribution
#'
#' Calculates the maximum likelihood estimator for the given dataset
#'
#' @param y Given observed data
#'
#' @return maximum likelihood estimator for the observed dataset y
#' @author Eunsan Jo <\email{ejo@@wustl.edu}>
#' @seealso \code{logLik}, \code{se}
#' @examples
#' y = c(1:10)
#' mle(y)
#' @rdname mle
#' @aliases poismle
#'
#' @export
setGeneric(name = "mle",
           def = function(y)
           {standardGeneric("mle")}
)

#' @export
setMethod(f = "mle",
          definition = function(y){
            if (any(y < 0)) {
              stopI("For maximum likelihood, values of y must be greater or equal to 0")
            }

            return(sum(y)/length(y))
          }
)

