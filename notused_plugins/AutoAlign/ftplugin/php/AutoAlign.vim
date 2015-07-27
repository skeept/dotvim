" AutoAlign: ftplugin support for PHP
" Author:    Dmytro Konstantinov
" Date:      Dec 28, 2012
" Version:   1
" Note:      Vim loads HTML ftplugin files as part of PHP initialisation.
"            In order to avoid pattern collision with html/AutoAlign, we
"            will delay loading of this file by placing it into "after" 
"            directory and start pattern count at 101 (not 1).
" ---------------------------------------------------------------------
let b:loaded_autoalign_php = "v1"

"  overloading '=' to keep things lined up {{{1
ino <silent> = =<c-r>=AutoAlign(1)<cr>
let b:autoalign_reqdpat1 = '^\(\s*\$\h\w*\)\s*[-+*/%.]\=='
let b:autoalign_notpat1  = '^\([^=]\|=>\)\+$'
let b:autoalign_trigger1 = '='
if !exists("g:mapleader")
 let b:autoalign_cmd1     = 'norm \t=$'
else
 let b:autoalign_cmd1     = "norm ".g:mapleader."t=$"
endif

"  overloading '>' to keep things lined up {{{1
ino <silent> > ><c-r>=AutoAlign(2)<cr>
let b:autoalign_reqdpat2 = '^\(\s*["].\+["]\)\s*=>'
let b:autoalign_notpat2  = '^\%(.\%(=>\(\s*array(\()\)\@!\)\@!\)\@!\)*$'
let b:autoalign_trigger2 = '=>'
let b:autoalign_cmd2     = "'a,.Align =>"
