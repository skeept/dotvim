
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


" pathogen 
"call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()
"let g:pathogen_disabled = ['whatever', 'unite.vim']
let g:pathogen_disabled = ['pyflakes', 'pep8']
call pathogen#infect()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
"set backspace=indent,eol,start
set backspace=2
set esckeys

set autoindent		" always set autoindenting on
set splitright          "split the window to the right
set splitbelow          "open the window to the bottom

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ignorecase
"set smartcase
set showmatch           " show matching parenthesis
set laststatus=2
set cmdheight=1

if v:version >= 703
  set undofile
  set relativenumber
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

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" select the text just last pasted or edited :)
nnoremap gp `[v`]

"cmap tb tab split +b

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

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

endif " has("autocmd")

set whichwrap=<,>,[,],h,l
let whichwrapOrig=&whichwrap
"the above is the same thing as 
"set ww=<,>,[,],h,l

" in insert mode make ctrl-a and ctrl-e behave like in emacs
"imap <C-A> <ESC>0i
imap <C-E> <ESC>$a

"map f2 to make
imap <F2> <ESC>:wa<cr>:Make <Up>
map  <F2> :wa<cr>:Make <Up>
command! -nargs=* Make write | make <args> | cwindow 6

"make the f1 key save-buffer key
imap <F1> <ESC>:wa<cr>
map <F1> :wa<cr>

"map  <f7> :tabp<cr>
"map  <s-f7> :bp<cr>
"map  <f8> :tabn<cr>
"map  <s-f8> :bn<cr>
"imap <f7> <esc>:bp<cr>
"imap <s-f7> <esc>:tabp<cr>
"imap <f8> <esc>:tabn<cr>
"imap <s-f8> <esc>:bn<cr>

"how often do I type ;;?
imap ;; <esc>

map  <f4> :x<cr>
imap <f4> <esc>:wq<cr>

"map ,en :cnext<cr>
"map ,ep :cprevious<cr>
nnoremap  <c-\>a :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap  ,w <c-w>
nnoremap  ,, <c-w><c-w>

"map gl :bprevious<cr>
"
if &diff
  map <f4> :qa<cr>
  map <f5> :wqa!<cr>
  map <f6> :qa!<cr>
endif

let fortran_free_source = 1

set nopaste
"set pastetoggle=<S-F3>
set pastetoggle=<Leader>pt


"Set terminal capabilities before the colorscheme
"set t_Co=128
set t_Co=256
"set t_Co=88


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
   colorscheme  graywh_cs1
endif


" some spelling related options mappings and functions
setlocal nospell
let g:togglespell = 0
function! ToggleSpell()
        if g:togglespell == 0
                setlocal spell spelllang=en_us
                let g:togglespell = 1
		echo "language = en_us"
        elseif g:togglespell == 1
	  	setlocal spell spelllang=pt
                let g:togglespell = 2
		echo "language = pt"
        else
                setlocal nospell
                let g:togglespell = 0
		echo "No spell Cheking"
        endif
endfunction
"map <F5> :call ToggleSpell()<cr>
"imap <F5> <C-O>:call ToggleSpell()<cr>
map <Leader>s :call ToggleSpell() <cr>

let g:relativenumber =2
function! ToogleRelativeNumber()
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

map <Leader>tn :call ToogleRelativeNumber()<cr>
"set relativenumber

"pep8
"let g:pep8_map = '<leader>p8' "not used anymore
let g:pep8_cmd  = 'pep8.py'
let g:pep8_ignore = "E111,E221,E225"
"todo list
map <leader>td <Plug>TaskList

"taglist options 
"let Tlist_Close_On_Select = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Horiz_Window = 0
let Tlist_WinWidth = 31
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
" the following is useful to use configure ctags for using taglist with gams
let tlist_gams_settings='gams;e:equation;c:variable;m:model;s:Solve Statement'
let tlist_gamslst_settings='gamslst;m:model;e:equation;c:var val;a:eq val'
"map <F3> :TlistToggle<cr>
"imap <F3> <ESC>:TlistToggle<cr>
"
"NERDTree settings
let NERDTreeShowBookmarks = 1

