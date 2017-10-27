"=============================================================================
" File    : autoload/unite/sources/outline/defaults/rust.vim
" Author  : OliverUv <oliver@uvman.se>
" Updated : 2017-10-26
"
" Licensed under the MIT license:
" http://www.opensource.org/licenses/mit-license.php
"
"=============================================================================

" Default outline info for Rust
" Version: 0.0.1

" Assumes that you have added these lines to your ctags configuration:
" https://github.com/rust-lang/rust/blob/master/src/etc/ctags.rust
" (Tested with commit aede1c73bd2e5540bb62216bff23362e9d8b55a9)

function! unite#sources#outline#defaults#rust#outline_info() abort
  return s:outline_info
endfunction

let s:Ctags = unite#sources#outline#import('Ctags')
let s:Util  = unite#sources#outline#import('Util')

"-----------------------------------------------------------------------------
" Outline Info

let s:outline_info = {
      \ 'highlight_rules': [
      \   { 'name'   : 'macro',
      \     'pattern': '/\S\+\ze : macros/' },
      \   { 'name'   : 'id',
      \     'pattern': '/.\+\ze : impls/' },
      \   { 'name'   : 'level_3',
      \     'pattern': '/\S\+\ze : trait/' },
      \   { 'name'   : 'type',
      \     'pattern': '/\S\+\ze : \%(types\|structure names\)/' },
      \   { 'name'   : 'function',
      \     'pattern': '/\S\+\ze : function/' },
      \   { 'name'   : 'level_4',
      \     'pattern': '/\S\+\ze : const/' },
      \ ],
      \}

function! s:outline_info.extract_headings(context) abort
  return s:Ctags.extract_headings(a:context)
endfunction
