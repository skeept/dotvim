"
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Jul 18
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

let g:is_vimrc_simple = 1 "so we can do something specific in gvimrc


"=============================== Settings =====================================
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
"set backspace=indent,eol,start
set backspace=2
set esckeys

set autoindent		" always set autoindenting on
"set splitright          "split the window to the right
"set splitbelow          "open the window to the bottom

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ignorecase
"set smartcase
set showmatch           " show matching parenthesis
set laststatus=2
set cmdheight=1
set whichwrap=<,>,[,],h,l
set nopaste
"set pastetoggle=<S-F3>
set pastetoggle=<Leader>pt

"Set terminal capabilities before the colorscheme
"set t_Co=128
set t_Co=256
"set t_Co=88

if v:version >= 703
  set undofile
  "set relativenumber
endif

"" set backup. but all the backuped files will be
"" placed in the directory specified by backupdir
set backup
if has("win32")
  set backupdir^=$HOME\vimfiles\backup//
  set directory^=$HOME\vimfiles\swapdir//
  if v:version >= 703
    set undodir^=$HOME\vimfiles\undodir//
  endif
else
  set backupdir^=~/.vim/backup//
  set directory^=~/.vim/swapdir//
  if v:version >= 703
    set undodir^=$HOME/.vim/undodir//
  endif
endif

set expandtab
set softtabstop=2
set cindent shiftwidth=2
set scrolloff=9 "kepp 9 lines of contex when editing
set clipboard+=unnamed " turns out I do like is sharing windows clipboard
set wildmenu                    "wmnu:  enhanced ex command completion
set wildmode=longest:full,list:full  "wim:   helps wildmenu auto-completion
cabbrev tabh tab help
set nostartofline

" for being able to change buffers without saving
set hidden
set shortmess=a

set foldmethod=syntax
set title
set virtualedit+=block

"if !has("win32") "for gnu grep, do some other setting for windows (maybe use cygwin?)
  "set grepprg=grep\ -nIH\ --exclude=tags\ --exclude=cscope.out
  "we change to setting from H to -h so the filename does not show up
  set grepprg=grep\ -nIh\ --exclude=tags\ --exclude=cscope.out
"endif

"for scip go up two folders
set tags=./tags,./TAGS,tags,TAGS,../tags,../../tags

set wildignore+=*.o,*.obj,.git,.hg,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*~
set wildignore+=tags,cscope.out

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
"set cot-=preview
"==============================================================================

"============================ Mappings ========================================
" Don't use Ex mode, use Q for formatting
noremap Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" select the text just last pasted or edited :)
nnoremap gp `[v`]
nnoremap <expr> gV    "`[".getregtype(v:register)[0]."`]"

"cmap tb tab split +b

" in insert mode make ctrl-a and ctrl-e behave like in emacs
"inoremap <C-A> <ESC>0i
inoremap <C-E> <ESC>$a

"noremap f2 to make
inoremap <F2> <ESC>:wa<cr>:Make <Up>
noremap <F2> :wa<cr>:Make <Up>
command! -nargs=* Make write | make <args> | cwindow 6

"make the f1 key save-buffer key
inoremap <F1> <ESC>:wa<cr>
noremap <F1> :wa<cr>

"noremap <f7> :tabp<cr>
"noremap <s-f7> :bp<cr>
"noremap <f8> :tabn<cr>
"noremap <s-f8> :bn<cr>
"inoremap <f7> <esc>:bp<cr>
"inoremap <s-f7> <esc>:tabp<cr>
"inoremap <f8> <esc>:tabn<cr>
"inoremap <s-f8> <esc>:bn<cr>

"how often do I type ;;?
inoremap ;; <esc>

noremap <f4> :x<cr>
inoremap <f4> <esc>:wq<cr>

"noremap ,en :cnext<cr>
"noremap ,ep :cprevious<cr>
nnoremap <c-\>a :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap ,w <c-w>
nnoremap ,, <c-w><c-w>

"noremap gl :bprevious<cr>
"
if &diff
  noremap <f4> :qa<cr>
  noremap <f5> :wqa!<cr>
  noremap <f6> :qa!<cr>
endif

nnoremap <C-L> :nohl<CR><C-L>

"nmap <silent> <Leader>rg :!screen -p gams_run -X stuff \"gr\" <cr>
"let g:tmpa='screen -p gams_run -X stuff gr'
"nmap <Leader>rg :!screen -p gams_run -X stuff gr  <cr>

" for searching gams erros
noremap <Leader>e /\*\*\*\*.*$<cr>
noremap <Leader>v :view<cr>
" for clearing search views
noremap <Leader>ch :nohlsearch<CR>
"open scratch buffer
noremap <Leader>os :Scratch<CR>


