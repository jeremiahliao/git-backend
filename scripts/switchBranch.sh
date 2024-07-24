#!/bin/bash

# find git respository location and switch to that branch

echo "Current Working Directory: $(pwd)"

# take argument as path name
path=$1
echo "Change to Git Directory at: $path"
cd "$path"

# debug: check if we are in the repository
echo "New Working Directory: $(pwd)"

# get the branch name

git checkout "$2"
git pull
