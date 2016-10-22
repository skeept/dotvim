"=============================================================================
" FILE: vim.vim
" AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
" License: MIT license
"=============================================================================

let s:denite_path = fnamemodify(expand('<sfile>'), ':p:h:h:h')
      \ . '/rplugin/python3'

function! denite#vim#_initialize() abort "{{{
  if v:version < 800 || !has('python3')
    call denite#util#print_error(
          \ 'denite.nvim does not work with this version.')
    call denite#util#print_error(
          \ 'It requires Vim 8.0+ with Python3 support("+python3").')
    return 1
  endif

  python3 << EOF
import vim

# Add sys.path
sys.path.insert(0, vim.eval('s:denite_path'))

import denite.rplugin

import denite.ui.default
denite_ui = denite.ui.default.Default(denite.rplugin.Neovim(vim))
EOF

  call denite#init#_variables()

  let g:denite#_channel_id = getpid()
endfunction"}}}

function! denite#vim#_start(sources, context) abort "{{{
  python3 << EOF
import vim
import denite.rplugin

denite_ui.start(denite.rplugin.reform_bytes(vim.bindeval('a:sources')),
                denite.rplugin.reform_bytes(vim.bindeval('a:context')))
EOF
  return []
endfunction"}}}

" vim: foldmethod=marker
