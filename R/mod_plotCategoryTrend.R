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
      inputId = ns("Id003"),
      label = "Variable Type",
      choices = c("Gross Investment", "Gross Investment Per capita"),
      selected = "Gross Investment",
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
      group_split(df, meta_cat) %>%
        map(~ plt_category(.))
    })

    output$plts_ui <- renderUI({
      exec(tagList, !!!imap(plt_gg(), ~ plotOutput(ns(paste0("plt_", .y)))))
    })

    observeEvent(plt_gg(), {
      iwalk(plt_gg(), ~ {
        output[[paste0("plt_", .y)]] <<- renderPlot({
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
