" is_windows, evim? {{{


" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" This must be first, because it changes other options as a side effect.
set nocompatible

let g:is_vimrc_simple = 1 "so we can do something specific in gvimrc

"default path for runtime files
"let g:p0 = split(&runtimepath, ',')[0]
if has("unix")
  let g:p0 = "~/.vim"
else
  let g:p0 = "~/vimfiles"
endif

let g:is_win = has('win32') || has('win64')
"}}}

"================== Settings =================================================={{{
" Use Vim settings, rather then Vi settings (much better!).

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
if !has("nvim") " newer nvim doesn't have this
  set pastetoggle=<Leader>pt
endif

"Set terminal capabilities before the colorscheme
"set t_Co=128
set t_Co=256
"set t_Co=88

set backup
exec "set backupdir^=" . g:p0 . "/backup"
exec "set directory^=" . g:p0 . "/swapdir"
if v:version >= 703
  set undofile
  exec "set undodir^=" . g:p0 . "/undodir"
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

"if !g:is_win "for gnu grep, do some other setting for windows (maybe use cygwin?)
  "set grepprg=grep\ -nIH\ --exclude=tags\ --exclude=cscope.out
  "we change to setting from H to -h so the filename does not show up
  set grepprg=grep\ -nIh\ --exclude={tags,cscope.out}
"endif

"for scip go up two folders
set tags=./tags,./TAGS,tags,TAGS,../tags,../../tags

set wildignore+=*.o,*.obj,.git,.hg,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*~
set wildignore+=tags,cscope.out,*.db

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
set cot-=preview

"==============================================================================}}}

"================== Mappings =================================================={{{
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
inoremap <expr><C-E> IsLineEndInsert() ? "\<C-E>" : "\<C-O>$"

"noremap f2 to make
"inoremap <F2> <ESC>:wa<CR>:Make <Up>
"noremap <F2> :wa<CR>:Make <Up>
inoremap <F2> <ESC>:call Make2()<CR><c-l>
noremap <F2> :call Make2()<CR><c-l>
command! -nargs=* Make write | let g:make_args="<args>" | make <args> | cwindow 6
function! Make2()
  if !exists("g:make_args")
    let g:make_args = ""
  endif
  wall
  exec "silent! make " . g:make_args
  cwindow 6
  redraw
endfunction

"make the f1 key save-buffer key
inoremap <F1> <ESC>:wa<CR>
noremap <F1> :wa<CR>

