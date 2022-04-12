#' estimatePois function for MLE calculation
#'
#' Function for calculating log likelihood, MLE, and standard errors of a Poisson distribution data
#'
#' @param y Observed data in vector form
#' @param lambda Designated value of lambda for the Poisson distribution
#' @param SEtype Method of calculating the standard error, either \code{basic} or \code{bootstrap}.
#' @param B Number of resamplings to be done if bootrapping the standard errors.Default is set to 200.
#'
#' @return An object of class PoisMLE
#' \item{y}{The original data}
#' \item{MLE}{The maximum likelihood estimator for this dataset}
#' \item{LL}{The log likelihood calculated from the observed data assuming the MLE is correct}
#' \item{SE}{The standard error for the MLE}
#' \item{SEtype}{The method used to calculate the standard error}
#'
#' @author Eunsan Jo

#' @rdname estimatePois
#' @include estimatePois.R
#' @import methods
#' @aliases estimatePois
#'
#' @export
setGeneric(name = "estimatePois",
           def = function(y, lambda, SEtype=c("basic", "bootstrap"), B=200)
           {standardGeneric("estimatePois")}
)


setMethod(f = "estimatePois",
          definition = function(y, lambda, SEtype=c("basic", "bootstrap", B=200)){
            MLE <- mle(y)
            LL <- logLik(y, lambda)
            SE <- standardError(y, SEtype = c("basic", "bootstrap"), B)
            estimateP <- new("PoisMLE", y=y, LL = LL, MLE = MLE, SE = SE,SEtype = SEtype)
            return(estimateP)
          }
)

