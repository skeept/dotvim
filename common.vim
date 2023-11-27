" common settings and functions to both vimrc and simple.vim

" use this to replace VAMAddToActiveAddons
command! -nargs=1 -bar PackAddRegister packadd <args> <bar> let g:active_addons += ['<args>']

"================== Settings =================================================={{{
" Use Vim settings, rather then Vi settings (much better!).

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"set backspace=2
if !has('nvim') | set esckeys | endif

set autoindent          " always set autoindenting on
set splitright          "split the window to the right
set splitbelow          "open the window to the bottom

set history=200
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set ignorecase
set smartcase
set showmatch           " show matching parenthesis
set laststatus=2
set cmdheight=1
set whichwrap=<,>,[,],h,l
set nopaste
"set pastetoggle=<S-F3>
set pastetoggle=<Leader>pt

"Set terminal capabilities before the colorscheme
"set t_Co=128
if !has('win32') && $TERM != 'cygwin'
  set t_Co=256
endif
"set t_Co=88

set backup
exec "set backupdir^=" . g:p0 . "/tmp/backup"
exec "set directory^=" . g:p0 . "/tmp/swapdir"
if v:version >= 703
  set undofile
  if has('nvim-0.5')
    let &undodir=g:p0 . '/tmp/undodir_nvim'
  else
    exec "set undodir^=" . g:p0 . "/tmp/undodir"
  endif
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
set shortmess=ac
if version > 800
  set shortmess+=F
endif

set foldmethod=syntax
set title
set titleold=
set virtualedit+=block

set grepprg=grep\ -nIh\ --exclude={tags,cscope.out}
if executable('rg')
  set grepprg=rg\ -H\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

"for scip go up two folders
set tags=./tags,./TAGS,tags,TAGS,../tags,../../tags

set wildignore+=*.o,*.obj,.git,.hg,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*~
set wildignore+=tags,cscope.out,*.db,*.pdf
set wildignore+=GTAGS,GRTAGS,GPATH,.tmp,*.exe

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
set cot-=preview

set viminfo=h,'100,<10000,s1000,/1000,:1000

set showtabline=0
"set regexpengine=1

if has("patch789")
  set nofixeol
endif

if v:version >= 800
  set belloff=all
endif

" fix for blinking cursor
if &term =~ "xterm" || &term =~ "screen-256color"
  let &t_SI = "\e[6 q"
  let &t_EI = "\e[2 q"
endif
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

nnoremap ,di :registers<CR>

" make <BS> <DEL> <C-U> and <C-W> undoable
" h i_Ctrl-g_u
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
inoremap <BS> <C-G>u<BS>
inoremap <DEL> <C-G>u<DEL>

noremap <f4> :<C-U>call jraf#closeTabOrExit(v:count)<CR>
inoremap <f4> <ESC>:<C-U>call jraf#closeTabOrExit(v:count)<CR>

"noremap ,en :cnext<CR>
"noremap ,ep :cprevious<CR>
nnoremap <c-\>a :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap ,w <c-w>
nnoremap ,, <c-w><c-w>

"noremap gl :bprevious<CR>
"
if &diff
  "noremap <F4> :qa<CR>
  noremap <F5> :wqa!<CR>
  noremap <F6> :qa!<CR>
endif

nnoremap <C-L> :nohl<CR><C-L>

nnoremap ,cn :%s///n<LEFT><LEFT><LEFT>

nnoremap ,vn :vim // *<LEFT><LEFT><LEFT>
nnoremap ,vr :vim // **/*<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
nnoremap ,vf :find **/**<LEFT>
nnoremap ,va :args **/**<LEFT>
vnoremap ,yy y:Sscratch<CR>p
nnoremap ,yy yy:Sscratch<CR>p

nnoremap ,fz :FZF<ENTER>
nnoremap ,fe :FZF<SPACE><C-R>=expand("%:p:h")<CR><CR>
nnoremap ,fb :Buffers<CR>
nnoremap ,fh :History<CR>
nnoremap ,fc :Commands<CR>
nnoremap ,fl :Lines<CR>
nnoremap ,vv :Files<CR>

nnoremap <SPACE>z :FZF<ENTER>
nnoremap <SPACE>e :FZF<SPACE><C-R>=expand("%:p:h")<CR><CR>
nnoremap <SPACE>b :Buffers<CR>

