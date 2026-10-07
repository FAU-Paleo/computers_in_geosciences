# Vectors
 
# Favorite number in the 0-9 range

# vector  - favorite numbers
# the c (combine) function can be used to create a vector
favorite <- c(6,2,7,6,7,7,6,7,3,8,4,8,8,9,9,5)

# the structure
str(favorite)

# length of a vector is the number of elements it has
length(favorite)

# in R every value is also a vector (with a single element)
 
# the length of length is 1
length(length(favorite))

# Subsetting is the process of getting a subset, i.e. keeping only a part of given object
# Whenever you see [] in R, that indicates some form of defining a subset, which is called a subscript.
# We put the subscript in square brackets. object[subscript]
 
# This is a numeric subscript, pointing to the 5th value, the value with index of 5
favorite[5]

# the same with 4
favorite[4]

# etc.
favorite[1]

# The combining function can take entire vectors, and will sequentially thread them together
favorite5 <- c(favorite, favorite, favorite, favorite, favorite)

# note how R is wrapping the vector, it cannot fit a single line
favorite5
# the numeric subscript of the first value in a new line is printed, indicating how you can access that

# get the 13th value of 'favorite'!
favorite[13]

# Vectorization allows us the execution of multiple operations defined with a vector. 
# every single value of favorite is incremented with 5
favorite + 5

# divided by 4
favorite/4

# or exponentiated
exp(favorite)


# How many people have favorite numbers are larger than 5?
favorite

# logical vector
favorite > 5

# function to sum up a vector
sum(favorite)

# logical vector into 'sum': the number of TRUE values in the vector
# how many people have favorite numbers larger than 5?
sum(favorite > 5)

# How many people have 7 as their favorite number? 
sum(favorite == 7)

# using a single number of as subscript
favorite[3]

# vectors can be used as subscripts (numeric)
c(3, 5, 7)

# result in as many numbers as many there are in the subscript
favorite[c(3, 5, 7)]

# the order can be used to extract values
favorite[c(7, 5, 3)]

# it can also repeat a value
favorite[c(1,1,2,3,4,4)]

# which favorites are larger than 5? 
# logical subscript
favorite[favorite > 5]

# integer indices of the values that are TRUE
which(favorite > 5)

# a nicer way to 
length(which(favorite > 5))

# A value accessed beyond the bounds of a vector results is
# Not applicable, Not available NA, 
# missing value
favorite[20]


################################################################################
# Survey 2.

# How many siblings do people have?
siblings <- c(
3,
2,
3,
1,
1,
2,
1,
1,
0,
1,
2,
1,
1,
3,
1,
NA)
# missing value means not given

# 1. How many values are there in the vector?
length(siblings)

# 2. How many people have one sibling?

# logical operatiorn
siblings == 1

# the missing values propegate
sum(siblings == 1)

# it needs to be explicitly indicated that
# missing values should be ignored!
sum(siblings == 1, na.rm=TRUE)

# this is fine, which will ignore missing values!
length(which(siblings == 1))

# 3. what is the total number of siblings in the sample? 
sum(siblings, na.rm=TRUE)

# 'quirky' values
# missing value 
NA == 1
NA * 4
NA * NA
NA / NA

# Not a Number
log(-5)*4

# Infinites
56 / 0
-56/0

# they exist so vectorized operations do not break!
67 / c(-1, 0, 1, 2, 3 )

# omitting values with negative subscripts
siblings[-4]
siblings[-1]
siblings[16]

# minimize magic numbers (hard-coded numbers) in code!
# combination of subscripts and length, 
# Get the last value in the vector
siblings[length(siblings)]

# omit the last value
siblings[- length(siblings)]

# Missing values sometimes need to be omitted as a separate step.
# a vector with multiple missing values
dummy <-c(NA, 2, 5, NA, 4, 6)

# predicate function, 
is.na(TRUE)
is.na(9)
is.na(FALSE)
is.na(NA)
is.na(dummy)

# three operations
# extracting non-missing value bits from a vector
dummy[!is.na(dummy)]

# sequences
# increasing integer sequence
1:100
# with negative and positives
-5:4
# decreasing integer sequences
5:-3

# 1:100
# how many values are divisible by 7 
length(which(1:100 %% 7 == 0))

# sequence function is more general
?seq

# someexamples
seq(from=1, to=100)
seq(from=1, to=100, by= 0.1)
seq(from=-5, to=-20, by= -0.1)
seq(from=1, to=20, by=3)

# length.out 
seq(from=1, to=20, length.out=8)
length(seq(from=1, to=20, length.out=8))

# repetition
c(1,1,1,1,1,1,1,1)

# repeat 15 67 times
rep(15, 67)

# repeat the (14 15) vector 67 times
rep(c(14,15), 67)

######################################
# Descriptive stats


siblings

# mininmum maximum, mean
min(siblings, na.rm=TRUE)
max(siblings, na.rm=TRUE)
range(siblings, na.rm=TRUE)
mean(siblings, na.rm=TRUE)


# this is incorrect!
# length is including the missing value
# sum(siblings, na.rm=TRUE)/length(siblings)

# the correct solution
siblingsNONA <- siblings[!is.na(siblings)]
sum(siblingsNONA) / length(siblingsNONA)

# standard deviation
sd(siblings, na.rm=TRUE)
