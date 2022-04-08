
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BEAInfrastructureInvestmentApp

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of BEAInfrastructureInvestmentApp is to explore BEA
infrastructure investment datasets from tidytuesday.

## Installation

You can install the development version of
BEAInfrastructureInvestmentApp like so:

``` r
devtools::install_github('jpdugo/BEAInfrastructureInvestmentApp')
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(BEAInfrastructureInvestmentApp)
#> Warning: replacing previous import 'ggplot2::last_plot' by 'plotly::last_plot'
#> when loading 'BEAInfrastructureInvestmentApp'
#> Warning: replacing previous import 'shiny::runExample' by 'shinyjs::runExample'
#> when loading 'BEAInfrastructureInvestmentApp'
#> Warning: replacing previous import 'shinyWidgets::alert' by 'shinyjs::alert'
#> when loading 'BEAInfrastructureInvestmentApp'
## run the app
BEAInfrastructureInvestmentApp::run_app()
#> Loading required package: shiny
#> 
#> Listening on http://127.0.0.1:5840
#> Warning: Transformation introduced infinite values in continuous y-axis
```

<img src="man/figures/README-example-1.png" width="100%" />
