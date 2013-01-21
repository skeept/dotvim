" is_windows, evim? {{{

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" This must be first, because it changes other options as a side effect.
set nocompatible

"default path for runtime files
"let g:p0 = split(&runtimepath, ',')[0]
if has("unix")
  let g:p0 = "~/.vim"
else
  let g:p0 = "~/vimfiles"
endif

let g:is_win = has('win32') || has('win64')
"}}}

" decide on pathogen or vam
let s:addon_manager = 2

"================== pathogen ================================================{{{
"we still use g:pathogen_disabled
let g:pathogen_disabled = []
"call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()
let g:pathogen_disabled += ['pyflakes', 'python-mode', 'pysmell']
let g:pathogen_disabled += ['powerline']
let g:pathogen_disabled += ['hilinks']
let g:pathogen_disabled += ['snipmate']
let g:pathogen_disabled += ['powershell', 'lycosaexplorer'] "lycosa is to heavy
"let g:pathogen_disabled += ['supertab']
"let g:pathogen_disabled += ['vlatex']
let g:pathogen_disabled += ['Align', 'AutoAlign']
if !has("python")
  let g:pathogen_disabled += ['lycosaexplorer', 'headlights']
  let g:pathogen_disabled += ['UltiSnips', 'pyflakes', 'python-mode']
endif
if g:is_win
  let g:pathogen_disabled += ['pysmell']
endif
if s:addon_manager == 1
  call pathogen#infect()
endif
"==============================================================================}}}

