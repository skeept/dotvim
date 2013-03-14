" common settings and functions to both vimrc and simple.vim

"================== Settings =================================================={{{
" Use Vim settings, rather then Vi settings (much better!).

" allow backspacing over everything in insert mode
"set backspace=indent,eol,start
set backspace=2
set esckeys

set autoindent		" always set autoindenting on
if !exists("g:is_vimrc_simple")
  set splitright          "split the window to the right
  set splitbelow          "open the window to the bottom
endif

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

set grepprg=grep\ -nIh\ --exclude={tags,cscope.out}

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

"if EOL copy char bellow, otherwise go to EOL
inoremap <expr> <C-E> IsLineEndInsert() ? "\<C-E>" : "\<C-O>$"

"noremap f2 to make
"inoremap <F2> <ESC>:wa<CR>:Make <Up>
"noremap <F2> :wa<CR>:Make <Up>
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
nnoremap ,i <C-I>

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
  let old_more=&more
  set nomore
  let @u = ""
  redir @U
  exec a:cmd
  redir END
  let &more=old_more
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
      echom "No language corresponding to such option [1: English, 2 Portuguese]"
    endif
    let g:togglespell = 1
  else
    setlocal nospell
    let g:togglespell = 0
    echo "No spell Checking"
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
  autocmd BufRead,BufNewFile *.gms,*.inc
        \   set syntax=gams filetype=gams
        \ | nnoremap <buffer> <Leader>e /\*\*\*\*.*$<CR>:set nohls<CR><C-L>
  autocmd BufRead,BufNewFile *.lst
        \   set syntax=gams filetype=gamslst
        \ | nnoremap <buffer> <Leader>e /\*\*\*\*.*$<CR>:set nohls<CR><C-L>

  "for now set scip compatible settings (3 spaces indentation for c files)
  autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.c++ set shiftwidth=3

  "place quickfix window below all other windows
  autocmd! FileType qf wincmd J

  "set readonly files to autoread
  autocmd BufRead,BufNewFile * if &readonly == 1
        \ | setlocal autoread sbo+=ver,hor | endif

  "mappings for specific buffers
  autocmd FileType help map <buffer> <space> <C-D>
  autocmd FileType help map <buffer> <BS> <C-U>

  "don't show file numbers in taglist and nerdtree
  autocmd FileType nerdtree      setlocal norelativenumber
  "autocmd FileType taglist       setlocal norelativenumber
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
  nnoremap ,uu :<C-u>Unite source -resume<CR>
  "nnoremap ,uc :<C-U>Unite -buffer-name=colorscheme colorscheme<CR>
  nnoremap ,uc :<C-U>call UniteColorSchemeResume()<CR>
endfunction

nnoremap <silent> ,ud :call LoadUnite()<CR>:<C-U>UniteWithCurrentDir file<CR>
nnoremap <silent> ,uc :call LoadUnite()<CR>:<C-U>call UniteColorSchemeResume()<CR>
nnoremap <silent> ,uo :call LoadUnite()<CR>:<C-U>Unite outline<CR>
nnoremap <silent> ,uf :call LoadUnite()<CR>:<C-U>Unite source<CR>
nnoremap <silent> ,uu :call LoadUnite()<CR>:<C-U>Unite source<CR>
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
let g:ctrlp_prompt_mappings = {
         \ 'PrtBS()':      ['<bs>', '<c-]>', '<c-h>'],
         \ 'PrtCurLeft()': ['<left>', '<c-^>'],
         \ }
let g:ctrlp_map = ''
command! CtrlPShowArr call CtrlpShowArrFun()
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
      \'Root', 'Tag', 'CurFile']
nnoremap <silent> <C-P> :<C-U>call CtrlpShowArrFun(v:count)
      \ \| silent! exe 'CtrlP' . g:ctrlp_comm[v:count]<CR>
noremap ,b :CtrlPBuffer<CR>
noremap ,e :CtrlPCurFile<CR>
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

" Change to Current's File Folder
command! ChgDirCurrFileFolder lcd %:p:h
" }}}

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

" vim: foldmethod=marker
