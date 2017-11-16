"=============================================================================
" File: autoload/unite/sources/outline/defaults/elm.vim
" Author: aiya000 <aiya000.develop@gmail.com>
" Updated: 2017-11-15
" Version: 0.1.0
" Referred To:
"     - https://github.com/kbsymanz/ctags-elm
"
" Licensed under the MIT license:
" http://www.opensource.org/licenses/mit-license.php
"
" MIT License {{{
" 
" Copyright (c) 2016 Kurt Symanzik
" 
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
" 
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.
" }}}
"
"=============================================================================

function! unite#sources#outline#defaults#elm#outline_info() abort
  return s:outline_info
endfunction

let s:Ctags = unite#sources#outline#import('Ctags')

let s:outline_info = {}

function! s:outline_info.extract_headings(context) abort
  return s:Ctags.extract_headings(a:context)
endfunction
