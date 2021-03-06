% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hv.R
\name{igd}
\alias{igd}
\alias{igd_plus}
\title{Inverted Generational Distance (IGD and IGD+)}
\usage{
igd(data, reference, maximise = FALSE)

igd_plus(data, reference, maximise = FALSE)
}
\arguments{
\item{data}{(\code{matrix} | \code{data.frame}) \cr Matrix or data frame of numerical
values, where each row gives the coordinates of a point.}

\item{reference}{(\code{matrix} | \code{data.frame}) \cr Reference set as a matrix or
data.frame of numerical values.}

\item{maximise}{(\code{logical()} | \code{logical(1)}) \cr Whether the objectives must be
maximised instead of minimised. Either a single logical value that applies
to all objectives or a vector of logical values, with one value per
objective.}
}
\value{
A single numerical value.
}
\description{
Computes the inverted generational distance (IGD and IGD+)
}
\details{
The generational distance (GD) of a set \eqn{A} is defined as the distance
between each point \eqn{a \in A} and the closest point \eqn{r} in a
reference set \eqn{R}, averaged over the size of \eqn{A}. Formally,

\deqn{GD(A,R) = \frac{1}{|A|}\left(\sum_{a\in A}\min_{r\in R} d(a,r)^p\right)^{\frac{1}{p}} }{GD(A,R) = (1/|A|) * ( sum_{a in A} min_{r in R} d(a,r)^p )^(1/p)}
where:
\deqn{d(a,r) = \sqrt{\sum_{k=1}^M (a_k - r_k)^2} }{d(a,r) = sqrt( sum_{k=1}^M (a_k - r_k)^2)}

The inverted generational distance (IGD) is calculated as \eqn{IGD(A,R) = GD(R,A)}
with \eqn{p=1}.

GD was first proposed by Van Veldhuizen and Lamont (1997)in [1] with
p=2. IGD seems to have been mentioned first by Coello Coello & Reyes-Sierra
(2004), however, some people also used the name D-metric for the same thing
with p=1 and later papers have often used IGD/GD with p=1.

The modified inverted generational distanced (IGD+) was proposed by
Ishibuchi et all. (2015) to ensure that IGD+ is weakly Pareto compliant,
similarly to unary epsilon. It averages over \eqn{|R|} within the exponent
\eqn{1/p} and modifies the distance measure as:

\deqn{d^+(r,a) = \sqrt{\sum_{k=1}^M (\max\{r_k - a_k, 0\})^2}}{d^+(r,a) = sqrt(sum_{k=1}^M (max {r_k - a_k, 0 })^2)}

See Bezerra et al. (2017) for a comparison.
}
\examples{
extdata_path <- system.file(package="eaf","extdata")
path.A1 <- file.path(extdata_path, "ALG_1_dat")
path.A2 <- file.path(extdata_path, "ALG_2_dat")
A1 <- read_datasets(path.A1)[,1:2]
A2 <- read_datasets(path.A2)[,1:2]
ref <- filter_dominated(rbind(A1, A2))
igd(A1, ref)
igd(A2, ref)

# IGD+ (Pareto compliant)
ref <- filter_dominated(rbind(A1, A2))
igd_plus(A1, ref)
igd_plus(A2, ref)

}
\references{
D. A. Van Veldhuizen and G. B. Lamont. Evolutionary Computation and
Convergence to a Pareto Front. In J. R. Koza, editor, Late Breaking Papers
at the Genetic Programming 1998 Conference, pages 221–228, Stanford
University, California, July 1998. Stanford University Bookstore.  Keywords:
generational distance.

Coello Coello, C.A., Reyes-Sierra, M.: A study of the parallelization of a
coevolutionary multi-objective evolutionary algorithm.  In: Monroy, R., et
al. (eds.) Proceedings of MICAI, LNAI, vol. 2972, pp. 688–697. Springer,
Heidelberg, Germany (2004).

Q. Zhang and H. Li. MOEA/D: A Multiobjective Evolutionary Algorithm Based
on Decomposition. IEEE Transactions on Evolutionary Computation,
11(6):712–731, 2007. doi:10.1109/TEVC.2007.892759.

Schutze, O., Esquivel, X., Lara, A., Coello Coello, C.A.: Using the
averaged Hausdorff distance as a performance measure in evolutionary
multiobjective optimization. IEEE Trans. Evol. Comput. 16(4), 504–522 (2012)

H. Ishibuchi, H. Masuda, Y. Tanigaki, and Y. Nojima.  Modified Distance
Calculation in Generational Distance and Inverted Generational Distance.
In A. Gaspar-Cunha, C. H. Antunes, and C. A. Coello Coello, editors,
Evolutionary Multi-criterion Optimization, EMO 2015 Part I, volume 9018 of
Lecture Notes in Computer Science, pages 110–125. Springer, Heidelberg,
Germany, 2015.

Leonardo C. T. Bezerra, Manuel López-Ibáñez, and Thomas Stützle. An
empirical assessment of the properties of inverted generational distance
indicators on multi- and many-objective optimization. In H. Trautmann,
G. Rudolph, K. Klamroth, O. Schütze, M. M. Wiecek, Y. Jin, and C. Grimme,
editors, Evolutionary Multi-criterion Optimization, EMO 2017, Lecture
Notes in Computer Science, pages 31–45. Springer, 2017.
}
\author{
Manuel \enc{López-Ibáñez}{Lopez-Ibanez}
}
