function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

function! LoadAdditionalUnite()
  packadd unite-colorscheme
  packadd unite-font
  packadd unite-mark
  packadd unite-outline
  packadd unite-qf
  packadd unite-session
  packadd unite-tag
endfunction

call plug#begin(g:p0 . '/plugged')

Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'

" Shougo
Plug 'Shougo/junkfile.vim', { 'on': ['JunkfileOpen', 'Unite'] }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler'}
Plug 'Shougo/unite.vim', { 'on': 'Unite' }
autocmd! User unite.vim call LoadAdditionalUnite()
Plug 'thinca/vim-unite-history', { 'on': 'Unite' }

Plug 'ctrlpvim/ctrlp.vim'

Plug 'lambdalisue/gina.vim', { 'on': 'Gina' }
autocmd! User gina.vim call LoadGina()

let line_plugin = 1
Plug 'molok/vim-smartusline', Cond(2 == line_plugin)
if 0 == line_plugin "airline
  Plug g:p0 . '/pack/bundle/opt/airline'
  Plug g:p0 . '/pack/bundle/opt/airline-extensions'
elseif 1 == line_plugin "lightline
  Plug g:p0 . '/pack/bundle/opt/lightline'
endif

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

let load_asynccomplete=has("nvim") || v:version > 800
Plug 'prabirshrestha/asyncomplete.vim', Cond(load_asynccomplete > 0)
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
Plug 'yami-beta/asyncomplete-omni.vim'

Plug 'lifepillar/vim-mucomplete'

"tpope
Plug 'tpope/vim-fugitive', { 'on': ['Git', 'Gwrite', 'Gstatus'] }
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-abolish', { 'on': 'Subvert' }
Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-apathy'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
"Plug 'tpope/vim-surround'
Plug g:p0 . '/pack/bundle/opt/surround'

Plug 'PProvost/vim-ps1', { 'for': ['dos', 'ps1'] }

Plug 'chrisbra/NrrwRgn', {'on': ['NR', 'NW', 'NRV', 'NW', 'NarrowRegion']}
"Plug 'chrisbra/NrrwRgn'
Plug 'chrisbra/Recover.vim'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'Julian/vim-textobj-brace'

Plug 'cohama/lexima.vim'

"tagbar
Plug 'majutsushi/tagbar', { 'on': ['Tagbar', 'TagbarToggle'] }

Plug 'molok/vim-scratch', { 'on': ['Scratch', 'Sscratch', 'ScratchToggle', 'Vscratch', 'Tscratch'] }

Plug 'vlmarek/PreciseJumpVlad', { 'on': 'PreciseJumpF' }

Plug 'will133/vim-dirdiff', { 'on': 'DirDiff' }

Plug 'AndrewRadev/linediff.vim', { 'on': ['Linediff', 'LinediffReset'] }


Plug 'liuchengxu/vim-clap'

call plug#end()