"nmap <silent> <Leader>rg :!screen -p gams_run -X stuff \"gr\" <CR>
"let g:tmpa='screen -p gams_run -X stuff gr'
"nmap <Leader>rg :!screen -p gams_run -X stuff gr  <CR>

noremap <Leader>v :<C-U>silent! view<CR>
" for clearing search views
noremap <Leader>ch :nohlsearch<CR>

nmap <TAB> <C-W>
nmap <TAB><TAB> <C-W><C-W>
nnoremap ,i <C-I>

noremap q; :
noremap q' "

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"nnoremap ,; :<UP>
"nnoremap ,; :Unite history/command -start-insert<CR>

" we already have <Leader>pt as pastetoogle, but I always get confused
nnoremap <Leader>tp :set paste!<CR>

nnoremap <Leader>tc :tabclose<CR>
nnoremap ,sc :tabclose<CR>
nnoremap <Leader>ts :tab split<CR>
nnoremap <Leader>st :tab split<CR>
nnoremap ,st :tab split<CR>
nnoremap ,ts :tab split<CR>
nnoremap ,te :tabedit<SPACE>
nnoremap <Leader>te :tabedit<SPACE>
nnoremap ,tt :tab split<BAR><BAR>only<LEFT><LEFT><LEFT><LEFT><LEFT>
nnoremap ,tc :tabclose<CR>
nnoremap ,sw :<C-U>setlocal wrap! \| set wrap?<CR>
nnoremap ,sq :bw!<CR>

nnoremap ,gg :<C-U>Gina<SPACE><C-D>
nnoremap ,gs :<C-U>Gina status<CR>
nnoremap ,gc :<C-U>Gina commit<CR>
" Gina diff is the inline diff. I guess not that useful
nnoremap ,gd :<C-U>Gina compare<CR>
nnoremap ,ga :<C-U>Gina add %
nnoremap ,gw :<C-U>:silent! call jraf#_gitCommit()<CR>

nnoremap <Leader>Q :Sayonara
nnoremap <Leader>q :Sayonara!<CR>
nnoremap g/ /\<\><Left><Left>
nnoremap ,le :<C-U>packadd<SPACE><C-D>

" numeric manipulation
nnoremap ,ln :<C-U>"<C-R>=<C-R><C-W>
"nnoremap ,lh :<C-U>"<C-R>=<C-R><C-W>/3600
command! HoursMinutes call wk#hoursMinutes(expand("<cword>"), 3600)
"==============================================================================}}}

"================== GetIsAddonActive =========================================={{{
function! IsAddonActive(addon)
  if !exists("g:addon_manager") || g:addon_manager == 0 "how can we know?
    return 0
  endif
  if g:addon_manager == 1 "Pathogen"
    return index(g:pathogen_disabled, a:addon) == -1
  elseif g:addon_manager == 2 "vam-addon-manager
    return index(g:active_addons, a:addon) >= 0
  elseif g:addon_manager == 3 "Plug
    return has_key(g:plugs, a:addon)
  endif
endfunction
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
      if v:count != 1
        echo "Finished recording to register u"
      endif
    endif
    if v:count == 1
      silent normal "up
      echo "Finished recording to register u; pasted contents of reg u"
    endif
  else
    let g:captureToRegisterUinProgress = 1
    set nomore
    echo "Capturing Output to register u"
    let @u = ""
    redir @U
  endif
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

"================== Scratch Edit =============================================={{{
"open scratch buffer
noremap <Leader>os :Scratch<CR>
nnoremap ,ss :ScratchToggle<CR>
command! -bar -nargs=* Sedit call jraf#ScratchEdit('edit', <q-args>)
command! -bar -nargs=* OSsplit call jraf#ScratchEdit('split', <q-args>)
command! -bar -nargs=* Svsplit call jraf#ScratchEdit('vsplit', <q-args>)
command! -bar -nargs=* Stabedit call jraf#ScratchEdit('tabe', <q-args>)
"==============================================================================}}}

