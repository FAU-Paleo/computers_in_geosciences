# Script written during the class: data frame
# Computers in geosciences course: day 3

# Tables
 
# Getting the data from the previous example
favorite <- c(2,7,6,7,7,6,3,7,3,8,4,9,8,6,8,8)

# whose favorite numbers they are
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


# we can tabulate the elements
tab <- table(favorite)

# this is a table class object
str(tab)


# behaves like a named numeric vector, you can access
# the frequency information character subscripts
# How many times does 8 occur in the favorite vector?
tab["8"]

# Which is the eighth value?  Not the same!!!
tab[8]

# when all values are unique, everything is one in a table.
table(people)

####################################################################
# data frames: are actual 
####################################################################

# create a 2d data frame
df <- data.frame(people, favorite)
df

# columns must have the same length
# this gives an error
#dummydf <- data.frame(
#  1:3,
#  c("one", "two")
#)

# columns must have the same length
dummydf <- data.frame(
  1:3,
   c("one", "two", "three")
)

# the names are created automatically
dummydf

# nicer names
dummydf <- data.frame(
  number = 1:3,
  text = c("one", "two", "three")
)

# going back to the previous data
df

# we can see it in browasable, taublar form like this:
View(df)

# add an additional variable, there can be as many as you want
paleo <- c(F,T,T,F,F,F,F,T,T,T,T,F,T,F,F,NA)
dfext <-cbind(df, paleo)

# check it out
dfext

# now it has a third, logical vector
str(dfext)

# fast way of accessing columns (list-style) $
dfext$people

# and then we can find specific values in there
# the syntax defines a vector, it can be subsetted the same way.
dfext$people[6]
dfext$people[1:3]


# matrix-style subsetting
# ROWS first, COLUMNS second
# single comma indicates , 2 dimensions
# dfext[ , ]
# 7th row, first column
dfext[7, 1]

# firts 5 rows, specific column
# when a single column is defined, the result becomes a vector
dfext[1:5, 1]
dfext[1:5, 2]
dfext[1:5, 3]

# two columns: this makes the result remain a data.frame
dfext[10, 1:2]
dfext

# there are no dupliates in column names and row names
# it is quite useful to access values based on the names
dfext[3, "favorite"]

# pay attention to the commas, when you want all the
# rows or all the columns, that part of the subscript should remain empty!
# All rows, second column
dfext[ ,2 ]
# All commas, second row
dfext[ 2, ]

# see that this is data.frame still
minidf<- dfext[ 2, ]
str(minidf)

# Give me names of the people that are paleo master, use dfext!
df$people[which(dfext$paleo)]








