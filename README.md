<!-- badges: start -->
[![Travis build status](https://travis-ci.org/marquesjchacon/myfirstpackage.svg?branch=master)](https://travis-ci.org/marquesjchacon/myfirstpackage)
[![Codecov test coverage](https://codecov.io/gh/marquesjchacon/myfirstpackage/branch/master/graph/badge.svg)](https://codecov.io/gh/marquesjchacon/myfirstpackage?branch=master)
<!-- badges: end -->

## Installation

To download the `myfirstpackage` package, use the code below:

``` r
# install.packages("devtools")
devtools::install_github("marquesjchacon/myfirstpackage")
library(myfirstpackage)
```

## Use

The vignette provides tutorials for each of the main functions in this package, and is meant to guide the user to make sure they are using the functions correctly. To view the vignette, please enter the following code below:

``` r
# install.packages("devtools")
devtools::install_github("marquesjchacon/myfirstpackage", build_vignette = TRUE, build_opts = c())
library(myfirstpackage)
# Use this to view the vignette in the myfirstpackage HTML help
help(package = "myfirstpackage", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "myfirstpackage")
```
