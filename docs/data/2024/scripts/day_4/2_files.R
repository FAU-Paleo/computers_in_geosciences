# Working with data.frames in files
# 2024-10-10

# ALl functions that read tabular data in text files work with this
# You can find relevant functions here
?read.table

################################################################################
# IMPORTANT:
# This will not work on your computer! This is the example code
# that Adam used on his virtual machine during the class. You have to
# set these to the absolute paths on YOUR COMPUTER!

# load in files with absolute paths
# corals <- read.csv("C:/Users/Adam/Desktop/paleo_msc/semester_1/computers course/day_4/data/corals.csv")
# stages <- read.csv("C:/Users/Adam/Desktop/paleo_msc/semester_1/computers course/day_4/data/stages.csv", sep=";")

# setting a working directory
getwd() # pwd in bash

# Shortening the repeating paths: breaking them up to a working directory
# and a bunch of relative paths. This script assumes that you have the entire directory properly set up.
# This path needs to the directory in which your 'data' directory is
setwd("C:/Users/Adam/Desktop/paleo_msc/semester_1/computers course/day_4") # cd in bash
getwd()
################################################################################

# import with relative paths
corals <- read.csv("data/corals.csv")
stages <- read.csv("data/stages.csv", sep=";")

# Exercise let's find the system of the "Hirnantian" stage!

# first, we have to find the column in which the stage names are. This is the 'stage' column
stages$stage

# now we need to find in which row this stage actually is.
# Following previous examples, it can be done like this.
# This statement will return the row index where the stage is "Hirnantian"
which(stages$stage == "Hirnantian")

# accessing the entire row, if we use this index number as a row subscript
stages[which(stages$stage == "Hirnantian"),]

# Get the target column: "system"
# Better solutions
stages$system[which(stages$stage == "Hirnantian")]
stages[which(stages$stage == "Hirnantian"),"system"]

# Poor
stages[which(stages$stage == "Hirnantian"),2]

# Even worse: do not hard code row and column indices, unless you have no options.
# Always use the NAME of the column or row, whenever possible
stages[stages$stage == "Hirnantian",2]

# Horrible, totally cryptic
stages[stages[,4] == "Hirnantian",2]

# subset() function. Do not endorse poor habits. Look for the warning in ?subset
# subset(stages, stage == "Hirnantian", select=system)

########################################----------------------------------------

# The table() function is frequently use to tally the number of times a value
# occurs in a vector

#  Trivial case, everything occurs once
table(1:10)

# using on a vector with repetitions
# The values of table are going the be the number of times that the value occurs.
# The names of the values is going to indicate which value is it.
table(c(1:3, 1:2, 1:5))

# table() can be used excellently in practical data analysis.
# How many stages are there in the systems? Since the table's main entity is the stage
# (every row indicates a stage), the number of times when the the name of the system occurs
# will be the the number of stages in a system.
table(stages$system)

########################################----------------------------------------
# Display the names of the stages that systems start with (i.e. the first stage in the systems)

# Pre-requisite no. 1 - Displaying things
# i.e. printing them
message("Hello world")

# How can we print the names of all stages?
# manuall repetition
message(stages$stage[1])
message(stages$stage[2])
message(stages$stage[3])
message(stages$stage[4])
message(stages$stage[5])

# Pre-requisite no. 2: iteration - the for loop
# repeating the same thing 5 times
for(i in 1:5) message(stages$stage[1])

# the simples for loop
for(i in 1:5) message(i)

# i takes the values of the vector that follows the 'in' keyword
for(i in 11:15) message(i)

# displaying the first 5 stage names
for(i in 1:5) message(stages$stage[i])

# displaying all 95 stage names (hard coding 95 is not optimal)
for(i in 1:95) message(stages$stage[i])

# The number of rows  is an attribute of the stages object
# we can access the number of rows and columns with these two functions
nrow(stages)
ncol(stages)

# Repeating the previous solution - without hard coding values
# note that all of these steps are based on the same object! (stages)
for(i in 1:nrow(stages)) message(stages$stage[i])


# Pre-requisite no. 3: conditionals - if

# setting up demonstration example
temperature <- 40 # current temperature
threshold <- 15 # decision point

# is it cold? If TRUE, yes, if FALSE, not
cold <- temperature <= threshold

# if requires a single logical value, then it will execute either the first or the second command.
if(cold) message("Bring a jacket!") else message("Nice!")

# If you need multiple instructions, this is the template:
# if(<logicalvalue>) <block of code> else <block of code>

# Blocks in R are indicated with the braces
{}

# the same instruction as before
if(cold) { message("Bring a jacket!") } else { message("Nice!") }

# this typically is written out on separate lines
if(cold){
	message("Bring a jacket!")
} else {
	message("Nice!")
	swimSuit <- "Consider bringing swimsuit with you!"
	message(swimSuit)
}

# To get the result for what we want (first stage in a system), we will assume that the first
# stage is starting a system (still in the Ediacaran)
message(stages$stage[1])

# Then we need to evaluate every stage in a sequence (indicating an iteration). Assuming that the
# stages are ordered (and they are!), if the stage's system is note the same as the previous one,
# then we have a stage that starts a system. The evaluation starts with the 2nd stage.

# 2nd stage
# is the focal stage a first stage in its system (its system is the samea s the previous one)
firstStage <- stages$system[2] != stages$system[2-1]
# then display
if(firstStage) message(stages$stage[2])

# 3rd stage
firstStage <- stages$system[3] != stages$system[3-1] 
if(firstStage) message(stages$stage[3])

# 4th stage
firstStage <- stages$system[4] != stages$system[4-1] 
if(firstStage) message(stages$stage[4])

# 5th stage
firstStage <- stages$system[5] != stages$system[5-1] 
if(firstStage) message(stages$stage[5])


# Note that this chunk of code is very repetitive. Iteration requires that the code be exactly the same.
# This can be acieved if the changing parts of the code can be traced back to a single changing variable (i),
# that changes in every iteration. Then the code can be exactly the same.

# 6 stage
i <- 6 # single thing that changes
firstStage <- stages$system[i] != stages$system[i-1] 
if(firstStage) message(stages$stage[i])

# 7th stage
i <- 7
firstStage <- stages$system[i] != stages$system[i-1] 
if(firstStage) message(stages$stage[i])

# The same thing with a for loop - for all the stages:
# the first stage will be starting a system
message(stages$stage[1])

# iterating for stage after the second
for(i in 2:nrow(stages)){
  
	# is it a stage starting a system
	# system not the same as previous
	firstStage <- stages$system[i] != stages$system[i-1]
  
	# if it is print it out - also with some more messages (using a block of code
	if(firstStage){
		message("Wonderful!")
		message(stages$stage[i])
	}
}

# not meaningful!
stages$system[0]

# Creatig directories in R - you can try to repeat what we did in bash (create a directory for)
# every coral genus by iterating dir.create() with a for loop
# dir.create()

################################################################################
# Simple plots - very quickly

# the X scared function
x <- -10:10
squared <- x^2

# default scatterplot - requires x and y to have the same length
plot(x=x,y=squared)
# red filled circles, 3 times larger than default
plot(x=x, y=squared, col="red", pch=16, cex=3)
# setting the limits of the plot
plot(x=x, y=squared, col="red", pch=16, cex=3, xlim=c(-20,20))

# plotting parameters can be accessed here
?par

