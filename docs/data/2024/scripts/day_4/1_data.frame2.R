# Revisiting data.frames
# 2024-10-10

# vectors with different types
id <- 1:5 # numerics
val <- c(6, 4, 3, 2, 8) # numerics
char<- letters[id] # characters from the letters object
logic <- val > 5  # logical vector

# if vectors have the same length, they can be combined into a data.frame
dat <- data.frame(
  id,
  val,
  char,
  logic
)

# if an object needs to be removed form the global environemnt, that can be done with:
rm(logic)

# data.frames can be viewed as a spredsheet
View(dat)

# and the structure can be inspected with
str(dat)

# if a non existing column is queried, that will return a NULL
dat$slhdfjadsf

# We looked at subsetting the data
# a subset of the table where the id is greater or equal than 3
# # this is the recommended solution
subDat <- dat[which(dat$id > 3),]

# in nice cases like the one we are looking at, this works just as fine, but
# not when dat$id includes missing values
dat[dat$id > 3,]

# the whole process in steps
# 1. access the column that you want to base the query on
dat$id
# 2. do a logical evaluation of the vector
dat$id > 3
# get the indices where this is TRUE
which(dat$id > 3)

# Replacement happens when we "assign to a subset"
# create a new vector
x<- id^2

# the third value is getting replace with -9
x[3] <- -9

# illustrating why the which() is necessary:
# accessing the column
dat$id

# replacing the second value of the column with a missing value
dat$id[2] <- NA

# without which(), this expression includes a 'messy' row, which is nothing but missing values
dat[dat$id > 3,]

# with which this does not happen:
subDat <- dat[which(dat$id > 3),]

# show with an example column
subDat$char



