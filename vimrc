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

"default path for runtime files
"let g:p0 = split(&runtimepath, ',')[0]
if has("unix")
  let g:p0 = "~/.vim"
else
  let g:p0 = "~/vimfiles"
endif


"============================= pathogen =======================================
let g:pathogen_disabled = []
"call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()
let g:pathogen_disabled += ['pyflakes', 'python-mode']
if has('unix') && executable('cygpath') "cygwin specific settings
  "cygwin vim does not have python
  let g:pathogen_disabled += ['lycosaexplorer', 'headlights', 'pysmell']
  let g:pathogen_disabled += ['ultisnips_rep', 'pyflakes', 'python-mode']
endif
if has("win32")
  "let g:pathogen_disabled += ['pysmell']
endif
call pathogen#infect()
"==============================================================================

"=============================== Settings =====================================
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
  set relativenumber
endif

"" set backup. but all the backuped files will be
"" placed in the directory specified by backupdir
set backup
exec "set backupdir^=" . g:p0 . "/backup"
exec "set directory^=" . g:p0 . "/swapdir"
if v:version >= 703
  exec "set undodir^=" . g:p0 . "/undodir"
endif
"if has("win32")
  "set backupdir^=$HOME\vimfiles\backup//
  "set directory^=$HOME\vimfiles\swapdir//
  "if v:version >= 703
    "set undodir^=$HOME\vimfiles\undodir//
  "endif
"else
  "set backupdir^=~/.vim/backup//
  "set directory^=~/.vim/swapdir//
  "if v:version >= 703
    "set undodir^=$HOME/.vim/undodir//
  "endif
"endif

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
set cot-=preview

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
"inoremap <F2> <ESC>:wa<cr>:Make <Up>
"noremap <F2> :wa<cr>:Make <Up>
inoremap <F2> <ESC>:call Make2()<cr><c-l>
noremap <F2> :call Make2()<cr><c-l>
command! -nargs=* Make write | let g:make_args="<args>" | make <args> | cwindow 6
function! Make2()
  if !exists("g:make_args")
    let g:make_args = ""
  endif
  write
  exec "silent! make " . g:make_args
  cwindow 6
  redraw
endfunction

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
  "colorscheme evening_cs
  "colorscheme default
  "colorscheme morning
  "colorscheme darkblue
  "colorscheme fruit
  "colorscheme icansee
  "colorscheme greens
  "colorscheme freya_cs
  "colorscheme asu1dark_cs
  "colorscheme desert256_cs
  "colorscheme desert
  "colorscheme leo_cs
  "colorscheme torte_cs
  "colorscheme blacksea_cs
  "colorscheme asu1dark_cs
  "colorscheme candycode_cs
  "colorscheme LightDefaultGrey_cs
  "colorscheme Dark2_cs
  "colorscheme anotherdark_cs
  "colorscheme  koehler_cs
   "colorscheme xoria256
   colorscheme  graywh_cs1
   "colorscheme peaksea | set background=dark
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

"=============================== tasklist =====================================
"todo list
noremap <leader>td <Plug>TaskList
"==============================================================================

"=============================== Taglist ======================================
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
"noremap <F3> :TlistToggle<cr>
"inoremap <F3> <ESC>:TlistToggle<cr>
"==============================================================================

"=============================== NerdTree =====================================
"NERDTree settings
let NERDTreeShowBookmarks = 1

"let g:togglelistornerdtree = 0
"function! ToogleTagListNerdTree()
  "if g:togglelistornerdtree == 0
    ""NERDTreeClose
    ""TlistOpen
    "TlistToggle
    ""setlocal nonumber
    ""setlocal norelativenumber
    "let g:togglelistornerdtree = 1
  "elseif g:togglelistornerdtree == 1
    "TlistToggle
    ""TlistClose

    ""NERDTreeToggle
    ""setlocal nonumber
    ""setlocal norelativenumber

    "let g:togglelistornerdtree = 0
  "else
    ""TlistClose
    ""NERDTreeClose
    "NERDTreeToggle
    "let g:togglelistornerdtree = 0
  "endif
"endfunction
"noremap <F3> :call ToogleTagListNerdTree() <cr>
"inoremap <F3> <ESC>:call ToogleTagListNerdTree() <cr>

"==============================================================================

"=============================== LustyJuggler =================================
"lusty juggler
let g:LustyJugglerShowKeys = 'a'
"==============================================================================

"=============================== yankRing =====================================
"yankring
let g:yankring_paste_using_g = 0 "I want gp to select the pasted text
let g:yankring_history_file = '.yankring_history'
if has("win32")
  let g:yankring_history_dir  = "$HOME/vimfiles"
