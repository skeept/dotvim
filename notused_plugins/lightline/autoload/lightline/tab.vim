" =============================================================================
" Filename: autoload/lightline/tab.vim
" Author: itchyny
" License: MIT License
" Last Change: 2015/01/04 22:44:42.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! lightline#tab#filename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = expand('#'.buflist[winnr - 1].':t')
  return strlen(_) ? _ : '[No Name]'
endfunction

function! lightline#tab#modified(n) abort
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&modified') ? '+' : gettabwinvar(a:n, winnr, '&modifiable') ? '' : '-'
endfunction

function! lightline#tab#readonly(n) abort
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&readonly') ? 'RO' : ''
endfunction

function! lightline#tab#tabnum(n) abort
  return a:n
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
