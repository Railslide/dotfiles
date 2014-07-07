#!/bin/bash

# .make.sh
# This script creates symlinks from the home directory to the doftiles contained in ~/dotfiles

#### Variables

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc gitignore_global gitconfig" 	#files to symlink
sublimedir=~/.config/sublime-text-3/Packages/User

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
    if [ -a  ~/.$file ]; then	 # check if a dotfile already exists
        echo "Moving any existing dotfiles from ~ to $olddir"
        mv ~/.$file $olddir
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo "...done"

# move Sublime Text Users directory to dotfiles_old directory, then create symlink
if [ -d $sublimedir ]; then	# check whether the directory already exists
    echo "Moving the existing Sublime Text Users directory from $sublimedir to $olddir"
    mv $sublimedir $olddir
    echo "...done"
fi
echo "Creating symlink to Users in $sublimedir"
ln -s $dir/sublime/User $sublimedir
echo "...done"

