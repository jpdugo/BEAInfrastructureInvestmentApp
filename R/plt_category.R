#' Plot trends grouped by category
#'
#' @param df dataframe containing bea variables
#' @import ggplot2
#' @importFrom rlang .data
#' @return ggplot
#'
plt_category <- function(df) {
  df %>%
    {
      ggplot(., aes(x = .data$year, y = .data$gross_inv_chain, color = .data$category)) +
        geom_line(alpha = .8, size = 1.1) +
        theme_minimal() +
        theme(legend.position = "top") +
        ylab("Gross investment (chained 2021 dollars) in millions of USD") +
        ggtitle(unique(.$meta_cat)) +
        # scale_y_continuous(labels = label_number(suffix = " K", scale = 1e-3)) +
        scale_x_continuous(breaks = seq(1947, 2017, 3)) +
        theme(axis.text.x = element_text(size = 8, angle = 45)) +
        scale_y_log10(labels = scales::label_number(suffix = " K", scale = 1e-3))
    }
}

#' Plot trends grouped by category and choose the y axis variable.
#'
#' @param df dataframe containing bea variables
#' @param var_name either gross_inv_per_cap or gross_inv_chain
#' @import ggplot2
#' @return ggplot object
plt_category_pop <- function(df, var_name) {
  df %>%
    {
      ggplot(., aes(x = .data$year, y = .data[[var_name]], color = .data$category)) +
        geom_line(alpha = .8, size = .8) +
        theme_minimal() +
        theme(legend.position = "top") +
        ylab("Gross investment chained") +
        ggtitle(unique(.$meta_cat)) +
        # scale_y_continuous(labels = label_number(suffix = " K", scale = 1e-3)) +
        scale_x_continuous(breaks = seq(1947, 2017, 3)) +
        theme(axis.text.x = element_text(size = 8, angle = 45))
      # scale_y_log10(labels = scales::label_number(suffix = " K", scale = 1e-3))
    }
}
