# Computers in geosciences course: day 4
# Script written during the class: practicing with penguins

# YOU HAVE TO UPDATE THE PATHS TO WHATEVER YOU HAVE ON YOUR COMPUTER

# read in the penguins.tab file!
read.csv("C:/Users/Adam/Desktop/computers_course/data/penguins.tab")
# does not really work

# the separator is a tab, ie. "\t"
penguins <- read.delim("C:/Users/Adam/Desktop/computers_course/data/penguins.tab")
View(penguins)

# this works just the same!
penguins <- read.table("C:/Users/Adam/Desktop/computers_course/data/penguins.tab", 
                       sep="\t", header=TRUE)

# 1. How many different species are there in the dataset? (a single numeric value)
length(unique(penguins$species))

# 2. How many islands are sampled in the dataset? (a single numeric value)
length(unique(penguins$island))
penguins$island[1] <- NA
length(table(penguins$island))

# 3. How many penguins were caught in each species? 
# (one numeric value per species, named with the names of the species)
table(penguins$species)

# 4. What is the average body mass of the Chinstrap penguins?  
# (a single numeric value)
# 1. isolate the records in Chinstrap penguins (data.frame specific to Chinstraps)
chin <- penguins[which(penguins$species == "Chinstrap"), ]

# 2. the average body mass in the data.frame
mean(chin$body_mass_g)

# could be exectued in a single go
mean(penguins[which(penguins$species == "Chinstrap"), "body_mass_g"])

################################################################################
# Afternoon
# 1. A extract a subset of data that pertains to Biscoe island! (data.frame)
biscoe <- penguins[which(penguins$island == "Biscoe"), ]

# 2. Count how many male penguins were found on the island (all species together)!
# (A single number)
# Solution 1. table
table(biscoe$sex)["male"]

# Solution 2. simple subset
length(which(biscoe$sex=="male"))

# Solution 2. with nrow 
biscoemale <- biscoe[which(biscoe$sex=="male"), ]
nrow(biscoemale)

# The empty quotes are perfectly valid values.
# Some datasets use this instead of missing values to indicate unavailable information
""

# Counting the margins of the data.frame
# number of rows
nrow(penguins)
length(penguins$species)

# number of columns
ncol(penguins)
length(penguins)

# Calculating the Adelie penguins' body size
# Make the species identifier
sp <- "Adelie"

# 1. isolate the records in Chinstrap penguins (data.frame specific to Chinstraps)
chin <- penguins[which(penguins$species == sp), ]

# 2. the average body mass in the data.frame
mean(chin$body_mass_g, na.rm=TRUE)

# How to cal

#############################
# We define a loop from here
############################
# Get the mean body mass of all penguins species
# get a vector the all the species names
allsp <- unique(penguins$species)

# WE KNOW how many iterations are done
res <-  rep(NA, length(allsp))
names(res) <- allsp

for(i in 1:length(allsp)){
  # the current species in the loop
  sp <- allsp[i]
  
  # 1. isolate the records of the current species
  spdf <- penguins[which(penguins$species == sp), ]
  
  # 2. the average body mass in the data.frame
  res[i] <- mean(spdf$body_mass_g, na.rm=TRUE)
}

res

################################################################################
# Plotting from 14:25
################################################################################

# There are two main approaches to plotting
# 1. Base R plotting (S-style), verbose but very flexible, requires more work.
# 2. Grid-based plotting (ggplot2), by default nicer looking, faster, but more rigid.
 
# histogram from a vector
hist(penguins$body_mass_g)

# create a new window and put things in there
x11()
hist(penguins$body_mass_g)

# make a histogram using the bill length!
# breaks set the target number of divisions
hist(penguins$bill_length_mm, breaks=40)

# making a bloxplot from a variable
boxplot(penguins$bill_length_mm)


# These are all high-level plotting functions. They create new plots, deleting
# the previous one.
# high-level scatterplot
plot(
  x=penguins$bill_length_mm, 
  y=penguins$bill_depth_mm
)

plot(x=penguins$bill_length_mm)

