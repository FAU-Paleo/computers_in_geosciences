# Script to demonstrate the basic capabilities of R
# Using the divDyn toolchain
# Ádám T. Kocsis, 2023-08-10, Erlangen
# CC BY 4.0


# The exercise:
#
# Run this script!
#
# 0. There will be an image file on the hard drive, find where 
# that map image file is, and...

# 1. change the background color of that map! - 5-10 minutes


# check whether packages are present, otherwise install them
required <- c("divDyn", "chronosphere", "sf")


# this is a matrix (2D array) of characters
installed <- installed.packages()

# it has similar attributes to a data.frame
colnames(installed)
rownames(installed)

# a matrix is an atomic, columns cannot be accessed with $
# installed$Version
dim(installed)

# technically a matrix is just a fancy, folded vector.
# Therefore, the elements can be accessed using 1-dimensional indexing
installed[32*16]
installed[32,16]


# a for loop: iterate for all packages in required
for(i in 1:length(required)){
  message(required[i])
	# conditional statement
	if(!required[i]%in%rownames(installed)){
		install.packages(required[i])
	}
}

# Conditional statements

# an if() clause represents a potential fork in a program.
# if the value between the parentheses is TRUE,
# then the instruction following if() will execute
dummy <- 10
if(dummy==12) message("Dummy is 12.")

# If it is FALSE, then it will not.
if(FALSE) message("Dummy is 12.")

# There can only be a single logical value in an if(),
# vectors with multiple values will create issues.
# WRONG
# if(c(TRUE, FALSE)) message("Dummy is 12.")

# multiple commands can be controlled simultaneously,
# if they are tied togeteher to block using braces.
if(TRUE){
  message("The condition evaluates to TRUE. ")
  message("Dummy is 12.")
}

# The if conditional can  bound together with an else statement,
# which will execute when the condition is FALSE.
dummy <- 0
if(dummy==12){
  message("The condition evaluates to TRUE. ")
  message("Dummy is 12.")
}else{
  message("The condition evaluates to FALSE. ")
  message("Dummy is not 12.")
}



# setting a project directory
# if the value is not NULL, then it is expected to be the project working dir.
projDir <- NULL
projDir <- "C:/Users/Adam/Desktop/computers_course"
if(!is.null(projDir)) setwd(projDir)

# messages
message("Your current working directory is:")
message(getwd())

# using external packages
library(divDyn)
library(chronosphere)
library(sf)

# using built-in data
data(stages, package="divDyn") # stage-level timescale
data(corals) # Paleobiology Database download


# The :: operator helps with finding the functions in the packages
# executing function calls from packages
dd <- divDyn::divDyn(corals, bin="stg", tax="genus")
stats <- divDyn::binstat(corals, bin="stg", tax="genus")

# calculating simple values and printing them to the console
nCorals <- length(unique(corals$genus))

# concatenating text
statement <-paste(
	"The total number of sampled coral genera is: ",
	nCorals,".",  sep="")

# paste concatenates text by default with inserting a space
paste("This", "is", "an", "R" , "course")

# the separator argument can be set to an arbitrary character string.
paste("This", "is", "an", "R" , "course", sep=" - !!Bullshit!! - ")

# and printing them to the console
message(statement)

# Modify the plot!
# color of the points is "gray30"  - col
# the point characters are triangles -> look it up! - pch
# limit the x axis at 2500! - xlim
# plotting variables against each other (scatter plots)
plot(
	stats$occs, dd$divSIB,
	xlab="Number of occurrences",
	ylab="Sampled-in-bin diversity", col="gray30", pch=17, xlim=c(0,2500))

# Correlation coefficients
a <- 1:10
b<-seq(100, 1000, length.out=10)

# this is perfect + correlation (Pearson's correlation coeff. R=1)
plot(a,b , pch=16)
cor(a,b)
# this is perfect - correlation (Pearson's correlation coeff. R=-1)
plot(a,-b , pch=16)
cor(a,-b)

# examples of pooor correlation

# Two samples from the standard normal distribution (1000 is the sample size)
# rerunning these lines iteratively will give you a different result every time
# because the samples are different
d <- rnorm(1000, 0,1)
e <- rnorm(1000, 0,1)
plot(d, e, pch=16, xlim=c(-5, +5), ylim=c(-5,5), col="#555555")
cor(d,e)

# if you decrease the sample size, it will be more likely that you get a more
# prominent correlation - which can happen because of random sampling.

# for this reason we need to test an observed correlation, to see how
# likely it is that it might be just an unrepresentative sampel

# THe correlation from the PBDB data.
# The cor() function cannot handle missing values, so they have to be omitted
# deliberately.
# also note that method="spearman", which means that we are not comparing the
# values, but their ranks (to make the effect of outliers less prominent)
cor(stats$occs[!is.na(stats$occs)], dd$divSIB[!is.na(dd$divSIB)], method="spearman")

