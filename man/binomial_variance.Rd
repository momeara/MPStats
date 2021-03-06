% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/util.R
\name{binomial_variance}
\alias{binomial_variance}
\title{Variance of Bayesian estimator for binomial trial with flat prior}
\usage{
binomial_variance(n_positive, n_trials, prior_positive = 1, prior_negative = 1)
}
\arguments{
\item{n_positive}{number of successes in binomial trial}

\item{n_trials}{number of binomial trials}

\item{prior_positive}{number of pseudo successes to add as prior}

\item{prior_negative}{number of pseudo failures to add as prior}
}
\value{
variance of parameter estimate
}
\description{
The Bayesian estimator for the success probability p from a binomial trial
with n successes and m failures and beta prior with rate parameters a and b is
   posterior ~ prior * likelihood
   posterior ~ Beta(a,b) * Binomial(n, m+n)
   posterior ~ p^(a-1) * (1-p)^(b-1) * p^n * (1-p)^m
   posterior ~ p^(n+a-1) * (1-p)^(m+b-1)
   posterior ~ Beta(n+a,m+b)
}
\details{
A flat prior is a Beta(a=1, b=1), so the estimate of the posterior distribution
for p is Beta(n+1, m+1). One way to think of this is that since the beta distribution is
the congugate prior to the binomial distribution, the flat prior effectively adds one
pseudo positive count and one pseudo negative count to the observation.

The variance of a Beta distribution is

   var[Beta(a,b)] = a*b/((a+b)^2(a+b+1))

so the variance of the posteriror is

   var[posterior] = var[Beta(n+1,m+1)] = (n+1)(m+1)/((n+m+2)^2 * (n+m+3))

Ref: https://stats.stackexchange.com/questions/185221/binomial-uniform-prior-bayesian-statistics
}
