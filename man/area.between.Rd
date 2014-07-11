\name{area.between}
\alias{area.between}
\title{Area between a Density Function and a Kernel Estimate}
\description{
The function \code{area.between} is an (internal) function of the \code{GoFKernel} package that calculates the area,
in a given interval, between a theoretical density function and an empirical
kernel estimate. \code{area.between} is called by \code{dgeometric.test} of the \code{GoFKernel} package.
}
\usage{
area.between(f, kernel.density, lower = -Inf, upper = Inf)
}
\arguments{
  \item{f}{a density function.}
  \item{kernel.density}{an empirical kernel estimate, an object of the class \code{density}.}
  \item{lower}{lower limit of the support of f, default -Inf.}
  \item{upper}{upper limit of the support of f, default Inf.}
}
\details{\code{area.between} is called by \code{dgeometric.test} and numerically calculates
the area between the density function of the null hypothesis and the kernel density estimate
of either the observed sample or a simulated sample from \code{f}.}
\value{A number corresponding to the numerical value of the area between a density function and
a kernel estimate.}
\author{
Jose M. Pavia
}

\seealso{
\code{\link{density.reflected}}, \code{\link{dgeometric.test}}, \code{\link{inverse}}
\code{\link{random.function}}, \code{\link{support.facto}} and
\code{\link[stats]{density}}
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