"how often do I type ;;?
inoremap ;; <esc>
inoremap {{ {<CR><CR>}<ESC>kcc

"do I really change colorscheme that often?
nnoremap ,sc :<C-U>colorscheme<space>
nnoremap ,dr :registers<CR>

" make <BS> <DEL> <C-U> and <C-W> undoable
" h i_Ctrl-g_u
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
inoremap <BS> <C-G>u<BS>
inoremap <DEL> <C-G>u<DEL>

noremap <f4> :x<CR>
inoremap <f4> <esc>:wq<CR>

"noremap ,en :cnext<CR>
"noremap ,ep :cprevious<CR>
nnoremap <c-\>a :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap ,w <c-w>
nnoremap ,, <c-w><c-w>

"noremap gl :bprevious<CR>
"
if &diff
  noremap <f4> :qa<CR>
  noremap <f5> :wqa!<CR>
  noremap <f6> :qa!<CR>
endif

nnoremap <C-L> :nohl<CR><C-L>

"nmap <silent> <Leader>rg :!screen -p gams_run -X stuff \"gr\" <CR>
"let g:tmpa='screen -p gams_run -X stuff gr'
"nmap <Leader>rg :!screen -p gams_run -X stuff gr  <CR>

" for searching gams erros
noremap <Leader>e /\*\*\*\*.*$<CR>:set nohls<CR><c-l>
noremap <Leader>v :view<CR>
" for clearing search views
noremap <Leader>ch :nohlsearch<CR>
"open scratch buffer
noremap <Leader>os :Scratch<CR>

nmap <TAB> <C-W>
nmap <TAB><TAB> <C-W><C-W>

"attemp to fix backspace
"inoremap  
"nmap  
"cnoremap  

"record something in register u by default
""noremap <Leader>rs :set nomore<CR>quq:redir @U<CR>

noremap q; :
noremap q' "
"==============================================================================}}}

"================== redir ====================================================={{{
noremap <Leader>rs :set nomore \| let @u = "" \| redir @U<CR>
noremap <Leader>re :redir END \| set more \| "-> u<CR>
function! CaptureOutFun(cmd)
  set nomore
  let @u = ""
  redir @U
  exec a:cmd
  redir END
  set more
  normal "up']$
endfunction
command! -nargs=* CaptureOut silent call CaptureOutFun("<args>")
nnoremap ,co :CaptureOut<SPACE>
"==============================================================================}}}

"================== Spelling =================================================={{{
" by default now toggle spell and nospell, if a count is given use Portuguese
setlocal nospell
let g:togglespell = 0
let g:default_langn = 1 "1 for English, 2 for Portuguese
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
noremap <Leader>st :<C-U>call ToggleSpell() <CR>
"==============================================================================}}}

"================== autocommands =============================================={{{
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
  "autocmd BufWritePost $MYVIMRC so %

  "for now set scip compatible settings (3 spaces indentation for c files)
  autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.c++ set shiftwidth=3

  "place quickfix window below all other windows
  autocmd! FileType qf wincmd J

  "set readonly files to autoread
  autocmd BufRead,BufNewFile * if &readonly == 1 | setlocal autoread so=0
        \ sbo+=ver,hor | endif

  "mappings for specific buffers
  autocmd FileType help map <buffer> <space> <c-d>
  autocmd FileType help map <buffer> <bs> <c-u>

  "don't show file numbers in taglist and nerdtree
  autocmd FileType nerdtree      setlocal norelativenumber
  autocmd FileType taglist       setlocal norelativenumber
  autocmd FileType qf            setlocal norelativenumber
  autocmd FileType tlibInputList setlocal norelativenumber


endif " has("autocmd")
"==============================================================================}}}

"================== colorscheme ==============================================={{{
" setting the color in terminals
if !has("gui_running") && !g:is_win
  "on windows default is better
  "colorscheme evening_cs
  "colorscheme default
  "colorscheme morning
  "colorscheme darkblue
  "colorscheme fruit
  "colorscheme icansee
  "colorscheme greens
  "colorscheme freya_cs
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
   set bg=dark | colorscheme peaksea
endif
"==============================================================================}}}

"================== number/relativenumber ====================================={{{
let g:relativenumber = 2
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

noremap <Leader>tn :call ToggleRelativeNumber()<CR>
"set relativenumber
"==============================================================================}}}

"================== LycosaExplorer ============================================{{{
"" lycosaexplorer alternative mappings
noremap  ,lh :LycosaFilesystemExplorerFromHere<CR>
noremap  ,le :LycosaFilesystemExplorer<CR>

function! ToggleLycosa()
  if v:count == 0
    LycosaFilesystemExplorer
  elseif v:count == 1
    LycosaBufferExplorer
  elseif v:count == 2
    LycosaFilesystemExplorerFromHere
  else
    echo "0: File System, 1:buffer, 2: File from here"
  endif
endfunction
"nnoremap ,e :<c-u> call ToggleLycosa()<CR>
"==============================================================================}}}

"================== Latex ====================================================={{{
"latex options
"let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -src-specials $*'
" in case we get errors when using compiling because of python set to 0
let g:Tex_UsePython=1
let g:Tex_MultipleCompileFormats='dvi,pdf'
"make vim load .tex files as latex files
"let g:tex_flavor='latex'
let g:tex_flavor='pdflatex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'pdflatex --synctex=-1 -src-specials -interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'pdflatex  --synctex=1 -interaction=nonstopmode $*'
let g:Tex_IgnoreLevel = 3
let g:tex_comment_nospell= 1 "don't do spelling in comments
if has("autocmd") && g:is_win
  autocmd BufRead,BufNewFile *.tex compiler tex
        \ | setlocal textwidth=90
endif

if g:is_win
  let g:SumatraPdfLoc = expand("$HOME" .
        \ "/Programs/PApps/PortableApps/SumatraPDFPortable/SumatraPDFPortable")
  let g:Tex_ViewRule_pdf = g:SumatraPdfLoc . " -reuse-instance"
endif

"for plugin in ftplugin/tex/tex_pdf.vim
let g:tex_pdf_map_keys = 0
"==============================================================================}}}

"================== NerdCommenter ============================================={{{
"let NERDShutUp=1
"use nested comments by default in NerdCommenter
let g:NERDDefaultNesting=1
"==============================================================================}}}

"================== Statusline ================================================{{{
"set statusline=%-3.3n%t\ \ \ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%-3.3n%t\ \ %h%m%r\ %y%=%l/%L\ %3c\ \ \ %P
"set statusline=%-3.3n%t\ \ \ %h%m%r\ %y%=%{strftime(\"[%H:%M%p]\")}\ \ \ \ \ %l/%L\ \ %3c\ \ \ %P
"
"set statusline=%<%f%m\ \[%{&ff}:%{&fenc}:%Y]
"set statusline+=\ %{getcwd()}\ \ \[%{strftime('%Y/%b/%d\ %a\ %I:%M\ %p')}\]
"set statusline+=\ %=\ Line:%l\/%L\ Column:%c%V\ %P
"
"set statusline=%-3.3n%t\ \ \ %h%m%r%=[%{&ft}\,
"set statusline+=%{&ff}]\ \ \ %{strftime(\"[%H:%M%p]\")}
"set statusline+=\ \ \ \ \ %l/%L\ \ %3c\ \ \ %P
"
function! CondDispFtFf()
  if winwidth(0) < 70 || &filetype == 'help'
    let val = ''
  else
    let xft = &filetype
    let xff = &fileformat
    let val =  '[' . xft . ( xft == '' ? '' : ',' ) . xff . ']'
  endif
  return val
endfunction

"set statusline=%2.2n\ %t\ %h%m%r%=[%{&ft}\,%{&ff}]
set statusline=%2.2n\ %t\ %h%m%r%=%{CondDispFtFf()}
"set statusline+=\ %{strftime(\"[%H:%M%p]\")} "do we want to show time?
set statusline+=\ %l/%L\ %2c\ %P
"==============================================================================}}}

"================== python settings ==========================================={{{
"================== PyLint Compiler ==========================================={{{
"autocmd FileType python compiler pylint
autocmd FileType python setlocal errorformat=%f:%l:\ %m
autocmd FileType python setlocal makeprg=epylint\ %
"==============================================================================}}}

"================== pep8 ======================================================{{{
"let g:pep8_map = '<leader>p8' "not used anymore
"let g:pep8_cmd  = 'pep8.py'
"let g:pep8_ignore = "E111,E221,E225"
"
" this is a different plugin, the one I used now doesn't work the same way
" E221 multiple spaces before operator -- aligning equals breaks this
" E111 indentation is not a multiple of four -- I use two spaces
" E225 missing whitespace around operator -- I like * without space
" E501 line too long   -- allow more than 80 characters
let g:pep8_args = " --ignore=E111,E221,E225,E501"
"==============================================================================}}}
"==============================================================================}}}

"================== ctrlP ====================================================={{{
"some ctrl settings and mappings
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'changes']
let g:ctrlp_jump_to_buffer = 0 "don't like this behavior
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_depth = 2
noremap ,pu :CtrlPMRUFiles<CR>
noremap ,pb :CtrlPBuffer<CR>
noremap ,pt :CtrlPTag<CR>
noremap ,pq :CtrlPQuickfix<CR>
noremap ,pd :CtrlPCurWD<CR>
noremap ,pj :CtrlPBufTagAll<CR>
noremap ,pf :CtrlPCurFile<CR>
noremap ,pa :CtrlPShowArr<CR>
let g:ctrlp_prompt_mappings = {
         \ 'PrtBS()':      ['<bs>', '<c-]>', '<c-h>'],
         \ 'PrtCurLeft()': ['<left>', '<c-^>'],
         \ }
let g:ctrlp_map = ''
command! CtrlPShowArr call CtrlpShowArrFun()
function! CtrlpShowArrFun()
  let i = 0
  let msg = ''
  for v in g:ctrlp_comm
    let msg .= i
    let msg .= ':'
    let msg .= g:ctrlp_comm[i]
    let msg .= ' '
    let i = i + 1
  endfor
  echo msg
endfunction
let g:ctrlp_comm = ['', 'Buffer', 'MRUFiles', 'CurWD', 'Dir',
      \'Root', 'Tag', 'CurFile']
nnoremap <silent> <c-p> :<c-u>silent! exe 'CtrlP' . g:ctrlp_comm[v:count]<CR>
"==============================================================================}}}

"================== tagbar ===================================================={{{
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
  \ 'ctagstype': 'gamslst',
  \ 'kinds' : [
  \ 'm:Model Solution Report',
  \ 'e:Equation',
  \ 'c:Variable Val:1',
  \ 'a:Equation val:1',
  \ ],
  \ }