"================== vim-addon-manager========================================{{{
if s:addon_manager == 2
function! SetupVAM()
  let s:active_addons = []
  command! -nargs=* -bar VAMAddToActiveAddons let s:active_addons += [<f-args>]

  let g:vim_addon_manager = {}
  let vam_install_path = escape(expand(g:p0 . '/bundle'), ' \')
  exec 'set rtp+='.vam_install_path.'/vam'
  let g:vim_addon_manager.additional_addon_dirs = [escape(expand(g:p0 . '/notused_plugins'), ' \')]

  " let g:vim_addon_manager = { your config here see "commented version" example and help

  "let s:active_addons  = ['ctrlp', 'SmartusLine', 'TaskList']
  ""let s:active_addons += ['Indent_Guides'
  "let s:active_addons += ['d.0']
  "let s:active_addons += ['Bufstop', 'delimitMate']
  ""let s:active_addons += ['clang_complete']
  "let s:active_addons += ['supertab', 'CountJump']
  "let s:active_addons += ['ManPageView', 'vimproc', 'Tagbar']
  ""let s:active_addons += ['undotree', 'textobj-word-column']
  ""let s:active_addons += ['fugitive', 'gitv']

  VAMAddToActiveAddons ctrlp SmartusLine TaskList supertab
  VAMAddToActiveAddons d.0 Bufstop delimitMate CountJump
  VAMAddToActiveAddons ManPageView vimproc Tagbar tlib
  "VAMAddToActiveAddons LaTeX-Box vlatex SpellCheck LanguageTool
  "VAMAddToActiveAddons SnippetCompleteSnipMate SnippetComplete
  "VAMAddToActiveAddons yankstack
  if has("python")
    "let s:active_addons += ['UltiSnips']
    "VAMAddToActiveAddons UltiSnips
  endif

  call vam#ActivateAddons(s:active_addons, {'auto_install' : 0})

  command! -nargs=* -bar -complete=customlist,vam#install#InstalledAddonCompletion AA
        \ :call vam#ActivateAddons([<f-args>], {'auto_install' : 0, 'force_loading_plugins_now': 1})
endfunction
call SetupVAM()
endif
"==============================================================================}}}

"================== Settings =================================================={{{
" Use Vim settings, rather then Vi settings (much better!).

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
set scrolloff=2 "kepp XX lines of contex when editing
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

set viminfo=h,'100,<10000,s1000,/1000,:1000
"==============================================================================}}}

"================== Mappings =================================================={{{
" Don't use Ex mode, use Q for formatting
noremap Q gq

" Make p in Visual mode replace the selected text with the "z register.
vnoremap p <Esc>:let current_reg = @z<CR>gvs<C-R>=current_reg<CR><Esc>
command! -nargs=1 CR execute "vnoremap p <Esc>:let current_reg = @<args><CR>gvs<C-R>=current_reg<CR><Esc>"

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
nnoremap ,di :registers<CR>

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

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" we already have <Leader>pt as pastetoogle, but I always get confused
nnoremap <Leader>tp :set paste!<CR>

"select everything in visual mode (from Damian Conway setup)
vnoremap aa VGo1G
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
  "normal "up']$
  normal "up'[
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
        \ | nnoremap <buffer> <Leader>e /\*\*\*\*.*$<CR>:set nohls<CR><C-L>
  autocmd BufRead,BufNewFile *.lst set syntax=gams filetype=gamslst
        \ | nnoremap <buffer> <Leader>e /\*\*\*\*.*$<CR>:set nohls<CR><C-L>

  "source .vimrc if changes are made (cool)
  "autocmd BufWritePost $MYVIMRC so %

  "for now set scip compatible settings (3 spaces indentation for c files)
  autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.c++ set shiftwidth=3

  "place quickfix window below all other windows
  autocmd! FileType qf wincmd J

  "set readonly files to autoread
  autocmd BufRead,BufNewFile * if &readonly == 1 | setlocal autoread
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
   colorscheme  graywh_cs1
   "colorscheme peaksea | set background=dark
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

"================== tasklist =================================================={{{
"useful for managing a todo list
noremap <leader>t_ <Plug>TaskList
noremap <leader>td :TaskList<CR>
"==============================================================================}}}

"================== Taglist ==================================================={{{
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
let tlist_gams_settings='gams;e:Equation;c:Variable;m:Model;s:Solve Statement'
let tlist_gamslst_settings = 'gamslst;m:Model Solution Report;'
let tlist_gamslst_settings .= 'e:Equation;c:Variable Val;a:Equation Val'
"noremap <F3> :TlistToggle<CR>
"inoremap <F3> <ESC>:TlistToggle<CR>
"==============================================================================}}}

"================== NerdTree =================================================={{{
"NERDTree settings
let NERDTreeShowBookmarks = 1
"==============================================================================}}}

"================== PreciseJump ==============================================={{{
"nnoremap ,f :call PreciseJumpF(-2, -1, 0)<CR>
nnoremap ,f :call PreciseJumpF(-1, -1, 0)<CR>
vnoremap ,f <ESC>:call PreciseJumpF(-1, -1, 1)<CR>
onoremap ,f :call PreciseJumpF(-1, -1, 0)<CR>
"==============================================================================}}}

"================== Unite ====================================================={{{
nnoremap <silent> ,ub :<C-u>UniteWithBufferDir -buffer-name=files
      \ -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>

function! UniteColorSchemeResume()
  if !exists("s:unite_init_colorscheme")
    let s:unite_init_colorscheme = 1
    Unite -buffer-name=colorscheme colorscheme
  else
    UniteResume colorscheme
  endif
endfunction

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  nmap <buffer> <ESC> <Plug>(unite_exit)
  inoremap <buffer> jj <Plug>(unite_insert_leave)
  "inoremap <buffer> <C-w> <Plug>(unite_delete_backward_path)

  "nmap <buffer> s :call unite#do_action('preview')<CR><Plug>(unite_loop_cursor_down)
  nmap <buffer> s jp
  nmap <buffer> S kp

  " <C-l>: manual neocomplcache completion.
  inoremap <buffer> <C-;> <C-x><C-u><C-p><Down>

  " Start insert.
  "let g:unite_enable_start_insert = 1
  setlocal nonumber
  setlocal norelativenumber
endfunction"}}}

let g:unite_source_file_mru_limit = 200
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''
let g:unite_source_history_yank_enable = 1

function! LoadUnite()
  call vam#ActivateAddons(['unite', 'unite-mark', 'unite-outline',
	\ 'unite-tag', 'unite-colorscheme'],
        \ {'auto_install' : 0, 'force_loading_plugins_now': 1})
  nnoremap <silent> ,ud :<C-u>UniteWithCurrentDir -buffer-name=files
	\ buffer file_mru bookmark file<CR>
  nnoremap <silent> ,ub :<C-u>UniteWithBufferDir -buffer-name=files
	\ -prompt=%\  buffer file_mru bookmark file<CR>
  nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
  nnoremap <silent> ,uo :<C-u>Unite outline<CR>
  nnoremap ,uf :<C-u>Unite source<CR>
  "nnoremap ,uc :<C-U>Unite -buffer-name=colorscheme colorscheme<CR>
  nnoremap ,uc :<C-U>call UniteColorSchemeResume()<CR>
endfunction

nnoremap <silent> ,ud :call LoadUnite()<CR>:<C-U>UniteWithCurrentDir file<CR>
nnoremap <silent> ,uc :call LoadUnite()<CR>:<C-U>call UniteColorSchemeResume()<CR>
nnoremap <silent> ,uo :call LoadUnite()<CR>:<C-U>Unite outline<CR>
nnoremap <silent> ,uf :call LoadUnite()<CR>:<C-U>Unite source<CR>

"==============================================================================}}}

"================== LibClang =================================================={{{
let g:clang_use_library = 1
"note, this does not work when the first file is loaded. Just reload the first
"file (:e!) and chill out
function! LoadClangComplete()
  if exists("s:loaded_clang_complete") | return '' | endif
  ActivateAddons clang_complete
  let s:loaded_clang_complete = 1
endfunction
autocmd FileType c,cpp call LoadClangComplete()
"==============================================================================}}}

"================== Buffergator ==============================================={{{
"nmap <silent> <Leader>bb :TSelectBuffer<CR>
"Buffergator settings
let g:buffergator_suppress_keymaps      = 1
let g:buffergator_viewport_split_policy = "R"
let g:buffergator_split_size            = 26
"Load Buffergator only on Demand
function! LoadBuffergator()
  if exists("s:loaded_buffergator") | return '' | endif
  ActivateAddons Buffergator
  "noremap <Leader>bb :BuffergatorOpen<CR>
  "noremap <Leader>bB :BuffergatorClose<CR>
  "noremap <Leader>bt :BuffergatorTabsOpen<CR>
  "noremap <Leader>bT :BuffergatorTabsClose<CR>
  let s:loaded_buffergator = 1
endfunction
"==============================================================================}}}

"================== Bufstop ==================================================={{{
function! MyBuffStopCall()
  if     v:count == 1 | Bufstop
  elseif v:count == 2 | BufstopFast
  elseif v:count == 3 | BufstopMode
  else
    BufstopModeFast
  endif
endfunction
nnoremap <Leader>b :<C-U>call MyBuffStopCall()<CR>
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
  if hostname() == "SHABBIRSTU3"
    let g:SumatraPdfLoc = 'C:\Documents and Settings\hinacio\Applications' .
          \ '\PortableApps\PortableApps\SumatraPDFPortable\SumatraPDFPortable'
  endif
  let g:Tex_ViewRule_pdf = g:SumatraPdfLoc . " -reuse-instance"
else
  let g:Tex_ViewRule_pdf = 'okular'
endif

function! LoadLatexPlugins()
  if exists("s:loaded_latex_plugins") | return '' | endif

  imap <F8> <Plug>IMAP_JumpForward
  nmap <F8> <Plug>IMAP_JumpForward
  vmap <F8> <Plug>IMAP_JumpForward
  vmap <F8> <Plug>IMAP_DeleteAndJumpForward
  ActivateAddons LaTeX-Box vlatex SpellCheck LanguageTool

  "will it be necessary to load after/ftplugin/tex again?

  let s:loaded_latex_plugins = 1
endfunction
autocmd FileType tex call LoadLatexPlugins()
"remoteOpen must be loaded in order to open from external viewer
runtime bundle/vlatex/plugin/remoteOpen.vim


"for plugin in ftplugin/tex/tex_pdf.vim
let g:tex_pdf_map_keys = 0
"==============================================================================}}}

"================== NerdCommenter ============================================={{{
"let NERDShutUp=1
"use nested comments by default in NerdCommenter
let g:NERDDefaultNesting=1
"==============================================================================
"}}}

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

function! XgetTagbarFunc()
  if &ft == "help"
    return ""
  else
    return tagbar#currenttag('[%s] ', '')
  endif
endfunction

let g:displtxcf = '' "one time display
function! DispLTXCF()
  "use this to debug other things
  " by displaying information in statusline
  " redifine it where appropriate
  "return '[' . len(getline(".")) . ',' . getpos(".")[2] . ']'
  "return '[' . g:displtxcf . ']'
  return ''
endfunction

"set statusline=%2.2n\ %t\ %h%m%r%=[%{&ft}\,%{&ff}]
set statusline=%2.2n\ %t
set statusline+=\ %h%#Modified#%m%r%*%=
"set statusline+=%{XgetTagbarFunc()}
set statusline+=%{CondDispFtFf()}
set statusline+=%{DispLTXCF()}
"set statusline+=\ %h%m%r%=%{CondDispFtFf()}
"set statusline+=%{tagbar#currenttag('[%s] ', '')}
"set statusline+=\ %{strftime(\"[%H:%M%p]\")} "do we want to show time?
set statusline+=\ %l/%L\ %2c\ %P

"=============================== smartusline =================================={{{
"%-3.3n%t   %h%m%r%=[%{&ft},%{&ff}]   %{strftime("[%H:%M%p]")}     %l/%L  %3c   %P
hi Modified guifg=black guibg=#FFA500
let g:smartusline_string_to_highlight = '%2.2n %t %h'
"let smartusline_deep_eval = 1
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"==============================================================================}}}
"==============================================================================}}}

"================== python settings ==========================================={{{
"some pylint settings
let g:pylint_onwrite = 0

"pysmell
function! LoadPysmell()
  if exists("s:loadedPysmell")
    return ''
  endif
  if has("python")
    silent python << EOF
import vim
try:
  import pysmell
  vim.command('let s:has_pysmell = 1')
except:
  vim.command('let s:has_pysmell = 0')
EOF

    if s:has_pysmell == 1
        ActivateAddons pysmell
      setlocal completefunc=pysmell#Complete
      autocmd filetype python setlocal completefunc=pysmell#Complete
    else
      echom "No Pysmell installed!"
    endif
  else
    echom "Cannot Load PySmell: No Python!"
  endif
  let s:loadedPysmell = 1
endfunction

function! LoadJedi()
  if exists("s:loadedJedi")
    return ''
  endif
  if has("python")
    silent python << EOF
import vim
try:
  import jedi
  vim.command('let s:has_jedi = 1')
except:
  vim.command('let s:has_jedi = 0')
EOF

    if s:has_jedi == 1
      let g:jedi#show_function_definition = "0"
      ActivateAddons jedi-vim
      setlocal omnifunc=jedi#complete
    else
      echom "No Jedi installed!"
    endif
  else
    echom "Cannot Load Jedi No Python!"
  endif
  let s:loadedJedi = 1
endfunction

"choose one of pysmell or jedi for the completion in python
"autocmd FileType python call LoadPysmell()
autocmd FileType python call LoadJedi()

"mapping for running python code
"nmap <F9> :SingleCompileRun<CR>

"================== python_mode (plugin) ======================================{{{
"some python mode configuration. Don't always use but for now disable some
"settings when used
let g:pymode_lint = 0
let g:pymode_rope = 0
let g:pymode_options_indent = 0
let g:pymode_breakpoint = 0
"==============================================================================}}}

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
nnoremap <silent> <C-P> :<C-U>silent! exe 'CtrlP' . g:ctrlp_comm[v:count]<CR>
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
      if !exists("s:loaded_taglist")
        ActivateAddons taglist
        let s:loaded_taglist = 1
      endif
      TlistToggle
    elseif s:tbartoggle == 3
      if !exists("s:loaded_nerdtree")
        silent ActivateAddons nerdtree
        let s:loaded_nerdtree = 1
      endif
      NERDTreeToggle
    elseif s:tbartoggle == 4
      if !exists("s:loaded_buffergator") | call LoadBuffergator() | endif
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

"nnoremap <F10> :call UltiSnips_ListSnippets()<CR>
inoremap <F9> <C-R>=UltiSnips_JumpBackwards()<CR>
snoremap <F9> <ESC>:call UltiSnips_JumpBackwards()<CR>
""inoremap <silent> <NL> <C-R>=UltiSnips_JumpForwards()<CR>
""snoremap <silent> <NL> <ESC>:call UltiSnips_JumpForwards()<CR>
"inoremap <silent> <NL> <C-R>=UltiSnips_ExpandSnippetOrJump()<CR>
"snoremap <silent> <NL> <ESC>:call UltiSnips_ExpandSnippetOrJump()<CR>

function! LoadUltisnips()
  if has("python")
    call vam#ActivateAddons(['UltiSnips'], {'auto_install' : 0, 'force_loading_plugins_now': 1})
    if has("autocmd")
      autocmd FileType * call UltiSnips_FileTypeChanged()
      autocmd BufNewFile,BufRead *.snippets setf snippets
    endif
    call UltiSnips_FileTypeChanged()
    inoremap <silent> <buffer> <NL> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0) ?
          \ "" : IMAP_Jumpfunc('', 0)<CR>
    snoremap <silent> <buffer> <NL> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0) ?
          \ "" : IMAP_Jumpfunc('', 0)<CR>

    inoremap <silent> <F10> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0) ?
          \ "" : UltiSnips_ListSnippets()<CR>
    return 1
  else
    echom "vim compiled without python"
    return 0
  endif
