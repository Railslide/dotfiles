# Create a directory and cd into it
mkcd()
{
    test -d "$1" || mkdir -p "$1" && cd "$1"
}

# Switch to master/main branch and pull from remote
alias gum="git switch master || git switch main && git pull"