else
  let g:yankring_history_dir = "$HOME/.vim" "don't want the file in the home folder
endif
"==============================================================================

"=============================== PreciseJump ==================================
nmap ,f :call PreciseJumpF(-1, -1, 0)<cr>
vmap ,f <ESC>:call PreciseJumpF(-1, -1, 1)<cr>
omap ,f :call PreciseJumpF(-1, -1, 0)<cr>
"==============================================================================


"======================== LustyExplorer and Juggler ===========================
nmap <silent> ,lf :LustyFilesystemExplorer<CR>
nmap <silent> ,lr :LustyFilesystemExplorerFromHere<CR>
nmap <silent> ,lb :LustyBufferExplorer<CR>
nmap <silent> ,lg :LustyBufferGrep<CR>
nmap <silent> ,lj :LustyJuggler<CR>
"==============================================================================

"========================= LocosaExplorer =====================================
"" lycosaexplorer alternative mappings
noremap  ,b :LycosaBufferExplorer<CR>
noremap  ,lh :LycosaFilesystemExplorerFromHere<CR>
noremap  ,le :LycosaFilesystemExplorer<CR>
"==============================================================================

"=============================== Unite ========================================
nnoremap <silent> ,uc  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> ,ub  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> ,ur  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uo  :<C-u>Unite outline<CR>
nnoremap ,uf  :<C-u>Unite source<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  nmap <buffer> <ESC>      <Plug>(unite_exit)
  inoremap <buffer> jj      <Plug>(unite_insert_leave)
  "inoremap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

  " <C-l>: manual neocomplcache completion.
  inoremap <buffer> <C-;>  <C-x><C-u><C-p><Down>

  " Start insert.
  "let g:unite_enable_start_insert = 1
  set nonumber
  set norelativenumber
endfunction"}}}

let g:unite_source_file_mru_limit = 200
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''
let g:unite_source_history_yank_enable = 1
"==============================================================================

"========================= LibClang ===========================================
let g:clang_use_library = 1
"==============================================================================

"=============================== Buffergator ==================================
"nmap <silent> <Leader>bb :TSelectBuffer<cr>
"Buffergator settings
let g:buffergator_suppress_keymaps      = 1
let g:buffergator_viewport_split_policy = "R"
let g:buffergator_split_size            = 26
noremap <Leader>bb :BuffergatorOpen<cr>
noremap <Leader>bB :BuffergatorClose<cr>
noremap <Leader>bt :BuffergatorTabsOpen<cr>
noremap <Leader>bT :BuffergatorTabsClose<cr>
"==============================================================================

"========================== Latex =============================================
"latex options
"let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -src-specials $*'
" in case we get errors when using compiling because of python set to 0
let g:Tex_UsePython=1
let g:Tex_MultipleCompileFormats='dvi,pdf'
"make vim load .tex files as latex files
"let g:tex_flavor='latex'
let g:tex_flavor='pdflatex'
let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_CompileRule_pdf = 'pdflatex --synctex=-1 -src-specials -interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'pdflatex  -interaction=nonstopmode $*'
let g:Tex_IgnoreLevel = 3
if has("autocmd") && has("win32")
  autocmd BufRead,BufNewFile *.tex compiler tex
        \ | setlocal textwidth=90
endif

"for plugin in ftplugin/tex/tex_pdf.vim
let g:tex_pdf_map_keys = 0
"==============================================================================


"============================= NerdCommenter ==================================
"let NERDShutUp=1
"use nested comments by default in NerdCommenter
let g:NERDDefaultNesting=1
"==============================================================================

"============================ autocomplpop (acp) ==============================
"don't want to start this completion thing before x chars
let g:acp_behaviorKeywordLength = 12
let g:acp_completeOption = '.,w,b,k,t'

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

"noremap <f11> :call ToggleAcpDisable()<cr>
"inoremap <f11> <ESC>:call ToggleAcpDisable()<cr>a
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
noremap <Leader>csa :cs add ../../cscope.out ../..<cr>

"======================== manpageview =========================================
let g:manpageview_winopen = "hsplit="
autocmd FileType man setlocal norelativenumber nonumber
"also created a file in bundle/manpageview/ftplugin/man.vim with map q to quit
"==============================================================================

"some pylint settings
let g:pylint_onwrite = 0

"pysmell
autocmd FileType python setlocal completefunc=pysmell#Complete

"mapping for running python code
nmap <F9> :SingleCompileRun<cr>