endfunction
nnoremap <F10> :if LoadUltisnips() \| call UltiSnips_ListSnippets() \| endif<CR>
inoremap <F10> <C-R>=LoadUltisnips()?UltiSnips_ExpandSnippet():""<CR>
inoremap <C-J> <C-R>=LoadUltisnips()?UltiSnips_ExpandSnippet():""<CR>

function! Ulti_ExpandOrJump_and_getRes() "{{{
  " use only for latex new
  call UltiSnips_ExpandSnippetOrJump()
  return g:ulti_expand_or_jump_res
endfunction "}}}

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

"================== powerline ================================================={{{
if index(g:pathogen_disabled, 'powerline') == -1
  let g:Powerline_cache_file = expand(g:p0 . "/.Powerline.cache")
  "let g:Powerline_symbols = 'unicode'
  "let g:Powerline_theme       = 'skwp'
  "let g:Powerline_colorscheme = 'skwp'
  "let g:Powerline_theme = 'solarized256'
  "let g:Powerline_colorscheme = 'solarized256'
  let g:Powerline_stl_path_style = 'filename'
  call Pl#Theme#RemoveSegment('currenttag')
  call Pl#Theme#RemoveSegment('branch')
endif
"==============================================================================}}}

"================== other commands/mappings/settings =========================={{{
"================== Don't view files with inconsistent ctrl-r ================={{{
map ,ml :ed ++ff=dos<CR>
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