nmap <tab> <c-w>
nmap <tab><tab> <c-w><c-w>

"attemp to fix backspace
"inoremap  
"nmap  
"cnoremap  
"==============================================================================

"======================== Spelling ============================================
" by default now toggle spell and nospell, if a count is given use portuguese
setlocal nospell
let g:togglespell = 0
let g:default_langn = 1 "1 for english, 2 for portuguese
function! ToggleSpell()
  if v:count != 0
    let g:default_langn = v:count
    let g:togglespell = 0 " force spelling this time
  endif
  if g:togglespell == 0
    if g:default_langn == 1
      setlocal spell spelllang=en_us
      echo "language = en_us"
    elseif g:default_langn == 2
      setlocal spell spelllang=pt
      echo "language = pt"
    else
      echom "No language correspondig to such option [1: English, 2 Portuguese]"
    endif
    let g:togglespell = 1
  else
    setlocal nospell
    let g:togglespell = 0
    echo "No spell Cheking"
  endif
endfunction
noremap <Leader>st :<C-U>call ToggleSpell() <cr>
"==============================================================================

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " do the gams stuff here
  autocmd BufRead,BufNewFile *.gms,*.inc set syntax=gams filetype=gams
  autocmd BufRead,BufNewFile *.lst set syntax=gams filetype=gamslst

  "source .vimrc if changes are made (cool)
  autocmd BufWritePost $MYVIMRC so %

  "for now set scip compatible settings (3 spaces indentation for c files)
  autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.c++ set shiftwidth=3
endif " has("autocmd")

let fortran_free_source = 1

" setting the color in terminals
if !has("gui_running") && !has("win32")
  "on windows default is better
  "colorscheme evening
  "colorscheme default
  "colorscheme morning
  "colorscheme darkblue
  "colorscheme fruit
  "colorscheme icansee
  "colorscheme greens
  "colorscheme freya
  "colorscheme 256_asu1dark
  "colorscheme desert256
  "colorscheme desert
  "colorscheme autumn
  "colorscheme leo
  "colorscheme torte
  "colorscheme blacksea_cs
  "colorscheme asu1dark_cs
  "colorscheme candycode_cs
  "colorscheme LightDefaultGrey_cs
  "colorscheme Dark2_cs
  "colorscheme anotherdark_cs
  "colorscheme  koehler_cs
   "colorscheme xoria256
   set bg=dark | colorscheme peaksea
endif

let g:relativenumber =2
"set relativenumber
function! ToggleRelativeNumber()
  if g:relativenumber == 0
    let g:relativenumber = 1
    set nonumber
    set relativenumber
  elseif g:relativenumber == 1
    let g:relativenumber = 2
    set norelativenumber
    set number
  else
    let g:relativenumber = 0
    set nonumber
    set norelativenumber
  endif
endfunction

noremap <Leader>tn :call ToggleRelativeNumber()<cr>
"set relativenumber

" Main settings and mappings for plugins
"



"========================== Latex =============================================
"latex options
"let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -src-specials $*'
" in case we get errors when using compiling because of python set to 0
let g:Tex_UsePython=1
let g:Tex_MultipleCompileFormats='dvi,pdf'
"make vim load .tex files as latex files
"let g:tex_flavor='latex'
let g:tex_flavor='pdflatex'
"let g:Tex_CompileRule_pdf = 'pdflatex --synctex=-1 -src-specials -interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'pdflatex  -interaction=nonstopmode $*'
let g:Tex_IgnoreLevel = 3
if has("autocmd") && has("win32")
  autocmd BufRead,BufNewFile *.tex compiler tex
endif

"for plugin in ftplugin/tex/tex_pdf.vim
let g:tex_pdf_map_keys = 0
"==============================================================================


"============================= NerdCommenter ==================================
"let NERDShutUp=1
"use nested comments by default in NerdCommenter
let g:NERDDefaultNesting=1
"==============================================================================

