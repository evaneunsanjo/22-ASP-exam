pkgname <- "easyPois"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('easyPois')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("logLik")
### * logLik

flush(stderr()); flush(stdout())

### Name: logLik
### Title: Log Likelihood of a Poisson Distribution
### Aliases: logLik loglik

### ** Examples

set.seed(10)
y <- sample(x=1:10, size=10, replace=TRUE)
logLik(y, 10)



cleanEx()
nameEx("mle")
### * mle

flush(stderr()); flush(stdout())

### Name: mle
### Title: Returns Maximum Likelihood of a Poisson Distribution
### Aliases: mle poismle

### ** Examples

y = c(1:10)
mle(y)



cleanEx()
nameEx("standardError")
### * standardError

flush(stderr()); flush(stdout())

### Name: standardError
### Title: Calculates the standard error of an MLE estimator
### Aliases: standardError seCalculate se

### ** Examples

set.seed(10)
y <- sample(x=1:10, size=10, replace=TRUE)
standardError(y, SEtype= "basic")
standardError(y, SEtype= "bootstrap")



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
