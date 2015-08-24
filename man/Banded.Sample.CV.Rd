\name{Banded.Sample.CVV}
\alias{Banded.Sample.CV}
\title{Selects bandwidth for sample covariance matrix cross validation}
\usage{
Banded.Sample.CV(X, bandwidth, folds = 3, est.eval = TRUE, Frob = TRUE)
}
\arguments{
\item{X}{an n by p data matrix}

\item{bandwidth}{a vector of candidate bandwidths}

\item{folds}{number of folds for CV; default is 3}

\item{est.eval}{TRUE/FALSE should the solution at the minizing tuning paramter be computed}

\item{Frob}{TRUE/FALSE; which type of norm used for evaluting CV error; FALSE sets to operator norm}
}
\value{
A list with
\item{bandwidth.min}{the bandwidth minimizing cv error}

\item{est}{the sample covariance matrix at bandwidth.min}
}
\description{
Selects bandwidth for sample covariance matrix by k-fold cross validation
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

## perform cross validation
k = 4:7
out2.cv = Banded.Sample.CV(X, bandwidth=k, folds=5)
}

