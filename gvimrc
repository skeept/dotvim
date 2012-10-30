" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Sep 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  " For Win32 version, have "K" lookup the keyword in a help file
  "if g:is_win
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background

  ""highlight Normal guibg=grey90
  ""highlight Cursor guibg=Green guifg=NONE
  ""highlight lCursor guibg=Cyan guifg=NONE
  ""highlight NonText guibg=grey80
  ""highlight Constant gui=NONE guibg=grey95
  ""highlight Special gui=NONE guibg=grey95

endif

" Determine the LC_CTYPE locale category setting and try to set guifontset accordingly:

let tmplang = $LC_ALL
if tmplang =~ "^$"
  let tmplang = $LC_CTYPE
endif
if tmplang =~ "^$"
  let tmplang = $LANG
endif
if tmplang =~ "^$"
  let tmplang = "en_US"
endif

set cmdheight=1

"disable or enable toolbars
"set guioptions -=m
"set guioptions -=T

"set guifont=Courier\ 16
"set guifont=Courier\ 13
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
if g:is_win
  set guifont=Terminus:h12
else
  set guifont=Terminus\ 12
endif

set winaltkeys=no

let g:togglemenu=0
set go -=T

"map <f5> :call ToggleMenu()<cr>
"imap <f5> <C-O>:call ToggleMenu()<cr>
function! ToggleMenu()
        if g:togglemenu == 0
                set go +=m
		set go +=T
                let g:togglemenu = 1
        else
                set go -=m
		set go -=T
                let g:togglemenu = 0
        endif
endfunction


if has("gui")
  set lines=40 columns=100
endif

map <c-tab> gt
map <c-s-tab> gT

" set options for solarized
let g:solarized_underline = 0
let g:solarized_italic    = 0
let g:solarized_style     = "light"

"-*-*-medium-*-*-*-15-*-*-*-*-*-*-*
"above is the desired font name for the gui
"set guifontset=-*-*-medium-*-*-*-18-*-*-*-*-*-*-1
"set guifontset=-misc-*-medium-*-*-*-18-*-*-*-*-*-*-1
"set guifontset=-misc-fixed-medium-*-*-*-18-*-*-*-*-*-iso8859-15

"colorscheme morning
colorscheme desert
"set bg=light | colorscheme solarized

if has("autocmd")
  autocmd BufEnter * hi PreciseJumpTarget ctermfg=yellow ctermbg=red cterm=bold gui=bold guibg=Red guifg=yellow
endif 

"simple.vim settings
if exists("g:is_vimrc_simple")
  colo peaksea
  hi! ColorColumn term=underline ctermfg=188 ctermbg=236 guifg=fg guibg=#303030
endif

set encoding=utf-8

"=============================== Supertab =====================================
imap <c-space> <c-r>=MySupertabAltCompletion()<cr>
"==============================================================================
