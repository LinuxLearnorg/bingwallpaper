#!/usr/bin/env bash
## Created BY aref

PICTURE_DIR="$HOME/Pictures/bing-wallpapers/"

mkdir -p $PICTURE_DIR

urls=( $(curl -s http://www.bing.com | \
    grep -Eo "url:'.*?'" | \
    sed -e "s/url:'\([^']*\)'.*/http:\/\/bing.com\1/" | \
    sed -e "s/\\\//g") )

for p in ${urls[@]}; do
    filename=$(echo $p|sed -e "s/.*\/\(.*\)/\1/")
    if [ ! -f $PICTURE_DIR/$filename ]; then
        echo "Downloading: $filename ..."
        curl -Lo "$PICTURE_DIR/$filename" $p
    else
        echo "Skipping: $filename ..."
    fi

gsettings set org.gnome.desktop.background picture-uri "file://$PICTURE_DIR/$filename"

done
## Created BY aref

