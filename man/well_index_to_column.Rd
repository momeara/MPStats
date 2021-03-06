% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/util.R
\name{well_index_to_column}
\alias{well_index_to_column}
\title{Extract column index from well index}
\usage{
well_index_to_column(well_index)
}
\arguments{
\item{well_index}{well index of the form e.g. '224'}
}
\value{
integer index corresponding to the column of the well
}
\description{
Convert e.g. '224' well index to 8 because it is on the 8th column in a 384 well plate
}
