plotly_modal <- function() {
  modalDialog(
    tagList(
      plotlyOutput("modal_plotly")
    ),
    title = "Interactive Plot",
    footer = tagList(
      actionButton('close_mod', "Close")
    ),
    size = 'l'
  )
}
