# Alejandro Cepeda
# Module 5: Math
# 2/13/22

library(MASS)

# store initial matrices
A <- matrix(1:100, nrow=10)
B <- matrix(1:1000, nrow=10)

# transpose A & B
tA <- t(A)
tB <- t(B)

# create A & B random number vectors
a <- c(sample(1:100, replace = FALSE))
b <- c(sample(1:1000, replace = FALSE))

# perform matrix multiplication with matrices and vectors
X <- tA*a
Y <- tB*b

# re-assign the vectors a and b to equal 
# the number of rows of the column for the corresponding matrix
a.matrix <- matrix(a, nrow=10)
b.matrix <- matrix(b, nrow=10)

# perform matrix multiplication with re-assigned values
multA <- a.matrix %*% X
multB <- b.matrix %*% Y

# find determinant and inverse of new matrices
det(multA)
solve(multA)

det(multB)
solve(multB)
# verifying results using MASS package 'ginv' function
ginv(A)
ginv(B)
