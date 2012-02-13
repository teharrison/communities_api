\name{kbGet}
\alias{kbGet}
\title{
Retrieve resources from the Kbase MG-RAST server
}
\description{
Retrieves resources, typically the outputs of the analysis pipeline, from the Kbase MG-RAST server.
}
\usage{
kbGet(resource = c("project", "sample", "library", "metagenome", "abundance.profile", "sequence.set", "sequence"), ID = NULL, param = NULL, verbose = FALSE, trim = TRUE, site = c("prod", "dev", "tobi"))
}
\arguments{
  \item{resource}{
%%     ~~Describe \code{resource} here~~
}
  \item{ID}{
%%     ~~Describe \code{ID} here~~
}
  \item{param}{
bleh
}
  \item{verbose}{
%%     ~~Describe \code{verbose} here~~
}
  \item{trim}{
%%     ~~Describe \code{trim} here~~
}
  \item{site}{
%%     ~~Describe \code{from} here~~
}
}
\details{
Real documentation, someday.
}
\value{
Returns the object requested, or NULL if unavailable.
}
\author{
Daniel Braithwaite
}

\seealso{
\code{\link{KbaseKit}}
}
\examples{
## Sorry, no examples.
}
