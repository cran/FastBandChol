

\name{Banded.Sample}
\alias{Banded.Sample}
\title{Computes banded sample covariance matrix}
\usage{
Banded.Sample(X, bandwidth, centered = FALSE)
}
\arguments{
\item{X}{an n times p data matrix}

\item{bandwidth}{nonnegative integer; less than n-1}

\item{centered}{TRUE/FALSE is data matrix centered?}
}
\value{
A list with
\item{est}{the banded sample covariance estimate}
}
\description{
Estimates a covariance matrix by banding the sample covariance matrix
}
\examples{
## set sample size and dimension
n=20
p=100

## create covariance with AR1 structure
Sigma = matrix(0, nrow=p, ncol=p)
for(l in 1:p){
  for(m in 1:p){
    Sigma[l,m] = .5^(abs(l-m))
  }
}

## simulation Normal data
eo1 = eigen(Sigma)
Sigma.sqrt = eo1$vec\%*\%diag(eo1$val^.5)\%*\%t(eo1$vec)
X = t(Sigma.sqrt\%*\%matrix(rnorm(n*p), nrow=p, ncol=n))

## compute estimate
out2 = Banded.Sample(X, bandwidth=4)
}

