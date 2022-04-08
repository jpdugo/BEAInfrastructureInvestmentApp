#' Create a fluidRow with two plotOutputs
#'
#' @param name1 left plotOutput id
#' @param name2 right plotOutout id
#'
#' @return fluidRow with two plots one near each other
#' @export
#'
#' @import shiny
#'
#' @examples
fluidRow_two_plots <- function(name1, name2) {

  fluidRow(
    column(width = 6,
           shinycssloaders::withSpinner(plotOutput(name1))),
    column(width = 6,
           shinycssloaders::withSpinner(plotOutput(name2)))
  )

}
