#!/bin/bash

# find git respository location and switch to that branch

origin=$PWD
echo "Current Working Directory: $origin"

# take argument as path name
path=$1
echo "Change to Git Directory at: $path"
cd "$path"

# debug: check if we are in the repository
echo "New Working Directory: $PWD"
echo ""


# run fetch operation

user=$2

git stash # stash local chaanges
git checkout "$user" # switch to user branch
git pull  # get updates from remote

echo "Branch succesfully updated for $user"


# copy repo contents to the web directory

destination="$3/$4/$user"
mkdir -p "$destination"
cp -r * "$destination"

echo "Files copied to $destination"

# change back to main branch

git checkout main
git pull
git stash pop

echo "Branch successfully switched back to main"

# return to original directory
cd "$origin"
echo "Returned to original directory: $PWD"