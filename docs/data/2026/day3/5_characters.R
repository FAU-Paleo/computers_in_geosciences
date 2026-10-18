# Script written during the class: characters
# Computers in geosciences course: day 3

# Example number (integer)
23

# Example number (double-precision floating point decimal)
23.45

# logical
TRUE
FALSE

# a character value, aka a single character string
"variable"

# you can see the lcass with str.
str("variable")

# character vector
c("string1", "string2")

# a single characters (not strings)
"k"
"1"
"?"
"ä"
"'"

# character string a single character value in a vector
"űáű"
'adam'

# character vector
c("u", "asdf")

# you can name and operate with them the same ways as with numbers and logicals
animals <- c("dog", "cat")

# example numeric subscrtips
animals[1]
animals[c(1,1,1,1)]

###########################################
# Favorite numbers of people
favorite <- c(2,7,6,7,7,6,3,7,3,8,4,9,8,6,8,8)

# how many people have exactly 2 as their favorite number?
length(which(favorite == 2))

# Adam's favorite
favorite[length(favorite)]

# how do we identify which number belongs to whom?

# we define names, first, a character vector
people <- c(
"Jessica",
"Sanji",
"Joel",
"Max",
"Florian",
"Ifi",
"Robin",
"Antonios",
"Zoe",
"Lorenzo",
"Marshall",
"Tim",
"Ada",
"Jakob",
"Miriam",
"Adam")

# the names of favorite initially are NULL
names(favorite)

# special placeholder value, indicates the absence of information
NULL 
NA
# compare it with a missing value, which means something is there, but it is undefined!
length(NA)
length(NULL)

# replacement: when we have assignment into something
names(favorite) <- people 

# the names are now there as attributes
favorite

# the class also changed
str(favorite)

# names can only be characters
# now we can see what they are
names(favorite)

# compare the output for names of another vector
# every vector can be named!
names(people) <- people
people

# going back to favorite numbers
# if names are assigned, we can use character subscripts like this
# to find values
favorite["Florian"]

# multiple character values can be used of course
favorite[c("Jakob", "Miriam", "Adam")]

# delete the names
names(people) <- NULL
################################################################################
# About replacements
################################################################################

# R Dynamically typed language:
# variables can be reassigned entirely
# and you can change the types as well
a <- 45
a <- 34
a <- "a character"

# another example
dummy <-1:10 
dummy
dummy <- TRUE
dummy <- 5:9
dummy

# replacement means that an object can be replaced partially
# extracting the third value
dummy[3]
# replacing the third value
dummy[3] <- -8
dummy

# the last value of a vector - get this dynamically with length
favorite
favorite[length(favorite)]
# numeric subscript for replacment
favorite[length(favorite)] <- 5

# replacement with character strings
favorite["Adam"] <- 2

# rewriting the last value of the names attribute
names(favorite)[length(favorite)] <- "Jakob"

# now we have two Jakob-values
favorite

# This is a limitation of this storage system.
# Referring to the name returns only the first value that was occurring
favorite["Jakob"]
# try not to have duplicates in names!!!
# A name should occurr only once


# Character values are displayed by R in different ways
# This is the show method (when you type things into the console)
"This is a character value"

# you can use functions to display things nicelly, e.g.
message("This is a character value")
# has no return value!


