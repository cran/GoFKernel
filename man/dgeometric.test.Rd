\name{dgeometric.test}
\alias{dgeometric.test}
\title{
 Geometric Goodness-of-fit Test
}
\description{
Implementation of the goodness-of-fit test based on assessing the size of the area
between the null hypothesis density function and a density kernel estimation of the sample.
}
\usage{
dgeometric.test(x, fun.den, par = NULL, lower = -Inf, upper = Inf, n.sim = 100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{a numeric vector of data values for which we can test the null hypothesis.}
  \item{fun.den}{an actual density distribution function, such as \code{dnorm}. Only continuous
densities are valid.}
  \item{par}{list of parameters of the density function under the null hypothesis, default NULL.}
  \item{lower}{lower end point of the support of the random variable defined by \code{fun.den},
  default -Inf.}
  \item{upper}{upper end point of the support of the random variable defined by \code{fun.den},
  default -Inf.}
  \item{n.sim}{number of iterations performed to calculate the p.value of the test, default 100.}
}
\details{
 \code{dgeometric.test} uses numerical integration and Monte Carlo simulation to implement
the test based on assessing the extent of the area between a null hypothesis density function
and a density kernel estimation. After computing by numerical integration the area between the density
function under the null hypothesis and the sample empirical kernel estimation, the p-value of the
test is obtained by simulation as follows: (i) drawing \code{n.sim} samples from \code{fun.den} with
the same size \code{length(x)} of our actual sample \code{x}; (ii) estimating the kernel density function
for each of these new samples; (iii) computing the area between the theoretical density and each of the
estimates obtained in (ii); and, (iv) calculating the p-value as the proportion of times the sample \code{length(x)}
areas computed in (iii) exceed the value of the area from the observed sample.
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
\references{
Pavia, JM (2013) "Testing Goodness-of-fit with the Kernel Density Estimator: GoFKernel".
}
\author{
Jose M. Pavia
}
\note{
\code{dgeometric.test} calls \code{\link{density.reflected}}, \code{\link{area.between}},
\code{\link{inverse}}, \code{\link{random.function}} and \code{\link{support.facto}},
which are internal functions of the package \code{GoFKernel}.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{area.between}}, \code{\link{density.reflected}}, \code{\link{inverse}}
\code{\link{random.function}}, \code{\link{support.facto}} and \code{\link{fan.test}}.
}
\examples{

set.seed(12)
x <- rlnorm(50, meanlog=1, sdlog=1)
## test if x follows a Gamma distribution with shape .6 and rate .1
dgeometric.test(x, dgamma, par=c(shape=0.6, rate=0.1), lower=0, upper=Inf, n.sim=11)

}

\keyword{ htest }

