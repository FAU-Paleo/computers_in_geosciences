
# two vectors
id  <- 1:5
animal <- c("cat", "dog", "turtle", "duck", "parrot")

# create a data frame
dat <- data.frame(id, animal)


# subsetting
# matrix-stlye (2nd row, 2nd column)
dat[2,2]

# the second column
dat$animal # list-style
dat[,2] # matrix-style
