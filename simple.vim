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
  let g:p0 = expand("~/.vim")
else
  let g:p0 = expand("~/vimfiles")
endif

let g:is_win = has('win32') || has('win64')
"}}}

" decide on pathogen or vam (pathogen: 1, vam: 2, 3: Plug + internal)
let g:addon_manager = 3
let g:active_addons = []

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

Plug 'will133/vim-dirdiff', { 'on': 'DirDiff' }


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
" statusline is set in common.vim; airline is active for simple.vim
"==============================================================================}}}

"=================== Plugin Loading ==========================================={{{
nnoremap <C-P> :<C-U>let curr_vcount=v:count
      \ \| call jraf#loadCtrlP()<CR>:<C-U>call jraf#ctrlpShowArrFun(curr_vcount)
      \ \| silent! exe 'CtrlP' . g:ctrlp_comm[curr_vcount]<CR>
nnoremap ,b :<C-U>call jraf#loadCtrlP()<CR>:<C-U>CtrlPBuffer<CR>
"}}}

"==============================================================================}}}

" vim: foldmethod=marker
