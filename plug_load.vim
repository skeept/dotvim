function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin(g:p0 . '/plugged')

Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'

" Shougo
Plug 'Shougo/junkfile.vim', { 'on': ['JunkfileOpen'] }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler'}
"Plug 'Shougo/unite.vim', { 'on': 'Unite' }
"autocmd! User unite.vim call LoadAdditionalUnite()
"Plug 'thinca/vim-unite-history', { 'on': 'Unite' }

Plug 'ctrlpvim/ctrlp.vim'

Plug 'lambdalisue/fern.vim', { 'on': 'Fern' }
Plug 'lambdalisue/gina.vim', { 'on': 'Gina' }
autocmd! User gina.vim call LoadGina()

let use_airline = 0  " issues when running airline (complains about ale init)
let use_airline = has("nvim")
Plug 'molok/vim-smartusline', Cond(2 == use_airline)
if 1 == use_airline "airline
  Plug g:p0 . '/pack/bundle/opt/airline'
  Plug g:p0 . '/pack/bundle/opt/airline-extensions'
elseif 0 == use_airline "lightline
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
"Plug 'lifepillar/vim-mucomplete'

"tpope
Plug 'tpope/vim-fugitive', { 'on': ['G', 'Git', 'Gwrite', 'Gstatus'] }
Plug 'tpope/vim-rsi'
"Plug 'tpope/vim-abolish', { 'on': 'Subvert' }
Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-apathy'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
"Plug 'tpope/vim-surround'
Plug g:p0 . '/pack/bundle/opt/surround'

" quickrun
Plug g:p0 .'/pack/bundle/opt/quickrun', {'on': 'QuickRun'}

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


Plug 'liuchengxu/vim-clap',  { 'on': 'Clap' }
Plug 'troydm/zoomwintab.vim'

Plug 'skeept/ctrlp-packadd'

Plug 'axvr/org.vim'
Plug 'mhinz/vim-signify'

" gin
Plug 'vim-denops/denops.vim', { 'on': ['Gin', 'GinStatus'] }
Plug 'lambdalisue/gin.vim', { 'on': ['Gin', 'GinStatus'] }

" local plugins
Plug g:p0 . '/pack/bundle/opt/sayonara', {'on': 'Sayonara'}
Plug g:p0 . '/pack/bundle/opt/ale', {'on': ['ALEEnable', 'ALELint']}

"airline fails if ale is not properly loaded
if use_airline
  Plug g:p0 . '/pack/bundle/opt/ale'
endif

"check telescope
"let is_nvim = has("nvim")
"Plug 'nvim-lua/plenary.nvim', Cond(is_nvim > 0)
"Plug 'nvim-telescope/telescope.nvim', Cond(is_nvim > 0, { 'tag': '0.1.1' })

" check ddu
"Plug 'Shougo/ddu.vim'


call plug#end()
