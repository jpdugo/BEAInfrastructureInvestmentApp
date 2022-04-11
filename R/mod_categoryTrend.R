#' categoryTrend UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @return taglist
#'
#' @import shiny
mod_categoryTrend_ui <- function(id) {
  ns <- NS(id)
  tagList(
    tabsetPanel(
      id = ns("explore_data_tabset"),
      tabPanel(
        title = "Explore Data",
        fluidRow(
          column(
            width = 10, offset = 1,
            tags$h3(""),
            shinyWidgets::panel(
              shinyWidgets::pickerGroupUI(
                id = ns("categories"),
                params = list(
                  category = list(inputId = "category", label = "Category:"),
                  meta_cat = list(inputId = "meta_cat", label = "Meta Category:"),
                  group_num = list(inputId = "group_num", label = "Group number:")
                )
              ),
              status = "primary"
            ),
            actionButton(ns("use_data"), "Use this data"),
            DT::DTOutput(outputId = ns("table"))
          )
        )
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
      module = shinyWidgets::pickerGroupServer,
      id = "categories",
      data = df,
      vars = c("category", "meta_cat", "group_num")
    )

    output$table <- DT::renderDT(res_mod(), rownames = FALSE)

    observeEvent(input$use_data, {

      # input$use_data lo estoy usando para que no se repitan los ids de los modulos.

      insertTab(
        inputId = "explore_data_tabset",
        tab = tabPanel(
          title = paste("Selected Data", input$use_data),
          mod_plotCategoryTrend_ui(ns(paste0("plotCategoryTrend_1", input$use_data)))
        ),
        target = "Explore Data", position = "after",
        select = TRUE, session = getDefaultReactiveDomain()
      )

      mod_plotCategoryTrend_server(paste0("plotCategoryTrend_1", input$use_data), isolate(res_mod()))
    })
  })
}

## To be copied in the UI
# mod_categoryTrend_ui("categoryTrend_1")

## To be copied in the server
# mod_categoryTrend_server("categoryTrend_1")