# The concept of function 'overloading': use the same name to describe the
# general process, but the exact implementation is dependent on the class
# of input objects.
# plot: generic function
# plot(x=numeric): one method (x-axis becomes the index, 'x' input is shown on the y axis!)
# plot(x=numeric, y=numeric): different method (x is the x coordinate, y is the y coord)


# This is base, or S-style plotting.
# customization happens using standard arguments
# ?par
# col sets the color of the plotted data, can be a number
plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm, col=6)

# a pre-defined string
plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm, col="burlywood3")

# or html/hexadecimal color: RRGGBB (0-f)
plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm, col="#17E3C4")

# also with transparency:RRGGBBAA (0-f)
plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm, col="#17E3C455")

# pch sets the character for the plotting (16 is filled circle)
plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm, col="#17E3C488", pch=16)

# cex controls the size of the plotted characters, 1 is default, proportionally scaled
plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm, cex=2)

# xlim sets the plotting limits in the x dimension
plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm, xlim=c(35, 50))

# xlim sets the plotting limits in the y dimension
plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm, ylim=c(10, 25))

# xlab and ylab control the axis labels
plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm,
     xlab="Bill length (mm)", ylab="Bill depth (mm)")

# axes controls whether the main axis components be plotted or not
plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm, axes=FALSE, 
     xlab="Bill length (mm)", ylab="Bill depth (mm)")

# these could be added manually with these (1:bottom, 2: left)
axis(1)
axis(2)
box()
# these are low-lever graphical functions, which can be used to add things
# on an existing plot.

################################################################################
# We very frequently plot only the background and visualize data separately.
# if the color is set to missing, nothing will be plotted, but the plot will
# be set up properly. Actually plot uses a low-level graphical function points.

# plot without data
plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm,
     xlab="Bill length (mm)", ylab="Bill depth (mm)", col=NA)
points(x=penguins$bill_length_mm, y=penguins$bill_depth_mm, pch=16)

################################################################################
# Visualize the different species using colors! This can be done in different ways.
# This is the most TRANSPARENT (not the shortest!).
 
# Create an empty plot
plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm,
     xlab="Bill length (mm)", ylab="Bill depth (mm)", col=NA)

# 1. figure out  just to draw the point on an existing plot
chin <- penguins[which(penguins$species == "Chinstrap"), ]
points(x=chin$bill_length_mm, y=chin$bill_depth_mm, pch=16, col="red")

# visualize the other species too! 
# Adelie: blue, rectangles, 
adelie <- penguins[which(penguins$species == "Adelie"), ]
points(x=adelie$bill_length_mm, y=adelie$bill_depth_mm, pch=15, col="blue")

# Gentoo: green, triangles
gentoo <- penguins[which(penguins$species == "Gentoo"), ]
points(x=gentoo$bill_length_mm, y=gentoo$bill_depth_mm, pch=17, col="green")
cor.test(x=gentoo$bill_length_mm, y=gentoo$bill_depth_mm)

# position: x
# vector of things we want to show
legend("bottomleft",
	legend=c("Chinstrap", "Gentoo", "Adelie"),
	col=c("red", "green","blue"),
	pch=c(16, 17, 15)         
)

# Additional lower level functions
# horizontal lines
abline(h=18)

# vertical lines
abline(v=50, col="pink", lwd=10) # line width
abline(v=50, col="orange", lwd=10, lty=2) # line type
abline(v=45, lty=2) # line type


# a rectangle
rect(xleft=40,xright=55, ytop=20, ybottom =16, 
     col="#FF000066", border="purple", lwd=4)

# legends can be positions
legend(x=40, y=20,
       legend=c("Chinstrap", "Gentoo", "Adelie"),
       col=c("red", "green","blue"),
       pch=c(16, 17, 15)         
)

# vectorization 
plot(1:10, col=NA)
rect(xleft=1, xright=1:10, ybottom=1, ytop=1:10)

# some more important functions
# ?text
# ?mtext
# ?lines
# ?segments

