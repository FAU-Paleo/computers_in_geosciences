# Computers in geosciences course: day 4
# Script written during the class: practicing with stages
 
# read in the stages.csv file
stages <- read.csv("C:/Users/Adam/Desktop/computers_course/data/stages.csv", sep=";")
View(stages)

# isolate the stage column 
stages$stage

# columns for periods/systems (full names)
stages$system

# omits duplicates
unique(stages$system)
length(unique(stages$system))

# countings
sysTab <- table(stages$system)

# a single value/number of how many stages there are in the Cretaceous?
sysTab["Cretaceous"]

# compare
unique(stages$system)
names(sysTab)
# the difference is the order!

# simple sorting
unSys <-unique(stages$system)

# sort take the input vector and reorders it
sort(unSys, decreasing =TRUE )
sort(stages$dur, decreasing=TRUE)


# the order function is more useful, it describes how to execute the ordering
# using subscripts
# just the indices
order(unSys)


# when we use them as subscripts
unSys[order(unSys)]

# we ge back the sorted version
sort(unSys)

# this is great, because we can use this to sort other vectors based on the order of this vector

# create two new vectors 
# just the names of the stages
st <- stages$stage

# just the durations
du <- stages$dur
  
# order the stage names by their durations, starting with the shortest stage

# reordering the durations themselves
du[order(du)]

# reordering the stage names by the durations
st[order(du)]

# the same as doing this... (example 5 subscripts)
st[c(95, 26, 16, 30, 22)]

# we can reorder entire tables with this logic
stOrdered <- stages[order(stages$dur),]

# reorder the stages data frame, alphabetically with the stage names A first Z last
nameOrdered <- stages[order(stages$stage), ]

# sanity checks on the result: store the result in an object, and use View()
View(nameOrdered)

