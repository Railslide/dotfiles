# Dotfiles

A repository holding my dotfiles.

## Installation

1. Install GNU Stow on the system
2. Run `git submodule update --init --recursive` to pull submodules.
3. Run `make stow-all` to install all the dotfiles.

## Stowing a single dotfile

```
stow --dotfiles -t [DESTINATION] [DOTFILE_FOLDER]

# e.g. stow --dotfiles -t ~ git
```

### Useful commands
- `make delete-all`: removes all the stowed dotfiles
- `make restow-all`: restow (i.e. delete and then stow again) all the dotfiles
