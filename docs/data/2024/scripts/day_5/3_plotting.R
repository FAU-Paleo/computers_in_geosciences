# Plotting - S style plotting concepts
# 2024-10-11

# two vectors
x <- -10:10
# x cube
y <- x^3

# setting the x-and y axis limit (you can use both!)
plot(x,y, xlim=c(-5, 5))
plot(x,y, xlim=c(-50, 50))
plot(x,y, xlim=c(50, -50))
plot(x,y, ylim=c(-100, 100))

# the plots have a large number of settings
par()


# # default axis label is the object's name
# one <- x
# plot(one, y)
# # Do not rename objects just so the plot would be different! Rather...

# ... use axis labels: xlab, ylab:
plot(x,y, xlab="First variable (x)", ylab="Second variable (x cube)")

# you can use more complex 'expressions' for elaborate axis labels
plot(x,y, xlab="First variable (x)", ylab=expression("Second variable (x"^3*")"))

# Basic R plots are made up of many things
# This is a high level plot (requires xlim and ylim, if data are not given!)
plot(NULL, xlim=range(x), ylim=range(y), xlab="First", ylab="Second")

# points() is a low-level plotting function. It will always plot on an existing plot.
# cex: size (general), pch= point character, col = color
points(x,y, cex=0.5, pch=1, col=1)
# combined
points(x, x^2, cex=3)

# pch1-24, characters
# col colors "red", 1-8, RGB(A): Three values (0-255) in hexadecimal :0-9abcdef
plot(NULL, xlim=range(x), ylim=range(y), xlab="First", ylab="Second")
points(x,y, cex=1, pch=16, col="#ff5500")

# available color strings
colors()

# some pch entries allow points with multiple colors. col will be the outline,
# bg the background
plot(NULL, xlim=range(x), ylim=range(y), xlab="First", ylab="Second")
points(x,y, cex=1, pch=21, col="#ff5500", bg="#005500")


# col also accepts RGBA values: a 4th hex value that describes opacity:
# 00 transparent, ff 100% opaque
plot(NULL, xlim=range(x), ylim=range(y), xlab="First", ylab="Second")
points(x,y, cex=1, pch=21, col="#ff5500", bg="#005500")
points(x, x^2, pch=17, col="#00550044")

# lines is also low-level plotting function. it will plot on the existing plot
# lty: the line type, lwd: line width
lines(x, x^4, lty=2)
#points(x, x^4)

# Example legend
legend(
  # position top-bottom left-right
  "bottomright",
  
  # what the symbols mean
  legend=c("x squared", "x cube", "x^4"),
  
  # describe the symbols
  pch=c(17, 16,NA),
  col=c("#00550044","#ff5500", "black" ),
  lty=c(NA, NA, 2)
 
  # customize
  
)


# another example: lines()
x<- -10:10
plot(x, x^2)

# plottting lines on the existing plot:
# abline: low-level function that plots on existing plots
abline(h=40) # horizontal line
abline(v=0) # vertical line
abline(v=5, col="red", lty=2)

# intersect=3, slope=2
plot(1:10, 1:10)
abline(-3, 2) # with two arguments, usingthe equation of the line




# another example: segments()
x<- -10:10
plot(x, x^2)

# segments require the coordinates of two points: 0,0 - 5,60
segments(x0=0, y0=0, x1=5, y1=60, col="green")

# Rectangle. Requires the coordinates to be set
rect(xleft=-8, xright=0, ybottom=60, ytop=80, col="red", border="green", 
     lty=2, lwd=3)


########################################
# Graphical devices
# this requires the 'sf' and 'chronosphere' packages to be present on the system!
ne <- chronosphere::fetch("NaturalEarth")

# create a new graphics device (interactive plotting)
# on MS Windows
windows()

# On MacOS
# quartz()

# On GNU/Linux
# x11()

# the plot will be displayed on it
plot(ne$geometry, col="gray", main="Coral occurrences from the world")

# the current graphic device
dev.cur()

# high-level plotting functions will overplot the previous one!
plot(1,1)

# close a graphics device. Shows the new curent device.
dev.off()
