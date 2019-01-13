
<!-- README.md is generated from README.Rmd. Please edit that file -->
pkg
===

The package is experimental!

pkg is yet another alternative to avoid namespace clashes when loading packages with library. It is based on the `import` package with some modified functionality.

Installation
------------

You can install the package from Github:

``` r
devtools::install_github("markusdumke/pkg")
```

Example
-------

``` r
library(pkg)

# Check that lubridate is installed (does not load the package)
# Refer to functions with lubridate::
import_pkg(lubridate, .load = FALSE)

lubridate::dmy("01.01.2019")


# Import only map from purrr
import_from(purrr, map)

map(1:3, rnorm)


# Explicitly import magrittr (same as library)
import_pkg("magrittr", .load = TRUE)

1:10 %>% sum
```