let g:tagbar_type_tex = {
  \ 'ctagstype' : 'latex',
  \ 'kinds'     : [
    \ 's:sections',
    \ 'l:labels',
    \ 'r:refs:1',
    \ 'g:graphics:1:0',
    \ 'p:pagerefs:1:0'
  \ ],
  \ 'sort'    : 0,
  \ }

"noremap <F5> :TagbarToggle<CR>
""aditonal map, since vim-latex takes over f5
"noremap ,gt :TagbarToggle<CR>

function! ToggleTBarListNT()
  "always use last explicit argument
  if !exists("s:tbartoggle")
    let s:tbartoggle = 1
  endif

  let s:tbartoggle_names = ['1: tagbar', '2: taglist', '3: nerdtree', '4: buffergator']

  if v:count >= 1 && v:count <= 4
    let s:tbartoggle = v:count
  endif

  if v:count <= 4
    if s:tbartoggle == 1
      TagbarToggle
    elseif s:tbartoggle == 2
      TlistToggle
    elseif s:tbartoggle == 3
      NERDTreeToggle
    elseif s:tbartoggle == 4
      BuffergatorToggle
    endif
  endif
  let s:tbartoggle_display = copy(s:tbartoggle_names)
  let s:tbartoggle_display[s:tbartoggle-1] .= '(*)'
  echom join(s:tbartoggle_display, ', ')
