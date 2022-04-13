#load necessary packages
library(devtools)
library(roxygen2)

# set the working directory to a new, exam-specific working directory
setwd("C:\Users\Eunsan\22 R\exam")

# testing document function using built-in hello file: afterwards delete.
# devtools::document(hello)

# after building relevant functions I repeat the below three steps.
devtools::load_all()
devtools::document()
devtools::check()

# test loading help files
?logLik
?mle
?standardError
?estimatePois

#test individual functions
set.seed(10)
y <- rpois(1000,5)
logLik(y, 10)

mle(y)

standardError(y, SEtype= "bootstrap", B= 300)
standardError(y, SEtype= "test")

# test the final version of function
estimatePois(y, lambda = 10, SEtype = "bootstrap")
estimatePois(y, lambda = 10, SEtype= "basic")