"================== Spelling =================================================={{{
" by default now toggle spell and nospell, if a count is given use Portuguese
setlocal nospell
let g:togglespell = 0
let g:default_langn = 1 "1 for English, 2 for Portuguese
function! ToggleSpellFun(...)
  if a:0 > 0 && a:1 == -1
    if v:count != 0
      let g:default_langn = v:count
      let g:togglespell = 0 " force spelling this time
    endif
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
command! -nargs=* ToggleSpell call ToggleSpellFun(<f-args>)
"noremap <Leader>st :<C-U>call ToggleSpell()<CR>
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

    autocmd FileType text setlocal textwidth=100

    if v:version >= 800
      autocmd TabClosed * tabprevious
    endif

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

  "augroup ft_rmclog
    "autocmd!
    "autocmd BufRead,BufNewFile *.log
          "\ set filetype=rmclog
  "augroup END

  "for now set scip compatible settings (3 spaces indentation for c files)
  augroup ft_ccpp
    autocmd!
    "scip settings
    "autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.c++ setlocal shiftwidth=3

    autocmd BufRead,BufNewFile *.C setlocal filetype=cpp
    autocmd FileType cpp setlocal tabstop=3 shiftwidth=3 expandtab
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

  augroup jq_grp
    autocmd!
    autocmd BufRead,BufNewFile *.jq set filetype=conf.jq | call jraf#quickrunjqload()
  augroup END

  "try to disable swapfiles for large files
  augroup disable_swap_large_files
    autocmd!
    "5 megs
    autocmd BufRead * if getfsize(expand('%:p')) > 5242880 |
          \ setlocal noswapfile noundofile | endif
  augroup END

endif " has("autocmd")
"==============================================================================}}}

"================== Colorscheme ==============================================={{{
" setting the color in terminals
if !has("gui_running") && !g:is_win
   if g:is_vimrc_simple == 0
     colorscheme  graywh_cs1
   else
     set bg=dark | colorscheme peaksea
   endif
endif
"==============================================================================}}}

"================== neocomplete ============================================={{{
let g:load_neocomplete = (!exists('g:load_neocomplete') ||  g:load_neocomplete == 1) &&
      \ (IsAddonActive('neocomplete'))
if g:load_neocomplete
  function! SetupNeocomplete()
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
          \ 'default' : '',
          \ 'vimshell' : $HOME.'/.vimshell_hist',
          \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplete#smart_close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    "inoremap <expr><C-y>  neocomplete#close_popup()
    "inoremap <expr><C-e>  neocomplete#cancel_popup()
    inoremap <expr><C-y> pumvisible() ? neocomplete#close_popup() : "\<C-Y>"
    inoremap <expr><C-e> pumvisible() ? neocomplete#cancel_popup() :
          \ IsLineEndInsert() ? "\<C-E>" : "\<C-O>$"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplete#enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplete#enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=python3complete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
  endfunction
endif
"==============================================================================}}}

"================== CtrlP ====================================================={{{
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'changes', 'funky']
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
nnoremap ,pc :CtrlPCommand<CR>
nnoremap <space>c :CtrlPCommand<CR>
nnoremap ,pl :CtrlPLine<CR>
let g:ctrlp_prompt_mappings = {
         \ 'PrtBS()':      ['<bs>', '<c-]>', '<c-h>'],
         \ 'PrtCurLeft()': ['<left>', '<c-^>'],
         \ }
let g:ctrlp_map = ''
command! CtrlPShowArr call jraf#ctrlpShowArrFun(-1)

let g:ctrlp_comm = ['', 'Buffer', 'MRUFiles', 'CurWD', 'Dir',
      \'Root', 'Tag', 'CurFile', 'BookmarkDir', 'Line']
nnoremap <silent> <C-P> :<C-U>call jraf#ctrlpShowArrFun(v:count)
      \ \| silent! exe 'CtrlP' . g:ctrlp_comm[v:count]<CR>
noremap ,b :CtrlPBuffer<CR>
noremap ,e :CtrlPCurFile<CR>
nnoremap ,; :CtrlPCmdHistory<CR>
"==============================================================================}}}

"================== Tagbar ===================================================={{{
nnoremap <F3> :<c-u>call jraf#toggleTBarListNT()<CR>
inoremap <F3> <esc>:<c-u>call jraf#toggleTBarListNT()<CR>
"==============================================================================}}}

"================== Gundo  ===================================================={{{
let g:gundo_prefer_python3 = 1
"==============================================================================}}}

"================== Snippets / UltiSnips ======================================{{{
"1 UltiSnips, 2 neosnippet
let s:ulti_or_neosnip = 2
if s:ulti_or_neosnip == 1 && !has("python3")
  let s:ulti_or_neosnip = 2
endif

