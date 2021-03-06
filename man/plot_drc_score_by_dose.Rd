% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_drc_score_by_dose.R
\name{plot_drc_score_by_dose}
\alias{plot_drc_score_by_dose}
\title{Plot the score as a function of compound dose}
\usage{
plot_drc_score_by_dose(well_scores, fits, subtitle = NULL)
}
\arguments{
\item{well_scores}{tibble::tibble as output by read_well_scores}

\item{fits}{tibble::tibble as output by fit_drc_score_by_dose}

\item{subtitle}{string subtitle for plot}
}
\value{
ggplot2 plot
}
\description{
For each compound plot a score by log_dose facet panel with
 *  the scores for each dose shown as the pooled score across replicates
 *  error bars as the standard deviation of the per-dose Bayesian uncertainty with a flat prior
 *  drc 4-parameter sigmoid with fixed to 0.
 *  labeled with the p-value of a constant-value fit
}
