" common settings and functions to both vimrc and simple.vim

"================== Settings =================================================={{{
" Use Vim settings, rather then Vi settings (much better!).

" allow backspacing over everything in insert mode
"set backspace=indent,eol,start
set backspace=2
set esckeys

set autoindent		" always set autoindenting on
if 1 || !exists("g:is_vimrc_simple")
  set splitright          "split the window to the right
  set splitbelow          "open the window to the bottom
endif

set history=200
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
exec "set backupdir^=" . g:p0 . "/tmp/backup"
exec "set directory^=" . g:p0 . "/tmp/swapdir"
if v:version >= 703
  set undofile
  exec "set undodir^=" . g:p0 . "/tmp/undodir"
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

set grepprg=grep\ -nIh\ --exclude={tags,cscope.out}

"for scip go up two folders
set tags=./tags,./TAGS,tags,TAGS,../tags,../../tags

set wildignore+=*.o,*.obj,.git,.hg,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*~
set wildignore+=tags,cscope.out,*.db,*.pdf
set wildignore+=GTAGS,GRTAGS,GPATH

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
"noremap Q gq

" Make p in Visual mode replace the selected text with the "z register.
" check http://www.reddit.com/r/vim/comments/17l6si/can_i_make_a_mapping_that_takes_advantage_of_an/
" and help v:register on how to change this
command! -nargs=1 CR execute
      \ "vnoremap p <Esc>:let current_reg = @<args><CR>gvs<C-R>=current_reg<CR><Esc>"
vnoremap p <Esc>:let current_reg = @z<CR>gvs<C-R>=current_reg<CR><Esc>

" select the text just last pasted or edited :)
nnoremap gp `[v`]
nnoremap <expr> gV    "`[".getregtype(v:register)[0]."`]"