"======================== python_mode =========================================
"some python mode configuration. Don't always use but for now disable some
"settings when used
let g:pymode_lint = 0
let g:pymode_rope = 0
let g:pymode_options_indent = 0
let g:pymode_breakpoint = 0
"==============================================================================

"======================== PyLint Compiler =====================================
"autocmd FileType python compiler pylint
autocmd FileType python setlocal errorformat=%f:%l:\ %m
autocmd FileType python setlocal makeprg=epylint\ %
"==============================================================================

"=========================== localvim =========================================
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
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
let g:ctrlp_prompt_mappings = {
         \ 'PrtBS()':      ['<bs>', '<c-]>', '<c-h>'],
         \ 'PrtCurLeft()': ['<left>', '<c-^>'],
         \ }
"==============================================================================

"=============================== tagbar =======================================
"tagbar gms and gamslst settings

let g:tagbar_autofocus = 1
let g:tagbar_width = 30 "tagbar width (default is 40)
let g:tagbar_sort = 0 "by default sort by order in the file

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
let g:tagbar_type_tex = {
    \ 'ctagstype' : 'latex',
    \ 'kinds'     : [
        \ 's:sections',
        \ 'g:graphics',
        \ 'l:labels',
        \ 'r:refs:1',
        \ 'p:pagerefs:1'
    \ ],
    \ 'sort'    : 0,
\ }
    "\ 'deffile' : expand('<sfile>:p:h:h') . '/ctags/latex.cnf'

"noremap <F5> :TagbarToggle<CR>
""aditonal map, since vim-latex takes over f5
"noremap ,gt :TagbarToggle<cr>

function! ToggleTBarListNT()
  if v:count != 0
    let g:tbarlistnt = v:count
  else
    let g:tbarlistnt = 0
  endif
  if g:tbarlistnt == 0
    TagbarToggle
  elseif g:tbarlistnt == 1
    TlistToggle
  elseif g:tbarlistnt == 2
    NERDTreeToggle
  else
    echo "0 or no prefix: tagbar, 1: taglist, 2: nerdtree"
  endif
endfunction
nnoremap <F3> :<c-u>call ToggleTBarListNT() <cr>
inoremap <F3> <esc>:<c-u>call ToggleTBarListNT() <cr>
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
inoremap <f9> <c-r>=UltiSnips_JumpBackwards()<cr>
snoremap <f9> <esc>:call UltiSnips_JumpBackwards()<cr>
inoremap <silent> <c-j> <c-r>=UltiSnips_JumpForwards()<cr>
"==============================================================================

"=============================== Supertab =====================================
"" for supertab plugin try changing the default context
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"imap <nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-u>")<cr>
let g:mysupertabaltcom = 1
function! MySupertabAltCompletion()
  let g:mysupertabaltcom = 1 - g:mysupertabaltcom
  if g:mysupertabaltcom == 0 && &completefunc != ""
    return SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-u>")
  else
    return SuperTabAlternateCompletion("\<lt>c-p>")
  endif
endfunction
imap <nul> <c-r>=MySupertabAltCompletion()<cr>
"==============================================================================

"=============================== powerline ====================================
let g:Powerline_cache_file = expand(g:p0 . "/.Powerline.cache")
"let g:Powerline_symbols = 'unicode'
"==============================================================================

"=============================== Delete Whitespace ============================
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
command! DelTrailwhiteSpace call StripTrailingWhitespace()
"==============================================================================

"don't show file numbers in taglist and nerdtree
autocmd FileType nerdtree      setlocal norelativenumber
autocmd FileType taglist       setlocal norelativenumber
autocmd FileType qf            setlocal norelativenumber
autocmd FileType tlibInputList setlocal norelativenumber

"source explorer
let g:SrcExpl_isUpdateTags = 0

"don't enable showmarks, use \mt to toogle it
let g:showmarks_enable=0

"to change the colors if previous color desired :call PreviousColorScheme()
"noremap <F12> :call NextColorScheme()<CR>:echo GetColorSyntaxName() <cr>
noremap <Leader>nc :call NextColorScheme()<CR>:echo GetColorSyntaxName() <cr>
"noremap <F10> :call PreviousColorScheme()<CR>:echo GetColorSyntaxName() <cr>
"

"=============================== smartusline ==================================
"%-3.3n%t   %h%m%r%=[%{&ft},%{&ff}]   %{strftime("[%H:%M%p]")}     %l/%L  %3c   %P
let g:smartusline_string_to_highlight = '%-3.3n%t   %h%m%r'
"let smartusline_deep_eval = 1
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"==============================================================================
