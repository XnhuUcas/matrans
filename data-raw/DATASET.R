## code to prepare `DATASET` dataset goes here

library(matrans)
## generate simulation datasets (M=7)
coeff0 <- cbind(as.matrix(c(1.4, -1.2, 1, -0.8, 0.65, 0.3)),
                   as.matrix(c(1.4, -1.2, 1, -0.8, 0.65, 0.3)+0.02),#  mis
                   as.matrix(c(1.4, -1.2, 1, -0.8, 0.65, 0.3)+0.02), #light diff
                   as.matrix(c(1.4, -1.2, 1, -0.8, 0.65, 0.3)+0.3),#  hard diff
                   as.matrix(c(1.4, -1.2, 1, -0.8, 0.65, 0.3)),# same
                   as.matrix(c(1.4, -1.2, 1, -0.8, 0.65, 0.3)+0.02),# light diff
                   as.matrix(c(1.4, -1.2, 1, -0.8, 0.65, 0.3)+0.3)) # hard diff

## correct target model setting
whole.data.cor <- simdata.gen(
  px = 6, num.source = 7, size = c(150,200,150,200,150,150,200), coeff0 = coeff0,
  coeff.mis = as.matrix(c(coeff0[, 2], 1.8)), err.sigma = 0.5, rho = 0.5, size.test = 500,
  sim.set = "homo", tar.spec = "cor", if.heter = FALSE
)

## misspecified target model setting
coeff.mis <- matrix(c(c(coeff0[, 1], 0.1), c(coeff0[, 2], 1.8)), ncol = 2)
whole.data.mis <- simdata.gen(
  px = 6, num.source = 7, size = c(150,200,150,200,150,150,200), coeff0 = coeff0,
  coeff.mis = coeff.mis, err.sigma = 0.5, rho = 0.5, size.test = 500,
  sim.set = "homo", tar.spec = "mis", if.heter = FALSE
)
example.data <- list(data.cor=whole.data.cor, data.mis=whole.data.mis)
usethis::use_data(example.data, overwrite = TRUE)
