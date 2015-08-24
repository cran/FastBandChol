\name{Banded.Chol.CV}
\alias{Banded.Chol.CV}
\title{Selects bandwidth for Cholesky factorization by cross validation}
\usage{
Banded.Chol.CV(X, bandwidth, folds = 3, est.eval = TRUE, Frob = TRUE)
}
\arguments{
\item{X}{an n by p  data matrix, not centered}

\item{bandwidth}{a vector of candidate bandwidths; max less than (folds-1)*n/folds - 1}

\item{folds}{number of folds for CV; default is 3}

\item{est.eval}{TRUE/FALSE; should the solution at the minizing tuning paramter be computed?}

\item{Frob}{TRUE/FALSE; which type of norm used for evaluting CV error; TRUE (default) sets to Frobenius norm; FALSE sets to operator norm}
}
\value{
a list with
\item{bandwidth.min}{the bandwidth minimizing cross-validation error}

\item{est}{estimated covariance matrix at bandwidth.min}
}
\description{
Selects bandwidth for Cholesky factorization by k-fold cross validation
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
out1.cv = Banded.Chol.CV(X, bandwidth=k, folds = 5)

}