nnoremap gy m`^yg_``
nnoremap gY yg_

"if EOL copy char bellow, otherwise go to EOL
inoremap <expr> <C-E> IsLineEndInsert() ? "\<C-E>" : "\<C-O>$"

inoremap <F2> <ESC>:call Make2()<CR><C-L>
noremap <F2> :call Make2()<CR><C-L>
function! Make2()
  if !exists("g:make_args")
    let g:make_args = ""
  endif
  wall
  exec "silent! make " . g:make_args
  cwindow 6
  redraw
endfunction
command! -nargs=* Make write | let g:make_args="<args>" | make <args> | cwindow 6

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
  noremap <F4> :qa<CR>
  noremap <F5> :wqa!<CR>
  noremap <F6> :qa!<CR>
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
nnoremap ,i <C-I>

noremap q; :
noremap q' "

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap ,; :<UP>

" we already have <Leader>pt as pastetoogle, but I always get confused
nnoremap <Leader>tp :set paste!<CR>

"select everything in visual mode (from Damian Conway setup)
vnoremap aa VGo1G
"==============================================================================}}}

"================== redir ====================================================={{{
function! CaptureToRegisterU()
  "enable/disable capture of output to register u
  let s:msg = ""
  if exists("g:captureToRegisterUinProgress") || v:count == 1
    redir END
    set more
    if exists("g:captureToRegisterUinProgress")
      unlet g:captureToRegisterUinProgress
      let s:msg .= 'Finished recording to reg u. '
    endif
    if v:count == 1
      silent normal "up
      "echo "Finished recording to register u; pasted contents of reg u"
      let s:msg .= "Pasted contents of reg u."
    endif
  else
    let g:captureToRegisterUinProgress = 1
    set nomore
    let @u = ""
    redir @U
    "echo "Capturing Output to register u"
    let s:msg .= "Capturing output to reg u. "
  endif
  echo s:msg
endfunction

function! RedirToScratch()
  redir END
  set more
  Sscratch
  normal "up
endfunction

function! CaptureOutFun(cmd, scratch)
  let old_more=&more
  set nomore
  let @u = ""
  redir @U
  exec a:cmd
  redir END
  let &more=old_more
  if a:scratch == 1
    Sscratch
    normal Go
  endif
  normal "up'[
endfunction

command! -nargs=* CaptureOut silent call CaptureOutFun("<args>", 0)
command! -nargs=* CaptureOutScratch silent call CaptureOutFun("<args>", 1)

nnoremap ,co :CaptureOut<SPACE>
nnoremap <Leader>co :CaptureOut<SPACE>
nnoremap ,cq :CaptureOutScratch<SPACE>
nnoremap <Leader>cq :CaptureOutScratch<SPACE>
nnoremap <Leader>rr :<C-U>call CaptureToRegisterU()<CR>
nnoremap <Leader>rs :call RedirToScratch()<CR>
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
      echom "No language corresponding to such option [1: English, 2 Portuguese]"
    endif
    let g:togglespell = 1
  else
    setlocal nospell
    let g:togglespell = 0
    echo "No spell Checking"
  endif
endfunction
noremap <Leader>st :<C-U>call ToggleSpell()<CR>
"==============================================================================}}}

"================== Autocommands =============================================={{{
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  augroup common_group
    autocmd!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif

    "place quickfix window below all other windows
    autocmd! FileType qf wincmd J

    "set readonly files to autoread
    autocmd BufRead,BufNewFile * if &readonly == 1
          \ | setlocal autoread sbo+=ver,hor | endif
  augroup END

  " gams stuff
  augroup ft_gams
    autocmd!
    autocmd BufRead,BufNewFile *.gms,*.inc
          \   set syntax=gams filetype=gams
          \ | nnoremap <buffer> <Leader>e /\*\*\*\*.*$<CR>:set nohls<CR><C-L>
    autocmd BufRead,BufNewFile *.lst
          \   set syntax=gams filetype=gamslst
          \ | nnoremap <buffer> <Leader>e /\*\*\*\*.*$<CR>:set nohls<CR><C-L>
  augroup END

  "for now set scip compatible settings (3 spaces indentation for c files)
  augroup ft_ccpp
    autocmd!
    "scip settings
    "autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.c++ setlocal shiftwidth=3
    " Sabre Settings
    autocmd FileType c setlocal noexpandtab shiftwidth=2 tabstop=2
    autocmd FileType cpp setlocal noexpandtab shiftwidth=2 tabstop=2
  augroup END

  "help buffers mappings
  augroup ft_help
    autocmd!
    autocmd FileType help nnoremap <buffer> <SPACE> <C-D>
    autocmd FileType help nnoremap <buffer> <BS> <C-U>
    autocmd filetype help nnoremap <buffer> q :q<CR>
  augroup END

  "remove number relativenumber from specific buffers
  augroup no_nurnu
    autocmd!
    autocmd FileType nerdtree      setlocal norelativenumber nonumber
    "autocmd FileType taglist       setlocal norelativenumber nonumber
    autocmd FileType qf            setlocal norelativenumber nonumber
    autocmd FileType tlibInputList setlocal norelativenumber nonumber
  augroup END

  augroup ft_scratch
    autocmd!
    autocmd FileType scratch setlocal fdm=expr
          \ foldexpr=getline(v:lnum)==#getline(v:lnum-1)?1:0
  augroup END

endif " has("autocmd")
"==============================================================================}}}

"================== Colorscheme ==============================================={{{
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
   if !exists("g:is_vimrc_simple")
     colorscheme  graywh_cs1
   else
     set bg=dark | colorscheme peaksea
   endif
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

"================== Unite ====================================================={{{
function! UniteColorSchemeResume()
  if !exists("s:unite_init_colorscheme")
    let s:unite_init_colorscheme = 1
    Unite -buffer-name=colorscheme colorscheme
  else
    UniteResume colorscheme
  endif
endfunction

augroup ft_unite
  autocmd!
  autocmd FileType unite call s:unite_my_settings()
augroup END

function! s:unite_my_settings()"{{{
  " Overwrite settings.

  nmap <buffer> <ESC> <Plug>(unite_exit)
  "inoremap <buffer> jj <Plug>(unite_insert_leave)
  "inoremap <buffer> <C-w> <Plug>(unite_delete_backward_path)

  nmap <buffer> s jp
  nmap <buffer> S kp

  " <C-L>: manual neocomplcache completion.
  inoremap <buffer> <C-;> <C-X><C-U><C-P><Down>

  inoremap <silent><expr><buffer> <C-X> unite#do_action('cd')
  nnoremap <silent><expr><buffer> <C-X> unite#do_action('cd')

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

function! LoadUnite() "{{{
  call vam#ActivateAddons(['unite', 'unite-mark', 'unite-outline',
	\ 'unite-tag', 'unite-colorscheme'],
        \ {'auto_install' : 0, 'force_loading_plugins_now': 1})
  nnoremap <silent> ,ud :<C-U>UniteWithCurrentDir -buffer-name=files
	\ buffer file_mru bookmark file<CR>
  nnoremap <silent> ,ub :<C-u>UniteWithBufferDir -buffer-name=files
	\ -prompt=%\  buffer file_mru bookmark file<CR>
  nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
  nnoremap <silent> ,uo :<C-u>Unite outline<CR>
  nnoremap ,uf :<C-U>Unite source<CR>
  nnoremap ,uu :<C-U>Unite source -resume<CR>
  nnoremap ,rr :<C-U>UniteResume<CR>
  nnoremap ,rd :<C-U>Unite -buffer-name=mru_folders -resume directory_mru<CR>
  "nnoremap ,uc :<C-U>Unite -buffer-name=colorscheme colorscheme<CR>
  nnoremap ,uc :<C-U>call UniteColorSchemeResume()<CR>

  " Ref {{{
  let g:ref_use_vimproc = 1
  let g:ref_open = 'vsplit'
  let g:ref_cache_dir = expand('~/.vim/tmp/ref_cache/')
  nnoremap <leader>K :<C-u>Unite ref/man -buffer-name=man
        \ -start-insert -horizontal<CR>
  " }}}

  " Ack {{{
  if !g:is_win
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '--column --no-color --nogroup --with-filename'
    let g:unite_source_grep_recursive_opt = ''
  else
    let g:unite_source_grep_command = 'grep_vim'
    let g:unite_source_grep_default_opts = ''
    let g:unite_source_grep_recursive_opt = ''
  endif

  "nnoremap <leader>a :<C-u>Unite grep -start-insert -default-action=above -auto-preview<CR>
  nnoremap <leader>a :<C-u>Unite grep -start-insert -default-action=above -no-quit <CR>
  nnoremap <leader>A :<C-u>execute 'Unite grep:.::' . expand("<cword>") .
        \ ' -default-action=above -auto-preview'<CR>
  " }}}

  " wimviki replacement {{{
  nnoremap <leader>W :<C-u>Unite file file/new -buffer-name=notes -start-insert
        \ -toggle -default-action=split -profile-name=files
        \ -input=~/vimfiles/Vimwiki/<CR>
  " }}}
endfunction
nnoremap <silent> ,ud :call LoadUnite()<CR>:<C-U>UniteWithCurrentDir file<CR>
nnoremap <silent> ,uc :call LoadUnite()<CR>:<C-U>call UniteColorSchemeResume()<CR>
nnoremap <silent> ,uo :call LoadUnite()<CR>:<C-U>Unite outline<CR>
nnoremap <silent> ,uf :call LoadUnite()<CR>:<C-U>Unite source<CR>
nnoremap <silent> ,uu :call LoadUnite()<CR>:<C-U>Unite source<CR>
nnoremap <silent> ,rr :call LoadUnite()<CR>:<C-U>UniteResume<CR>
" }}}

if 0 && has('python') "{{{ LoadPythonDelayed
function! LoadPythonDelayed()

python << ENDP
import time
from threading import Thread
import vim

def LoadUnitePy():
    time.sleep(2)
    vim.command('call LoadUnite()')

Thread(target=LoadUnitePy).start()

ENDP
return ''
endfunction

call LoadPythonDelayed()
else
  call LoadUnite()
endif
"}}}
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

"================== CtrlP ====================================================={{{
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
nnoremap ,pc :CtrlPBookmarkDir<CR>
let g:ctrlp_prompt_mappings = {
         \ 'PrtBS()':      ['<bs>', '<c-]>', '<c-h>'],
         \ 'PrtCurLeft()': ['<left>', '<c-^>'],
         \ }
let g:ctrlp_map = ''
command! CtrlPShowArr call CtrlpShowArrFun(-1)
function! CtrlpShowArrFun(count)
  let i = 0
  let msg = ''
  for v in g:ctrlp_comm
    if a:count == i | let msg .= '*' | endif
    let msg .= i
    let msg .= ':'
    let msg .= g:ctrlp_comm[i]
    let msg .= ' '
    let i = i + 1
  endfor
  echo msg
endfunction
let g:ctrlp_comm = ['', 'Buffer', 'MRUFiles', 'CurWD', 'Dir',
      \'Root', 'Tag', 'CurFile', 'BookmarkDir']
nnoremap <silent> <C-P> :<C-U>call CtrlpShowArrFun(v:count)
      \ \| silent! exe 'CtrlP' . g:ctrlp_comm[v:count]<CR>
noremap ,b :CtrlPBuffer<CR>
noremap ,e :CtrlPCurFile<CR>
"==============================================================================}}}

"================== Tagbar ===================================================={{{
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
let s:ulti_or_neosnip = 1 "1 UltiSnips, 2 neosnippet
if s:ulti_or_neosnip == 1
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
      augroup load_ulti
        autocmd!
        autocmd FileType * call UltiSnips_FileTypeChanged()
        autocmd BufNewFile,BufRead *.snippets setf snippets
      augroup END
    endif
    call UltiSnips_FileTypeChanged()
    inoremap <silent> <NL> <C-R>=UltiSnips_ExpandSnippetOrJump()<CR>
    nnoremap <silent> <NL> :call UltiSnips_ListSnippets()<CR>
    snoremap <silent> <NL> <ESC>:call UltiSnips_ExpandSnippetOrJump()<CR>
    xnoremap <silent> <NL> :call UltiSnips_SaveLastVisualSelection()<CR>gvs

    inoremap <silent> <F10> <C-R>=UltiSnips_ExpandSnippetOrJump()<CR>
    nnoremap <silent> <F10> :call UltiSnips_ListSnippets()<CR>
    snoremap <silent> <F10> <ESC>:call UltiSnips_ExpandSnippetOrJump()<CR>
    return 1
  else
    echom "vim compiled without python"
    return 0
  endif
endfunction
nnoremap <F10> :if LoadUltisnips() \| call UltiSnips_ListSnippets() \| endif<CR>
inoremap <F10> <C-R>=LoadUltisnips()?UltiSnips_ExpandSnippet():""<CR>
nnoremap <C-J> :if LoadUltisnips() \| call UltiSnips_ListSnippets() \| endif<CR>
inoremap <C-J> <C-R>=LoadUltisnips()?UltiSnips_ExpandSnippet():""<CR>
endif
"==============================================================================}}}

"================== NeoSnippet ================================================{{{
"Shoud decide on either neosnippet or UltiSnips
if s:ulti_or_neosnip == 2
inoremap <silent><expr> <NL>
      \ neosnippet#expand_or_jump_impl()
snoremap <silent><expr> <NL>
      \ neosnippet#expand_or_jump_impl()
xnoremap <silent> <NL>
      \ :<C-u>call neosnippet#expand_target()<CR>
xnoremap <silent><expr> <C-L>
      \ unite#sources#snippet_target#start()

endif
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

"================== Python Settings ==========================================={{{

"================== PyLint Compiler ==========================================={{{
augroup py_pylint
  autocmd!
  "autocmd FileType python compiler pylint
  autocmd FileType python setlocal errorformat=%f:%l:\ %m
  autocmd FileType python setlocal makeprg=epylint\ %
augroup END
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

"pysmell {{{
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
      augroup ft_py_pysmellcomp
        autocmd!
        autocmd filetype python setlocal completefunc=pysmell#Complete
      augroup END
    else
      echom "No Pysmell installed!"
    endif
  else
    echom "Cannot Load PySmell: No Python!"
  endif
  let s:loadedPysmell = 1
endfunction "}}}

"Jedi {{{
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
endfunction "}}}

"choose one of pysmell or jedi for the completion in python
if !exists("g:is_vimrc_simple")
  augroup ft_py_pysmell_or_jedi
    autocmd!
    "autocmd FileType python call LoadPysmell()
    autocmd FileType python call LoadJedi()
  augroup END
endif

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
"if has("autocmd") && g:is_win "why only on windows? don't remember now
if has("autocmd")
  augroup ft_tex_setCompiler
    autocmd!
    autocmd BufRead,BufNewFile *.tex compiler tex
          \ | setlocal textwidth=90
  augroup END
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

augroup ft_tex_loadLatexPlugins
  autocmd!
  autocmd FileType tex call LoadLatexPlugins()
augroup END

"remoteOpen must be loaded in order to open from external viewer
runtime bundle/vlatex/plugin/remoteOpen.vim

"for plugin in ftplugin/tex/tex_pdf.vim
let g:tex_pdf_map_keys = 0

"" fix viewing pdf, using \la to view pdf by default
function! SetPdfDestination(...)
  "without args get current working file and add pdf, else specific arg
  if a:0 > 0
    let g:fix_pdf_dest = substitute(a:1, '.pdf', '', '')
  else
    let g:fix_pdf_dest = substitute(expand('%:t'), '.tex', '', '')
  endif

  "just change to the folder of the current file already. Should be there in
  "the first place
  silent exe "cd " . expand('%:p:h')
  echo "changed folder to " . expand('%p:h')

  if has("gui")
    winpos 0 0
    set guioptions-=m "no menu bar for now
    set lines=100 columns=91
  endif

  let g:did_setpdfdestination = 1
  let g:fix_pdf_dest_target = expand('%:p:h') . '/' . g:fix_pdf_dest
  nnoremap <Leader>la :<C-U>call FixForwardSeach()<CR>
  command! -complete=file -nargs=* CompileViewLatex
        \ exec "!start latexmk -pvc " . g:fix_pdf_dest_target
endfunction

function! FixForwardSeach()
  if !exists("g:did_setpdfdestination")
    call SetPdfDestination()
  endif
  let target = g:fix_pdf_dest_target . '.pdf'
  let cmd = g:SumatraPdfLoc . " -reuse-instance -forward-search "
        \ . expand('%:p') . ' ' . line('.') . ' ' . target
  let execString = 'silent! !start ' . cmd
  exe execString
endfunction
command! -complete=file -nargs=* Mt call SetPdfDestination(<f-args>)
"==============================================================================}}}

"================== Other commands/mappings/settings =========================={{{

"================== Don't view files with inconsistent ctrl-r ================={{{
map ,ml :ed ++ff=dos<CR>
command! HideCtrlM ed ++ff=dos
augroup fix_ff
  autocmd!
  autocmd BufReadPost * nested
        \ if !exists('b:reload_dos') && !&binary && &ff=='unix' && (0 < search('\r$', 'nc')) |
        \   let b:reload_dos = 1 |
        \   e ++ff=dos |
        \ endif
augroup END
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

function! LoadQuickRun() "{{{
  call vam#ActivateAddons(['quickrun'],
        \ {'auto_install' : 0, 'force_loading_plugins_now': 1})
  nnoremap ,qr :QuickRun<CR>
endfunction
nnoremap ,qr :call LoadQuickRun()<CR>:QuickRun<CR>
"}}}

" {{{ commands
" delete current buffer but don't delete the view
command! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn

"fix not having <c-i> for the jumplist after mapping tab
command! -count=1 Jump exe ":norm! <count>\<C-I>"

" path related commands {{{

" change to path of current file
command! ChgDirCurrFileFolder lcd %:p:h
" print current files pwd
command! Pcp echo expand('%:p')
" }}}

" maximize window vertically
command! ML set go-=m | winpos 0 0 | set lines=100

"" change some highlight
hi! ColorColumn term=underline ctermfg=188 ctermbg=236 guifg=fg guibg=#303030

let fortran_free_source = 1

"================== QuickRun =================================================={{{
let g:quickrun_config = {}
let g:quickrun_config.python = {
      \ 'runner': 'vimproc',
      \ }
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
else
  nnoremap <Leader>tf :silent! !wmctrl -r GVIM -b toggle,fullscreen<CR>
endif
"==============================================================================}}}

"================== LycosaExplorer ============================================{{{
function! SetupLycosa()
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
endfunction

"if index(g:pathogen_disabled, 'lycosaexplorer') == -1
if index(g:active_addons, 'lycosaexplorer') >= 0
  call SetupLycosa()
endif
"==============================================================================}}}

"================== NerdCommenter ============================================={{{
"let NERDShutUp=1
"use nested comments by default in NerdCommenter
let g:NERDDefaultNesting=1
"==============================================================================}}}

"==============================================================================}}}

" vim: foldmethod=marker
