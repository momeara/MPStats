% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/util.R
\name{poisson_quantile}
\alias{poisson_quantile}
\title{Quantile of bayesian estimators for samples of a poisson process}
\usage{
poisson_quantile(count, p)
}
\arguments{
\item{count}{vector of n counts, assumed to be samples from a poisson process}

\item{probability}{quantile to return}
}
\value{
count value of the given quantile of the posterior estimator for the poisson process
}
\description{
The gamma distribution is the congugate prior for the poisson distribution. Given a prior `Gamma(k,theta)``,
and poisson observations `k_1, k_2, ..., k_n`, the bayesian estimator for the posterior is
}
\details{
Gamma(k + sum k_i, n + theta)

So the prior can be thought of as adding `theta` pseudo observations each with a count value of `k/theta`.

Example:

    Say we have collected a sample of 3 counts with values `counts <- c(120, 130, 125)`
    then the 95% credible interval for the rate poisson rate parameter is

         low <- poisson_quantile(counts, .025)
         high <- poisson_quantile(counts, .975)

    Now say we have a prior equivilent to a single count with 124, then we would add 124 to the counts vector:

           counts <- c(120, 130, 125) + c(124)
           low <- poisson_quantile(counts, .025)
           high <- poisson_quantile(counts, .975)
}
