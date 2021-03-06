
#' plot cell count by batch variables as a density plot
#' 
#' For each batch variable, show a facet panel with sqrt(cell_count) by batch variable
#'
#' Modeling the cell count as a poisson random variable, taking the square root makes the
#' distribution more normal.
#' 
#'   N.A. Thacker and P.A. Bromiley, The Effects of a Square Root Transform on a Poisson Distributed Quantity
#'   Statistics and Segmentation Series, 2001-010, updated 2009, http://tina.wiau.man.ac.uk/tina-knoppix/tina-memo/2001-010.pdf
#' 
#'@param well_scores tibble::tibble as output by read_well_scores
#'@param subtitle plot subtitle, typically the study identifier
#'@return ggplot2 object with the lattice plot with a panel for each batch variable
#' 
#'@export 
plot_cell_count_by_batch_vars_density <- function(well_scores, subtitle=NULL){
  data <- well_scores %>%
    dplyr::filter(!is_control) %>%
    dplyr::select(
      week, plate, row,           # batch variables
      cell_count) %>%             # response value
    tidyr::pivot_longer(
      cols=c("week", "plate", "row"),
      names_to="batch_variable",
      values_to="batch_value")
  
  p <- ggplot2::ggplot(data=data) +
    ggplot2::theme_bw() +
    ggplot2::geom_density(
      mapping=ggplot2::aes(
        x=sqrt(cell_count),
        color=batch_value,
        group=batch_value)) +
    ggplot2::facet_wrap(
      facets=ggplot2::vars(batch_variable)) +
    ggplot2::scale_x_continuous(
      "Well Cell Count",
      breaks=c(0,10,20,30,40),
      labels=c(0,100,400,900,1600)) +
    ggplot2::scale_y_continuous("Density") +
    ggplot2::scale_color_continuous("Batch Value") +
    ggplot2::ggtitle(
      label="Well Cell Count by Batch Variables",
      subtitle=subtitle) +
    ggplot2::theme(
      legend.position=c(.84,1.13),
      legend.direction="horizontal",
      legend.margin=ggplot2::margin(t=0,r=0,b=0,l=0),
      legend.box.background=ggplot2::element_blank())
}