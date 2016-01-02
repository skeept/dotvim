let s:suite = themis#suite('toml')
let s:assert = themis#helper('assert')

function! s:suite.get_in_paren()
  call s:assert.equals(neosnippet#parser#_get_in_paren(
        \ '(', ')',
        \ '(foobar)'),
        \ 'foobar')
  call s:assert.equals(neosnippet#parser#_get_in_paren(
        \ '(', ')',
        \ '(foobar, baz)'),
        \ 'foobar, baz')
  call s:assert.equals(neosnippet#parser#_get_in_paren(
        \ '(', ')',
        \ '(foobar, (baz))'),
        \ 'foobar, (baz)')
  call s:assert.equals(neosnippet#parser#_get_in_paren(
        \ '(', ')',
        \ 'foobar('),
        \ '')
  call s:assert.equals(neosnippet#parser#_get_in_paren(
        \ '(', ')',
        \ 'foobar()'),
        \ '')
  call s:assert.equals(neosnippet#parser#_get_in_paren(
        \ '(', ')',
        \ 'foobar(fname)'),
        \ 'fname')
  call s:assert.equals(neosnippet#parser#_get_in_paren(
        \ '(', ')',
        \ 'wait()    wait(long, int)'),
        \ 'long, int')
endfunction

function! s:suite.get_completed_snippet()
  call s:assert.equals(neosnippet#parser#_get_completed_snippet({
        \ 'word' : 'foo(', 'abbr' : 'foo()',
        \ 'menu' : '', 'info' : ''
        \ }), ')${1}')

  call s:assert.equals(neosnippet#parser#_get_completed_snippet({
        \ 'word' : 'foo(', 'abbr' : '',
        \ 'menu' : '', 'info' : ''
        \ }), '${1})${2}')

  call s:assert.equals(neosnippet#parser#_get_completed_snippet({
        \ 'word' : 'foo(', 'abbr' : 'foo(hoge)',
        \ 'menu' : '', 'info' : ''
        \ }), '${1:#:hoge})${2}')

  call s:assert.equals(neosnippet#parser#_get_completed_snippet({
        \ 'word' : 'foo', 'abbr' : 'foo(hoge)',
        \ 'menu' : '', 'info' : ''
        \ }), '')

  call s:assert.equals(neosnippet#parser#_get_completed_snippet({
        \ 'word' : 'foo(', 'abbr' : 'foo(hoge, piyo)',
        \ 'menu' : '', 'info' : ''
        \ }), '${1:#:hoge}, ${2:#:piyo})${3}')

  call s:assert.equals(neosnippet#parser#_get_completed_snippet({
        \ 'word' : 'foo(', 'abbr' : 'foo(hoge, piyo(foobar))',
        \ 'menu' : '', 'info' : ''
        \ }), '${1:#:hoge}, ${2:#:piyo()})${3}')

  call s:assert.equals(neosnippet#parser#_get_completed_snippet({
        \ 'word' : 'foo(', 'abbr' : 'foo(hoge[, abc])',
        \ 'menu' : '', 'info' : ''
        \ }), '${1:#:hoge[, abc]})${2}')

  call s:assert.equals(neosnippet#parser#_get_completed_snippet({
        \ 'word' : 'foo(', 'abbr' : 'foo(...)',
        \ 'menu' : '', 'info' : ''
        \ }), '${1:#:...})${2}')

  call s:assert.equals(neosnippet#parser#_get_completed_snippet({
        \ 'word' : 'foo(', 'abbr' : 'foo(hoge, ...)',
        \ 'menu' : '', 'info' : ''
        \ }), '${1:#:hoge}${2:#:, ...})${3}')

  call s:assert.equals(neosnippet#parser#_get_completed_snippet({
        \ 'word' : 'foo{', 'abbr' : 'foo{}',
        \ 'menu' : '', 'info' : ''
        \ }), '}${1}')

  call s:assert.equals(neosnippet#parser#_get_completed_snippet({
        \ 'word' : 'foo{', 'abbr' : 'foo{',
        \ 'menu' : '', 'info' : ''
        \ }), '${1}}${2}')

  call s:assert.equals(neosnippet#parser#_get_completed_snippet({
        \ 'word' : 'foo{', 'abbr' : 'foo{piyo}',
        \ 'menu' : '', 'info' : ''
        \ }), '${1:#:piyo}}${2}')

  call s:assert.equals(neosnippet#parser#_get_completed_snippet({
        \ 'word' : 'Dictionary(', 'abbr' : 'Dictionary<Key, Value>(foo)',
        \ 'menu' : '', 'info' : ''
        \ }), '<${1:#:Key}, ${2:#:Value}>${3:#:foo})${4}')

  call s:assert.equals(neosnippet#parser#_get_completed_snippet({
        \ 'word' : 'Dictionary(', 'abbr' : 'Dictionary<Key, Value> (foo)',
        \ 'menu' : '', 'info' : ''
        \ }), '${1:#:foo})${2}')
endfunction

