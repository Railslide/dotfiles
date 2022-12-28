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

> **Note**
> The current setup of `.bash_custom` expects `pipx`, `pyenv`, and `pyenv-virtualenv` to be installed on the system.
