\name{support.facto}
\alias{support.facto}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
"De Facto" Support
}
\description{
\code{support.facto} computes the de facto numerical limits of a density function
with theoretical infinite support. This function is for internal use within the
\code{GoFKernel} package.
}
\usage{
support.facto(f, lower = -Inf, upper = Inf)
}
\arguments{
  \item{f}{ a density function. It requires that its first two ordinary moments exist.
  Otherwise, the limits are not modified.}
  \item{lower}{ theoretical lower limit of the support of the random variable, default -Inf.}
  \item{upper}{ theoretical upper limit of the support of the random variable, default, Inf.}
}
\details{
For Internal use only.
}
\value{
A two components vector with the de facto lower and upper limits.
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
