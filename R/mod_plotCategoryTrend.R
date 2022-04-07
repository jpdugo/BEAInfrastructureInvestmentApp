#' plotCategoryTrend UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_plotCategoryTrend_ui <- function(id) {
  ns <- NS(id)
  tagList(
    awesomeRadio(
      inputId = ns("choose_var"),
      label = "Chioose y axis variable",
      choices = c("gross_inv_chain", "gross_inv_per_cap"),
      selected = "gross_inv_chain",
      status = "warning"
    ),
    uiOutput(ns("plts_ui"))
  )
}

#' plotCategoryTrend Server Functions
#'
#' @noRd
mod_plotCategoryTrend_server <- function(id, df) {
  # stopifnot(is.reactive(df))

  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    # si hay multiples valores en meta_cat dentro del df, entonces se hace split para poder usar la
    # funcion plt_category()
    plt_gg <- reactive({
      req(input$choose_var)
      group_split(df, meta_cat) %>%
        map(~ ggplotly(plt_category_pop(., input$choose_var)))
    })

    output$plts_ui <- renderUI({
      exec(tagList, !!!imap(plt_gg(), ~ plotlyOutput(ns(paste0("plt_", .y)))))
    })

    observeEvent(plt_gg(), {
      iwalk(plt_gg(), ~ {
        output[[paste0("plt_", .y)]] <<- renderPlotly({
          .x
        })
      })
    })
  })
}

## To be copied in the UI
# mod_plotCategoryTrend_ui("plotCategoryTrend_1")

## To be copied in the server
# mod_plotCategoryTrend_server("plotCategoryTrend_1")