"1tagbar settings
let g:tagbar_autofocus = 1
"tagbar width (default is 40)
let g:tagbar_width = 30

"lusty juggler
let g:LustyJugglerShowKeys = 'a'

"yankring 
let g:yankring_paste_using_g = 0 "I want gp to select the pasted text
let g:yankring_history_file = '.yankring_history'
if has("win32") 
  let g:yankring_history_dir  = "$HOME/vimfiles"
else
  let g:yankring_history_dir = "$HOME/.vim" "don't want the file in the home folder
endif

nmap ,f :call PreciseJumpF(-1, -1, 0)<cr>
vmap ,f <ESC>:call PreciseJumpF(-1, -1, 1)<cr>
omap ,f :call PreciseJumpF(-1, -1, 0)<cr>

"don't show file numbers in taglist and nerdtree
autocmd FileType nerdtree      setlocal norelativenumber
autocmd FileType taglist       setlocal norelativenumber
autocmd FileType qf            setlocal norelativenumber
autocmd FileType tlibInputList setlocal norelativenumber


let g:togglelistornerdtree = 0
function! ToogleTagListNerdTree()
  if g:togglelistornerdtree == 0
    "NERDTreeClose
    "TlistOpen
    TlistToggle
    "setlocal nonumber
    "setlocal norelativenumber
    let g:togglelistornerdtree = 1
  elseif g:togglelistornerdtree == 1
    TlistToggle
    "TlistClose

    "NERDTreeToggle

    "setlocal nonumber
    "setlocal norelativenumber

    let g:togglelistornerdtree = 0
  else
    "TlistClose
    "NERDTreeClose
    NERDTreeToggle
    let g:togglelistornerdtree = 0
  endif
endfunction

"fuction to toogle behaviour of autocomplpop
let g:is_acp_disabled = 0
function! ToggleAcpDisable()
  if g:is_acp_disabled == 0
    AcpLock
    let g:is_acp_disabled = 1
  else
    AcpUnlock
    let g:is_acp_disabled = 0
  endif
endfunction

"source explorer
let g:SrcExpl_isUpdateTags = 0


"don't enable showmarks, use \mt to toogle it
let g:showmarks_enable=0

map <f11> :call ToggleAcpDisable()<cr>
imap <f11> <ESC>:call ToggleAcpDisable()<cr>a

map <F3> :call ToogleTagListNerdTree() <cr>
imap <F3> <ESC>:call ToogleTagListNerdTree() <cr>
map <F5> :TagbarToggle<CR>

nmap <silent> ,lf :LustyFilesystemExplorer<CR>
nmap <silent> ,lr :LustyFilesystemExplorerFromHere<CR>
nmap <silent> ,lb :LustyBufferExplorer<CR>
nmap <silent> ,lg :LustyBufferGrep<CR>

nmap <silent> ,lj :LustyJuggler<CR>

nnoremap <silent> ,uc  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> ,ub  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> ,ur  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uo  :<C-u>Unite outline<CR>
nnoremap  ,uf  :<C-u>Unite source<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  nmap <buffer> <ESC>      <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

  " <C-l>: manual neocomplcache completion.
  inoremap <buffer> <C-;>  <C-x><C-u><C-p><Down>

  " Start insert.
  "let g:unite_enable_start_insert = 1
  set nonumber
  set norelativenumber
endfunction"}}}


"libclang completion
let g:clang_use_library = 1

let g:unite_source_file_mru_limit = 200
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''

nmap <silent> <Leader>bb :TSelectBuffer<cr> 
nnoremap <C-L> :nohl<CR><C-L>

"nmap <silent> <Leader>rg :!screen -p gams_run -X stuff \"gr\" <cr>
"let g:tmpa='screen -p gams_run -X stuff gr'
"nmap  <Leader>rg :!screen -p gams_run -X stuff gr  <cr>


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


"neocomplcache
"let g:neocomplcache_enable_at_startup = 1 

