% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit_drc_score_by_dose.R
\name{fit_drc_score_by_dose}
\alias{fit_drc_score_by_dose}
\title{DRC 4-param dose response fits with bottom fixed = 0}
\usage{
fit_drc_score_by_dose(well_scores)
}
\arguments{
\item{well_scores}{tibble::tibble as output by read_well_scores}
}
\value{
data.frame with information about fits
}
\description{
Use the R drc package to fit dose response data
}
\details{
The model that is fit is the 4-parameter sigmoid with bottom fixed at 0.
To fit the curve, drc uses weighted least squares. Assuming errors are not
correlated the BLUE has weight w_i = 1/V_i, where V_i is the variance of the
bayesian probability positive estimator using a prior of Beta(10,10)
and then normalized so each replica has on average weight 1.
}
