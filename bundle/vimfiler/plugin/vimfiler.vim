"=============================================================================
" FILE: vimfiler.vim
" AUTHOR: Shougo Matsushita <Shougo.Matsu@gmail.com>
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================

if exists('g:loaded_vimfiler')
  finish
elseif v:version < 703
  echomsg 'vimfiler does not work this version of Vim "' . v:version . '".'
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

" Global options definition. "{{{
let g:vimfiler_as_default_explorer =
      \ get(g:, 'vimfiler_as_default_explorer', 0)
let g:vimfiler_define_wrapper_commands =
      \ get(g:, 'vimfiler_define_wrapper_commands', 0)
"}}}

" Plugin keymappings "{{{
nnoremap <silent> <Plug>(vimfiler_split_switch)
      \ :<C-u><SID>call_vimfiler({ 'split' : 1 }, '')<CR>
nnoremap <silent> <Plug>(vimfiler_split_create)
      \ :<C-u>VimFilerSplit<CR>
nnoremap <silent> <Plug>(vimfiler_switch)
      \ :<C-u>VimFiler<CR>
nnoremap <silent> <Plug>(vimfiler_create)
      \ :<C-u>VimFilerCreate<CR>
nnoremap <silent> <Plug>(vimfiler_simple)
      \ :<C-u>VimFilerSimple<CR>
"}}}

command! -nargs=? -complete=customlist,vimfiler#complete VimFiler
      \ call vimfiler#init#_command({}, <q-args>)
command! -nargs=? -complete=customlist,vimfiler#complete VimFilerDouble
      \ call vimfiler#init#_command({ 'double' : 1 }, <q-args>)
command! -nargs=? -complete=customlist,vimfiler#complete VimFilerCurrentDir
      \ call vimfiler#init#_command({}, <q-args> . ' ' . getcwd())
command! -nargs=? -complete=customlist,vimfiler#complete VimFilerBufferDir
      \ call vimfiler#init#_command({}, <q-args> . ' ' .
      \ vimfiler#helper#_get_buffer_directory(bufnr('%')))
command! -nargs=? -complete=customlist,vimfiler#complete VimFilerCreate
      \ call vimfiler#init#_command({ 'create' : 1 }, <q-args>)
command! -nargs=? -complete=customlist,vimfiler#complete VimFilerSimple
      \ call vimfiler#init#_command({ 'simple' : 1, 'split' : 1, 'create' : 1 }, <q-args>)
command! -nargs=? -complete=customlist,vimfiler#complete VimFilerSplit
      \ call vimfiler#init#_command({ 'split' : 1, }, <q-args>)
command! -nargs=? -complete=customlist,vimfiler#complete VimFilerTab
      \ call vimfiler#init#_command({ 'tab' : 1 }, <q-args>)
command! -nargs=? -complete=customlist,vimfiler#complete VimFilerExplorer
      \ call vimfiler#init#_command({ 'explorer' : 1, }, <q-args>)
command! -nargs=1 VimFilerClose call vimfiler#mappings#close(<q-args>)

augroup vimfiler
  autocmd BufReadCmd ??*:{*,*/*}
        \ call vimfiler#handler#_event_handler('BufReadCmd')
  autocmd BufWriteCmd ??*:{*,*/*}
        \ call vimfiler#handler#_event_handler('BufWriteCmd')
  autocmd FileAppendCmd ??*:{*,*/*}
        \ call vimfiler#handler#_event_handler('FileAppendCmd')
  autocmd FileReadCmd ??*:{*,*/*}
        \ call vimfiler#handler#_event_handler('FileReadCmd')
  autocmd BufEnter,VimEnter,BufNew,BufWinEnter,BufRead,BufCreate
        \ * call s:browse_check(expand('<amatch>'))
augroup END

if g:vimfiler_define_wrapper_commands
  " Define wrapper commands.
  command! -bang -bar -complete=customlist,vimfiler#complete -nargs=*
        \ Edit  edit<bang> <args>
  command! -bang -bar -complete=customlist,vimfiler#complete -nargs=*
        \ Read  read<bang> <args>
  command! -bang -bar -complete=customlist,vimfiler#complete -nargs=1
        \ Source  source<bang> <args>
  command! -bang -bar -complete=customlist,vimfiler#complete -nargs=* -range=%
        \ Write  <line1>,<line2>write<bang> <args>
endif

function! s:browse_check(path) "{{{
  if !g:vimfiler_as_default_explorer
        \ || a:path == ''
    return
  endif

  let bufnr = bufnr('%')
  if bufnr != expand('<abuf>')
    if (!&l:hidden && &l:modified)
          \ || (&l:hidden && &l:bufhidden =~# 'unload\|delete\|wipe')
          \ || !isdirectory(a:path)
      " Cannot switch
      return
    endif

    execute expand('<abuf>').'buffer'
  endif

  " Disable netrw.
  augroup FileExplorer
    autocmd!
  augroup END

  let path = a:path
  " For ":edit ~".
  if fnamemodify(path, ':t') ==# '~'
    let path = '~'
  endif

  if &filetype ==# 'vimfiler' && line('$') != 1
    return
  endif

  if isdirectory(vimfiler#util#expand(path))
    call vimfiler#handler#_event_handler('BufReadCmd')
  endif

  if bufnr != expand('<abuf>')
    execute expand('<abuf>').'buffer'
  endif
endfunction"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_vimfiler = 1

" vim: foldmethod=marker
