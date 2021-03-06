% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit_brms_hill_score_by_dose.R
\name{fit_brms_npos_nneg_by_dose}
\alias{fit_brms_npos_nneg_by_dose}
\title{brms model for the counts of positive and negative cells by compound dose}
\usage{
fit_brms_npos_nneg_by_dose(well_scores)
}
\arguments{
\item{well_scores}{tibble::tibble as output by read_well_scores}
}
\value{
list of brms::brmsfit objects one for each compound
}
\description{
Use the R BRMS package to fit dose response data to with a multiple poisson model
}
\details{
W. Scott Comulada and Robert E. Weiss, On Models for Binomial Data with Random Numbers of Trials
Biometrics, 2007, 63(2): 610–617. doi:10.1111/j.1541-0420.2006.00722.x.
}
