
set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
imap <S-Insert> <MiddleMouse>

" I like highlighting strings inside C comments
let c_comment_strings=1

" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
  syntax on
endif

" Switch on search pattern highlighting.
set hlsearch

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
  if !has("nvim")
    set rop=type:directx
  endif
  set guifont=Terminus:h12
else
  "set guifont=Terminus\ 12,
        "\-misc-fixed-medium-*-normal-*-15-*-*-*-*-*-*-*
  set guifont=Monospace 12
endif

set winaltkeys=no

let g:togglemenu=0
if !has("nvim")
  set guioptions -=T
endif

"map <f5> :call ToggleMenu()<cr>
"imap <f5> <C-O>:call ToggleMenu()<cr>
function! ToggleMenu()
  if g:togglemenu == 0
    set go +=m
  if !has("nvim")
    set guioptions +=T
  endif
    let g:togglemenu = 1
  else
    set go -=m
  if !has("nvim")
    set guioptions -=T
  endif
    let g:togglemenu = 0
  endif
endfunction


if has("gui")
  set lines=53 columns=114
endif

nnoremap <C-TAB> gt
nnoremap <C-S-TAB> gT

" set options for solarized
let g:solarized_underline = 0
let g:solarized_italic    = 0
let g:solarized_style     = "light"

colorscheme desert
"set bg=light | colorscheme solarized

if has("autocmd")
  autocmd BufEnter * hi PreciseJumpTarget ctermfg=yellow ctermbg=red cterm=bold gui=bold guibg=Red guifg=yellow
endif

"simple.vim settings
if g:is_vimrc_simple == 1
  colo peaksea
  hi! ColorColumn term=underline ctermfg=188 ctermbg=236 guifg=fg guibg=#303030
endif

set encoding=utf-8

"=============================== Supertab =====================================
imap <C-SPACE> <C-R>=jraf#mySupertabAltCompletion()<CR>
"==============================================================================
