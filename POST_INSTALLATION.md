# Post-installation

> **Note**
>
> The current setup of `.bash_custom` expects some tools (e.g.`pipx`, `pyenv`, and `pyenv-virtualenv`) to be installed on the system. If that becomes an issue, a potential solution would be to wrap those lines in a conditional statement like this:
>
> ```
> if command -v pipx &> /dev/null; then
>    # do what's needed here
> fi
> ```
> However, such a workaround might come with a performance cost (i.e. the terminal might take longer to load).

