#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import dplyr
#'
#' @importFrom purrr walk2
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic


  # FIRST TABS --------------------------------------------------------------



  data_by_groups <- chain_investment %>%
    group_split(group_num)

  # store interactive plots for a modalDialog
  interactive_plots <- reactiveValues()


  walk2(
    .x = c("total_inf", "total_inf_sector", "total_basic_inf_type", "total_inf_basic_sector", paste0("social", 1:5)),
    .y = data_by_groups[c(1:4, 15:19)],
    ~ {
      plt <- .y %>% plt_category()

      observe({
        interactive_plots[[.x]] <- plt %>% plotly::ggplotly()
        #permite reproducir un plotly adentro de un modal cuando se hace click en el grafico.
        shinyjs::onclick(.x, expr = {
          showModal(plotly_modal())
          output$modal_plotly <- plotly::renderPlotly({
            interactive_plots[[.x]] %>%
              plotly::layout(showlegend = FALSE)
          })
        })
      })

      output[[.x]] <<- renderPlot({
        plt
      })
    }
  ) #end of walk2

  observeEvent(input$close_mod, {
    removeModal()
  })

  # EXPLORE DATA TAB --------------------------------------------------------

  ## population data from https://data.worldbank.org/indicator/SP.POP.TOTL?locations=US

  us_population_1960_2017 <- us_population_1960_2017 %>%
    mutate(year = as.numeric(year))

  chain_investment_per_cap <- chain_investment %>%
    right_join(us_population_1960_2017, by = "year") %>%
    mutate(gross_inv_per_cap = (gross_inv_chain * 1e6) / pop)


  mod_categoryTrend_server("categoryTrend_1", chain_investment_per_cap)
}
