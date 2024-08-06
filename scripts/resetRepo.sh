#!/bin/bash

# locate folder in apache web server

origin=$PWD
echo "Current Working Directory: $origin"

# concatenate user directory to webpath
webpath="${1}"

echo "Change directory to $webpath"
cd "$webpath"

#debug: check if we are in the correct directory
echo "new Working Directory: $PWD"
echo ""

# remove target directory

rm -r $2

echo "Sucessfully removed directory: $2"

# return to original directory
cd "$origin"
echo "Returned to original directory: $PWD"