function! Uniq () range "{{{
  " from Damian Conway scripting the vim editor
  " Nothing unique seen yet...
  let have_already_seen = {}
  let unique_lines = []

  " Walk through the lines, remembering only the hitherto-unseen ones...
  for original_line in getline(a:firstline, a:lastline)
    let normalized_line = '>' . original_line
    if !has_key(have_already_seen, normalized_line)
      call add(unique_lines, original_line)
      let have_already_seen[normalized_line] = 1
    endif
  endfor

  " Replace the range of original lines with just the unique lines...
  exec a:firstline . ',' . a:lastline . 'delete'
  call append(a:firstline-1, unique_lines)
endfunction
command! -range Uniq <line1>,<line2>call Uniq()
"}}}


function! IsLineEndInsert() "{{{
  "in insert mode last is +1 len"
  return getpos(".")[2] == (1 + len(getline(".")))
endfunction "}}}

" {{{ commands
" delete current buffer but don't delete the view
command! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn

"fix not having <c-i> for the jumplist after mapping tab
command! -count=1 Jump exe ":norm! <count>\<C-I>"

" Change to Current's File Folder
command! ChgDirCurrFileFolder lcd %:p:h
" }}}

"" change some highlight
hi! ColorColumn term=underline ctermfg=188 ctermbg=236 guifg=fg guibg=#303030

