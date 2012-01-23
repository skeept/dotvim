

syntax on
set nocompatible
set t_Co=256
set wildchar=<Tab>

fun! ToogleBackground()
  if &background == 'light'
    set background=dark
  else
    set background=light
  endif
  syn on
  source cur_color.vim
endf

nmap l :call ToogleBackground()
nmap q :quitall
nmap <tab> <c-w>

