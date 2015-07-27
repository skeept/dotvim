" AutoAlign: ftplugin support for elastic tabs
" Author:    Charles E. Campbell, Jr.
" Date:      Aug 29, 2007
" Version:   1
" ---------------------------------------------------------------------
let b:loaded_autoalign_eltab = "v1"

" overloading '<tab>' to keep things lined up {{{1
ino <silent> <tab> <tab><c-r>=AutoAlign(1)<cr>
let b:autoalign_reqdpat1 = "\t"
let b:autoalign_notpat1  = '^\%(\%(\t\)\@!.\)*$'
let b:autoalign_trigger1 = "\t"
if !exists("g:mapleader")
 let b:autoalign_cmd1     = 'norm \tab'
else
 let b:autoalign_cmd1     = "norm ".g:mapleader.'tab'
endif
