#' Plot dose-response checkerboard
#' 
#' @param treatment_scores data.frame with columns [dose1, dose2, score]
#' @param treatment_1_label used to make default title and axis labels
#' @param treatment_2_label used to make default title and axis labels
#' @param treatment_1_units used to make default axis labels
#' @param treatment_2_units used to make default axis labels
#' @param plot_zero_dose plotted on the log scale, zero doses would be
#'     at -Inf, so to show them on the plot, add them as with a slight
#'     separation on the axis.
#' @param contour_color default 'gold'
#'
#' @return ggplot2 plot with ligt-blue to dark-blue tiles the dose
#'     response. Individual plot elemenecs can be over-written and the
#'     plot can be saved with ggplot2::ggsave()
#' 
#' @export
plot_checkerboard_score_by_dose <- function(
    treatment_scores,
    treatment_1_label,
    treatment_2_label,
    treatment_1_units,
    treatment_2_units,
    plot_zero_dose = TRUE,
    contour_color = "gold") {
    d1 <- d1_label <- treatment_scores$dose1 %>% unique() %>% sort()
    d2 <- d2_label <- treatment_scores$dose2 %>% unique() %>% sort()
    if (plot_zero_dose) {
        if (d1[1] == 0) {
            d1[1] <- 10 ^ (log10(d1[2]) - 1.05 * (log10(d1[3]) - log10(d1[2])))
            treatment_scores <- treatment_scores %>%
                dplyr::mutate(dose1 = ifelse(dose1 != 0, dose1, d1[1]))
        }
        if (d2[1] == 0) {
            d2[1] <- 10 ^ (log10(d2[2]) - 1.05 * (log10(d2[3]) - log10(d2[2])))
            treatment_scores <- treatment_scores %>%
                dplyr::mutate(dose2 = ifelse(dose2 != 0, dose2, d2[1]))
        }
    }
  ggplot2::ggplot(data = treatment_scores) +
    ggplot2::theme_bw() +
    ggplot2::theme(
      legend.position = "bottom",
      panel.grid = element_blank(),
      panel.background =
          ggplot2::element_rect(fill = "grey40", colour = "grey40")) +
    ggplot2::geom_tile(
      mapping = ggplot2::aes(
        x = log10(dose1),
        y = log10(dose2),
        fill = score)) +
    ggplot2::geom_contour(
      mapping = ggplot2::aes(
        x = log10(dose1),
        y = log10(dose2),
        z = score),
      color = contour_color) +
      ggplot2::coord_fixed() +
      ggplot2::ggtitle(paste0("Drug Combo: ", treatment_1_label, " vs. ", treatment_2_label)) +
      ggplot2::scale_x_continuous(
          paste(treatment_1_label, treatment_1_units),
          breaks = log10(d1),
          labels = signif(d1_label, 3),
          expand = c(0, 0)) +
      ggplot2::scale_y_continuous(
          paste(treatment_2_label, treatment_2_units),
          breaks = log10(d2),
          labels = signif(d2_label, 3),
          expand = c(0, 0)) +
      viridis::scale_fill_viridis(
          "Response",
          option = "cividis",
          guide = guide_colorbar(reverse = TRUE))
}
