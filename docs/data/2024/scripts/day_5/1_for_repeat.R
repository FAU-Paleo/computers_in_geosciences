# Repeating the basics of the for loop + nested loops
# 2024-10-11

# THe for loop again
# needs a vector that it is based on
control <- rep(1, 5)
for(i in control) message("Wonderful!")


# this can be anything
control <- c("dog", "cat", "snake", "turtle", "owl")

# usually for loops are written out on multiple lines
for(i in control){
  message(i)
}

# what is happening inside a loop. Block forces the execution to happen after the block is finished,
# so this display looks the same as in a loop
{
i <- control[1]
message(i)
i <- control[2]
message(i)
i <- control[3]
message(i)
i <- control[4]
message(i)
i <- control[5]
message(i)
}


# The example's result is the same as that of this.
# It is very powerful to use the index of the object as the chaning variable.
# This way the index can be used as the number of the loops
for(i in 1:length(control)){
  message(control[i])
}

# in the example above, in every iteration i is assigned these values
i<- (1:length(control))[1]
i<- (1:length(control))[2]


################################################################################
# Nested for loops can be used to elaborate the combinations of values in two vectors.
# This is also what you would use to access every element in a matrix.

# Let's assume that we have two vectors. We need to get all combinations
outer <- 1:5
inner <- 11:14

# Step 1. Using a single for loop and hard coding the lines that display the
# values of the second vector
for(i in outer){
  message("Entering outer loop ", i)
  message(i, " - ", inner[1])
  message(i, " - ", inner[2])
  message(i, " - ", inner[3])
  message(i, " - ", inner[4])
}


# This would already not work if the vector inner is very long.

#####################################
# Step 2. note that we can make these repeating instructions exactly the same
# with slight modificiations
outer <- 1:5
inner <- 11:14

for(i in outer){
  message("Entering outer loop ", i)
  
  j <- 1
  message(i, " - ", inner[j])
  j <- 2
  message(i, " - ", inner[j])
  j <- 3
  message(i, " - ", inner[j])
  j <- 4
  message(i, " - ", inner[j])
}

#####################################
# Step 3. Replace the repeating code with another for loop
# to indicate when we are finishing the inner loops check out the printout of this chunk of code!
outer <- 1:5
inner <- 11:14

# outer for loop
for(i in outer){
  
  # indicate entry of next loop
  message("Entering outer loop ", i)
  
  # inner for loop
  for(j in 1:length(inner)){
    # what we want
    message(i, " - ", inner[j])
  }
  
  message("We exited the inner loop!")
}


