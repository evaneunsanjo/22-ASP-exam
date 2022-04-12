# I create basic R package structure using 'New project' menu
library(devtools)
library(roxygen2)

# creating it inside original class repository created errors, so I have
# set the working directory to a new, exam-specific git repository
setwd("C:/Users/Eunsan/Dropbox/22 R")

# add a .r file for testing functions and documenting progress (development file)

## In general, I will follow process of creating a class/function - testing it (setting examples)
## - set methods - document them - test as a package.


# I begin by building a logLik function.
# The structure of function is based on what we did in PSET3.
      # Referencing QPMII, I use lfactorial and then exponentiate it, instead of simple factorial().
      # other than that it is as defined in the guideline.

      function(y, lambda){

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
      # documentation
      devtools::document()
      # I check the help file and dislike it, make some grammatical changes.
      ?logLik

# define class

