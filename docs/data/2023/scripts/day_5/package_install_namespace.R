# example script to install packages and the :: operator

# installing packages
# arbitrary example
install.packages("rgplates")

# not working initially
# arbitrary function in
mapedge()

# works without attaching
rgplates::mapedge()

# attaching
library(rgplates)

# works without ::
mapedge()
