% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predictionsToSummary.R
\name{predictionsToSummary}
\alias{predictionsToSummary}
\title{Convert SNP branchpoint predictions across the branchpoint window to an intronic summary}
\usage{
predictionsToSummary(query, predictions, probabilityCutoff = 0.52,
  probabilityChange = 0.15)
}
\arguments{
\item{query}{query GRanges containing all SNP ids to be summarised}

\item{predictions}{site-wide branchpoint proability predictions
produced from predictBranchpoints()}

\item{probabilityCutoff}{Value to be used as the cutoff for
discriminating branchpoint sites from non-branchpoint sites
(default = \code{0.52})}

\item{probabilityChange}{Minimum probability score change
required to call a branchpoint site as deleted or created by
a SNP (default = \code{0.15})}
}
\value{
GRanges with summarised branchpoint changes
occuring within the intron due to a SNP.
}
\description{
Takes predictions of branchpoint probabilities from a reference
and alternative SNP and summarises the effect(s) of the SNP.
}
\examples{
smallExons <- system.file("extdata","gencode.v26.annotation.small.gtf", package = "branchpointer")
exons <- gtfToExons(smallExons)
g <- BSgenome.Hsapiens.UCSC.hg38::BSgenome.Hsapiens.UCSC.hg38

querySNPFile <- system.file("extdata","SNP_example.txt", package = "branchpointer")
querySNP <- readQueryFile(querySNPFile,queryType = "SNP",exons = exons, filter = FALSE)
predictionsSNP <- predictBranchpoints(querySNP,queryType = "SNP",BSgenome = g)

summarySNP <- predictionsToSummary(querySNP,predictionsSNP)
}
\author{
Beth Signal
}
