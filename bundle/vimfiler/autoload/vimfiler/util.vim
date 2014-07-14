"=============================================================================
" FILE: util.vim
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

let s:save_cpo = &cpo
set cpo&vim

let s:V = vital#of('vimfiler')

function! vimfiler#util#get_vital() "{{{
  return s:V
endfunction"}}}
function! s:get_prelude() "{{{
  if !exists('s:Prelude')
    let s:Prelude = vimfiler#util#get_vital().import('Prelude')
  endif
  return s:Prelude
endfunction"}}}
function! s:get_list() "{{{
  if !exists('s:List')
    let s:List = vimfiler#util#get_vital().import('Data.List')
  endif
  return s:List
endfunction"}}}
function! s:get_message() "{{{
  if !exists('s:Message')
    let s:Message = vimfiler#util#get_vital().import('Vim.Message')
  endif
  return s:Message
endfunction"}}}
function! s:get_process() "{{{
  if !exists('s:Process')
    let s:Process = vimfiler#util#get_vital().import('Process')
  endif
  return s:Process
endfunction"}}}

let s:is_windows = has('win16') || has('win32') || has('win64')

function! vimfiler#util#truncate_smart(...)
  return call(s:get_prelude().truncate_skipping, a:000)
endfunction
function! vimfiler#util#truncate(...)
  return call(s:get_prelude().truncate, a:000)
endfunction
function! vimfiler#util#strwidthpart(...)
  return call(s:get_prelude().strwidthpart, a:000)
endfunction
function! vimfiler#util#strwidthpart_reverse(...)
  return call(s:get_prelude().strwidthpart_reverse, a:000)
endfunction
function! vimfiler#util#wcswidth(...)
  return call(s:get_prelude().wcswidth, a:000)
endfunction
function! vimfiler#util#is_windows(...)
  return s:is_windows
endfunction
function! vimfiler#util#is_win_path(path)
  return a:path =~ '^\a\?:' || a:path =~ '^\\\\[^\\]\+\\'
endfunction
function! vimfiler#util#print_error(...)
  return call(s:get_message().error, a:000)
endfunction
function! vimfiler#util#escape_file_searching(...)
  return call(s:get_prelude().escape_file_searching, a:000)
endfunction
function! vimfiler#util#escape_pattern(...)
  return call(s:get_prelude().escape_pattern, a:000)
endfunction
function! vimfiler#util#set_default(...)
  return call(s:get_prelude().set_default, a:000)
endfunction
function! vimfiler#util#set_dictionary_helper(...)
  return call(s:get_prelude().set_dictionary_helper, a:000)
endfunction
function! vimfiler#util#substitute_path_separator(...)
  return call(s:get_prelude().substitute_path_separator, a:000)
endfunction
function! vimfiler#util#path2directory(...)
  return call(s:get_prelude().path2directory, a:000)
endfunction
function! vimfiler#util#path2project_directory(...)
  return call(s:get_prelude().path2project_directory, a:000)
endfunction
function! vimfiler#util#has_vimproc(...)
  return call(s:get_process().has_vimproc, a:000)
endfunction
function! vimfiler#util#system(...)
  return call(s:get_process().system, a:000)
endfunction
function! vimfiler#util#get_last_status(...)
  return call(s:get_process().get_last_status, a:000)
endfunction
function! vimfiler#util#sort_by(...)
  return call(s:get_list().sort_by, a:000)
endfunction
function! vimfiler#util#escape_file_searching(...)
  return call(s:get_prelude().escape_file_searching, a:000)
endfunction

function! vimfiler#util#has_lua()
  " Note: Disabled if_lua feature if less than 7.3.885.
  " Because if_lua has double free problem.
  return has('lua') && (v:version > 703 || v:version == 703 && has('patch885'))
endfunction

function! vimfiler#util#is_cmdwin() "{{{
  return bufname('%') ==# '[Command Line]'
endfunction"}}}

function! vimfiler#util#expand(path) "{{{
  return s:get_prelude().substitute_path_separator(
        \ (a:path =~ '^\~') ? substitute(a:path, '^\~', expand('~'), '') :
        \ (a:path =~ '^\$\h\w*') ? substitute(a:path,
        \               '^\$\h\w*', '\=eval(submatch(0))', '') :
        \ a:path)
