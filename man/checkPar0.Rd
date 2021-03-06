% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/checkPar0.R
\name{checkPar0}
\alias{checkPar0}
\title{Check parameter length and order for a \code{\link{fitHMM}} (or \code{\link{MIfitHMM}}) model}
\usage{
checkPar0(data, nbStates, dist, Par0 = NULL, beta0 = NULL, delta0 = NULL,
  estAngleMean = NULL, circularAngleMean = NULL, formula = ~1,
  formulaDelta = NULL, stationary = FALSE, DM = NULL, cons = NULL,
  userBounds = NULL, workBounds = NULL, workcons = NULL,
  betaCons = NULL, betaRef = NULL, stateNames = NULL, fixPar = NULL)
}
\arguments{
\item{data}{\code{\link{momentuHMMData}} object or a data frame containing the data stream and covariate values}

\item{nbStates}{Number of states of the HMM.}

\item{dist}{A named list indicating the probability distributions of the data streams.}

\item{Par0}{Optional named list containing vectors of state-dependent probability distribution parameters for 
each data stream specified in \code{dist}.  If \code{Par0} is not provided, then ordered parameter indices are returned.}

\item{beta0}{Optional matrix of regression coefficients for the transition probabilities. If \code{beta0} is not provided, then ordered parameter indices are returned.}

\item{delta0}{Optional values or regression coefficients for the initial distribution of the HMM. If \code{delta0} is not provided, then ordered parameter indices are returned.}

\item{estAngleMean}{An optional named list indicating whether or not to estimate the angle mean for data streams with angular 
distributions ('vm' and 'wrpcauchy').}

\item{circularAngleMean}{An optional named list indicating whether to use circular-linear (FALSE) or circular-circular (TRUE) 
regression on the mean of circular distributions ('vm' and 'wrpcauchy') for turning angles.}

\item{formula}{Regression formula for the transition probability covariates.}

\item{formulaDelta}{Regression formula for the initial distribution.}

\item{stationary}{\code{FALSE} if there are covariates in \code{formula} or \code{formulaDelta}. If \code{TRUE}, the initial distribution is considered
equal to the stationary distribution. Default: \code{FALSE}.}

\item{DM}{An optional named list indicating the design matrices to be used for the probability distribution parameters of each data 
stream.}

\item{cons}{Deprecated: please use \code{workBounds} instead. An optional named list of vectors specifying a power to raise parameters corresponding to each column of the design matrix 
for each data stream.}

\item{userBounds}{An optional named list of 2-column matrices specifying bounds on the natural (i.e, real) scale of the probability 
distribution parameters for each data stream.}

\item{workBounds}{An optional named list of 2-column matrices specifying bounds on the working scale of the probability distribution, transition probability, and initial distribution parameters.}

\item{workcons}{Deprecated: please use \code{workBounds} instead. An optional named list of vectors specifying constants to add to the regression coefficients on the working scale for 
each data stream.}

\item{betaCons}{Matrix of the same dimension as \code{beta0} composed of integers identifying any equality constraints among the t.p.m. parameters.}

\item{betaRef}{Numeric vector of length \code{nbStates} indicating the reference elements for the t.p.m. multinomial logit link.}

\item{stateNames}{Optional character vector of length nbStates indicating state names.}

\item{fixPar}{An optional list of vectors indicating parameters which are assumed known prior to fitting the model.}
}
\description{
Prints parameters with labels based on \code{DM}, \code{formula}, and/or \code{formulaDelta}.  See \code{\link{fitHMM}} for 
further argument details.
}
\examples{
m <- example$m
checkPar0(data=m$data, nbStates=2, dist=m$conditions$dist,
          estAngleMean = m$conditions$estAngleMean,
          formula = m$conditions$formula)

par <- getPar(m)
checkPar0(data=m$data, nbStates=2, dist=m$conditions$dist,
          estAngleMean = m$conditions$estAngleMean,
          formula = m$conditions$formula,
          Par0=par$Par, beta0=par$beta, delta0=par$delta)
          
dummyDat <- data.frame(step=0,angle=0,cov1=0,cov2=0)
checkPar0(data=dummyDat, nbStates=2, dist=m$conditions$dist,
          estAngleMean = m$conditions$estAngleMean,
          formula = m$conditions$formula)

\dontrun{
simDat <- simData(nbStates=2, dist=m$conditions$dist, Par = par$Par,
                  spatialCovs = list(forest=forest),
                  centers = matrix(0,1,2),
                  nbCovs = 2)
checkPar0(data = simDat, nbStates=2, dist=m$conditions$dist,
          formula = ~forest,
          DM = list(step=list(mean=~cov1, sd=~cov2),
                    angle=list(mean=~center1.angle,concentration=~1)),
          estAngleMean=list(angle=TRUE),
          circularAngleMean=list(angle=TRUE))
          
par <- list(step=rnorm(8),angle=rnorm(4))
beta0 <- matrix(rnorm(4),2,2)
delta0 <- c(0.5,0.5)
checkPar0(data = simDat, nbStates=2, dist=m$conditions$dist,
          Par0 = par, beta0 = beta0, delta0 = delta0,
          formula = ~forest,
          DM = list(step=list(mean=~cov1, sd=~cov2),
                    angle=list(mean=~center1.angle,concentration=~1)),
          estAngleMean=list(angle=TRUE),
          circularAngleMean=list(angle=TRUE))                
}
}
\seealso{
\code{\link{fitHMM}}, \code{\link{MIfitHMM}}
}
