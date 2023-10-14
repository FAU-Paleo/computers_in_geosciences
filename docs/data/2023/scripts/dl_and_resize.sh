# download the files
wget -i first.txt


# create new directory
mkdir reduced 

# for %i in (*.jpg): repeat for all .jpg files found in this directory
# do: whatever happens after this is what you repeat
for %i in (*.jpg) do magick %i -resize 100x reduced\%i

# on linux and mac 'magick' is 'convert'
