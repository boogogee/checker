#!/bin/bash

# Set the URL to check
url="http://example.com"

# Set the path to the directory where the downloaded files will be stored
dir="/path/to/website/directory"

# Create the directory if it doesn't exist
mkdir -p $dir

# Loop indefinitely
while true; do

    # Download the website
    wget -q -P $dir $url

    # Compare the current file with the previous file
    diff $dir/index.html $dir/prev.html > /dev/null

    # If there are differences, display a message and update the previous file
    if [ $? -ne 0 ]; then
        echo "Website has changed!"
        mv $dir/index.html $dir/prev.html
    fi

    # Wait for an hour before checking again
    sleep 3600

done
