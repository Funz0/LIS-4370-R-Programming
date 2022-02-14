# Alejandro Cepeda
# Module 2: Introduction to basic R functions and Data Structures
# 1/23/2022

# storing vector as 'assignment'
assignment <- c(16,18,14,22,27,17,19,17,17,22,20,22)

# storing 'myMean' function to calculate the mean of vector
myMean <- function(assignment){
  return(sum(assignment)/length(assignment))
}
# displaying assignment mean
myMean(assignment)

# verifying results
(myMean2 <- sum(assignment)/12)
