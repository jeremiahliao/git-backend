#!/bin/bash

# find git respository location and switch to that branch

origin=$PWD
echo "Current Working Directory: $origin"

# take argument as path name
path=$1
echo "Change to Git Directory at: $path"
cd "$path"

# verify successful directory change
if [ $? != 0 ] ; then
    echo "Error: Directory not found"
    exit 1
fi

# debug: check if we are in the repository
echo "New Working Directory: $PWD"
echo ""


# run fetch operation

user=$2

#test if branch exists

branch=$(git branch -l $user)
if [ $branch ]; then
    echo "Branch $user exists"
else
    echo "Branch $user does not exist"
    exit 1
fi

# consider redirecting outputs to stdout over stderr

git stash # stash local changes
git checkout "$user" # switch to user branch
git pull  # get updates from remote

echo "Branch succesfully updated for $user"


# copy repo contents to the web directory

destination="$3/$4/$user"

if ! [ test -d $destination ]; then
    echo "Directory not found, creating directory"
    mkdir -p "$destination"
fi

cp -r * "$destination"

echo "Files copied to $destination"

# change back to main branch

git checkout main
git pull
if [ $? -ne 0 ]; then
    echo "Error: Could not switch back to main branch"
    exit 1
fi
res=$(git stash pop)

if [ $? -ne 0 ] && [ $res != "No stash entries found." ]; then
    echo "Error: $res"
    exit 1
fi

echo "Branch successfully switched back to main"

# return to original directory
cd "$origin"
echo "Returned to original directory: $PWD"