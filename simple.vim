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

" decide on pathogen or vam (pathogen: 1, vam: 2, 3: Plug + internal)
let g:addon_manager = 3
let g:active_addons = []

"================== vim-addon-manager========================================{{{
if g:addon_manager == 2
function! SetupVAM()
  let g:vim_addon_manager = {}
  let vam_install_path = escape(g:p0 . '/pack/bundle/opt/vam', ' \')
  exec 'set rtp+='. vam_install_path

  let g:active_addons += ['Supertab', 'nerdcommenter']
  let g:active_addons += ['vim-unimpaired', 'vim-scratch']

  let g:vim_addon_manager.additional_addon_dirs = [
        \ escape(g:p0 . '/notused_plugins', ' \'),
        \ escape(g:p0 . '/pack/bundle/opt', ' \'),
        \ escape(g:p0 . '/plugged', ' \')
        \ ]

  call vam#ActivateAddons(g:active_addons, {'auto_install' : 0, 'force_loading_plugins_now': 1})

  command! -nargs=* -bar -complete=customlist,vam#install#InstalledAddonCompletion AA
        \ :call vam#ActivateAddons([<f-args>], {'auto_install' : 0, 'force_loading_plugins_now': 1})
endfunction
call SetupVAM()
endif
"==============================================================================}}}


"================== Plug + internal ========================================={{{
if g:addon_manager == 3

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin(g:p0 . '/plugged')

Plug 'preservim/nerdcommenter'

" Shougo
Plug 'Shougo/junkfile.vim', { 'on': ['JunkfileOpen'] }
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'

Plug 'ctrlpvim/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPCurFile'] }


Plug g:p0 . '/pack/bundle/opt/airline'
Plug g:p0 . '/pack/bundle/opt/airline-extensions'

"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'

"tpope
Plug 'tpope/vim-fugitive', { 'on': ['G', 'Git', 'Gwrite', 'Gstatus'] }
Plug 'tpope/vim-unimpaired'


Plug 'chrisbra/NrrwRgn', {'on': ['NR', 'NW', 'NRV', 'NW', 'NarrowRegion']}


Plug 'molok/vim-scratch', { 'on': ['Scratch', 'Sscratch', 'ScratchToggle', 'Vscratch', 'Tscratch'] }


Plug 'skeept/ctrlp-packadd'

call plug#end()


endif
"==============================================================================}}}

"this is where all vimrc and simple settings go
execute "source " . g:p0 . "/common.vim"

" load machine specific file if it exists. In this case work related functions
" We don't load most plugins. Must load this one explicitly
let s:work_common = expand(g:p0 . "/plugin/work_common.vim")
if filereadable(s:work_common)
  execute "source " . s:work_common
endif


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
"set statusline=%2.2n\ %t\ %h%m%r%=[%{&ft}\,%{&ff}]
if 0
set statusline=%2.2n\ %t\ %h%m%r%=
set statusline+=%{GetNumTabsStr()}
set statusline+=%{CondDispFtFf()}
"set statusline+=\ %{strftime(\"[%H:%M%p]\")} "do we want to show time?
set statusline+=\ %l/%L\ %2c\ %P
endif

"" SmartusLine
"hi Modified guifg=black guibg=#FFA500
"set statusline=%2.2n\ %t\ %h%#Modified#%m%r%*%=%{CondDispFtFf()}\ %l/%L\ %2c\ %P
"let g:smartusline_string_to_highlight = '%2.2n %t %h'
"call vam#ActivateAddons(['SmartusLine'], {'auto_install' : 0, 'force_loading_plugins_now': 1})
"==============================================================================}}}

"=================== Plugin Loading ==========================================={{{
nnoremap <C-P> :<C-U>let curr_vcount=v:count
      \ \| call jraf#loadCtrlP()<CR>:<C-U>call jraf#ctrlpShowArrFun(curr_vcount)
      \ \| silent! exe 'CtrlP' . g:ctrlp_comm[curr_vcount]<CR>
nnoremap ,b :<C-U>call jraf#loadCtrlP()<CR>:<C-U>CtrlPBuffer<CR>
"}}}

"==============================================================================}}}

" vim: foldmethod=marker
