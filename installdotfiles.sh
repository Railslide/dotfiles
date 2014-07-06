#!/bin/bash

# .make.sh
# This script creates symlinks from the home directory to the doftiles contained in ~/dotfiles

#### Variables

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc gitignore_global gitconfig"

####

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    if [ -a  ~/.$file ] # check if a dotfile already exists
        then
            echo "Moving any existing dotfiles from ~ to $olddir"
            mv ~/.$file ~/dotfiles_old/
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
