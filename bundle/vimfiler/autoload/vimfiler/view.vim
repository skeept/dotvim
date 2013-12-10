"=============================================================================
" FILE: view.vim
" AUTHOR: Shougo Matsushita <Shougo.Matsu@gmail.com>
" Last Modified: 04 Dec 2013.
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

let g:vimfiler_draw_files_limit =
      \ get(g:, 'vimfiler_draw_files_limit', 100)

function! vimfiler#view#_force_redraw_screen(...) "{{{
  let is_manualed = get(a:000, 0, 0)

  let old_original_files = {}
  for file in filter(copy(b:vimfiler.original_files),
        \ 'v:val.vimfiler__is_directory && v:val.vimfiler__is_opened')
    let old_original_files[file.action__path] = 1
  endfor

  " Use matcher_glob.
  let b:vimfiler.original_files =
        \ vimfiler#get_directory_files(b:vimfiler.current_dir, is_manualed)
  let index = 0
  for file in copy(b:vimfiler.original_files)
    if file.vimfiler__is_directory
          \ && has_key(old_original_files, file.action__path)
      " Insert children.
      let children = vimfiler#mappings#expand_tree_rec(file, old_original_files)

      let b:vimfiler.original_files = b:vimfiler.original_files[: index]
            \ + children + b:vimfiler.original_files[index+1 :]
      let index += len(children)
    endif

    let index += 1
  endfor

  call vimfiler#view#_redraw_screen()
