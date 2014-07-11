\name{density.reflected}
\alias{density}
\alias{density.reflected}

\title{
Kernel Density Estimation with Reflection
}
\description{
The function \code{density.reflected} computes kernel density estimates for univariate observations using reflection in the borders.

}
\usage{
\method{density}{reflected}(x, lower = -Inf, upper = Inf, ...)
}
\arguments{
  \item{x}{a numeric vector of data from which the estimate is to be computed.}
  \item{lower}{the lower limit of the interval to which x theoretically constrained, default -Inf.}
  \item{upper}{the upper limit of the interval to which x theoretically constrained, default, Inf.}
  \item{\dots}{further \code{density} arguments.}
}
\details{
\code{density.reflected} is called by \code{dgeometric.test} and computes the density
kernel estimate of a univariate random sample \code{x} of a random variable defined in
the interval \code{(lower,upper)} using the default options of \code{density} and reflection in the borders.
This avoids the density kernel estimate being underestimated in the proximity of \code{lower} or \code{upper}.
For unbounded variables, \code{density.reflected} generates the same output as \code{density} with its default options.}

\value{
An object of the class \code{density} with borders correction, whose underlying structure
is a list containing the following components.

  \item{x}{the \code{n} coordinates of the points where the density is estimated.}
  \item{y}{the estimated density values. These will be non-negative.}
  \item{bw}{the bandwidth used.}
  \item{n}{the sample size after elimination of missing values.}
  \item{call}{the call which produced the result.}
  \item{data.name}{the deparsed name of the \code{x} argument.}
  \item{has.na}{logical, for compatibility (always \code{FALSE}).}

The \code{print} method reports \code{\link{summary}} values on the \code{x} and \code{y} components.

}
\references{
Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) "The New S Language." Wadsworth & Brooks/Cole (for S version).

Scott, D. W. (1992) "Multivariate Density Estimation. Theory, Practice and Visualization." New York: Wiley.

Sheather, S. J. and Jones M. C. (1991) "A reliable data-based bandwidth selection method for kernel density estimation." J. Roy. Statist. Soc. B, 683--690.

Silverman, B. W. (1986) "Density Estimation." London: Chapman and Hall.

Venables, W. N. and Ripley, B. D. (2002) "Modern Applied Statistics with S." New York: Springer.


}
\author{
Jose M. Pavia
}
\note{
The function is based on \code{\link{density}}.
}

\seealso{
\code{\link{dgeometric.test}} and \code{\link{density}}
}
\examples{
set.seed(234)
x <- runif(2000)
dx <- density.reflected(x,0,1)

## Plot of the density estimate with and without reflection
par(mfcol=c(1,2))
plot(dx, xlim=c(-0.1,1.1), ylim=c(0,1.1))
abline(h=1, col="red")

plot(density(x), xlim=c(-0.1,1.1), ylim=c(0,1.1))
abline(h=1, col="blue")
}
\keyword{ density }

