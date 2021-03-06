#'get plate layout
#'
#'@param well_scores well scores data.frame as output by read_well_scores()
#'@param week week identifier (1-based integer)
#'@param plate plate index (1-based index)
#'@return Table with row and columns as on the plate
#'        with cell values 'compound_id|log_dose'
#'        
#'@export
plate_layout <- function(well_scores, week, plate){
  selected_week <- week
  selected_plate <- plate
  well_scores %>%
    dplyr::filter(week == selected_week, plate==selected_plate) %>%
    dplyr::mutate(well_name = paste0(compound, "|", log_dose)) %>%
    dplyr::arrange(row, column) %>%
    tidyr::pivot_wider(
      id_cols="row",
      names_from="column",
      values_from="well_name")
}
