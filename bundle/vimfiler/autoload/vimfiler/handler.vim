"=============================================================================
" FILE: handler.vim
" AUTHOR: Shougo Matsushita <Shougo.Matsu@gmail.com>
" Last Modified: 23 Sep 2013.
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

let s:save_cpo = &cpo
set cpo&vim

function! vimfiler#handler#_event_handler(event_name, ...)  "{{{1
  let context = vimfiler#initialize_context(get(a:000, 0, {}))
  let path = get(context, 'path',
        \ vimfiler#util#substitute_path_separator(expand('<afile>')))

  if filereadable(path)
    call vimfiler#print_error('You cannot open the file contained ":"(see FAQ).')
    return
  endif

  let ret = vimfiler#parse_path(path)
  let source_name = ret[0]
  let source_args = ret[1:]

  return s:on_{a:event_name}(source_name, source_args, context)
endfunction

" Event Handlers.

function! s:on_BufReadCmd(source_name, source_args, context)  "{{{1
  " Check path.
  let ret = unite#vimfiler_check_filetype(
        \ [insert(a:source_args, a:source_name)])
  if empty(ret)
    " File not found.
    return
  endif
  let [type, info] = ret

  let bufnr = bufnr('%')

  let b:vimfiler = {}
  let b:vimfiler.source = a:source_name
  let b:vimfiler.context = a:context
  let b:vimfiler.bufnr = bufnr('%')
  if type ==# 'directory'
    call vimfiler#init#_initialize_vimfiler_directory(info, a:context)
  elseif type ==# 'file'
    call vimfiler#init#_initialize_vimfiler_file(
          \ a:source_args, info[0], info[1])
  else
    call vimfiler#print_error('Unknown filetype.')
  endif

  if bufnr('%') != bufnr
    " Restore window.
    execute bufwinnr(bufnr).'wincmd w'
  endif

  call vimfiler#set_current_vimfiler(b:vimfiler)
endfunction"}}}

function! s:on_BufWriteCmd(source_name, source_args, context)  "{{{1
  " BufWriteCmd is published by :write or other commands with 1,$ range.
  return s:write(a:source_name, a:source_args, 1, line('$'), 'BufWriteCmd')
endfunction"}}}


function! s:on_FileAppendCmd(source_name, source_args, context)  "{{{1
  " FileAppendCmd is published by :write or other commands with >>.
  return s:write(a:source_name, a:source_args, line("'["), line("']"), 'FileAppendCmd')
endfunction"}}}


function! s:on_FileReadCmd(source_name, source_args, context)  "{{{1
  " Check path.
  let ret = unite#vimfiler_check_filetype(
        \ [insert(a:source_args, a:source_name)])
  if empty(ret)
    " File not found.
    call vimfiler#print_error(
          \ printf('Can''t open "%s".', join(a:source_args, ':')))
    return
  endif
  let [type, info] = ret

  if type !=# 'file'
    call vimfiler#print_error(
          \ printf('"%s" is not a file.', join(a:source_args, ':')))
    return
  endif

  call append(line('.'), info[0])
endfunction"}}}


function! s:on_FileWriteCmd(source_name, source_args, context)  "{{{
  " FileWriteCmd is published by :write or other commands with partial range
  " such as 1,2 where 2 < line('$').
  return s:write(a:source_name, a:source_args, line("'["), line("']"), 'FileWriteCmd')
endfunction"}}}

function! s:write(source_name, source_args, line1, line2, event_name)  "{{{
  if !exists('b:vimfiler') || !has_key(b:vimfiler, 'current_file') || !&l:modified
    return
  endif

  try
    setlocal nomodified

    call unite#mappings#do_action('vimfiler__write',
          \ [b:vimfiler.current_file], {
          \ 'vimfiler__line1' : a:line1,
          \ 'vimfiler__line2' : a:line2,
          \ 'vimfiler__eventname' : a:event_name,
          \ })
  catch
    call vimfiler#print_error(v:exception . ' ' . v:throwpoint)
    setlocal modified
  endtry
endfunction"}}}

" Event functions.
function! vimfiler#handler#_event_bufwin_enter(bufnr) "{{{
  let prev_winnr = winnr('#')

  if a:bufnr != bufnr('%') && bufwinnr(a:bufnr) > 0
    let winnr = winnr()
    let prev_winnr = winnr
    execute bufwinnr(a:bufnr) 'wincmd w'
  endif

  try
    if !exists('b:vimfiler')
      return
    endif

    call vimfiler#set_current_vimfiler(b:vimfiler)

    let vimfiler = vimfiler#get_current_vimfiler()
    if !has_key(vimfiler, 'context')
      return
    endif

    let context = vimfiler#get_context()
    if context.winwidth != 0
      execute 'vertical resize' context.winwidth

      let context.vimfiler__winfixwidth = &l:winfixwidth
      if context.split
        setlocal winfixwidth
      endif
    elseif context.winheight != 0
      execute 'resize' context.winheight
      if line('.') < winheight(0)
        normal! zb
      endif

      let context.vimfiler__winfixheight = &l:winfixheight
      if context.split
        setlocal winfixheight
      endif
    endif

    let context.vimfiler__prev_winnr = prev_winnr

    let winwidth = (winwidth(0)+1)/2*2
    if exists('vimfiler.winwidth')
      if vimfiler.winwidth != winwidth
        call vimfiler#view#_redraw_screen()
      endif
    endif

    call s:restore_statusline()
  finally
    if exists('winnr')
      execute winnr.'wincmd w'
    endif
  endtry
endfunction"}}}

function! vimfiler#handler#_event_bufwin_leave(bufnr) "{{{
  let vimfiler = getbufvar(str2nr(a:bufnr), 'vimfiler')

  if type(vimfiler) != type({})
    return
  endif

  " Restore winfix.
  let context = vimfiler.context
  if context.winwidth != 0 && context.split
    let &l:winfixwidth = context.vimfiler__winfixwidth
  elseif context.winheight != 0 && context.split
    let &l:winfixheight = context.vimfiler__winfixheight
  endif
endfunction"}}}

function! s:restore_statusline()  "{{{
  if &filetype !=# 'vimfiler' || !g:vimfiler_force_overwrite_statusline
    return
  endif

  if &l:statusline != b:vimfiler.statusline
    " Restore statusline.
    let &l:statusline = b:vimfiler.statusline
  endif
endfunction"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: foldmethod=marker

