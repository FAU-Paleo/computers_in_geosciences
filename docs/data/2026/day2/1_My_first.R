# calculating 9
3   +   3

# this is a multi-line comment
# continued  here
5 *5

# multi-line maths
3  +
  
  5
  
### more maths
6 + 2
7 - 2
6*3
63/9
61/9
2/3

# modulus (remainder of integer division)
8 %% 5

#exponentiation
4^3

# multiple operations in the same line
3 + 5 + 6 + 8
6 - 3 * 5 
(6- 3)*5

# reuusing with copying
(3 + 5 + 6 + 8) * 3

# assignment
mybox <- 56
myresult <- 3 + 5 + 6 + 8

# showing the variables
mybox
myresult

# reusing variables
mybox + myresult

# the same as if they were just numbers
myresult + 3

# not possible!
# 3 <- 12 * 4

# variable names cannot start with a number
# 3trus <- 34

# but this is fine
tru3 <- 45

# also cannot contain a dash, R would try to parse it
# my-variabe <- 5

# variable names are case-sensitive!
a <- 23
A <- 10

# This is not defined yet!
# Mybox


# Every line of R code is actually using a function internally
# The exponentiation function
exp(1)
exp(0)
exp(2)

# functions can be recognized with parentheses following a regular word
# text()

# natural logarithms
log(10)
log(1)

# Negative logarithms are not defined mathematically.
# R represents these with NaN: Not a Number
# this warnining is intentional! ALWAYS READ WARNING MESSAGES!
log(-5)

# the return value of a function can be assigned to a variable
# similar to the result of an operator
awesome<- log(3)
 
# they can be used the same way, as a value
awesome*3
exp(awesome)

# the help file of a function can be accessed like this
?exp

# this function has x as a parameter/argument
# which can be explicitly given like this
log(x=3)

# if the names of the parameters are not given, then the
# order will be used
log(3)

# if they are given then the order does not matter
log(x=3, base=3)
log(base=3, x=9)

# similar to operators
log(base=3, 
    
    
    
    x=9)


