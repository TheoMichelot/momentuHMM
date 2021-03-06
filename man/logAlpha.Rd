% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/logAlpha.R
\name{logAlpha}
\alias{logAlpha}
\title{Forward log-probabilities}
\usage{
logAlpha(m)
}
\arguments{
\item{m}{A \code{\link{momentuHMM}}, \code{\link{miHMM}}, or \code{\link{miSum}} object.}
}
\value{
The matrix of forward log-probabilities.
}
\description{
Used in \code{\link{stateProbs}} and \code{\link{pseudoRes}}.
}
\examples{
\dontrun{
# m is a momentuHMM object (as returned by fitHMM), automatically loaded with the package
m <- example$m

la <- momentuHMM:::logAlpha(m)
}
}