endfunction
nnoremap <F3> :<c-u>call ToggleTBarListNT()<CR>
inoremap <F3> <esc>:<c-u>call ToggleTBarListNT()<CR>
"==============================================================================}}}

"================== UltiSnips ================================================={{{
let g:UltiSnipsExpandTrigger = "<F10>"
let g:UltiSnipsListSnippets = "<C-F10>"
let g:UltiSnipsJumpForwardTrigger = "<F10>"
let g:UltiSnipsJumpBackwardTrigger ="<S-F10>""
let g:UltiSnipsEditSplit = "horizontal"
nnoremap <F10> :call UltiSnips_ListSnippets()<CR>
inoremap <F9> <C-R>=UltiSnips_JumpBackwards()<CR>
snoremap <F9> <ESC>:call UltiSnips_JumpBackwards()<CR>
"inoremap <silent> <NL> <C-R>=UltiSnips_JumpForwards()<CR>
"snoremap <silent> <NL> <ESC>:call UltiSnips_JumpForwards()<CR>
inoremap <silent> <NL> <C-R>=UltiSnips_ExpandSnippetOrJump()<CR>
snoremap <silent> <NL> <ESC>:call UltiSnips_ExpandSnippetOrJump()<CR>
"==============================================================================}}}

"================== Supertab =================================================={{{
"" for supertab plugin try changing the default context
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"inoremap <nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-u>")<CR>
let g:mysupertabaltcom = 1
function! MySupertabAltCompletion()
  "alternate between keyword completion and user omni completion
  "when in latex complete tags
  let g:mysupertabaltcom = 1 - g:mysupertabaltcom
  if g:mysupertabaltcom == 0 && (&completefunc != "" || &filetype == 'tex')
    if &completefunc != ""
      return SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-u>")
    else
      return SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-]>")
    endif
  else
    return SuperTabAlternateCompletion("\<lt>c-p>")
  endif
endfunction
inoremap <nul> <c-r>=MySupertabAltCompletion()<CR>
"==============================================================================}}}

"================== other commands/mappings/settings =========================={{{
"================== Don't view files with inconsistent ctrl-r ================={{{
map ,m :ed ++ff=dos<CR>
command! HideCtrlM ed ++ff=dos
autocmd BufReadPost * nested
      \ if !exists('b:reload_dos') && !&binary && &ff=='unix' && (0 < search('\r$', 'nc')) |
      \   let b:reload_dos = 1 |
      \   e ++ff=dos |
      \ endif
"==============================================================================}}}

"================== scrollbind mappings ======================================={{{
noremap ,sbt :windo set scrollbind<CR>
noremap ,sbf :windo set noscrollbind<CR>
"==============================================================================}}}

