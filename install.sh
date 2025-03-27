#!/bin/bash

set -u
abort() {
    echo "[ERROR] $@"
  exit 1
}

# Check if git its initialized
if ! [ -d ./.git ] ; then
	abort "Git module is not intalled in $(pwd)";
fi 

# Clone repository into temporal folder

echo "Thank you for use branch color. We will start with the installation. \n"

## If you have previous installation we will delete the folder and clone it again
if [ -d /tmp/branch-color ] ; then
    echo "Deleting old versions. "
    rm -rf /tmp/branch-color ;
fi

echo "Downloading branch color project ..."
git clone git@github.com:dhararon/branch-color.git /tmp/branch-color

echo "Copying files to git hooks ..."

# Delete colors folder if already exists
if [ -d ./.git/hooks/colors ] ; then
    rm -rf ./.git/hooks/colors ;
fi
mkdir .git/hooks/colors;

# Delete post-checkout script if exists 
if [ -d ./.git/hooks/post-checkout ] ; then
    rm -rf ./.git/hooks/post-checkout ;
fi

# Move file to git hook
chmod +x /tmp/branch-color/post-checkout
mv /tmp/branch-color/colors/*.json ./.git/hooks/colors
mv /tmp/branch-color/post-checkout ./.git/hooks

echo "The installation is finish, please change your branch for change the vscode color. "