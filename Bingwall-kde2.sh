#!/bin/bash

bing="www.bing.com"
xmlURL="http://www.bing.com/HPImageArchive.aspx?format=xml&idx=1&n=1&mkt=en-US"

saveDir="$HOME/Pictures/BingDesktopImages/"

# Create saveDir if it does not already exist
mkdir -p $saveDir

# Set picture options
# Valid options are: none,wallpaper,centered,scaled,stretched,zoom,spanned
picOpts="zoom"

# The desired Bing picture resolution to download
# Valid options: "_1024x768" "_1280x720" "_1366x768" "_1920x1200"
desiredPicRes="_1366x768"

# The file extension for the Bing pic
picExt=".jpg"

# Extract the relative URL of the Bing pic of the day from
# the XML data retrieved from xmlURL, form the fully qualified
# URL for the pic of the day, and store it in $picURL

# Form the URL for the desired pic resolution
desiredPicURL=$bing$(echo $(curl -s $xmlURL) | grep -oP "<urlBase>(.*)</urlBase>" | cut -d ">" -f 2 | cut -d "<" -f 1)$desiredPicRes$picExt

# Form the URL for the default pic resolution
defaultPicURL=$bing$(echo $(curl -s $xmlURL) | grep -oP "<url>(.*)</url>" | cut -d ">" -f 2 | cut -d "<" -f 1)

# $picName contains the filename of the Bing pic of the day

# Attempt to download the desired image resolution. If it doesn't
# exist then download the default image resolution
if wget --quiet --spider "$desiredPicURL"
then

    # Set picName to the desired picName
    picName=${desiredPicURL##*/}
    # Download the Bing pic of the day at desired resolution
    curl -s -o $saveDir$picName $desiredPicURL
else
    # Set picName to the default picName
    picName=${defaultPicURL##*/}
    # Download the Bing pic of the day at default resolution
    curl -s -o $saveDir$picName $defaultPicURL
fi

    random=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13 ; echo '.jpg' )
    mv $saveDir$picName $saveDir$random
    python3 ~/bin/ksetwallpaper.py $saveDir$random
#delete old pix
find $saveDir -atime 30 -delete

# Exit the script
exit