if s:ulti_or_neosnip == 1
  let g:UltiSnipsExpandTrigger = "<F10>"
  let g:UltiSnipsListSnippets = "<C-F10>"
  let g:UltiSnipsJumpForwardTrigger = "<F10>"
  let g:UltiSnipsJumpBackwardTrigger ="<S-F10>""
  let g:UltiSnipsEditSplit = "horizontal"

  inoremap <F9> <C-R>=UltiSnips#JumpBackwards()<CR>
  snoremap <F9> <ESC>:call UltiSnips#JumpBackwards()<CR>

  nnoremap <F10> :if jraf#loadUltisnips() \| call UltiSnips#ListSnippets() \| endif<CR>
  inoremap <F10> <C-R>=jraf#loadUltisnips()?UltiSnips#ExpandSnippet():""<CR>
  nnoremap <C-J> :if jraf#loadUltisnips() \| call UltiSnips#ListSnippets() \| endif<CR>
  inoremap <C-J> <C-R>=jraf#loadUltisnips()?UltiSnips#ExpandSnippet():""<CR>
  nnoremap <F12> :call LoadUnite(0) \| call jraf#loadUltisnips() \|
        \ :call jraf#ultiSnipsCallUnite()<CR>
  inoremap <F12> <ESC>:call LoadUnite(0) \| call jraf#loadUltisnips() \|
        \ :call jraf#ultiSnipsCallUnite()<CR>
endif
"==============================================================================}}}

"================== NeoSnippet ================================================{{{
if s:ulti_or_neosnip == 2
  function! s:LoadNeoSnipppet()
    imap <NL> <Plug>(neosnippet_expand_or_jump)
    imap <C-J> <Plug>(neosnippet_expand_or_jump)
    smap <NL> <Plug>(neosnippet_expand_or_jump)
    xmap <NL> <Plug>(neosnippet_expand_target)
    imap <F12> <Plug>(neosnippet_start_unite_snippet)
    smap <F12> <Plug>(neosnippet_start_unite_snippet)
    xmap <F12> <Plug>(neosnippet_start_unite_snippet)

    let g:neosnippet#snippets_directory = g:p0 . "/snippets/neo"
  endfunction

  call s:LoadNeoSnipppet()
endif
"==============================================================================}}}

"================== Supertab =================================================={{{
"" for supertab plugin try changing the default context
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"inoremap <nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-u>")<CR>
let g:mysupertabaltcom = 1
inoremap <nul> <C-R>=jraf#mySupertabAltCompletion()<CR>
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

"choose one of pysmell or jedi for the completion in python
let g:jedi#popup_on_dot = 0
if g:is_vimrc_simple == 0
  augroup ft_py_pysmell_or_jedi
    autocmd!
    "autocmd FileType python call jraf#loadPysmell()
    autocmd FileType python call jraf#loadJedi()
  augroup END
endif

"==============================================================================}}}

"================== Latex ====================================================={{{
augroup ft_tex_setCompiler
  autocmd!
  autocmd BufRead,BufNewFile *.tex compiler tex
        \ | setlocal textwidth=90 ft=tex | echom "Mt <file> (sets LaTeX goodies)"
augroup END

augroup ft_tex_loadLatexPlugins
  autocmd!
  autocmd FileType tex call jraf#loadLatexSettings() | call jraf#loadLatexPlugins()
augroup END

"remoteOpen must be loaded in order to open from external viewer
runtime bundle/vlatex/plugin/remoteOpen.vim

command! -complete=file -nargs=* Mt call jraf#setPdfDestination(<f-args>)

" the following settings seems to work for sumatraPDF:
" "C:\Program Files\Vim\vim74\gvim.exe"  -c ":RemoteOpen +%l %f"
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
noremap ,sb :windo setlocal scrollbind!<CR>
"==============================================================================}}}

