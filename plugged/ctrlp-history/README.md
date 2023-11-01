ctrlp-history

Adds cmd history (what you see in `g:`) and search history (what you see in
`g/`) to ctrlp so you can quickly re-run commands or searches.

# Install
Please install [ctrlp.vim](https://github.com/kien/ctrlp.vim) to use this plugin.

Bundle/NeoBundle will be convenient plugins to install such plugins.

# Usage
    :CtrlPCmdHistory
    :CtrlPSearchHistory

# An example of .vimrc
    nnoremap <silent><C-p><C-h> :CtrlPCmdHistory<CR>
    nnoremap <silent><C-p><C-s> :CtrlPSearchHistory<CR>
