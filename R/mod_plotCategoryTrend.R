#' plotCategoryTrend UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_plotCategoryTrend_ui <- function(id){
  ns <- NS(id)
  tagList(



  )
}

#' plotCategoryTrend Server Functions
#'
#' @noRd
mod_plotCategoryTrend_server <- function(id, df, y_axis_var){
  moduleServer( id, function(input, output, session){
    ns <- session$ns



  })
}

## To be copied in the UI
# mod_plotCategoryTrend_ui("plotCategoryTrend_1")

## To be copied in the server
# mod_plotCategoryTrend_server("plotCategoryTrend_1")
