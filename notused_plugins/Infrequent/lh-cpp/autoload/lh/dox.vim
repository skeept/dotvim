"=============================================================================
" File:         autoload/lh/cpp/dox.vim                           {{{1
" Author:       Luc Hermitte <EMAIL:hermitte {at} free {dot} fr>
" 		<URL:http://github.com/LucHermitte/lh-cpp>
" License:      GPLv3 with exceptions
"               <URL:http://code.google.com/p/lh-vim/wiki/License>
" Version:	2.2.0
" Created:      22nd Feb 2011
" Last Update:  21st Dec 2015
"------------------------------------------------------------------------
" Description:
"       Set of functions to generate Doxygen tags in respect of the current
"       style.
" }}}1
"=============================================================================

let s:cpo_save=&cpo
set cpo&vim
"------------------------------------------------------------------------
" ## Misc Functions     {{{1
" # Version {{{2
let s:k_version = 200
function! lh#dox#_version()
  return s:k_version
endfunction

" # Debug   {{{2
let s:verbose = 0
function! lh#dox#verbose(...)
  if a:0 > 0 | let s:verbose = a:1 | endif
  return s:verbose
endfunction

function! s:Verbose(expr)
  if s:verbose
    echomsg a:expr
  endif
endfunction

function! lh#dox#debug(expr)
  return eval(a:expr)
endfunction


"------------------------------------------------------------------------
" ## Exported functions {{{1

" # doxygen comment generation {{{2
" Function: lh#dox#comment_leading_char() {{{3
function! lh#dox#comment_leading_char()
  return lh#dev#option#get('dox_CommentLeadingChar', &ft, '*', 'bg')
endfunction

" Function: lh#dox#tag_leading_char() {{{3
function! lh#dox#tag_leading_char()
  return lh#dev#option#get('dox_TagLeadingChar', &ft,'@', 'bg')
  " alternative: \
endfunction

" Function: lh#dox#tag(tag) {{{3
function! lh#dox#tag(tag)
  return lh#dox#tag_leading_char().a:tag
endfunction

" Function: lh#dox#semantics(text) {{{3
" TODO: s/text/list
function! lh#dox#semantics(text)
  return '<p><b>Semantics</b><br>'
endfunction

" Function: lh#dox#throw([text]) {{{3
function! lh#dox#throw(...)
  let throw = lh#dev#option#get('dox_throw', &ft, 'throw ', 'bg')
  let res = ''
  if !empty(throw)
    let res .= lh#dox#tag(throw)
    if a:0==0 || empty(a:1)
      let res = lh#marker#txt(res)
    else
      let res .= a:1
    endif
  else
    if a:0!=0 && ! empty(a:1)
      let res .= lh#dox#tag('throw ') . a:1
    endif
  endif
  return res
endfunction

" Function: lh#dox#ingroup([text]) {{{3
function! lh#dox#ingroup(...)
  let text = a:0==0 || empty(a:1) ? lh#marker#txt('group') : a:1
  let ingroup = lh#dev#option#get('dox_ingroup', &ft, 0, 'bg')
  if     ingroup =~? '^y\%[es]$\|^a\%[lways]$\|1'
    let res =  lh#dox#tag('ingroup ').text
  elseif ingroup =~? '^no$\|^n\%[ever]$\|0'
    let res =  ''
  elseif type(ingroup) == type('')
    let res = lh#dox#tag('ingroup ').ingroup
  else " maybe
    let res = lh#marker#txt(lh#dox#tag('ingroup ').(a:0==0?'':a:1))
  endif
  return res
endfunction

" Function: lh#dox#brief([text]) {{{3
function! lh#dox#brief(...)
  let text = a:0==0 || empty(a:1) ? lh#marker#txt('brief explanation').'.' : a:1
  if text[-1:] != '.' |let text .= '.' | endif
  let brief = lh#dev#option#get('dox_brief', &ft, 'short', 'bg')
  if     brief =~? '^y\%[es]$\|^a\%[lways]$\|1'
    let res =  lh#dox#tag('brief ').text
  elseif brief =~? '^no$\|^n\%[ever]$\|0\|^s\%[hort]$'
    let res =  text
  else " maybe
    let res =  lh#marker#txt(lh#dox#tag('brief ')).text
  endif
  return res
