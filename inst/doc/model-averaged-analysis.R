## ---- echo=FALSE, results='asis'-----------------------------------------
foo <- read.csv(system.file("Cmatrix.mp.csv", package ="SAGA"))[1:15,1:16]
knitr::kable(foo, row.names=T, output=T)

## ---- echo=FALSE, results='asis'-----------------------------------------
data(per.inf, package="SAGA")
colnames(per.inf) <- c("Cohort ID", "Mean", "SE") 
knitr::kable(per.inf, row.names=T, output=T)

## ----fig.cap='__Figure 1.__ Model averaged estimate of genetic architecture.', echo=TRUE, warning=FALSE,results='markup', fig.width=6.5----
# we will need the plotrix package for plotting
library(plotrix)
results <- SAGA::AnalyzeCrossesMM(per.inf, graph=T, cex.names=.8)

## ---- fig.cap='__Figure 3.__ Conditional estimate of genetic architecture.', echo=TRUE, warning=FALSE, results='markup', fig.width=6----
library(plotrix)
data(SR, package="SAGA")
results2 <- SAGA::AnalyzeCrossesMM(SR, even.sex=T, graph=T)

## ----fig.cap='__Figure 2.__ Subset of model averaged estimate of genetic architecture.', echo=TRUE, warning=FALSE, results='hide', fig.width=6.5----
    # here we extract the 4 largest composite effects found in the first analysis
    estimates <- as.numeric(results[[2]][1, c(3, 7, 8, 9)])
    names(estimates) <- colnames(results[[2]])[c(3, 7, 8, 9)]
    barplot(estimates, main = "Estimate for composite effects",
            names.arg = names(estimates))

## ---- fig.cap='__Figure 4.__ Distribution of akaike weights across model space for Tribolium dataset.', echo=FALSE, warning=FALSE, results='hide', fig.width=5.5, fig.height=5----
SAGA::VisModelSpace(results, cex.u=1.6)

## ---- fig.cap='__Figure 5.__ Distribution of akaike weights across model space for Drosophila dataset.', echo=FALSE, warning=FALSE, results='hide', fig.width=5.5, fig.height=5----
SAGA::VisModelSpace(results2, cex.u=.4)

## ---- echo=FALSE, warning=FALSE, results='hide'--------------------------
SAGA::EvaluateModel(results, 166, cex.names=.7, cex.main=.7)
SAGA::EvaluateModel(results, 110, cex.names=.7, cex.main=.7)

