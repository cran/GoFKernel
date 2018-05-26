\name{dgeometric.test}
\alias{dgeometric.test}
\title{
 Geometric Goodness-of-fit Test
}
\description{
Implementation of the goodness-of-fit test based on assessing the size of the area
between the null hypothesis density function and a  kernel density estimate of a sample.
}
\usage{
dgeometric.test(x, fun.den, par = NULL, lower = -Inf, upper = Inf, n.sim = 101,
                bw=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{a numeric vector of data values for which the null hypothesis is tested.}
  \item{fun.den}{an actual density distribution function, such as \code{dnorm}. Only continuous
densities are valid.}
  \item{par}{list of (additional) parameters of the density function under the null hypothesis, default NULL.}
  \item{lower}{lower end point of the support of the random variable defined by \code{fun.den},
  default -Inf.}
  \item{upper}{upper end point of the support of the random variable defined by \code{fun.den},
  default -Inf.}
  \item{n.sim}{number of iterations performed to calculate the \code{p.value} of the test, default \code{101}.}
  \item{bw}{a number indicating the bandwidth to be used in the empirical kernel estimate of the data,
  default NULL. In its default option, the bandwidth varies in each simulated dataset and is the one
  estimated by default by \code{\link[stats]{density}} with a Gaussian kernel.}
}
\details{
\code{dgeometric.test} uses numerical integration and Monte Carlo simulation to implement
the test based on assessing the extend of the area between a null hypothesis density function
and a density kernel estimation. It works as follows. After computing by numerical integration the area
between the density function under the null hypothesis and its sample empirical kernel estimate obtained using
\code{density.reflected}, the \code{p-value} of the test is obtained by simulation as follows:
(i) drawing \code{n.sim} samples from \code{fun.den} with the same size \code{length(x)} of our actual
sample \code{x}; (ii) estimating the kernel density function for each of these new samples;
(iii) computing the area between the theoretical density and each of the estimates obtained in (ii);
and, (iv) calculating the p-value as the proportion of times the sample \code{n.sim}
areas computed in (iii) exceed the value of the area computed from the observed sample.
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
\references{
Pavia, JM (2015) "Testing Goodness-of-fit with the Kernel Density Estimator: GoFKernel", Journal of Statistical Software, Code Snippets, 66(1), 1--27.
}
\author{
Jose M. Pavia
}
\note{
\code{dgeometric.test} calls \code{\link{density.reflected}} and \code{\link{area.between}}
(and, in some circunstances, also \code{\link{inverse}}, \code{\link{random.function}} and \code{\link{support.facto}}),
which are (internal) functions of the package \code{GoFKernel}.
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
dgeometric.test(x, dgamma, par=list(shape=0.6, rate=0.1), lower=0, upper=Inf, n.sim=100)

f0 <- function(x) ifelse(x>=0 & x<=1, 2-2*x, 0)
## test if risk76.1929 follows the distribution characterized by f0
dgeometric.test(risk76.1929, f0, lower=0, upper=1, n.sim=21)

}

\keyword{ htest }

