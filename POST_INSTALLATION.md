# Post-installation

Some dotfiles require some extra settings in order to work properly.

## Bash

Add the following to `~/.bashrc`:
```
# Source custom settings
if [ -f ~/.bash_custom ]; then
    . ~/.bash_custom
fi
```

> **Note**
> 
> The current setup of `.bash_custom` expects some tools (e.g.`pipx`, `pyenv`, and `pyenv-virtualenv`) to be installed on the system. If that becomes an issue, a potential solution would be to wrap those lines in a conditional statement like this:
> 
> ```
> if [ "$(pipx --version)" ]; then
>    # do what's needed here
> fi
> ```
> However, such a workaround comes with a performance cost as the terminal will take longer to load.