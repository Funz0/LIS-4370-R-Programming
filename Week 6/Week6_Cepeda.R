# Alejandro Cepeda
# Module 6: Math in R part 2
# 2/20/22

# matrices given by professor
A = matrix(c(2,0,1,3), ncol=2)
B = matrix(c(5,2,4,-1), ncol=2)

# add and subtract stored matrices
A + B
A - B

# build a matrix of size 4 with 4,1,2,3 in diagonal
diag(c(4,1,2,3), nrow=4)

# generate the matrix shown by the professor 
# using row and column binds with 3 as the diagonal digits
rbind(c(3,1,1,1,1), cbind(c(2,2,2,2),
                    diag(3, nrow=4)))