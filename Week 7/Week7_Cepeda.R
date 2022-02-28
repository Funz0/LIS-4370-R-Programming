# Alejandro Cepeda
# Module 7: S3 vs S4 Object
# 2/27/22

# MASS library for dataset
library("MASS")

# Boston dataset from MASS package
data(Boston)
# verify dataset is usable w/ generic functions
head(Boston,4)
list(Boston[1:4,])
plot(Boston$lstat, Boston$medv)

# S3 class creation 
boston_s3 <- list(medv=20, lstat=4.05, crim=0.0064)
# required step to convert to S4 object (set class type closure)
setClass("housing",
         slots=c(medv="numeric", lstat="numeric", crim="numeric"))
boston_s3
# S4 class creation
(boston_s4 <- new("housing", medv=20, lstat=4.05, crim=0.0064))

# determine OO system w/ stored objects
isS4(boston_s3)
isS4(boston_s4)

# determine base type of objects
typeof(boston_s3)
typeof(boston_s4)
