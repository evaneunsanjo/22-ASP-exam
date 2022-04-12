#' Log Likelihood of a Poisson Distribution
#'
#' Calculates a log likelihood for the observed data
#'
#' @param y The vector of observed data
#' @param lambda The assumed value of lambda
#'
#' @return the log likelihood for the observed dataset y conditioned on the value of lambda
#' @author Eunsan Jo <\email{ejo@@wustl.edu}>
#' @seealso \code{mle}, \code{se}
#' @note part of easyPois package
#' @examples
#' set.seed(10)
#' y <- sample(x=1:10, size=10, replace=TRUE)
#' logLik(y, 10)
#' @rdname logLik
#' @include logLik.R
#' @import methods
#' @aliases loglik
#' @export
setGeneric(name="logLik",
           def = function(y, lambda)
           {standardGeneric("logLik")}
)



setMethod(f="logLik",
          definition = function(y, lambda){

            if (any(y < 0)) {
              stopI("For log likelihood, values of y must be greater or equal to 0")
            }

            if (lambda < 0) {
              stop("For log likelihood, lambda must be of a value greater than 0.")
            }

            LL <- -length(y)*lambda - sum(log(exp(lfactorial(y)))) + log(lambda)*sum(y)

            return(LL)
          }
)
