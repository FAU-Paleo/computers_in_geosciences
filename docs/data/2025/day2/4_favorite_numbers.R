# Survey - favorite number between 0-9

# vector
favorite <- c(7,3,7,9,8,3,9,6,3,7,4,2,1,4,5)
str(favorite)

# handy function
length(favorite)

# subset - subscript
favorite[9]

# last element
# favorite[15]
favorite[length(favorite)]

# what does this mean?
fiver <- favorite > 5

# subsetting expression
favorite[fiver]

# idiom 
# logical subscript
favorite[favorite>5]

# which are true
which(fiver)

# numeric
favorite[which(favorite>5)]

# numeric subscript
favorite[c(1, 2, 12)]


############################################################
# Survey 2

# How many siblings does everyone have?
siblings <- c(2, 1, 1, 1, 1, 2, 4, 1, 0, 3, 6, 1, 1, 1, 0)

# how many people have one sibling only?
length(siblings[siblings==1])

# if somebody doesn't want to tell: missing value: NA
siblings <- c(2, 1, 1, 1, 1, 2, 4, 1, 0, 3, 6, 1, 1, 1, 0, NA)
length(siblings[siblings==1])

# missing values propegate!
siblings==1 # inlcudes missing value
NA == 1

siblings[siblings==1] # missing value is propagated

# more robust
siblings[which(siblings==1)]


# How many people have more than 2 siblings? 
length(siblings[which(siblings>2)])

# who has more than 2?
which(siblings>2)


###############################################################

# integer sequences
1:200
-5:10
10:-5

# bunch of values
numbers <- 1:30
numbers

# divisible by 7
14%%7
13%%7

# the number of values divisible by 7
length(which(numbers%%7 == 0))


#####################################

1:10
seq(from=1, to=10, by=1)
seq(from=1, to=10, by=0.5)
seq(from=1, to=10, by=2)

# by argument is negative!
seq(from=100, to=10, by=-2)

#####################################
manualOne <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
nicerOne <- rep(1, 25)

moreRepeat <- rep(c(5,4,3), 25)
moreRepeat[which(moreRepeat>3)]








