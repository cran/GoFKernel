\name{inverse}
\alias{inverse}

\title{Inverse CDF Function}
\description{Function to calculate the inverse function of a cumulative distribution function.}
\usage{inverse(f, lower = -Inf, upper = Inf)}
\arguments{
  \item{f}{a cdf function for which we want to obtain its inverse}
  \item{lower}{the lower limit of \code{f} domain (support of the random variable), default -Inf.}
  \item{upper}{the upper limit of \code{f} domain (support of the random variable), default Inf.}
}
\details{
\code{inverse} is called by \code{\link{random.function}} and calculates de inverse of a given
function \code{f}. \code{inverse} has been especifically designed to compute the inverse
of the cumulative distribution function of an absolutely continuous random variable, therefore
it assummes there is only a root for each value in the interval (0,1) between \code{f(lower)}
and \code{f(upper)}. It is for internal use in \code{\link{dgeometric.test}}.
}
\value{
A function, the inverse function of a cumulative distribution function \code{f}.
}
\references{
See the references in \href{http://stat.ethz.ch/R-manual/R-devel/library/stats/html/optim.html}{optim}
and \href{http://stat.ethz.ch/R-manual/R-patched/library/stats/html/uniroot.html}{uniroot}.
}
\author{
Jose M. Pavia
}
\note{
This function uses either \href{http://stat.ethz.ch/R-manual/R-devel/library/stats/html/optim.html}{optim}
with default options \code{method="L-BFGS-B"} or
\href{http://stat.ethz.ch/R-manual/R-patched/library/stats/html/uniroot.html}{uniroot}
to derive the inverse function.

The upper endpoint must be strictly larger than the lower endpoint.
}

\seealso{
\code{\link{dgeometric.test}},  \href{http://stat.ethz.ch/R-manual/R-patched/library/stats/html/integrate.html}{integrate},
 \href{http://stat.ethz.ch/R-manual/R-devel/library/stats/html/optim.html}{optim},  \code{\link{random.function}},
 \code{\link{support.facto}}  and  \href{http://stat.ethz.ch/R-manual/R-patched/library/stats/html/uniroot.html}{uniroot}.
}

\examples{
f <- function(x) pbeta(x, shape1=2, shape2=3)
f.inv<-inverse(f,lower=0,upper=1)
f.inv(.2)
}