let fortran_free_source = 1

"source explorer
let g:SrcExpl_isUpdateTags = 0

"don't enable showmarks, use \mt to toogle it
let g:showmarks_enable=0

"================== snipmate =================================================={{{
let g:snippets_dir = g:p0 . "/bundle/snipmate/snippets"
"==============================================================================}}}

"================== localvim =================================================={{{
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
"==============================================================================}}}

"================== yankRing / yankstack ======================================{{{
let g:yankring_paste_using_g = 0 "I want gp to select the pasted text
let g:yankring_history_file = '.yankring_history'
let g:yankring_history_dir = g:p0

if index(s:active_addons, 'yankstack') >= 0
  nmap ,y <Plug>yankstack_substitute_older_paste
  nmap ,Y <Plug>yankstack_substitute_newer_paste
endif
"==============================================================================}}}

"================== A.vim settings ============================================{{{
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,./inc,../'
"==============================================================================}}}

"================== autocomplpop (acp) ========================================{{{
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

"noremap <f11> :call ToggleAcpDisable()<CR>
"inoremap <f11> <ESC>:call ToggleAcpDisable()<CR>a
"==============================================================================}}}

"================== manpageview ==============================================={{{
let g:manpageview_winopen = "hsplit="
autocmd FileType man setlocal norelativenumber nonumber
"also created a file in bundle/manpageview/ftplugin/man.vim with map q to quit
"==============================================================================}}}