"======================== Statusline ==========================================
"set statusline=%-3.3n%t\ \ \ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%-3.3n%t\ \ %h%m%r\ %y%=%l/%L\ %3c\ \ \ %P
"set statusline=%-3.3n%t\ \ \ %h%m%r\ %y%=%{strftime(\"[%H:%M%p]\")}\ \ \ \ \ %l/%L\ \ %3c\ \ \ %P
set statusline=%-3.3n%t\ \ \ %h%m%r%=[%{&ft}\,
set statusline+=%{&ff}]\ \ \ %{strftime(\"[%H:%M%p]\")}
set statusline+=\ \ \ \ \ %l/%L\ \ %3c\ \ \ %P
"set statusline=%<%f%m\ \[%{&ff}:%{&fenc}:%Y]
"set statusline+=\ %{getcwd()}\ \ \[%{strftime('%Y/%b/%d\ %a\ %I:%M\ %p')}\]
"set statusline+=\ %=\ Line:%l\/%L\ Column:%c%V\ %P
"==============================================================================

com! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn
"
"

" =============================================================================
" Python
" =============================================================================
"au BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
"au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"

"" change some highlight
hi! ColorColumn term=underline ctermfg=188 ctermbg=236 guifg=fg guibg=#303030

"======================== PyLint Compiler =====================================
"autocmd FileType python compiler pylint
autocmd FileType python setlocal errorformat=%f:%l:\ %m
autocmd FileType python setlocal makeprg=epylint\ %
"==============================================================================

"============================ ctrlP ===========================================
"some ctrl settings and mappings
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir']
noremap ,pu :CtrlPMRUFiles<cr>
noremap ,pb :CtrlPBuffer<cr>
noremap ,pt :CtrlPTag<cr>
noremap ,pq :CtrlPQuickfix<cr>
noremap ,pd :CtrlPCurWD<cr>
noremap ,pj :CtrlPBufTagAll<cr>
noremap ,pf :CtrlPCurFile<cr>
"==============================================================================

"=============================== tagbar =======================================
"tagbar gms and gamslst settings

let g:tagbar_autofocus = 1
"tagbar width (default is 40)
let g:tagbar_width = 30

let g:tagbar_type_gams = {
  \ 'ctagstype': 'gams',
  \ 'kinds' : [
  \ 'e:equation',
  \ 'c:variable',
  \ 'm:model',
  \ 's:Solve Statement',
  \ ],
  \ }
let g:tagbar_type_gamslst = {
  \ 'ctagstype': 'gams',
  \ 'kinds' : [
  \ 'e:equation',
  \ 'c:var val',
  \ 'm:model',
  \ 's:Solve Statement',
  \ 'a:eq val',
  \ ],
  \ }

"noremap <F5> :TagbarToggle<CR>
"==============================================================================

"============================== pep8 ==========================================
"let g:pep8_map = '<leader>p8' "not used anymore
"let g:pep8_cmd  = 'pep8.py'
"let g:pep8_ignore = "E111,E221,E225"
" this is a different plugin, the one I used now doesn't work the same way
let g:pep8_args = " --ignore=E111,E221,E225"
"==============================================================================

"================================ UltiSnips ===================================
let g:UltiSnipsExpandTrigger = "<f10>"
let g:UltiSnipsListSnippets  = "<c-f10>"
let g:UltiSnipsJumpForwardTrigger  = "<f10>"
let g:UltiSnipsJumpBackwardTrigger ="<s-f10>""
nnoremap <f10> :call UltiSnips_ListSnippets()<cr>
"==============================================================================

"=============================== Supertab =====================================
"" for supertab plugin try changing the default context
let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"==============================================================================

"======================== Plugin Loading ======================================
"load eventual plugins here (the ones that would be really necessary)
"let g:p0 = split(&runtimepath, ',')[0]
if has("unix")
  let g:p0 = "~/.vim"
else
  let g:p0 = "~/vimfiles"
endif
runtime plugin/NERD_commenter.vim
runtime plugin/supertab.vim
runtime plugin/unimpaired.vim
runtime plugin/scratch.vim

function! LoadTagbar()
  runtime bundle/tagbar/plugin/tagbar.vim
  exec "set runtimepath+=" . g:p0 . "/bundle/tagbar"
  noremap <F5> :TagbarToggle<CR>
endf
noremap <f5> :call LoadTagbar()<cr>:TagbarToggle<CR>

function! LoadUltisnips()
  if !(has('unix') && executable('cygpath'))
    "cygwin vim does not have python
    runtime bundle/ultisnips_rep/plugin/UltiSnips.vim
    exec "set runtimepath+=" . g:p0 . "/bundle/ultisnips_rep"
  endif
  nnoremap <f10> :call UltiSnips_ListSnippets()<cr>
endfunction
nnoremap <f10> :call LoadUltisnips()<cr>:call UltiSnips_ListSnippets()<CR>

"for filetype tex we need imap.vim
if has("autocmd")
  autocmd FileType tex exec "source " . g:p0 . "/plugin/imaps.vim"
endif

function! LoadCtrlP()
  exec "set runtimepath+=" . g:p0 . "/bundle/ctrlp"
  runtime bundle/ctrlp/plugin/ctrlp.vim
endf
nnoremap <c-p> :call LoadCtrlP()<cr>
