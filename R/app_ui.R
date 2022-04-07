#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(
      theme = shinytheme("paper"),
      h1("BEAInfrastructureInvestmentApp"),
      tabsetPanel(
        id = "main_nav_panel",
        tabPanel(
          "Total Infrastructure",
          fluidRow_two_plots("total_inf", "total_inf_sector"),
        ),
        tabPanel(
          "Basic",
          fluidRow_two_plots("total_basic_inf_type", "total_inf_basic_sector")
        ),
        tabPanel(
          "Social",
          exec(tagList, !!!map(paste0("social", 1:5), ~ plotOutput(.x)))
        ),
        tabPanel("Explore Data", mod_categoryTrend_ui("categoryTrend_1"))
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "BEAInfrastructureInvestmentApp"
    ),
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
    shinyjs::useShinyjs()
  )
}
