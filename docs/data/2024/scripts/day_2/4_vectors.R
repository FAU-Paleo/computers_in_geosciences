# Example script about vectors

# a bunch values that have a particular sequence
one <- c(1, 2, 3, 4, 5)

# example vector, temperatures predicted for Erlangen (2024-10-08)
temperature <- c(18, 16, 14, 13, 13, 12, 11, 14)

# sequence of integer values (vectors)
second <- 1:5
second <- -100:200

# the length of the vector: the number of values
theLengthOfSecond <- length(second)
theLengthOfSecond > 200

# subsets (numeric subscripts)
second[92] #92th value
second[1] # first value
second[301] # 301st value

# <object>[<subscript>]

# the last value of the vector
second[theLengthOfSecond]

# the first two values
second[c(1,2)]

# first one hundred values (and shifted by by one)
second[1:100]
second[2:101]

# repetitions in subscripts lead to repetitions of values
second[c(1,2,1,2,1,2)]

###########################################################
# Logical vectors

# a simple logical vector
logicalVector <- c(TRUE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE)
length(logicalVector)

# subsets
logicalVector[1]
logicalVector[1:3]

###########################################################
# Character vectors

charVec <- c("adam", "table", "glass", "lame", "o", "R")
charVec[4]


###########################################################
# Logical vectors

###########################################################
# subsetting based on logical expressions
second

# how many values are divisible by seven?
second + 1000

# remainders of integer division by 7 (modulus)
remainders <- second %% 7

c(6, 12) == 12

# 
divisibleBy7 <- remainders == 0

# indices of divisible values
indexOfDivisible <- which(divisibleBy7)
length(indexOfDivisible)

# which values are divisble by 7
second[indexOfDivisible]

# return the values divisible by 7
second[ which(second%%7 == 0) ]

# the values in second that are greater than 0
second[which(second>0)]


