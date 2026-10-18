# Computers in geosciences course: day 3
# Script written during the class: working iteration

# in general, we try to avoid repetitive tasks
# instead of this 
c(1,1,1,1,1,1,1,1,1)

# we can do this
rep(1,9)

# becomes handy when the repetition is large
large <- rep(1,10000)

# this can be used to define a large number of calculations
large + 3

# but not everything... More complex tasks have to be manually repeated
# like this:
message("Awesome!")

# this is not the same
message(rep("Awesome!", 10))


# as this
message("Awesome!")
message("Awesome!")
message("Awesome!")
message("Awesome!")
message("Awesome!")
message("Awesome!")
message("Awesome!")
message("Awesome!")
message("Awesome!")
message("Awesome!")
message("Awesome!")

# the chunk above can be repeated like this
for(i in 1:10) message("Awesome!")


# in practice it usually looks more like this
# the braces indicate a block, which means that
# the entier section of code is run at the same time
for(i in 1:10) {
  message("Awesome!")
}

# normally in loops a changing variable is used
# this displays the changing variable
for(i in 1:10) {
  message(i)
}

# We frequently have multiple lines of code in a repeating block
for(i in 1:10) {
  message(i)
  message("One loop is done.")
}

# consider this calculation
ones <- rep(1, 10)
ones

# and add a sequence to it
ones + 1:10

# Let's recreate this operation with a for loop
# this is what the loop is using 
ones <- rep(1, 10)

# the change variable is different in every iteration
for(change in 1:length(ones)){
  ones[change] <- ones[change] + change
}

# run this line by line, by manually setting change to be 1,2, etc!
change <- (1:length(ones))[1]
ones[change] <- ones[change] + change

change <- (1:length(ones))[2]
ones[change] <- ones[change] + change

change <- (1:length(ones))[3]
ones[change] <- ones[change] + change


# We can use for loops together with data items
stages <- read.csv("C:/Users/Adam/Desktop/computers_course/data/stages.csv", sep=";")
str(stages)

# a message showing every stage name
for(i in 1:length(stages$stage)) message(stages$stage[i])

# the same, the guiding vector is defined slightly differently
for(i in 1:nrow(stages)) message(stages$stage[i])
