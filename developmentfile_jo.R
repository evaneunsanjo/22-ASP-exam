# I create basic R package structure using 'New project' menu
library(devtools)
library(roxygen2)

# creating it inside original class repository created errors, so I have
# set the working directory to a new, exam-specific git repository
setwd("C:\Users\Eunsan\22 R\exam")

# add a .r file for testing functions and documenting progress (development file)

## In general, I will follow process of creating a class/function - testing it (setting examples)
## - set methods - document them - test as a package.
## after building each of the function below I repeat the below three steps.
devtools::check()
devtools::load_all()
devtools::document()
# After this I check the help file and dislike it, make some grammatical changes.
?logLik
?mle
?standardError
?estimatePois
?'PoisMLE'


# General structure of functions are based on what we did in PSET3.
# I begin by building a logLik function.
      # Referencing QPMII, I use lfactorial and then exponentiate it, instead of simple factorial().
      # other than that it is as defined in the guideline.

logLik <- function(y, lambda){

        if (any(y < 0)) {
          stop("For log likelihood, values of y must be greater or equal to 0")
        }

        if (lambda < 0) {
          stop("For log likelihood, lambda must be of a value greater than 0.")
        }

        LL <- -length(y)*lambda - sum(log(exp(lfactorial(y)))) + log(lambda)*sum(y)

        return(LL)
      }
      # testing
      set.seed(10)
      y <- sample(x=1:10, size=10, replace=TRUE)
      logLik(y, 10)

#mle function

mle <- function(y){
        if (any(y < 0)) {
          stop("For maximum likelihood, values of y must be greater or equal to 0")
        }

        return(sum(y)/length(y))
}
  #example
y = c(1:10)
mle(y)


# stadard errors function
  # this took a good hour because I could not get the bootstrapping option to work.

se<- function(y, SEtype = c("basic", "bootstrap"), B=200){

  mle <- function(y){return(sum(y)/length(y))}

  if (SEtype == "basic") {
    se <- sqrt(mle(y) /length(y))

    return(se)

  }

  if (SEtype == "bootstrap") {
    matrix <- replicate(B, {
      return(sample(y, length(y), replace = T))
    })

    bootmle <- apply(matrix, 2, mle)
    bootse <- sd(bootmle)

    return(bootse)

  }

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

se(y, SEtype= "bootstrap", B= 300)
se(y, SEtype= "test")
se(y, SEtype= "bootstrap")
se(y, SEtype= "basic")


# class definitions
