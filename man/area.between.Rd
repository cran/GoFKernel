\name{area.between}
\alias{area.between}
\title{Area between a Density Function and a Kernel Estimate}
\description{
\code{area.between} calculates the area entre between a theoretical density and a kernel empirical
estimate in a given interval. \code{area.between} is called by \code{dgeometric.test}
defined in the \code{GoFKernel} package.
}
\usage{
area.between(f, kernel.density, lower = -Inf, upper = Inf)
}
\arguments{
  \item{f}{A density function.}
  \item{kernel.density}{A empirical kernel estimate, an object of the class \code{density}.}
  \item{lower}{Lower limit of the support of \code{f}, default -Inf.}
  \item{upper}{Upper limit of the support of \code{f}, default Inf.}
}
\details{\code{area.between} is called by \code{dgeometric.test} and numerically calculates
the area between the density function of the null hypothesis and the kernel density estimate
of either the observed sample or an actual sample from \code{f} in \code{\link{dgeometric.test}}.}
\value{A number with the numerical value of the area between the density function and
the kernel estimate.}
\author{
Jose M. Pavia
}

\seealso{
\code{\link{density.reflected}},  \code{\link{dgeometric.test}},  \code{\link{inverse}},
\code{\link{random.function}},  \code{\link{support.facto}}  and
\href{http://stat.ethz.ch/R-manual/R-patched/library/stats/html/density.html}{density}
}
\examples{
## Unbounded example
x <- rnorm(100)
dx <- density(x)
area.between(dnorm, dx)

## Bounded example
x <- rbeta(100, 1.3, 2)
dx <- density.reflected(x, lower=0, upper=1)
area.between(dunif, dx)
}
\keyword{ density }