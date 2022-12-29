" Load vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Set path for Python
let g:python3_host_prog = '~/.pyenv/versions/neovim/bin/python3'
