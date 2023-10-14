# logical operations

# logical values
TRUE
FALSE
# by default these resolve to TRUE and FALSE
T
F

# write out TRUE and FALSE!!!
T <- 14
T

####
# logical operator
12 == 34
12 == 12
12 == 12.0 # specific to R: this TRUE

# logical operators work on character values
"a" == "a"
"a" == "b"
"a" != "b"

# comparison of numeric data
12 > 6

# Vectorization: logical operations between vectors
# cf. cube function
x <- -20:20
x ^ 3

# vectorized comparison
x > 0
