"=============================================================================
" FILE: ultisnips.vim
" AUTHOR:  Jorge Rodrigues <skeept@gmail.com>
" Last Modified: 12 Aug 2013.
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

if exists("g:ultisnips_disable_unite")
  function! unite#sources#ultisnips#define()
    return {}
  endfunction
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

let s:unite_source = {
      \ 'name': 'ultisnips',
      \ 'hooks': {},
      \ 'action_table': {},
      \ 'default_action': 'expand',
      \ }

let s:unite_source.action_table.preview = {
      \ 'description' : 'ultisnips snippets',
      \ 'is_quit' : 0,
      \ }

function! s:unite_source.action_table.preview.func(candidate)
  " no nice preview at this point, cannot get snippet text
  let snippet_preview = a:candidate['word']
  echo snippet_preview
endfunction

let s:unite_source.action_table.expand = {
      \ 'description': 'expand the current snippet',
      \ 'is_quit': 1
      \}
function! s:unite_source.action_table.expand.func(candidate)
  exe "normal a" . a:candidate['trigger'] . " "
  call UltiSnips_ExpandSnippet()
  return ''
endfunction

function! s:unite_source.gather_candidates(args, context)
  let default_val = {'word': '', 'unite__abbr': '', 'is_dummy': 0, 'source':
        \  'ultisnips', 'unite__is_marked': 0, 'kind': 'command', 'is_matched': 1,
        \    'is_multiline': 0}
  let snippet_list = UltiSnips_SnippetsInCurrentScope()
  let canditates = []
  for snip in items(snippet_list)
    let curr_val = copy(default_val)
    let curr_val['word'] = snip[0] . "     " . snip[1]
    let curr_val['trigger'] = snip[0]
    call add(canditates, curr_val)
  endfor
  return canditates
endfunction

function! unite#sources#ultisnips#define()
  return s:unite_source
endfunction

"unlet s:unite_source

let &cpo = s:save_cpo
unlet s:save_cpo
