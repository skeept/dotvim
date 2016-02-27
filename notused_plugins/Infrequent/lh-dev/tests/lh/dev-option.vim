"=============================================================================
" $Id$
" File:		tests/lh/dev-option.vim                           {{{1
" Author:	Luc Hermitte <EMAIL:hermitte {at} free {dot} fr>
"		<URL:http://hermitte.free.fr/vim/>
" Version:	1.1.5
" Created:	05th Oct 2009
" Last Update:	$Date$
"------------------------------------------------------------------------
" Description:
"       Test lh#dev#options#*() functions
"       Run the test with :UTRun %
" }}}1
"=============================================================================

UTSuite [lh-dev-lib] Testing lh#dev#option functions

runtime autoload/lh/dev/option.vim
let s:cpo_save=&cpo
set cpo&vim
"------------------------------------------------------------------------
function! s:Test_global()
  let cleanup = lh#on#exit()
        \.restore('g:foo')
        \.restore('b:foo')
        \.restore('g:FT_foo')
        \.restore('b:FT_foo')
  try
    let g:foo = 42
    Assert lh#dev#option#get('foo', 'FT', 12) == 42
    Assert lh#dev#option#get('bar', 'FT', 12) == 12

    let b:foo = 43
    Assert lh#dev#option#get('foo', 'FT', 12) == 43

    let g:FT_foo = 44
    Assert lh#dev#option#get('foo', 'FT', 12) == 44

    let b:FT_foo = 45
    Assert lh#dev#option#get('foo', 'FT', 12) == 45
  finally
    call cleanup.finalize()
  endtry
endfunction

function! s:Test_local()
  let cleanup = lh#on#exit()
        \.restore('b:foo')
        \.restore('g:FT_foo')
        \.restore('b:FT_foo')
  try
    let b:foo = 43
    Assert lh#dev#option#get('foo', 'FT', 12) == 43

    let g:FT_foo = 44
    Assert lh#dev#option#get('foo', 'FT', 12) == 44

    let b:FT_foo = 45
    Assert lh#dev#option#get('foo', 'FT', 12) == 45
  finally
    call cleanup.finalize()
  endtry
endfunction

function! s:Test_FT_global()

  let cleanup = lh#on#exit()
        \.restore('g:FT_foo')
        \.restore('b:FT_foo')
  try
    let g:FT_foo = 44
    Assert lh#dev#option#get('foo', 'FT', 12) == 44

    let b:FT_foo = 45
    Assert lh#dev#option#get('foo', 'FT', 12) == 45
  finally
    call cleanup.finalize()
  endtry
endfunction

" Function: s:Test_inheritedFT() {{{3
function! s:Test_inheritedFT()
  Assert lh#dev#option#inherited_filetypes('zz') == ['zz']
  Assert lh#dev#option#inherited_filetypes('c') == ['c']
  Assert lh#dev#option#inherited_filetypes('cpp') == ['cpp', 'c']

  let cleanup = lh#on#exit()
        \.restore('g:foo1_inherits')
        \.restore('g:foo2_inherits')
        \.restore('b:foo3_inherits')
  try
    let g:foo1_inherits = 'foo'
    let g:foo2_inherits = 'foo1'
    let b:foo3_inherits = 'foo1,foo'
    AssertTxt (lh#dev#option#inherited_filetypes('foo') == ['foo'],
          \ 'foo inherits from '.string(lh#dev#option#inherited_filetypes('foo')))
    AssertTxt (lh#dev#option#inherited_filetypes('foo1') == ['foo1', 'foo'],
          \ 'foo1 inherits from '.string(lh#dev#option#inherited_filetypes('foo1')))
    AssertTxt (lh#dev#option#inherited_filetypes('foo2') == ['foo2', 'foo1', 'foo'],
          \ 'foo2 inherits from '.string(lh#dev#option#inherited_filetypes('foo2')))
    AssertTxt (lh#dev#option#inherited_filetypes('foo3') == ['foo3', 'foo1', 'foo', 'foo'],
          \ 'foo3 inherits from '.string(lh#dev#option#inherited_filetypes('foo3')))
  finally
    call cleanup.finalize()
  endtry
endfunction
"------------------------------------------------------------------------
let &cpo=s:cpo_save
"=============================================================================
" vim600: set fdm=marker:
