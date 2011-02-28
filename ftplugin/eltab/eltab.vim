" eltab.vim
"   Author: Charles E. Campbell, Jr.
"   Date:   Jun 22, 2010
"   Version: 1a	NOT RELEASED
" ---------------------------------------------------------------------
"  Load Once: {{{1
if &cp || exists("g:loaded_ftplugin_eltab")
 finish
endif
let g:loaded_ftplugin_eltab = "v1a"
let s:keepcpo               = &cpo
set cpo&vim

" ---------------------------------------------------------------------
"  Restore: {{{1
let &cpo= s:keepcpo
unlet s:keepcpo
" vim: ts=4 fdm=marker
