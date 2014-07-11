\name{inverse}
\alias{inverse}

\title{Inverse CDF Function}
\description{Function to calculate the inverse function of a cumulative distribution function.}
\usage{inverse(f, lower = -Inf, upper = Inf)}
\arguments{
  \item{f}{a cdf function for which we want to obtain its inverse.}
  \item{lower}{the lower limit of \code{f} domain (support of the random variable), default -Inf.}
  \item{upper}{the upper limit of \code{f} domain (support of the random variable), default Inf.}
}
\details{
\code{inverse} is called by \code{random.function} and calculates the inverse of a given
function \code{f}. \code{inverse} has been specifically designed to compute the inverse
of the cumulative distribution function of an absolutely continuous random variable, therefore
it assumes there is only a root for each value in the interval (0,1) between \code{f(lower)}
and \code{f(upper)}. It is for internal use in \code{\link{dgeometric.test}}.
}
\value{
A function, the inverse function of a cumulative distribution function \code{f}.
}
\references{
See the references in \code{\link[stats]{optim}} and \code{\link[stats]{uniroot}}.
}
\author{
Jose M. Pavia
}
\note{
This function uses either \code{\link[stats]{optim}} with default options \code{method="L-BFGS-B"} or \code{\link[stats]{uniroot}}
to derive the inverse function.

The upper endpoint must be strictly larger than the lower endpoint.
}

\seealso{
\code{\link{dgeometric.test}}, \code{\link[stats]{integrate}}, \code{\link[stats]{optim}}, \code{\link{random.function}},
\code{\link{support.facto}} and \code{\link[stats]{uniroot}}.
}

\examples{
f <- function(x) pbeta(x, shape1=2, shape2=3)
f.inv <- inverse(f,lower=0,upper=1)
f.inv(.2)
}

\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
