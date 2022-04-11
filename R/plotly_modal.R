#' Create modalDialog with a plotlyOutput
#'
#' A modalDialog containing one plot and a button to close it.
#'
#' @import shiny
#' @export
#'
plotly_modal <- function() {
  modalDialog(
    tagList(
      plotly::plotlyOutput("modal_plotly")
    ),
    title = "Interactive Plot",
    footer = tagList(
      actionButton("close_mod", "Close")
    ),
    size = "l"
  )
}
