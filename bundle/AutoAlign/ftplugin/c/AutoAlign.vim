" AutoAlign: ftplugin support for C
" Author:    Charles E. Campbell, Jr.
" Date:      Jan 06, 2011
" Version:   16d	ASTRO-ONLY
" ---------------------------------------------------------------------
if &ft != "cpp"
 let b:loaded_autoalign_c = "v16d"

 "  overloading '=' to keep things lined up {{{1
 ino <silent> = =<c-r>=AutoAlign(1)<cr>
 let b:autoalign_reqdpat1 = '^\([ \t*]\{0,}\h\w*\%(\[\%(\d\+\|\h\w*\)\=\]\)\{0,}\%(->\|\.\)\=\)\+\s*[-+*/^|%]\=='
 let b:autoalign_notpat1  = '^[^=]\+$\|\<\%(for\|if\|while\)\s*(\|\<else\>'
 let b:autoalign_trigger1 = '='
 if !exists("g:mapleader")
  let b:autoalign_cmd1     = 'norm \t=$'
 else
  let b:autoalign_cmd1     = "norm ".g:mapleader."t=$"
 endif
endif
