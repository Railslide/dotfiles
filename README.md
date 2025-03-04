# Dotfiles

A repository holding my dotfiles.

## Requirements

- GNU Stow

#### Application-specific dependencies (i.e. can be skipped if you don't plan to install a given application).

Neovim
  - Neovim >= 0.10.0
  - Ripgrep
  - SouceCodePro nerd font

Sway
  - Install everything in `sway_dependencies.txt`
  - If you are using multiple monitor, remember to define the kanshi config

Ssh
  - Add `Include config.d/*` at the top of your `./ssh/config`

Foot
  - SouceCodePro nerd font

Alacritty
  - SouceCodePro nerd font

## Installation

1. Add the following to `~/.bashrc`:
```
# Source custom settings
if [ -f ~/.bash_custom ]; then
    . ~/.bash_custom
fi
```
2. Run `make install` to install all the dotfiles.

## Stowing a single dotfile

```
stow --dotfiles -t [DESTINATION] [DOTFILE_FOLDER]

# e.g. stow --dotfiles -t ~ git
```

## Healthcheck

Check dependencies and necessary settings. Run automatically when installing
```
make check-health
```

## Bulk commands
- `make delete-all`: removes all the stowed dotfiles
- `make restow-all`: restow (i.e. delete and then stow again) all the dotfiles
