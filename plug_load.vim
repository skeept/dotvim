
call plug#begin(g:p0 . '/plugged')

Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'

" Shougo
Plug 'Shougo/junkfile.vim', { 'on': 'JunkfileOpen'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler'}
Plug 'Shougo/unite.vim', { 'on': 'Unite' }

Plug 'ctrlpvim/ctrlp.vim'

Plug 'lambdalisue/gina.vim', { 'on': 'Gina' }

Plug 'molok/vim-smartusline'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
Plug 'yami-beta/asyncomplete-omni.vim'

"tpope
Plug 'tpope/vim-fugitive', { 'on': ['Git', 'Gwrite', 'Gstatus'] }
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-abolish', { 'on': 'Subvert' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'

call plug#end()
