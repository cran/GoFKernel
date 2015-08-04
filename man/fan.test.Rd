\name{fan.test}
\alias{fan.test}
\title{
Univariate implementation of the test of Fan (1994) in the form proposed by Li and Racine (2007).
}
\description{
Given a sample of a continuous univariate random variable and a density
function \code{fun.den} with support in the interval (\code{lower}, \code{upper})),
\code{fan.test} considers the test whose null hypothesis is that the sample has \code{fun.den} as density function
and the test statistic and the corresponding p-value of the test based on the integral of the squared difference between
the null hypothesis density function and a kernel smoothing approximation.
To properly run, the \code{KernSmooth} package needs to be
installed, as in its default option it depends on the \code{dpik} function to estimate the bandwidth.
}
\usage{
fan.test(x, fun.den, par = NULL, lower = -Inf, upper = Inf, kernel = "normal",
         bw=NULL)
}

\arguments{
  \item{x}{a numeric vector of data values for which the null hypothesis is tested.}
  \item{fun.den}{an actual density distribution function, such as \code{dnorm}. Only continuous
densities are valid.}
  \item{par}{list of (additional) parameters of the density function under the null hypothesis, default NULL.}
  \item{lower}{lower end point of the support of the random variable defined by \code{fun.den},
  default -Inf.}
  \item{upper}{upper end point of the support of the random variable defined by \code{fun.den},
  default -Inf.}
  \item{kernel}{a character string with the kernel to be used, either "normal" (a N(0,1) density),
  "box" (a uniform in -1 to 1) or "epanech" (a Epanechnikov quadratic kernel), default "normal".}
  \item{bw}{a number indicating the bandwidth to be used in the empirical kernel estimate of the data,
  default NULL. In its default option, the bandwidth is estimated using the \code{dpik} function
  included in the package \code{KernSmooth}.}
}

\value{
The output is an object of the class \code{htest} exactly like for the Kolmogorov-Smirnov
test, \code{\link[stats]{ks.test}}.
A list containing the following components:

\item{statistic}{the value of the test statistic.}
\item{p.value}{the p-value of the test.}
\item{method}{the character string "Geometric test".}
\item{data.name}{a character string giving the name of the data.}
}

\details{
The Fan's test is based on a normal approximation of the integral of the squared difference between
the null hypothesis density function and a kernel smoothing approximation. In Li and Racine's form it is
obtained as the aggregation of (i) a sampling component, (ii) the integrate of the square of the kernel
convolution of the density null function and (iii) the sum of the convolution of the density in the sampled values,
see Li and Racine (2007, pp.380-1) for details.
}


\references{
Fan, Y (1994) "Testing the goodness-of-fit of a parametric density function by kernel method", Econometric Theory, 10, 316--356.

Li, O. and Racine, J.F. (2007) "Nonparametric Econometrics", Princeton niversity Press, New Jersey.
}
\author{
Jose M. Pavia
}
\note{
To properly run the function requires the package \code{KernSmooth}
to be installed to estimate the bandwidth.
}

\section{Warning}{\code{fan.test} calls the \code{\link[KernSmooth]{dpik}} function of \code{KernSmooth}}

\seealso{
\code{\link{dgeometric.test}}, \code{\link[stats]{integrate}} and \code{\link[KernSmooth]{dpik}}.
}
\examples{
fan.test(runif(100), dunif, lower=0, upper=1)

f0 <- function(x) ifelse(x>=0 & x<=1, 2-2*x, 0)
## testing if risk76.1929 follows the distribution characterized by f0
fan.test(risk76.1929, f0, lower=0, upper=1, kernel="epanech")

}
\keyword{ htest }

