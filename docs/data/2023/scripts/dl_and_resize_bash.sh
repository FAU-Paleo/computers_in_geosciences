# download the files
wget -i first.txt

# list out 
files=$(ls *.jpg)

# create a new directory for the output
mkdir output

# repeat process for every entity 
for i in $files

# what you,  repeat wat is between do and done
do
	# convert: imagemagick application, on mac and linux this is 'convert'
	# -resize: option, indicating that resizing is to be done
	# 100x, heightxwidth, what are the desired parameters, 
	# $i: reference to variable 'i': changes in every iteration,
	#      this is the name of the file you are converting
	# output/$i: the result will be saved in the output directory 'output/'
	#      with the same name as the original '$i'
	magick -resize 100x $i output/$i
done
