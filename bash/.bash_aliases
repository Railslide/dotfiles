# Switch to master/main branch and pull from remote
gum()
{
  git switch master || git switch main && git pull
}

# Create a directory and cd into it
mkcd()
{
    test -d "$1" || mkdir -p "$1" && cd "$1"
}

# Open neovim config for editing
nvconf()
{
  cd -P ~/.config/nvim/ && nvim
}
