\name{random.function}
\alias{random.function}

\title{
Random Draw Generator
}
\description{
This function generates random draws of a continuous random variable
given either its density or its cumulative distribution function.
}
\usage{
random.function(n = 1, f, lower = -Inf, upper = Inf, kind = "density")
}

\arguments{
  \item{n}{number of draws, default 1.}
  \item{f}{either a density (default) or cumulative distribution function of the random variable.}
  \item{lower}{lower limit of the support of the random variable, default -Inf.}
  \item{upper}{upper limit of the support of the random variable, default Inf.}
  \item{kind}{character string with the function used to identify the distribution,
   either "density" (default) or "cumulative", as alternative.}
}
\details{
\code{random.function} uses the method of the inverse of the cdf to generate random draws from \code{f}.
}
\value{
A vector of length \code{n} with \code{n} draws from a random variable with density (or
cumulative distribution) function given by \code{f}.
}

\author{
Jose M. Pavia
}

\note{
\code{random.function} is called by \code{dgeometric.test} when the corresponding r-
 function (random generator of \code{f}) is not available in the environment. \code{random.function}
 generates random samples from the null hypothesis density function specified in \code{dgeometric.test}.
}

\seealso{
\code{\link{dgeometric.test}}, \code{\link{integrate}}, \code{\link{inverse}} and \code{\link{support.facto}}.
}
\examples{
f0 <- function(x) ifelse(x>=0 & x<=1, 2-2*x, 0)
random.function(10, f0, lower=0, upper=1, kind="density")
}