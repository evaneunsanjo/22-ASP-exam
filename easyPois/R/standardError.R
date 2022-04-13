#' Calculates the standard error of an MLE estimator
#'
#' Calculates the standard error using a vector of the data with Poisson distribution
#'
#' @param y observed data in vector form
#' @param SEtype method of calculating the standard error
#' @param B number of sampling to be done from y in case of bootstrapping. The default is 1000.
#'
#' @return standard error of mle
#' @author Eunsan Jo <\email{ejo@@wustl.edu}>
#' @examples
#' set.seed(10)
#' y <- sample(x=1:10, size=10, replace=TRUE)
#' standardError(y, SEtype= "basic")
#' standardError(y, SEtype= "bootstrap")
#' @rdname standardError
#' @aliases seCalculate se
#' @include standardError.R
#' @import methods
#' @importFrom stats sd


#' @export
setGeneric(name="standardError",
           def=function(y, SEtype, B=1000)
           {standardGeneric("standardError")}
)


setMethod(f="standardError",
          definition=function(y, SEtype = c("basic", "bootstrap"), B=1000){

            mle <- function(y){return(sum(y)/length(y))}

            if (SEtype == "basic") {
              se <- sqrt(mle(y) /length(y))
            }

            if (SEtype == "bootstrap") {
              matrix <- replicate(B, {
                return(sample(y, length(y), replace = T))
              })

              bootmle <- apply(matrix, 2, mle)
              se <- sd(bootmle)
            }
            return(se)

            if(any(y < 0)) {
              stop("For log likelihood, values of y must be greater or equal to 0")
            }

            if(B <= 0) {
              stop("For bootstrapping, B must be greater than 0.")
            }

            if (!(SEtype %in% c("basic", "bootstrap"))) {
              stop("Please insert a defined method for SEtype.")
            }
          }
)

