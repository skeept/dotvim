" File: autoload/ctrlp/funky/python.vim
" Description: adds python support to ctrlp's funky extension
" Author: pydave
" License: The MIT License

let s:filter = [{ 'pattern': '\v\C^\s*(def|class)\s+\w.+:',
                \ 'filter': ['\v\C^\s*', '', '']}
\ ]

function! ctrlp#funky#python#apply_filter(bufnr)
  return ctrlp#funky#abstract(a:bufnr, s:filter)
endfunction

function! ctrlp#funky#python#get_filter()
  return s:filter
endfunction