""tab complete
"function! InsertTabWrapper(direction)
    "let col = col('.') - 1
    "if !col || getline('.')[col - 1] !~ '\k'
        "return "\<tab>"
    "elseif "backward" == a:direction
        "return "\<c-p>"
    "else
        "return "\<c-n>"
    "endif
"endfunction
"inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
"inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

" for searching gams erros
map <Leader>e /\*\*\*\*.*$<cr>
map <Leader>v :view<cr>
" for clearing search views
map <Leader>ch :nohlsearch<CR>
"open scratch buffer 
map <Leader>os :Scratch<CR>


"let NERDShutUp=1
"hi TabLine cterm=reverse

"map H :let &hlsearch = !&hlsearch<CR>

"use nested comments by default in NerdCommenter
let g:NERDDefaultNesting=1

"don't want to start this completion thing before x chars
let g:acp_behaviorKeywordLength = 5
let g:acp_completeOption = '.,w,b,k,t'

"" for supertab plugin try changing the default context
let g:SuperTabDefaultCompletionType = "context"

"to change the colors if previous color desired :call PreviousColorScheme()
"map <F12> :call NextColorScheme()<CR>:echo GetColorSyntaxName() <cr>
map <Leader>nc :call NextColorScheme()<CR>:echo GetColorSyntaxName() <cr>
"map <F10> :call PreviousColorScheme()<CR>:echo GetColorSyntaxName() <cr>


"set statusline=%-3.3n%t\ \ \ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%-3.3n%t\ \ %h%m%r\ %y%=%l/%L\ %3c\ \ \ %P
"set statusline=%-3.3n%t\ \ \ %h%m%r\ %y%=%{strftime(\"[%H:%M%p]\")}\ \ \ \ \ %l/%L\ \ %3c\ \ \ %P
set statusline=%-3.3n%t\ \ \ %h%m%r%=[%{&ft}\ \ 
set statusline+=%{&ff}]\ \ \ %{strftime(\"[%H:%M%p]\")}
set statusline+=\ \ \ \ \ %l/%L\ \ %3c\ \ \ %P
"set statusline=%<%f%m\ \[%{&ff}:%{&fenc}:%Y]
"set statusline+=\ %{getcwd()}\ \ \[%{strftime('%Y/%b/%d\ %a\ %I:%M\ %p')}\]
"set statusline+=\ %=\ Line:%l\/%L\ Column:%c%V\ %P

set foldmethod=syntax
set title
set virtualedit+=block

com! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn
"
"
"for now set scip compatible settings (3 spaces indentation for c files)
if has("autocmd")
  autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.c++ set shiftwidth=3
end " has("autocmd")

"if !has("win32") "for gnu grep, do some other setting for windows (maybe use cygwin?)
  "set grepprg=grep\ -nIH\ --exclude=tags\ --exclude=cscope.out
  "we change to setting from H to -h so the filename does not show up
  set grepprg=grep\ -nIh\ --exclude=tags\ --exclude=cscope.out
"endif


" ==================================================
" Python
" ==================================================
"au BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
"au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"
"for scip go up two folders
set tags=./tags,./TAGS,tags,TAGS,../tags,../../tags

"" change some highlight
hi! ColorColumn   term=underline ctermfg=188 ctermbg=236 guifg=fg guibg=#303030

"some plugins don't work weel with some enviroments, just try to adjust them
let g:LustyExplorerSuppressRubyWarning = 1
if !has("python")
  let g:loaded_gundo = 1
  let loaded_gundo = 1
endif

"don't load plugins in that cause errors for previous versions
if v:version < 702
  let g:loaded_ZoomWinPlugin = 1
  let g:loaded_tagbar = 1
endif
if v:version < 703
  let g:loaded_autoload_l9 = 1
endif

"load cscope in two levels up
map <Leader>csa :cs add ../../cscope.out ../..<cr>
set cot-=preview

let g:unite_source_history_yank_enable = 1

let g:manpageview_winopen = "hsplit="

"some pylint settings
let g:pylint_onwrite = 0

"pysmell
autocmd FileType python setlocal completefunc=pysmell#Complete

"mapping for running python code
nmap <F9> :SingleCompileRun<cr>

