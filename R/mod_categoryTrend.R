#' categoryTrend UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @import shinyWidgets
#'
#' @importFrom shiny NS tagList
mod_categoryTrend_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      column(
        width = 10, offset = 1,
        tags$h3(""),
        panel(
          pickerGroupUI(
            id = ns("categories"),
            params = list(
              category = list(inputId = "category", label = "Category:"),
              meta_cat = list(inputId = "meta_cat", label = "Meta Category:"),
              group_num = list(inputId = 'group_num', label = 'Group number:')
            )
          ),
          status = "primary"
        ),
        actionButton('use_data', 'Use this data'),
        DT::DTOutput(outputId = ns("table"))
      )
    )
  )
}

#' categoryTrend Server Functions
#'
#' @noRd
mod_categoryTrend_server <- function(id, df) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    res_mod <- callModule(
      module = pickerGroupServer,
      id = "categories",
      data = df,
      vars = c("category", "meta_cat", 'group_num')
    )

    output$table <- DT::renderDT(res_mod(), rownames = FALSE)

    res_mod

  })
}

## To be copied in the UI
# mod_categoryTrend_ui("categoryTrend_1")

## To be copied in the server
# mod_categoryTrend_server("categoryTrend_1")
