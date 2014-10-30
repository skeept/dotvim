" AutoAlign: ftplugin support for HTML
" Author:    Charles E. Campbell, Jr.
" Date:      Feb 11, 2013
" Version:   14
" ---------------------------------------------------------------------
if !exists("b:loaded_autoalign_php")
 let b:loaded_autoalign_html= "v14"

 "  overloading '>' to keep things lined up {{{1
 ino <silent> > ><c-r>=AutoAlign(-1)<cr>
 let b:autoalign_reqdpat1 = '</[tT][rR]>$'
 let b:autoalign_notpat1  = '\%(</[tT][rR]>\)\@!.\{5}$'
 let b:autoalign_suspend1 = '\c</\=table>'
 let b:autoalign_trigger1 = '>'
 if !exists("g:mapleader")
  let b:autoalign_cmd1     = 'norm \Htd$'
 else
  let b:autoalign_cmd1     = "norm ".g:mapleader."\Htd$"
 endif
endif
