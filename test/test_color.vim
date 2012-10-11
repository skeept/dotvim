"use this file together with the script listcol.pl
"to list the colors and call each one at a time.

syntax on
set nocompatible
set t_Co=256
set wildchar=<Tab>
set rnu

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
nmap j <c-d><c-d><c-w><c-w><c-d><c-d>
