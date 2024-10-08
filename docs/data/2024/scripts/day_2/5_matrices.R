# matrix example

# two vectors
one <- 1:4
two <- 101:104

# column-bind
matOne <- cbind(one, two)

# FIRST DIMENSION: ROW, SECOND DIMENSION: COLUMN
dim(matOne)
length(matOne) # the number of elements in the matrix

# row-bind
matTwo <- rbind(one, two)

# other order
matThree <- rbind(two, one)
matThree <- rbind(two, one, one)
dim(matThree)

# the same with logical values
logVec1 <- c(TRUE, FALSE, TRUE)
logVec2 <- c(FALSE, FALSE, TRUE)
cbind(logVec1, logVec2)

# aceessing subsets of a matrix
matThree[1, 2]
matThree[1, 4]
matThree[2, 3]

# elements of a vector vs a matrix
one[1]
one[1:2]
matThree[1:2, 3]
matThree[1:2, c(2,3,4)]

# accessing an entire column
thirdColumn <- matThree[,3]
thirdColumn

