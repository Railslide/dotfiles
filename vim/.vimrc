" ------------------------------------------------------------------------
"  General
"  -----------------------------------------------------------------------

" Show line numbers
set number

" Ignore case when searching
set ignorecase

" Respect case if there are capital letters in the search string
set smartcase

" Convert tabs into 4 spaces
set expandtab
set softtabstop=4
set shiftwidth=4

"-------------------------------------------------------------------------
" Plugin manager
"-------------------------------------------------------------------------

" Load minpac on demand
" See: https://github.com/k-takata/minpac#load-minpac-on-demand
function! PackInit() abort
  packadd minpac

  " minpac plugin manager
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " ALE (Asynchronous Lint Engine)
  call minpac#add('dense-analysis/ale')

  " lightline statusline
  call minpac#add('itchyny/lightline.vim')
endfunction

" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

"-------------------------------------------------------------------------
" Plugin settings
" ------------------------------------------------------------------------

" ALE
let g:ale_sign_column_always = 1   " always show the sign column
let g:ale_fix_on_save = 1          " fix files on save

" fixers
let g:ale_fixers = {
\   '*': [
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ],
\}

" lightline
set noshowmode  " do not show mode below the statusline