# the correlation test gives a p-value as well:
# how likely it is, that we make a mistake if we reject the null hypothesis (that the true correlation is 0),
# and accept the alternative hypothesis (that true correlation is not 0).
# This p-value is very small, indicating, that the true correlation is probably not 0.
# calculating simple statistics and printing them out to the console
cor.test(stats$occs, dd$divSIB, method="spearman")
message("It is important to understand warning messages!")
# the warning message is produced, becasue some values are the same (and then their ranks as well)
# so the p-value is only an approximation. This is something we can safely ignore!

# higher and lower level plotting

divDyn::tsplot(stages, boxes="sys", xlim=52:95, ylim=c(0,300), boxes.col="col")
# low level plotting
lines(stages$mid, dd$divSIB, col="black", lwd=2)
lines(stages$mid, dd$divRT, col="blue", lwd=2)

# both lwd, lty and pch can be used in a legend,
# so you can show both points and lines
# as long as the order is consistent.
# legend
legend(
	"topleft",
	legend=c("Sampled-in-bin diversity", "Range-through diversity"),
	col=c("black", "blue"),
	pch=c(16, 17), lwd=2)

# the same with only points
# higher and lower level plotting
divDyn::tsplot(stages, boxes="sys", xlim=52:95, ylim=c(0,300), boxes.col="col")
# low level plotting
points(stages$mid, dd$divSIB, col="black", pch=16)
points(stages$mid, dd$divRT, col="blue", pch=17)

# legend
legend(
  "topleft",
  legend=c("Sampled-in-bin diversity", "Range-through diversity"),
  col=c("black", "blue"),
  pch=c(16, 17))


# saving outputs to a directory
# create new directory from R
dir.create("corals_export")

# subsetting tables (matrices)
saveThis <- dd[52:95,]

# writing (and reading tables)
write.csv( saveThis, file="corals_export/divDyn.csv", row.names=FALSE, na="")

# also the original result
saveRDS(file="corals_export/divDyn_original.rds", dd)
# the pair of the saveRDS function is the readRDS
# b <- readRDS("C:/Users/Adam/Desktop/computers_course/corals_export/divDyn_original.rds")

# downloading and drawing a world map
ne <-fetch("NaturalEarth")
plot(ne$geometry, col="purple", border=NA, main="Coral occurrences from the world")

# with the coral occurrences
coordinates <- unique(corals[,c("lng","lat")])
# points with RGB colors
points(coordinates, pch=3, col="#AA223355")


# to create a new graphical device, we can use these functions on windows
x11()
windows()

# returns which the current graphical device is
dev.cur()

# these plotting statments will be directed into the new device
plot(ne$geometry, col="purple", border=NA, main="Coral occurrences from the world")
points(coordinates, pch=3, col="#AA223355")

# switch off the device
dev.off()


# functions
# functions are simply instructions, stored in the memory for later use.
# the function's definition
hello <- function()  message("Hello World")
hello # show the function the contents
hello() # call to the function-> execute instructions


# multiple instructions can be stored ina function for further use
helloMore <- function(){
  message("This is my second function!")
  message("Hello World!")
} 

# call to the helloMore() function
helloMore()


# Functions can have arguments, which modify how they get executed.
# we square, with a side, what is the area?
side <- 10
side*side

# simple function to calculate the area of a square
area <- function(side) {
  result <- side*side
  return(result)
}

# the call to the area function, experiment with changing the side argument!
area(side=10)

# function that displays whatever we feed into it
echo <- function(x) message(x)
echo("Hello -hello")


# You can always add a new argument to a function (e.g. bg)
# The importnat thing to note is that it has to used in the code, which makes up the body of the function.
# definition of functions
plot_occs_from_stage <- function(x, stage, ts=stages, map=ne$geometry, bg="gray"){
	# occurrences from the stage
	thisStage <- x[which(x$stg==stage),]

	# a plot
	plot(map, col=bg,
		main=paste("Coral occurrences from the", ts$stage[stage]))

	
	# with the coral occurrences
	coordinates <- unique(thisStage[,c("lng","lat")])
	points(coordinates, pch=3, col=ts$col[stage])
}


# yo can run the body of the function above manually if you
# define these variablbes
## x <- corals
## stage <- 81
## ts<-stages
## map<-ne$geometry
## bg <-"gray"

# saving plots to the hard drive
png("corals_export/one_stage_occs.png", width=2000, height=1000)
	# calling of functions
	plot_occs_from_stage(corals, 81, bg="green")	
dev.off()

# A simple series plot
# widht and height are in pixels 
png("series.png", width=1000, height=1000)
plot(1:10, 1:10, pch=16, cex=2)	
dev.off()

# the same as a pdf. widht and height are in inches.
pdf("series.pdf", width=5, height=5)
plot(1:10, 1:10, pch=16, cex=2)	
dev.off()