"================== Fix shell=bash in windows ================================={{{
if g:is_win && &shell =~ 'bash'
"let $TMP = 'c:\\htemp\\tmp'
set shell=C:\Windows\System32\cmd.exe
set shellxquote=(
endif
"==============================================================================}}}

"================== Delete Whitespace ========================================={{{
command! -range=% DelTrailWhiteSpace
      \ exe "normal mz" | exe "normal Hmy"
      \ | <line1>,<line2>call jraf#stripTrailingWhitespace()
"==============================================================================}}}

"================== Split words into Lines ===================================={{{
command! SplitInLines call jraf#splitInLines()
"==============================================================================}}}

"================== Statusline Settings/functions ======================={{{
" These cannot go into autoload because always called by statusline
function! GetNumTabsStr()
  if tabpagenr('$') == 1
    return ''
  else
    return '[T' . tabpagenr() . '/' . tabpagenr('$') . ']'
  endif
endfunction

function! GetWindowNR()
  if winnr('$') < 3 |  return '' | endif
  return 'W' . winnr()
endfunction

function! CondDispFtFf()
  if v:version < 702
    return ''
  endif
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
"==============================================================================}}}

function! IsLineEndInsert() "{{{
  "in insert mode last is +1 len"
  return getpos(".")[2] == (1 + len(getline(".")))
endfunction "}}}
"}}}

"================== Commands =================================================={{{
" delete current buffer but don't delete the view
command! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn

command! -range Uniq <line1>,<line2>call jraf#uniq()

"fix not having <c-i> for the jumplist after mapping tab
command! -count=1 Jump exe ":norm! <count>\<C-I>"

" path related commands {{{

" change to path of current file
command! -bang ChgDirCurrFileFolder
      \ if "<bang>" == ""  |
      \ lcd %:p:h |
      \ else |
      \ cd! %:p:h | endif
      \ | echo expand('%:p:h')

nnoremap ,cd :<C-U>ChgDirCurrFileFolder<CR>
nnoremap ,cu :<C-U>cd! %:p:h \| cd ..\| echo expand('%:p:h:h')<CR>

" print current files pwd
command! Pcp echo expand('%:p')
" }}}

" maximize window vertically
command! ML set go-=m | winpos 0 0 | set lines=100

" keep text on screen when exiting vim on command line
command! KeepText set t_te=

" Deletes spaces, puts quotes, comma and joins range of lines. Usefull to
" quickly define a powershell list
command! -range=% QuoteCommaJoin silent <line1>,<line2>call jraf#quoteCommaJoin()

"" change some highlight
"hi! ColorColumn term=underline ctermfg=188 ctermbg=236 guifg=fg guibg=#303030

"let fortran_free_source = 1

set diffopt+=vertical
command! WTS if &diffopt =~ 'iwhite' | set diffopt-=iwhite
      \ | else | set diffopt+=iwhite | endif | echo &diffopt
"==============================================================================}}}

"================== QuickRun =================================================={{{
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config.python = {
      \ 'runner': 'vimproc',
      \ }

function! SetupQuickRun()
  nnoremap ,qr :QuickRun<CR>
  nnoremap <F9> :QuickRun<CR>
  inoremap <F9>  <C-\><C-O>:QuickRun<CR>
endfunction
command! -nargs=? -complete=file QuickRunJQSet call jraf#quickrunjqset('<args>')
nnoremap ,qr :call SetupQuickRun()<CR>:QuickRun<CR>

"==============================================================================}}}

"================== A.vim / alternate.vim settings ============================{{{
let g:alternateSearchPath = '../inc,./inc,../source,sfr,../src,../include,..'
let g:alternateExtensions_C = "h,inc,H,HPP,hpp"
let g:alternateExtensions_h = "C,cpp,c++,CPP"
"==============================================================================}}}

"================== NerdCommenter ============================================={{{
"let NERDShutUp=1
"use nested comments by default in NerdCommenter
let g:NERDDefaultNesting=1

" use some non-standard mapping

map ,ci <plug>NERDCommenterInvert
map gc <plug>NERDCommenterInvert
"==============================================================================}}}

"================== Load More Plugins On Demand ==============================={{{
" some we load if we can some we load on demand
"packadd! editexisting
if v:version > 800
  packadd! matchit
  packadd! SimpylFold
  packadd! cfilter
endif

function! LoadMorePluginsOnDemand()
  packadd dirvish
  packadd ferret
  packadd neomru
  packadd obsession
  packadd tlib
  packadd tcommand
  packadd tmarks
  packadd tmru
  packadd toptions
  packadd tregisters
  packadd tselectbuffer
  packadd which-key
endfunction

command! LoadMorePlugins call LoadMorePluginsOnDemand()
"==============================================================================}}}

"================== Other ============================================{{{
" Default to static completion for SQL
let g:omni_sql_default_compl_type = 'syntax'
"==============================================================================}}}


" vim: foldmethod=marker