"================== languagetool =============================================={{{
let g:languagetool_disable_rules = "WHITESPACE_RULE,EN_QUOTES,CURRENCY," .
      \ "COMMA_PARENTHESIS_WHITESPACE,EN_UNPAIRED_BRACKETS"
"==============================================================================}}}

"================== LustyExplorer and Juggler ================================={{{
"nmap <silent> ,lf :LustyFilesystemExplorer<CR>
"nmap <silent> ,lr :LustyFilesystemExplorerFromHere<CR>
"nmap <silent> ,lb :LustyBufferExplorer<CR>
"nmap <silent> ,lg :LustyBufferGrep<CR>
"nmap <silent> ,lj :LustyJuggler<CR>
"==============================================================================}}}

"================== LustyJuggler =============================================={{{
"lusty juggler
let g:LustyJugglerShowKeys = 'a'
"==============================================================================}}}

"================== LycosaExplorer ============================================{{{
"" lycosaexplorer alternative mappings
if index(g:pathogen_disabled, 'lycosaexplorer') == -1
  noremap ,b :LycosaBufferExplorer<CR>
  noremap ,lh :LycosaFilesystemExplorerFromHere<CR>
  noremap ,le :LycosaFilesystemExplorer<CR>

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
  nnoremap ,e :<c-u> call ToggleLycosa()<CR>
else
  noremap ,b :CtrlPBuffer<CR>
  noremap ,e :CtrlPCurFile<CR>
endif

"==============================================================================}}}

"================== vim-pipe commands ========================================={{{
autocmd FileType python let b:vimpipe_command="python"
autocmd FileType perl let b:vimpipe_command="perl"
autocmd FileType tex let b:vimpipe_command="latexmk"
"==============================================================================}}}

