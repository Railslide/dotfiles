# Dotfiles

A repository holding my dotfiles.

## Installation

1. Install GNU Stow on the system
2. Run `git submodule update --init --recursive` to pull submodules.
3. Run `make stow-all` to install all the dotfiles.
4. Check the [post-installation steps](#post-installation).

## Stowing a single dotfile

```
stow --dotfiles -t [DESTINATION] [DOTFILE_FOLDER]

# e.g. stow --dotfiles -t ~ git
```

## Bulk commands
- `make delete-all`: removes all the stowed dotfiles
- `make restow-all`: restow (i.e. delete and then stow again) all the dotfiles

## Post-installation

Some dotfiles require some extra settings in order to work properly.

#### Bash

Add the following to `~/.bashrc`:
```
# Source custom settings
if [ -f ~/.bash_custom ]; then
. ~/.bash_custom
fi
```