"================== Fix shell=bash in windows ================================={{{
if g:is_win && &shell =~ 'bash'
"let $TMP = 'c:\\htemp\\tmp'
set shell=C:\Windows\System32\cmd.exe
set shellxquote=(
endif
"==============================================================================}}}

"================== Delete Whitespace ========================================={{{
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
"==============================================================================}}}

function! IsLineEndInsert()
  "in insert mode last is +1 len"
  return getpos(".")[2] == (1 + len(getline(".")))
endfunction

" delete current buffer but don't delete the view
command! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn

"" change some highlight
hi! ColorColumn term=underline ctermfg=188 ctermbg=236 guifg=fg guibg=#303030

"fix not having <c-i> for the jumplist after mapping tab
command! -count=1 Jump exe ":norm! <count>\<C-I>"

let fortran_free_source = 1

"==============================================================================}}}

"================== A.vim settings ============================================{{{
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,./inc,../'
"==============================================================================}}}

"================== full screen with plugin ==================================={{{
"plugin: http://www.vim.org/scripts/script.php?script_id=2596
if g:is_win
  let g:isMaximized = 0
  function! FullScreenToogleFun()
    if g:isMaximized == 0
      let g:defaultNumCols = &columns
      let g:defaultNumLines = &lines
      let g:currposx = getwinposx()
      let g:currposy = getwinposy()
      call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
      let g:isMaximized = 1
    else
      call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
      let g:isMaximized = 0
      exec "set columns=" . g:defaultNumCols
      exec "set lines=" . g:defaultNumLines
      exec "winpos" . g:currposx . " " . g:currposy
    endif
  endfunction

  "command! FullScreenToogle call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
  command! FullScreenToogle call FullScreenToogleFun()
  noremap  <Leader>tf :FullScreenToogle<CR>
endif
"==============================================================================}}}

"=================== Plugin Loading ==========================================={{{
" always load {{{
runtime plugin/NERD_commenter.vim
runtime bundle/supertab/plugin/supertab.vim
runtime plugin/unimpaired.vim
runtime plugin/scratch.vim
"}}}

function! LoadTagbar() "{{{
  runtime bundle/tagbar/plugin/tagbar.vim
  exec "set runtimepath+=" . g:p0 . "/bundle/tagbar"
  "nnoremap <F3> :TagbarToggle<CR>
  nnoremap <F3> :<C-U>call ToggleTBarListNT() <CR>
  inoremap <F3> <ESC>:<C-U>call ToggleTBarListNT() <CR>
endf
nnoremap <F3> :call LoadTagbar()<CR>:<C-U>call ToggleTBarListNT()<CR>
inoremap <F3> <CR>:call LoadTagbar()<CR>:<C-U>call ToggleTBarListNT()<CR>
"}}}

function! LoadUltisnips() "{{{
  if has("python")
    runtime bundle/UltiSnips/plugin/UltiSnips.vim
    exec "set runtimepath+=" . g:p0 . "/bundle/UltiSnips"
    if has("autocmd")
      autocmd FileType * call UltiSnips_FileTypeChanged()
      autocmd BufNewFile,BufRead *.snippets setf snippets
    endif
    call UltiSnips_FileTypeChanged()
    nnoremap <F10> :call UltiSnips_ListSnippets()<CR>
    return 1
  else
    echom "vim compiled without python"
    return 0
  endif
endfunction
nnoremap <F10> :if LoadUltisnips() \| call UltiSnips_ListSnippets() \| endif<CR>
inoremap <F10> <C-R>=LoadUltisnips()?UltiSnips_ExpandSnippet():""<CR>
"}}}

function! LoadCtrlP() "{{{
  exec "set runtimepath+=" . g:p0 . "/bundle/ctrlp"
  runtime bundle/ctrlp/plugin/ctrlp.vim
  nnoremap <silent> <c-p> :<c-u>silent! exe 'CtrlP' . g:ctrlp_comm[v:count]<CR>
  nnoremap <silent> ,b :<C-U>CtrlPBuffer<CR>
endf
nnoremap <c-p> :call LoadCtrlP()<CR>
      \:<c-u>CtrlP<CR>
nnoremap ,b :<C-U>call LoadCtrlP()<CR>:<C-U>CtrlPBuffer<CR>
"}}}

function! LoadLycosa() "{{{
  exec "set runtimepath+=" . g:p0 ."/bundle/lycosaexplorer"
  runtime bundle/lycosaexplorer/plugin/lycosaexplorer.vim
  nnoremap ,e :<c-u>call ToggleLycosa()<CR>
endfunction
nnoremap ,e :call LoadLycosa()<CR>:<c-u>LycosaFilesystemExplorer<CR>
"}}}

"for filetype tex we need imap.vim
if has("autocmd")
  autocmd FileType tex exec "source " . g:p0 . "/bundle/vlatex/plugin/imaps.vim"
endif
"==============================================================================}}}

" vim: foldmethod=marker
