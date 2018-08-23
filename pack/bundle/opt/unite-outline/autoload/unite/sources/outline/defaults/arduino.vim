"=============================================================================
" File    : autoload/unite/sources/outline/defaults/arduino.vim
" Author  : kurokky <blacktree0228@gmail.com>
" Updated : 2018-08-22
"
" Licensed under the MIT license:
" http://www.opensource.org/licenses/mit-license.php
"
"=============================================================================

" Default outline info for Arduino
" Version: 0.0.2

function! unite#sources#outline#defaults#arduino#outline_info() abort
  return s:outline_info
endfunction

let s:Util = unite#sources#outline#import('Util')

"-----------------------------------------------------------------------------
" Outline Info

let s:outline_info = {
      \ 'heading'  : '^\s*\%(void\|command_data_t\|serial_data_t\|middle_data_t\)\>',
      \
      \ 'heading_groups': {
      \   'function' : ['function'],
      \ },
      \
      \ 'not_match_patterns': [
      \   s:Util.shared_pattern('*', 'parameter_list'),
      \ ],
      \
      \ 'highlight_rules': [
      \   { 'name'   : 'comment',
      \     'pattern': "'/[/*].*'" },
      \   { 'name'   : 'function',
      \     'pattern': '/\h\w*\ze\s*(/' },
      \   { 'name'   : 'parameter_list',
      \     'pattern': '/(.*)/' },
      \ ],
      \}

function! s:outline_info.create_heading(which, heading_line, matched_line, context) abort
  let h_lnum = a:context.heading_lnum
  let level = s:Util.get_indent_level(a:context, h_lnum)
  let heading = {
        \ 'word' : a:heading_line,
        \ 'level': level,
        \ 'type' : 'generic',
        \ }

  if heading.word =~ '^\s*void\>'
    " Function
    let heading.type = 'function'
    let heading.word = substitute(heading.word, '\<void\s*', '', '')
    let heading.word = substitute(heading.word, '\S\zs(', ' (', '')
    let heading.word = substitute(heading.word, '\%(:\|#\).*$', '', '')
  endif
  return heading
endfunction

function! s:outline_info.need_blank_between(cand1, cand2, memo) abort
  if a:cand1.source__heading_group == 'function' && a:cand2.source__heading_group == 'function'
    " Don't insert a blank between two sibling functions.
    return 0
  else
    return (a:cand1.source__heading_group != a:cand2.source__heading_group ||
          \ a:cand1.source__has_marked_child || a:cand2.source__has_marked_child)
  endif
endfunction
