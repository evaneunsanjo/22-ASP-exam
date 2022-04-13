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
#' y <- sample(x=1:1000, size=1000, replace=TRUE)
#' standardError(y, SEtype= "basic")
#' standardError(y, SEtype= "bootstrap")
#' @rdname standardError
#' @aliases seCalculate se
#' @include standardError.R
#' @import methods
#' @importFrom stats sd
#' @export
# I include 'import from' above for the functions here to run smoothly
#set generic ahead of method per S4 classing
setGeneric(name="standardError",
           def=function(y, SEtype, B=1000)
           {standardGeneric("standardError")}
)

#set method for calculating standard errors
setMethod(f="standardError",
          definition=function(y, SEtype = c("basic", "bootstrap"), B=1000){
              # I include mle function within function for this function to be self-conclusive
            mle <- function(y){return(sum(y)/length(y))}
              # if the type is set to basic, the function returns a square root
            if (SEtype == "basic") {
              se <- sqrt(mle(y) /length(y))
            }
            # if the type is set to bootstrap, the function runs a same function B times over given y

            if (SEtype == "bootstrap") {
              matrix <- replicate(B, {
              return(sample(y, length(y), replace = T)) # sample with replacement from y for n times
              })
                # calculates MLE: we use apply instead of a for loop
              bootmle <- apply(matrix, 2, mle)
              se <- sd(bootmle)
            }
            # the resulting standard error, regardless of the method
            return(se)

              # warning messages in case the inputs are invalid
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

