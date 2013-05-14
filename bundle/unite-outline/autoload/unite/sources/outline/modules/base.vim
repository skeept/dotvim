"=============================================================================
" File    : autoload/unite/source/outline/modules/base.vim
" Author  : h1mesuke <himesuke@gmail.com>
" Updated : 2012-01-11
" Version : 0.5.1
" License : MIT license {{{
"
"   Permission is hereby granted, free of charge, to any person obtaining
"   a copy of this software and associated documentation files (the
"   "Software"), to deal in the Software without restriction, including
"   without limitation the rights to use, copy, modify, merge, publish,
"   distribute, sublicense, and/or sell copies of the Software, and to
"   permit persons to whom the Software is furnished to do so, subject to
"   the following conditions:
"   
"   The above copyright notice and this permission notice shall be included
"   in all copies or substantial portions of the Software.
"   
"   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"   CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"   TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! unite#sources#outline#modules#base#new(name, sid)
  let module = copy(s:Module)
  let module.__name__ = a:name
  let module.__prefix__ = a:sid . a:name . '_'
  " => <SNR>10_Fizz_
  return module
endfunction

"-----------------------------------------------------------------------------

function! s:get_SID()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_')
endfunction
let s:SID = s:get_SID()
delfunction s:get_SID

let s:Module = {}

function! s:Module_bind(func_name) dict
  let self[a:func_name] = function(self.__prefix__  . a:func_name)
endfunction
let s:Module.__bind__ = function(s:SID . 'Module_bind')
let s:Module.function = s:Module.__bind__ | " syntax sugar

let &cpo = s:save_cpo
unlet s:save_cpo
