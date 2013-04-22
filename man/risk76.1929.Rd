\name{risk76.1929}
\alias{risk76.1929}
\docType{data}
\title{
Inmigrants Exposed to Risk of Death
}
\description{
Vector containing the time exposed to risk of death with 76 years during 2006
for the 2006 registered Spanish immigrants born in 1929.
}
\usage{data(risk76.1929)}
\format{
  The format is:
 num [1:362] 0.94 0.885 0.863 0.852 0.797 ...
}
\note{
Under the null hypotheses of uniform distribution of date of birth and date of
migration, this time exposed to risk is distributed as a f(x)=2-2x 0<x<1.
}
\source{
Own elaboration from data available in \href{http://www.ine.es}{www.ine.es}
}

\examples{
plot(density.reflected(risk76.1929, 0, 1))
}
\keyword{datasets}
