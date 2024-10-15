# Some additional functions/ comments on the coral-demo script
# 2024-10-11

# THe installed packages
installed <- installed.packages()

# accessing column and rownames
rownames(installed)
colnames(installed)

# replacing the names with numbers (not recommended, use meaningful names!)
colnames(installed) <- 1:ncol(installed)


# The match operator (%in%)

# which of the values in the first vector are present in the second?
one <- c("a", "a", "b", "d", "e", "a", "f")
two <- c("a", "d", "a", "g")

# binary logical
# one logical value for every value in the first vector
one %in% two

# this can be used as a subscript to return the actual values that are present in the second vector
# includes duplicates
one[which(one %in% two)]


# the is.null() binary predicate can be used to check whether an object is null or not
# if the object is not NULL, then the result will be FALSE
projDir <- installed
is.null(projDir)

# is.na() can be use to check whether any of the values of a vector are NA (missing)
# returns one logical value for every value in the vector
dummy <- 1:5
is.na(dummy)

# correct detection after replacement
dummy[2] <- NA
is.na(dummy)

# omit missing values from data
dummy[!is.na(dummy)]


# Why we need message() or something similar? Doesn't display
for(i in 1:5) 12
for(i in 1:5) message(12)

# Finding unique values
# example vector with repetitions
undummy <- c(1, 2,4, 1, 6, 5, 3, 1)

# values appear only once, in ORIGINAL order of appearance
unique(undummy)

# which values are duplicated(logical)
duplicated(undummy)

# the same as unique
undummy[!duplicated(undummy)]


# character operations
a <- "good"
b <- "boy"

# concatenate the two vectors
paste(a,b)

# one value from the two strings
length(paste(a,b))

# we can set the separator to whatever we want
paste(a,b,a,b, sep=";")
# paste0() is just paste( , sep="")
paste0(a,"  ", b,"!", "You are a ",a," ", b )


# example correlations

# two very large random samples (n=50000) from a standard normal distribution N(mu=0,sigma=1)
x<- rnorm(50000)
y <- rnorm(50000)
#scatterplot
plot(x,y)
# correlation coefficient will be close to 0 but not exactly 0
cor(x,y)

# the smaller the samples the more likely it is that repeating the code above results in higher correlations
# repeate these 4 lines until you can get a correlation that is higher than 0.3 (its absolute value)
x<- rnorm(10)
y <- rnorm(10)
plot(x,y)
cor(x,y)

# correlation testing provides information on how likely it is that the true correlation is actually 0
cor.test(x,y)
