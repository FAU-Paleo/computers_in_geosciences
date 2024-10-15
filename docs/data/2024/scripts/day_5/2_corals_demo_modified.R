# Script to demonstrate the basic capabilities of R
# Using the divDyn toolchain
# Ádám T. Kocsis, 2024-10-11, Erlangen
# CC BY 4.0

# check whether packages are present, otherwise install them
required <- c("divDyn", "chronosphere", "sf")
installed <- installed.packages()

# a for loop: iterate for all packages in required
for(i in 1:length(required)){
	# conditional statement
	if(!required[i]%in%rownames(installed)){
		install.packages(required[i])
	}
}

# setting a project directory
projDir <- "C:/Users/Adam/Desktop/paleo_msc/semester_1/computers course/day_5"
if(!is.null(projDir)) setwd(projDir)

# messages
message("Your current working directory is:")
message(getwd())


# using external packages
library("divDyn")
library(chronosphere)
library(sf)

# using built-in data
data(stages) # stage-level timescale
data(corals) # Paleobiology Database download

# executing function calls from packages
dd <- divDyn::divDyn(corals, bin="stg", tax="genus")
stats <- divDyn::binstat(corals, bin="stg", tax="genus")

# calculating simple values and printing them to the console
nCorals <- length(unique(corals$genus))

# concatenating text
statement <-paste(
	"The total number of sampled coral genera is: ",
	nCorals,".",  sep="")

# and printing them to the console
message(statement)

# plotting variables against each other (scatter plots)
plot(
	x=stats$occs, y=dd$divSIB,
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

# legend
legend(
	"topleft",
	legend=c("Sampled-in-bin diversity", "Range-through diversity"),
	col=c("black", "blue"),
	lwd=c(2,2))

# saving outputs to a directory
# create new directory from R
dir.create("corals_export")

# subsetting tables (matrices)
saveThis <- dd[52:95,]

# writing (and reading tables)
write.csv( saveThis, file="corals_export/divDyn.csv", row.names=FALSE)

# also the original result
saveRDS(file="corals_export/divDyn_original.rds", dd)

# downloading and drawing a world map
ne <- chronosphere::fetch("NaturalEarth")
plot(ne$geometry, col="gray", main="Coral occurrences from the world")

# with the coral occurrences
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
	points(coordinates, pch=3, col=ts$col[stage], cex=3)
}

# testing the function displays a map
plot_occs_from_stage(x=corals, stage=81)


# Prototyping the code of the funciton
# These need to be set in the global namespace

# x <- corals
# stage <- 81
# ts <- stages
# map <- ne$geometry

# then thefunction's code can be run line-by-line

# Example plots
#saving plots to the hard drive
png("corals_export/one_stage_occs.png", width=2000, height=1000)
	# calling of functions
	plot_occs_from_stage(corals, 81)	
dev.off()


# define vector controlling the loop
allStg <- sort(unique(corals$stg), decreasing=FALSE)

# repeat for all the stages
for(i in allStg){
  # construct file path to store the image
  filePath <- paste("corals_export/one_stage_occs_",i, ".png", sep="")
  # open up device
  png(filePath, width=2000, height=1000)
    # calling of functions
    plot_occs_from_stage(corals, i)
  # close device
  dev.off()

  # loop counter
  message(i)
}


# pdf with multiple pages
pdf("corals_export/one_stage_occs.pdf", width=14, height=7)
	plot_occs_from_stage(corals, 82)
	plot_occs_from_stage(corals, 83)
dev.off()
