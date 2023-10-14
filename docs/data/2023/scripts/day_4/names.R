# Introduction the names attribute

# The names attribute
master <- c(1, 10)

# the names of an unnamed object
names(master)

# replacement of names
# names are always character
names(master) <- c("geography", "paleo")
str(master)

# character subscript
master["geography"]
master["paleo"]

# it does work
# gives missing values
master["female"]

