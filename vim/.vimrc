" Show line numbers
set number

" Ignore case when searching
set ignorecase

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
