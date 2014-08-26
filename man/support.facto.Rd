\name{support.facto}
\alias{support.facto}

\title{
"De Facto" Support
}
\description{
\code{support.facto} computes the de facto numerical limits of a density function
with theoretical infinite support. This function is an (internal) function of
the \code{GoFKernel} package.
}
\usage{
support.facto(f, lower = -Inf, upper = Inf)
}
\arguments{
  \item{f}{ a density function.}
  \item{lower}{ theoretical lower limit of the support of the random variable, default -Inf.}
  \item{upper}{ theoretical upper limit of the support of the random variable, default, Inf.}
}
\details{
\code{support.facto} requires that the  two first ordinary moments of \code{f} exist;
otherwise, \code{support.facto} returns the introduced limits.
}
\value{
A two components vector with the de facto lower and upper limits of \code{f}.
}

\author{
Jose M. Pavia
}

\seealso{
\code{\link{area.between}}, \code{\link{dgeometric.test}}, \code{\link{inverse}}, \code{\link{random.function}}
and \code{\link{fan.test}}.
}
\examples{
support.facto(dnorm)
}