endfunction"}}}
function! vimfiler#view#_redraw_screen(...) "{{{
  let is_all = get(a:000, 0, 0)

  let is_switch = &filetype !=# 'vimfiler'
  if is_switch
    " Switch vimfiler.
    let vimfiler = vimfiler#get_current_vimfiler()

    let save_winnr = winnr()
    let winnr = bufwinnr(vimfiler.bufnr)
    if winnr < 0
      " Not vimfiler window.
      return
    endif

    execute winnr . 'wincmd w'
  endif

  if !has_key(b:vimfiler, 'original_files')
    return
  endif

  let current_file = vimfiler#get_file()

  let b:vimfiler.all_files =
        \ unite#filters#matcher_vimfiler_mask#define().filter(
        \ copy(b:vimfiler.original_files),
        \ { 'input' : b:vimfiler.current_mask })
  if !b:vimfiler.is_visible_ignore_files
    if g:vimfiler_ignore_pattern != ''
      call filter(b:vimfiler.all_files,
            \  "v:val.vimfiler__filename !~? g:vimfiler_ignore_pattern")
    endif

    let b:vimfiler.all_files =
          \ s:check_tree(b:vimfiler.all_files)
  endif

  let b:vimfiler.all_files_len = len(b:vimfiler.all_files)

  let b:vimfiler.winwidth = (winwidth(0)+1)/2*2

  let b:vimfiler.current_files = is_all ?
        \ b:vimfiler.all_files : b:vimfiler.all_files[ :
        \      max([g:vimfiler_draw_files_limit, winheight(0) * 2]) - 1]

  setlocal modifiable

  try
    let last_line = line('.')

    " Clean up the screen.
    if line('$') > 1 &&
          \ b:vimfiler.prompt_linenr + len(b:vimfiler.current_files) < line('$')
      silent execute '$-'.(line('$')-b:vimfiler.prompt_linenr-
            \ len(b:vimfiler.current_files)+1).',$delete _'
    endif

    call s:redraw_prompt()

    " Print files.
    call setline(b:vimfiler.prompt_linenr + 1,
          \ vimfiler#view#_get_print_lines(b:vimfiler.current_files))
  finally
    setlocal nomodifiable
  endtry

  let index = index(b:vimfiler.current_files, current_file)
  if index >= 0
    call cursor(vimfiler#get_line_number(index), 0)
  elseif line('.') == 1 && last_line == 1
    " Initialize cursor position.
    call cursor(b:vimfiler.prompt_linenr+1, 0)
  else
    call cursor(last_line, 0)
  endif

  if last_line != line('.') || (line('$') - line('.')) <= winheight(0)
    call vimfiler#helper#_set_cursor()
  endif

  if is_switch
    execute save_winnr . 'wincmd w'
  endif
endfunction"}}}
function! vimfiler#view#_force_redraw_all_vimfiler(...) "{{{
  let is_manualed = get(a:000, 0, 0)

  let current_nr = winnr()

  try
    " Search vimfiler window.
    for winnr in filter(range(1, winnr('$')),
          \ "getwinvar(v:val, '&filetype') ==# 'vimfiler'")
      execute winnr . 'wincmd w'
      call vimfiler#view#_force_redraw_screen(is_manualed)
    endfor
  finally
    execute current_nr . 'wincmd w'
  endtry
endfunction"}}}
function! vimfiler#view#_redraw_all_vimfiler() "{{{
  let current_nr = winnr()
  let bufnr = 1
  while bufnr <= winnr('$')
    " Search vimfiler window.
    if getwinvar(bufnr, '&filetype') ==# 'vimfiler'

      execute bufnr . 'wincmd w'
      call vimfiler#view#_redraw_screen()
    endif

    let bufnr += 1
  endwhile

  execute current_nr . 'wincmd w'
endfunction"}}}
function! s:redraw_prompt() "{{{
  if &filetype !=# 'vimfiler'
    return
  endif

  let mask = !b:vimfiler.is_visible_ignore_files
        \ && b:vimfiler.current_mask == '' ?
        \ '' : '[' . (b:vimfiler.is_visible_ignore_files ? '.:' : '')
        \       . b:vimfiler.current_mask . ']'

  let prefix = (b:vimfiler.is_safe_mode ? '[safe] ' : '') .
        \ (b:vimfiler.source ==# 'file' ? '' : b:vimfiler.source.':')

  let dir = b:vimfiler.current_dir
  if b:vimfiler.source ==# 'file'
    let home = vimfiler#util#substitute_path_separator(expand('~')).'/'
    if stridx(dir, home) >= 0
      let dir = '~/' . dir[len(home):]
    endif
  endif

  if vimfiler#util#wcswidth(prefix.dir) > winwidth(0)
    let dir = fnamemodify(substitute(dir, '/$', '', ''), ':t')
  endif

  if dir !~ '/$'
    let dir .= '/'
  endif
  let b:vimfiler.status = prefix .  dir . mask

  let context = vimfiler#get_context()

  " Append up directory.
  let modifiable_save = &l:modifiable
  setlocal modifiable

  if getline(b:vimfiler.prompt_linenr) != '..'
    if line('$') == 1
      " Note: Dirty Hack for open file.
      call append(1, '')
      call setline(2, '..')
      silent delete _
    else
      call setline(1, '..')
    endif
  endif

  if context.status || context.explorer
    if getline(1) == '..'
      call append(0, '[in]: ' . b:vimfiler.status)
    else
      call setline(1, '[in]: ' . b:vimfiler.status)
    endif
  endif

  if context.explorer
    " Delete prompt
    silent 1,2delete _
  endif

  let &l:modifiable = modifiable_save
endfunction"}}}
function! vimfiler#view#_get_print_lines(files) "{{{
  " Clear previous syntax.
  for syntax in b:vimfiler.syntaxes
    silent! execute 'syntax clear' syntax
  endfor

  let columns = (b:vimfiler.context.simple) ? [] : b:vimfiler.columns

  let start = 0
  for column in columns
    let column.vimfiler__length = column.length(
          \ a:files, b:vimfiler.context)
  endfor
  let columns = filter(columns, 'v:val.vimfiler__length > 0')

  " Calc padding width.
  let padding = 0
  for column in columns
    let padding += column.vimfiler__length + 1
  endfor

  if &l:number || (exists('&relativenumber') && &l:relativenumber)
    let padding += max([&l:numberwidth,
          \ len(line('$') + len(a:files))+1])
  endif

  let padding += &l:foldcolumn

  if has('signs')
    " Delete signs.
    silent execute 'sign unplace buffer='.bufnr('%')
  endif

  let max_len = max([max([winwidth(0), &winwidth]) - padding, 10])

  " Column region.
  let start = max_len + 1
  for column in columns
    if get(column, 'syntax', '') != '' && max_len > 0
      for [offset, syntax] in [
            \ [vimfiler#util#wcswidth(
            \  g:vimfiler_tree_opened_icon), 'vimfilerOpendFile'],
            \ [vimfiler#util#wcswidth(
            \  g:vimfiler_tree_closed_icon), 'vimfilerClosedFile'],
            \ [vimfiler#util#wcswidth(
            \  g:vimfiler_readonly_file_icon), 'vimfilerROFile'],
            \ [vimfiler#util#wcswidth(
            \  g:vimfiler_file_icon), 'vimfilerNormalFile']]
        execute 'syntax region' column.syntax 'start=''\%'.(start+offset).
              \ (v:version >= 703 ? 'v' : 'c').
              \ ''' end=''\%'.(start + column.vimfiler__length+offset).
              \ (v:version >= 703 ? 'v' : 'c').
              \ ''' contained keepend containedin=vimfilerMarkedFile,'.syntax
      endfor

      call add(b:vimfiler.syntaxes, column.syntax)
    endif

    let start += column.vimfiler__length + 1
  endfor

  " Print files.
  let lines = []
  for file in a:files
    let filename = file.vimfiler__abbr
    if file.vimfiler__is_directory
          \ && filename !~ '/$'
      let filename .= '/'
    endif

    let mark = ''
    if file.vimfiler__nest_level > 0
      let mark .= repeat(' ', file.vimfiler__nest_level
            \       * g:vimfiler_tree_indentation)
            \ . g:vimfiler_tree_leaf_icon
    endif
    if file.vimfiler__is_marked
      let mark .= g:vimfiler_marked_file_icon
    elseif file.vimfiler__is_directory
      let mark .= !get(file, 'vimfiler__is_writable', 1)
            \    && !file.vimfiler__is_opened ?
            \ g:vimfiler_readonly_file_icon :
            \ file.vimfiler__is_opened ? g:vimfiler_tree_opened_icon :
            \                            g:vimfiler_tree_closed_icon
    else
      let mark .= (!get(file, 'vimfiler__is_writable', 1) ?
          \      g:vimfiler_readonly_file_icon : g:vimfiler_file_icon)
    endif
    let mark .= ' '

    let line = mark . filename
    if len(line) > max_len
      let line = vimfiler#util#truncate_smart(
            \ line, max_len, max_len/2, '..')
    else
      let line .= repeat(' ', max_len - vimfiler#util#wcswidth(line))
    endif

    for column in columns
      let column_string = column.get(file, b:vimfiler.context)
      if len(column_string) > column.vimfiler__length
        let column_string = vimfiler#util#truncate(
            \ column_string, column.vimfiler__length)
      endif
      let line .= ' ' . column_string
    endfor

    if line[-1] == ' '
      let line = substitute(line, '\s\+$', '', '')
    endif

    call add(lines, line)
  endfor

  return lines
endfunction"}}}
function! vimfiler#view#_check_redraw()
  if &l:number || (exists('&relativenumber') && &l:relativenumber)
    " Force redraw.
    call vimfiler#view#_force_redraw_screen()
  endif
endfunction

function! s:check_tree(files) "{{{
  let level = 0
  let _ = []
  for file in a:files
    if file.vimfiler__nest_level == 0 ||
          \ file.vimfiler__nest_level <= level + 1
      call add(_, file)
      let level = file.vimfiler__nest_level
    endif
  endfor

  return _
endfunction"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: foldmethod=marker