"================== ConqueTerm ================================================{{{
let g:ConqueTerm_ReadUnfocused = 1
"==============================================================================}}}

"================== QuickRun =================================================={{{
let g:quickrun_config = {}
let g:quickrun_config.python = {
      \ 'runner': 'vimproc',
      \ }
"==============================================================================}}}

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
noremap <Leader>csa :cs add ../../cscope.out ../..<CR>

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

"================== delimitmate ==============================================={{{
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
"==============================================================================}}}

"================== fugitive =================================================={{{
nnoremap ,gcf :<C-U>Gcommit -v %<CR>
nnoremap ,gca :<C-U>Gcommit -v -a<CR>
nnoremap ,gp :<C-U>Git push<CR>
nnoremap ,gdf :<C-U>Git diff<CR>
"==============================================================================}}}

"================== Thesis Specific Settings =================================={{{
"let compname = ($COMPUTERNAME == "") ? $HOSTNAME : $COMPUTERNAME
let compname = hostname()
if compname == "MIDDLE-EARTH" || compname == "Gondor"
    let g:thesis_path = $HOME . "/Desktop/tmp/Thesis"
  elseif compname == "ISENGARD2"
    let g:thesis_path = $HOME . ""
  elseif compname == "Isengard-3000-N100"
    let g:thesis_path = $HOME .  "/Documents/Thesis"
  elseif compname == "SHABBIRSTU3"
    let g:thesis_path = 'U:\WORK\Thesis'
  elseif compname =~ 'isye.gatech.edu' || compname == 'ISENGARD'
    let g:thesis_path = $HOME . "/WORK/Thesis"
endif

function! MyThesisEnv()
  if has("gui")
    winpos 0 0
    set guioptions-=m "no menu bar for now
    set lines=100 columns=91
  endif
  silent exec "cd " . g:thesis_path
  nmap <silent> \tt :silent !perl OtherFiles/do_tags.pl<CR>
  command! ThesisCompileView !start perl run_latexmk.pl

  set wildignore+=*.pdf,*.log,*.aux,*.toc,*.blg,*.fls

  "exe "command! MLRT1 '<'>s/\(xl\|xu\|yl\|yu\|zl\|zu\)/\=" .
        "\ "{'xu':'x^u', 'xl':'x^l', 'yl':'y^l', 'yu':'y^u', 'zl':'z^l', 'yu':'y^u'}" .
        "\ "[submatch(0)]/gc"
  command! MLRT1 call histadd("cmd", "'<,'>s/" . '\(x\|y\|z\)\(l\|u\)/\1^\2/gc')
  command! MLRT2 call histadd("cmd", "'<,'>s/" . '\(x\|y\|z\)\(l\|u\)^/(\1^\2)^/gc')
  command! MLRT3 call histadd("cmd", "'<,'>s/" . '\\text{\([^}]*\)}/\1/gc')
  function! MyLatexReplaceText(...)
    call histadd("cmd", "'<,'>s/\\\\text{\\([^}]*\\)}/\\1/gc")
    if a:0 > 0
      if a:0 != 2
        echom "provide two lists to the function"
        return ''
      endif
      let g:replace_list_in = a:1
      let g:replace_list_out = a:2
      let g:replace_ncur = 0
    endif
    if a:0 == 0 && !exists("g:replace_ncur")
      let g:replace_list_in = ['xl^', 'xl', 'xu^', 'xu', 'yl', 'yu', 'zl', 'zu']
      let g:replace_list_out = ['(x^l)^', 'x^l', '(x^u)^', 'x^u', 'y^l', 'y^u', 'z^l', 'z^u']
      let g:replace_ncur = 0
    endif
    if g:replace_ncur == len(g:replace_list_in)
      let g:replace_cmd = ":echom 'reached end of list'\<CR>"
      let g:replace_ncur = -1
    else
      let range_ = "'<,'>"
      let extra_flags = 'gc'
      let g:replace_cmd = ':' .range_ . "s/" .  g:replace_list_in[g:replace_ncur]
            \ . "/" . g:replace_list_out[g:replace_ncur] . "/" . extra_flags
            \ . "\<CR>"
      call histadd("cmd", g:replace_cmd)
    endif
    let g:replace_ncur += 1
    return g:replace_cmd
  endfunction
  nnoremap <silent><expr> <Leader>ns MyLatexReplaceText()

  function! MyForwardSearch()
    let target = g:thesis_path . '/tdraft.pdf'
    let cmd = g:SumatraPdfLoc .  " -reuse-instance -forward-search " . expand('%:p') . " " . line('.') . " " . target
    let execString = 'silent! !start ' . cmd
    exe execString
  endfunction
  if g:is_win
    nnoremap <Leader>la :<C-U>call MyForwardSearch()<CR>
  else
    nnoremap <Leader>la <Leader>ls
  endif

