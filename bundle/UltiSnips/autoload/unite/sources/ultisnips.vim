let s:save_cpo = &cpo
set cpo&vim

let s:unite_source = {
      \ 'name': 'ultisnips',
      \ 'hooks': {},
      \ 'action_table': {'*': {}},
      \ }

let s:unite_source.action_table['*'].preview = {
      \ 'description' : 'ultisnips snippets',
      \ 'is_quit' : 0,
      \ }

function! s:unite_source.action_table['*'].preview.func(candidate)
  execute a:candidate.action__command
endfunction

function! Expand_snippetUltiUnite(snippet)
  exe "normal a" . a:snippet . " "
  call UltiSnips_ExpandSnippet()
  return ''
endfunction

function! s:unite_source.gather_candidates(args, context)
  let default_val = {'word': '', 'unite__abbr': '', 'is_dummy': 0, 'source':
        \  'ultisnips', 'unite__is_marked': 0, 'kind': 'command', 'is_matched': 1,
        \    'is_multiline': 0, 'action__command': ''}
  let snippet_list = UltiSnips_SnippetsInCurrentScope()
  let canditates = []
  for snip in items(snippet_list)
    let curr_val = copy(default_val)
    let curr_val['word'] = snip[0] . "     " . snip[1]
    let curr_val['action__command'] = 'call Expand_snippetUltiUnite("' . snip[0] . '")'
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
