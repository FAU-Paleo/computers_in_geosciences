# Computers in geoscience course - Day 3

# NOTE that you need to adjust the paths to work on your computer!

# read in the data files separately
stages <- read.csv(
  "C:/Users/Adam/Desktop/computers_course/data/stages.csv",
  sep=";")

# read in the corals.csv file, call the object corals!
corals <- read.csv(
  "C:/Users/Adam/Desktop/computers_course/data/corals.csv")
#


################################################################################
# With a working directory
################################################################################
# working directory
getwd()

# setting the working directory
setwd("C:/Users/Adam/Desktop/computers_course/")

stages <- read.csv(
  "data/stages.csv", 
  sep=";")

# read in the corals.csv file, call the object corals!
corals <- read.csv(
  "data/corals.csv")

################################################################################
# The number of records the PBDB coral subset

# how many rows are there with every stg entry? (utility function!)
stgTab <- table(corals$stg)

# Visualize this information!

# 1. transform the table into a data.frame
as.numeric(names(stgTab))

stgDF <- data.frame(
  stg=as.numeric(names(stgTab)),
  occ=as.numeric(stgTab)
)

# 2. JOIN it with the timescale data.frame -merge()
occTS <- merge(stages, stgDF, by="stg")

# plot - kid of ugly...
plot(x=occTS$mid, y=occTS$occ, type="l", xlim=c(200,0))


# we have packages to do specific-things
# install.packages("divDyn") # You don't need to run this every time!
# rerunning will reinstall the package
# It is good idea to reinstall them from time to time, in case
# an update is available

# attaching the package -> you can start to use it from now
library("divDyn")

#timescale plotting function
?tsplot
# An empty canvas
tsplot(stages, boxes="sys", shading="sys", xlim=c(250, 0), ylim=c(0,8000))
# the information as a line
lines(x=occTS$mid, y=occTS$occ, lwd=2)
