\name{density.reflected}
\alias{density.reflected}

\title{
Kernel Density Estimation with Reflection
}
\description{
Function to compute from a random sample of data in an interval
a kernel estimate using reflection in the borders.
}
\usage{
\method{density}{reflected}(x, lower = -Inf, upper = Inf, \dots)
}
\arguments{
  \item{x}{a numeric vector of data values.}
  \item{lower}{the lower limit of the interval to which x theoretically belongs to.}
  \item{upper}{the upper limit of the interval to which x theoretically belongs to.}
  \item{...}{further arguments for (non-default) methods.}
}
\details{
\code{density.reflected} is called by \code{\link{dgeometric.test}} and computes the density
kernel estimate of a univariate random sample \code{x} of a random variable defined in
the interval \code{(lower,upper)} using the default options of \code{density} using reflection in the borders
to avoid underestimation in the proximity of \code{lower} or \code{upper}. For unbounded variables,
\code{density.reflected} generates the same output of \code{density} with its default options.
It is for internal use.
}
\value{
An object of the class \code{density} with borders correction, whose underlying structure
is a list containing the following components.

  \item{x}{the \code{n} coordinates of the points where the density is estimated.}
  \item{y}{the estimated density values. These will be non-negative.}
  \item{bw}{the bandwidth used.}
  \item{n}{the sample size after elimination of missing values.}
  \item{call}{the sample size after elimination of missing values.}
  \item{data.name}{the deparsed name of the \code{x} argument.}
  \item{has.na}{logical, for compatibility (always \code{FALSE}).}

The \code{print} method reports \href{http://stat.ethz.ch/R-manual/R-patched/library/base/html/summary.html}{summary}
values on the x and y components.

}
\references{
Silverman, B. W. (1986) \emph{Density Estimation for Statistics and Data Analysis}, Chapman and Hall, London.
}
\author{
Jose M. Pavia
}
\note{
The function is based on \href{http://stat.ethz.ch/R-manual/R-patched/library/stats/html/density.html}{density}.
}

\seealso{
\code{\link{dgeometric.test}} and \href{http://stat.ethz.ch/R-manual/R-patched/library/stats/html/density.html}{density}
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