endfunction

command! Mt call MyThesisEnv()
"==============================================================================}}}

"================== neocomplcache ============================================={{{
" Use neocomplcache?
let g:neocomplcache_enable_at_startup = 1 && (
      \ (s:addon_manager == 1 && index(g:pathogen_disabled, 'neocomplcache') == -1) ||
      \ (s:addon_manager == 2 && index(s:active_addons, 'neocomplcache') >= 0))
if g:neocomplcache_enable_at_startup == 1
  let g:acp_enableAtStartup = 0
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 0
  " Use camel case completion.
  let g:neocomplcache_enable_camel_case_completion = 0
  " Use underbar completion.
  let g:neocomplcache_enable_underbar_completion = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 6
  let g:neocomplcache_min_keyword_length = 6
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

  " disable file name completion
  let g:neocomplcache_source_disable = {
        \ 'filename_complete' : 1
        \ }

  " Define keyword.
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  "inoremap <expr><C-G>     neocomplcache#undo_completion()
  "inoremap <expr><C-L>     neocomplcache#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <expr><silent> <CR> <SID>my_cr_function()
  function! s:my_cr_function()
    return pumvisible() ? neocomplcache#close_popup() . "\<CR>" : "\<CR>"
  endfunction
  " <TAB>: completion.
  "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y> pumvisible() ? neocomplcache#close_popup() : "\<C-Y>"
  inoremap <expr><C-e> pumvisible() ? neocomplcache#cancel_popup() :
        \ IsLineEndInsert() ? "\<C-E>" : "\<C-O>$"

  " For cursor moving in insert mode(Not recommended)
  "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
  "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
  "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
  "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
  "let g:neocomplcache_enable_cursor_hold_i = 1
  "let g:neocomplcache_enable_insert_char_pre = 1

  " AutoComplPop like behavior.
  "let g:neocomplcache_enable_auto_select = 1

  " Shell like behavior(not recommended).
  set completeopt+=longest
  let g:neocomplcache_enable_auto_select = 0
  let g:neocomplcache_disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
  "inoremap <expr><TAB>  pumvisible() ? "\<C-N>" : "\<C-X>\<C-U>\<C-N>"
  "inoremap <expr><S-TAB>  pumvisible() ? "\<C-P>" : "\<C-X>\<C-U>\<C-P>"
  inoremap <expr><F12> pumvisible() ? "\<C-N>" : "\<C-X>\<C-U>\<C-N>"
  "inoremap <expr><CR>  pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
  inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"

  inoremap <expr><C-U> pumvisible() ? neocomplcache#smart_close_popup() . "\<C-U>" : "\<C-G>u\<C-U>"

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
  "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif
"==============================================================================}}}

"=================== Plugin Loading ==========================================={{{
function! LoadQuickRun() "{{{
  call vam#ActivateAddons(['quickrun'],
        \ {'auto_install' : 0, 'force_loading_plugins_now': 1})
  nnoremap ,qr :QuickRun<CR>
endfunction
nnoremap ,qr :call LoadQuickRun()<CR>:QuickRun<CR>
"}}}
"==============================================================================}}}

" vim: foldmethod=marker
