fluidRow_two_plots <- function(name1, name2) {

  fluidRow(
    column(width = 6,
           withSpinner(plotOutput(name1))),
    column(width = 6,
          withSpinner(plotOutput(name2)))
  )

}
