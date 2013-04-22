\name{fan.test}
\alias{fan.test}
\title{
Univariate implementation of the test of Fan (1994) in the form proposed by Li and Racine (2007).
}
\description{
Given a sample of a continuous univariate random variable and a density
function \code{fun.den} (with suppot in the interval (\code{lower}, \code{upper}),
\code{fan.test} calculates the test statistic and the corresponding p-value using a nonparametric
kernel approximation to the test assuming as null hypothesis that the sample has as density function \code{fun.den}.
To proper run, the \href{http://cran.r-project.org/web/packages/KernSmooth/index.html}{KernSmooth} package needs to be
installed.
}
\usage{
fan.test(x, fun.den, par = NULL, lower = -Inf, upper = Inf, kernel = "normal")
}

\arguments{
  \item{x}{a numeric vector of data values for which we can test the null hypothesis.}
  \item{fun.den}{an actual density distribution function, such as \code{dnorm}. Only continuous
densities are valid.}
  \item{par}{list of parameters of the density function under the null hypothesis, default NULL.}
  \item{lower}{lower end point of the support of the random variable defined by \code{fun.den},
  default -Inf.}
  \item{upper}{upper end point of the support of the random variable defined by \code{fun.den},
  default -Inf.}
  \item{kernel}{a character string with the kernel to be used, either "normal" (a N(0,1) density),
"box" (a uniform in -1 to 1) or "epanech" (a Epanechnikov quadratic kernel), default "normal".}
}

\value{
The output is an object of the class \code{htest} exactly like for the Kolmogorov-Smirnov
test, \href{http://stat.ethz.ch/R-manual/R-patched/library/stats/html/ks.test.html}{ks.test}.
A list containing the following components:

\item{statistic}{the value of the test statistic.}
\item{p.value}{the p-value of the test.}
\item{method}{the character string "Geometric test".}
\item{data.name}{a character string giving the name of the data.}
}

\details{
The Fan's test is based on a normal approximation for the integrate of the squared difference between
the null hypothesis density function and a kernel smoothing approximation. In the Li and Racine's form, it is
obtained as the aggregation of (i) a sampling component, (ii) the integrate of the square of the kernel
convolution of the density null function and (iii) the sum of the convolution of the density in the sampled values,
see Li and Racine (2007, pp.380-1) for details.
}


\references{
Fan, Y (1994) "Testing the goodness-of-fit of a parametric density function by kernel method", \emph{Econometric Theory}, 10, 316-356. \cr
Li, O. and Racine, J.F. (2007) \emph{Nonparametric Econometrics}, Princeton University Press, New Jersey.
}
\author{
Jose M. Pavia
}
\note{
To proper run the function requires the package \href{http://cran.r-project.org/web/packages/KernSmooth/index.html}{KernSmooth}
(>=2.23-8), to estimate the bandwidth.
}

\seealso{
\code{\link{dgeometric.test}}, \href{http://stat.ethz.ch/R-manual/R-patched/library/stats/html/integrate.html}{integrate}
and \href{http://cran.r-project.org/web/packages/KernSmooth/index.html}{KernSmooth}.
}
\examples{
fan.test(runif(100), dunif, lower=0, upper=1)

f0 <- function(x) ifelse(x>=0 & x<=1, 2-2*x, 0)
## testing if risk76.1929 follows the distribution characterized by f0
fan.test(risk76.1929, f0, lower=0, upper=1, kernel="epanech")

}

\keyword{ htest }