endfunction

" Function: lh#dox#param({dir,name,text) {{{3
function! lh#dox#param(param)
  let res = lh#dox#tag("param")
  if type(a:param) == type({})
    if has_key(a:param, "dir")
      let dir = a:param.dir
      if stridx(dir, '[') == -1
        let dir = '[' . dir .']'
      endif
      let res .= dir
    endif
    if has_key(a:param, "name") | let res .= " ".(a:param.name) | endif
    let res .= ' '. a:param.text
  else
    let res .= ' ' . a:param
  endif
  return res
endfunction

" Function: lh#dox#author() {{{3
function! lh#dox#author(...)
  let author_tag = lh#dev#option#get('dox_author_tag', &ft, 'author', 'g')
  let tag        = lh#dox#tag(author_tag) .  ' '

  let author = lh#dev#option#get('dox_author', &ft, a:0 && !empty(a:1) ? (a:1) : '', 'bg')
  if author =~ '^g:.*'
    if exists(author)
      return tag . {author}
      " return tag . {author} . lh#marker#txt('')
    else
      return tag . lh#marker#txt('author-name')
    endif
  elseif strlen(author) == 0
    return tag . lh#marker#txt('author-name')
  else
    return tag . author
    " return tag . author . lh#marker#txt('')
  endif
endfunction

" Function: lh#dox#since(...) {{{3
function! lh#dox#since(...)
  let tag  = lh#dox#tag('since')
  let ver  = lh#option#get('ProjectVersion', a:0==0 ? lh#marker#txt('1.0') : a:1)
  return tag . ' Version '.ver
endfunction

"------------------------------------------------------------------------
" # fn_comments object {{{2
" Function: lh#dox#_parameter_direction(type) {{{3
function! lh#dox#_parameter_direction(type) abort
  " todo: enhance the heuristics.
  " First strip any namespace/scope stuff

  " Support for boost smart pointers, custom types, ...
  if     a:type =~ '\%(\<const\(expr\)\=\>\s*[&*]\=\|const_\%(reference\|iterator\)\|&&\|\%(unique\|auto\)_ptr\)\s*$'
        \ . '\|^\s*\(\<const\(expr\)\=\>\)'
    return '[in]'
  elseif a:type =~ '\%([&*]\|reference\|pointer\|iterator\|_ptr\)\s*$'
    return '[' . lh#marker#txt('in,') . 'out]'
  elseif lh#dev#cpp#types#IsBaseType(a:type, 0)
    return '[in]'
  else
    return lh#marker#txt('[in]')
  endif
endfunction

" Function: lh#dox#new_function(brief) {{{3
function! lh#dox#new_function(brief) abort
  let res = {'brief': a:brief, 'param': [], 'pre': []}
  function! res.add_param(param) " {{{4
    " dict with: "dir", "name", "text"
    " if no "dir", but a "type" => compute "dir"
    let param = a:param
    let name = lh#dev#naming#param(param.name)
    if !has_key(param, 'dir')
      let param.dir = lh#dox#_parameter_direction(param.type)
    endif
    if !has_key(param, 'text')
      let param.text = lh#marker#txt(name.'-explanations')
    endif
    if has_key(param, 'type') && lh#dev#cpp#types#IsPointer(param.type)
      let self.pre += [ '`'.name.' != NULL`' . lh#marker#txt()]
    endif
    let self.param += [ param ]
  endfunction

  " }}}4
  return res
endfunction
"------------------------------------------------------------------------
" ## Internal functions {{{1

"------------------------------------------------------------------------
let &cpo=s:cpo_save
"=============================================================================
" vim600: set fdm=marker:
