# Script to demonstrate the basic capabilities of R
# Using the divDyn toolchain - modified during the class 2026-10-09
# Ádám T. Kocsis, 2023-08-10, Erlangen
# CC BY 4.0

# check whether packages are present, otherwise install them
required <- c("divDyn", "chronosphere", "sf")
installed <- installed.packages()

# this is a matrix, which is a 2d-folded vector.
# It behaves similar to a data.frame, but it can only have one type.
str(installed)

# accessing the marginal names of a data frame or a matrix
colnames(installed)
rownames(installed)

# matrices can be viewed like data.frames
View(installed)


# conditional statements are used to fork the flow of a program
# A single logical value is used to turn commands on or off.
# Off
a <- FALSE
if(a) message("It works!")

# On
a <- TRUE
if(a) message("It works!")

# It can be combined with an else statement to make sure something runs.
rain<- FALSE

if(rain){
  message("Raincoat!")
}else{
  message("Shorts/Skirt!")
}

# Usually the logical value is a result of a computation.
weather<- "Sun"
if(weather=="Rain"){
  message("Raincoat!")
}else{
  message("Shorts/Skirt!")
}


# check whether packages are present, otherwise install them
required <- c("divDyn", "chronosphere", "sf")
installed <- installed.packages()

# the match operator is used to find whether a vlaue
a <- c(5,6)
b <- c(1:5)

# returns a value for each value in a, telling whether it is
# present in b or not
a%in%b

# a for loop: iterate for all packages in required
for(i in 1:length(required)){
	# conditional statement
	if(!required[i]%in%rownames(installed)){
		install.packages(required[i])
	}
}

# install the 'palmerpenguins' package!
install.packages("palmerpenguins")

# setting a project directory
# # THIS HAS TO BE SET BY YOU!
projDir <- "C:/Users/Adam/Desktop/computers_course/day_5/corals"
if(!is.null(projDir)) setwd(projDir)

# NULLs can be detected with this function.
is.null(projDir)

# messages
message("Your current working directory is:")
message(getwd())

# using external packages
library("divDyn")

# attaching packages allow you to use objects from another package
# without statintg that you want to use them
tsplot


# this is not yet available
# gives ERROR
st_read

library(chronosphere)
library(sf)

# after attaching sf, it becomes available
st_read

# using built-in data
data(stages) # stage-level timescale
data(corals, package="divDyn") # Paleobiology Database download

# always check strucutres
str(corals)


# The :: operator can be used to indicate which package does a function
# come from. This is good practice: <package>::<function>
 
# executing function calls from packages
dd <- divDyn::divDyn(corals, bin="stg", tax="genus")
stats <- divDyn::binstat(corals, bin="stg", tax="genus")

# calculating simple values and printing them to the console
nCorals <- length(unique(corals$genus))

# concatenating text
statement <-paste(
	"The total number of sampled coral genera is: ",
	nCorals,".",  sep="")

# paste is a character function used for concatenation
# i.e. creating a single character value.
ch <- c("word", "another")
# default separator is a space, i.e. " "
# 
# you can set sep
paste("no", "yes", sep="/")

# it can also be nocharacaters
paste(ch, "!", sep="")

# different number of values: recycling!
# 4 values plus 1 value, 2 is repeated four times!
1:4 + 2

# and printing them to the console
message(statement)

# plotting variables against each other (scatter plots)
plot(
	stats$occs, dd$divSIB,
	xlab="Number of occurrences",
	ylab="Sampled-in-bin diversity")

# calculating simple statistics and printing them out to the console
cor.test(stats$occs, dd$divSIB, method="spearman")
message("It is important to understand warning messages!")

# higher and lower level plotting
divDyn::tsplot(stages, boxes="sys", xlim=52:95, ylim=c(0,300), boxes.col="col")
# low level plotting
lines(stages$mid, dd$divSIB, col="black", lwd=2)
lines(stages$mid, dd$divRT, col="blue", lwd=2)

# Lines behave like points, it just connects the successive points together.
divDyn::tsplot(stages, boxes="sys", xlim=52:95, ylim=c(0,300), boxes.col="col")
# low level plotting
points(stages$mid, dd$divSIB, col="black")
points(stages$mid, dd$divRT, col="blue")


# legend
legend(
	"topleft",
	legend=c("Sampled-in-bin diversity", "Range-through diversity"),
	col=c("black", "blue"),
	lwd=2, pch=1)

# saving outputs to a directory
# create new directory from R
dir.create("corals_export")

# subsetting tables (matrices)
saveThis <- dd[52:95,]

# writing (and reading tables)
write.csv( saveThis, file="corals_export/divDyn.csv", row.names=FALSE)
redd <- read.csv(file="corals_export/divDyn.csv")

# also the original result
# Binary R file, has to be assigned into an object,
# does not store environment information (e.g. name of the object)
saveRDS(file="corals_export/divDyn_original.rds", dd)
rdsdd <- readRDS(file="corals_export/divDyn_original.rds")

# also stores environemnt info
save(dd, file="corals_export/divDyn_original.RData")
rm(dd)

# dd reappears!
load(file="corals_export/divDyn_original.RData")

# Another external pacage
# downloading and drawing a world map
ne <-chronosphere::fetch("NaturalEarth")

# complex spatial object, plotting 
plot(ne$geometry, col="gray", main="Coral occurrences from the world", 
     border=NA)

# There is no point in overplotting the same coordinate pair multiple times
# one point is enough per one coordinate pair.
# Uniquing of vectors
unique(c(1,2,3,1,2,3,5,1))


# Unique can be applied to data.frames, this means that duplicate rows
# will be omitted with the coral occurrences
coordinates <- unique(corals[,c("lng","lat")])

# points with RGB colors
points(coordinates, pch=3, col="#AA223355")

# definition of functions
plot_occs_from_stage <- function(x, stage, ts=stages, map=ne$geometry){
	# occurrences from the stage
	thisStage <- x[which(x$stg==stage),]

	# a plot
	plot(map, col="gray",
		main=paste("Coral occurrences from the", ts$stage[stage]))

	
	# with the coral occurrences
	coordinates <- unique(thisStage[,c("lng","lat")])
	points(coordinates, pch=3, col=ts$col[stage])
}

# calling to a function
plot_occs_from_stage(x=corals, stage=80)	

# the area of a circle  can be calculated like this
r <- 12
r^2*pi

# Defining a function to make this compact and easier to reuse
circlearea <- function(radius){
  area <- radius ^2 * pi
  return(area)
}

# calling to a function
circlearea(radius=300)

# the same with a cube's volume
cubevolume <- function(x){
  return(x^3)
}
cubevolume(5)


# Functions should be defended against invalid input!
# circlearea(radius=-4)
# circlearea(radius="one")

# not all functions have parameters/arguments
# the simples R function
hello <- function() message("Hello World!")
hello()

# 'unpacking' a function can be done if we defined the arguments manually
x <- corals
stage <- 75
ts<-stages
map<-ne$geometry

# then you can run the definition's contents line-by line
# occurrences from the stage
thisStage <- x[which(x$stg==stage),]

# a plot
plot(map, col="gray",
     main=paste("Coral occurrences from the", ts$stage[stage]))


# with the coral occurrences
coordinates <- unique(thisStage[,c("lng","lat")])
points(coordinates, pch=3, col=ts$col[stage])

################################################################################ 
# Plotting devices
# These are very useful for creating nice figures. You write directly into files
################################################################################
# saving plots to the hard drive
# open a device, will overwrite existing files!
png("corals_export/one_stage_occs.png", width=2000, height=1000)
	# calling of functions
	plot_occs_from_stage(corals, 75)	
# nothing is actually stored until the device is closed
# only then can the figure be inspected
dev.off()


# the contents can be scaled using pointsize, 
# saving plots to the hard drive
png("corals_export/one_stage_occs.png", width=2000, height=1000, pointsize=36)
# calling of functions
plot_occs_from_stage(corals, 75)	
dev.off()

# see the currently active plotting device
dev.cur()

# the pdf device is vector based, its dimensions and scaling
# are given with inches, not pixels
pdf("corals_export/one_stage_occs.pdf", width=12, height=6)
# calling of functions
plot_occs_from_stage(corals, 75)	
dev.off()



# Pdfs can have multiple pages. If a new plot is created,
# that will be put on a new page.
pdf("corals_export/multiple_basic.pdf", width=12, height=6)
# calling of functions
plot(1:10)
plot(1:10)
dev.off()

# Maps of coral occurrences through time
pdf("corals_export/multiple_stages.pdf", width=12, height=6)
# calling of functions
plot_occs_from_stage(corals, 75)	
plot_occs_from_stage(corals, 76)	
plot_occs_from_stage(corals, 77)	
dev.off()

# Looping these
# which are to be plotted? given the stage identifiers
stgIDs <- sort(unique(corals$stg))
pdf("corals_export/multiple_stages.pdf", width=12, height=6)
# loop through these
for (i in 1:length(stgIDs)){ 
	# create a new plot for all
	plot_occs_from_stage(corals, stgIDs[i])
}
dev.off()


