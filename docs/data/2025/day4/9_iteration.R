#############################################################
# Computers in geoscience course - Day 4

# read in the data file
stages <- read.csv(
  "C:/Users/Adam/Desktop/computers_course/data/stages.csv", 
  sep=";")

# calculate how long the Permian period is!
permian <- stages[which(stages$system == "Permian") , ]
sum(permian$dur)

# the top and bottom ages
# just the first stage
permian$bottom[1]-permian$top[1]
max(permian$bottom)-min(permian$top)


# calculate how long the Mesozoic era was!
# A logical vector that defines the Mesozoic rows
bMesozoic <-
  stages$system == "Triassic"| 
  stages$system == "Jurassic" |
  stages$system == "Cretaceous"

# Not the same! - actually wrong
# stages$system ==c("Triassic", "Jurassic", "Cretaceous")
# Correct: match operator
stages$system %in% c("Triassic", "Jurassic", "Cretaceous")

# a subset of the mesozoic
mesozoic <-  stages[which(bMesozoic), ]
sum(mesozoic$dur)

################################################################################
# Iteration - "loops"
# THe length of all periods?

# the lenght of one period
permian <- stages[which(stages$system == "Permian") , ]
sum(permian$dur)


# the length of many periods, manually... - booo!
paleozoicSystemDuration <- c(
  sum(stages[which(stages$system == "Cambrian") , "dur"]),
  sum(stages[which(stages$system == "Ordovician") , "dur"]),
  sum(stages[which(stages$system == "Silurian") , "dur"]),
  sum(stages[which(stages$system == "Devonian") , "dur"]),
  sum(stages[which(stages$system == "Carboniferous") , "dur"]),
  sum(stages[which(stages$system == "Permian") , "dur"])
)

# make a variable from the thing that changes
focalSystem <- "Jurassic"
sum(stages[which(stages$system == focalSystem) , "dur"])


###########################################################################
# for loops!

# for( definition of the loop)
# in the parens.:
# - 1. variable i
# - in
# - vector
message("Hello")

# the body of the loop
for(i in 1:10) 
  message(i)


# what it does is this:
i<- 1
message(i)
i<- 2
message(i)
i<- 3
message(i)
# ...
i<-10
message(i)


# the vector can be anything
for(i in 20:-5) 
  message(i)

# you can do multiple lines in the loop, they have to be
# 'tied together' with the braces
for(i in 1:10) {
  message(i)
}

# double i in every loop before messaging i
for(i in 1:10) {
    doubleI <- i*2
    message(doubleI)
}

# Write a for loop to message the system names in sequence!
# the system names
for(i in unique(stages$system)) message(i)
  
# Write a for loop to message the duration of every period/system!
# HINT: combine the for loop above with this previously developed chunk:  
focalSystem <- "Jurassic"
sum(stages[which(stages$system == focalSystem) , "dur"])

# good, but very long ...
for(focalSystem in unique(stages$system)) message(sum(stages[which(stages$system == focalSystem) , "dur"]))


# refactoring for readability
################################################################################
# Messaging the system durations

# the systems
systems <- unique(stages$system)

# iterate for all systems
for(focalSystem in systems) {
  # the duration of the systems
  systemDuration <- sum(stages[which(stages$system == focalSystem) , "dur"])
  
  # the display / printing
  message(systemDuration)
}
################################################################################

# you can always debug if you manually set the changing variable
focalSystem <- systems[1]

for(i in 1:length(systems)) message(systems[i])


# How can we aggregate more values in a vector?
durations <- NULL
durations <- c(durations, 20)
durations <- c(durations, 18)



################################################################################
# Calculating and storing the system durations

# The systems
systems <- unique(stages$system)

# empty placeholder
#durations <- NULL
durations <- numeric() # a bit more, info about the type

# iterate for all systems
for(focalSystem in systems) {
  # the duration of the systems
  systemDuration <- sum(stages[which(stages$system == focalSystem) , "dur"])
  
  # storing
  durations <-c(durations, systemDuration)
}

# add names for easier legibility!
names(durations) <- systems
################################################################################

################################################################################
# Adam's preferred way

# The systems
systems <- unique(stages$system)

# empty placeholder
durations <- rep(NA, length(systems))
names(durations) <- systems

# iterate for all systems
for(i in 1:length(systems)){
  # the actual system name character value
  focalSystem <- systems[i]
  
  # the duration of the systems
  systemDuration <- sum(stages[which(stages$system == focalSystem) , "dur"])
  
  # storing
  durations[focalSystem] <-systemDuration
}

################################################################################
# Exercise: Get a vector with the bottom boundaries of every system(period)
# the period names should be in the names attribute of the values!

# 1. select a random period
"Jurassic"

# 2. get the bottom boundary age for that period
max(stages[which(stages$system=="Jurassic"),"bottom"])

# 3. list out all the period (unique)
systems <- unique(stages$system)

# 4. write a for loop to the code in 2. for all periods
# empty placeholder
bottoms <- rep(NA, length(systems))
names(bottoms) <- systems

# for every system
for(i in 1:length(systems)){
	# define a focal system
  focalSystem <- systems[i]

	# grab the bottom boundary
  systemBottom <- max(stages[which(stages$system==focalSystem),"bottom"])

	# store it!
  bottoms[focalSystem] <- systemBottom
}