endfunction"}}}
function! vimfiler#util#set_default_dictionary_helper(variable, keys, value) "{{{
  for key in split(a:keys, '\s*,\s*')
    if !has_key(a:variable, key)
      let a:variable[key] = a:value
    endif
  endfor
endfunction"}}}
function! vimfiler#util#set_dictionary_helper(variable, keys, value) "{{{
  for key in split(a:keys, '\s*,\s*')
    let a:variable[key] = a:value
  endfor
endfunction"}}}
function! vimfiler#util#resolve(filename) "{{{
  return ((vimfiler#util#is_windows() && fnamemodify(a:filename, ':e') ==? 'LNK') || getftype(a:filename) ==# 'link') ?
        \ vimfiler#util#substitute_path_separator(resolve(a:filename)) : a:filename
endfunction"}}}

function! vimfiler#util#set_variables(variables) "{{{
  let variables_save = {}
  for [key, value] in items(a:variables)
    let save_value = exists(key) ? eval(key) : ''

    let variables_save[key] = save_value
    execute 'let' key '=' string(value)
  endfor

  return variables_save
endfunction"}}}
function! vimfiler#util#restore_variables(variables_save) "{{{
  for [key, value] in items(a:variables_save)
    execute 'let' key '=' string(value)
  endfor
endfunction"}}}

function! vimfiler#util#alternate_buffer() "{{{
  let context = vimfiler#get_context()

  if s:buflisted(context.alternate_buffer)
        \ && getbufvar(context.alternate_buffer, '&filetype') !=# 'vimfiler'
        \ && g:vimfiler_restore_alternate_file
    execute 'buffer' context.alternate_buffer
    return
  endif

  let listed_buffer = filter(range(1, bufnr('$')),
        \ "s:buflisted(v:val) &&
        \  (v:val == bufnr('%') || getbufvar(v:val, '&filetype') !=# 'vimfiler')")
  let current = index(listed_buffer, bufnr('%'))
  if current < 0 || len(listed_buffer) < 2
    enew
    return
  endif

  execute 'buffer' ((current < len(listed_buffer) / 2) ?
        \ listed_buffer[current+1] : listed_buffer[current-1])

  silent call vimfiler#force_redraw_all_vimfiler()
endfunction"}}}
function! vimfiler#util#delete_buffer(...) "{{{
  let context = vimfiler#get_context()
  let delete_bufnr = get(a:000, 0, bufnr('%'))

  if winnr('$') != 1 && (context.split || context.toggle
        \ || vimfiler#exists_another_vimfiler())
    " Move to delete buffer window.
    let current_bufnr = winbufnr(winnr())
    try
      execute bufwinnr(delete_bufnr).'wincmd w'
      close
    finally
      execute bufwinnr(current_bufnr).'wincmd w'
    endtry
  else
    call vimfiler#util#alternate_buffer()
  endif
  silent execute 'bwipeout!' delete_bufnr
endfunction"}}}
function! s:buflisted(bufnr) "{{{
  return exists('t:unite_buffer_dictionary') ?
        \ has_key(t:unite_buffer_dictionary, a:bufnr) && buflisted(a:bufnr) :
        \ buflisted(a:bufnr)
endfunction"}}}

function! vimfiler#util#convert2list(expr) "{{{
  return type(a:expr) ==# type([]) ? a:expr : [a:expr]
endfunction"}}}
function! vimfiler#util#get_vimfiler_winnr(buffer_name) "{{{
  for winnr in filter(range(1, winnr('$')),
        \ "getbufvar(winbufnr(v:val), '&filetype') ==# 'vimfiler'")
    let buffer_context = getbufvar(
          \ winbufnr(winnr), 'vimfiler').context
    if buffer_context.profile_name ==# a:buffer_name
      return winnr
    endif
  endfor

  return -1
endfunction"}}}

function! vimfiler#util#is_sudo() "{{{
  return $SUDO_USER != '' && $USER !=# $SUDO_USER
        \ && $HOME !=# expand('~'.$USER)
        \ && $HOME ==# expand('~'.$SUDO_USER)
endfunction"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: foldmethod=marker
