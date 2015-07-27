" SnippetComplete/Abbreviations.vim: Retrieval of defined Vim abbreviations.
"
" DEPENDENCIES:
"
" Copyright: (C) 2012-2014 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   2.20.002	14-Jan-2014	Support getting buffer-local, global, or both
"				(the old behavior) abbreviations from
"				SnippetComplete#Abbreviations#RetrieveAbbreviations().
"				Add SnippetComplete#Abbreviations#LocalFullid()
"				etc. generator functions to support new
"				buffer-local-only mappings.
"   2.00.001	03-May-2012	file creation
let s:save_cpo = &cpo
set cpo&vim

let s:filterExpr = {
\   'none': '^\S\+$'
\}
function! SnippetComplete#Abbreviations#RetrieveAbbreviations( which )
    let l:abbreviations = ''
    let l:save_verbose = &verbose
    try
	set verbose=0	" Do not include any "Last set from" info.
	redir => l:abbreviations
	execute 'silent iabbrev' (a:which ==# 'local' ? '<buffer>' : '')
    finally
	redir END
	let &verbose = l:save_verbose
    endtry

    let l:globalMatches = []
    let l:localMatches = []
    try
	for l:abb in split(l:abbreviations, "\n")
	    let [l:lhs, l:flags, l:rhs] = matchlist(l:abb, '^\S\s\+\(\S\+\)\s\+\([* ][@ ]\)\(.*\)$')[1:3]
	    let l:match = { 'word': l:lhs, 'menu': l:rhs }
	    call add((l:flags =~# '@' ? l:localMatches : l:globalMatches), l:match)
	endfor
    catch /^Vim\%((\a\+)\)\=:E688/	" catch error E688: More targets than List items
	" When there are no abbreviations, Vim returns "No abbreviation found".
    endtry

    if a:which ==# 'all'
	" A buffer-local abbreviation overrides an existing global abbreviation
	" with the same {lhs}.
	for l:localWord in map(copy(l:localMatches), 'v:val.word')
	    call filter(l:globalMatches, 'v:val.word !=# ' . string(l:localWord))
	endfor
	return l:globalMatches + l:localMatches
    elseif a:which ==# 'global'
	return l:globalMatches
    elseif a:which ==# 'local'
	return l:localMatches
    else
	throw 'ASSERT: Unknown argument: ' . string(a:which)
    endif
endfunction

" All three different types of abbreviations are backed by the same query of
" defined abbreviations. As a balance between memory and performance, let's
" cache the abbreviations for the current buffer, one for each scope of local /
" global / all, so that all three queries of the different abbreviation types
" can be handled with a single lookup, and subsequent lookups in the same
" buffer, too. As there can be buffer-local abbreviations, the cache has to be
" re-generated when the buffer changes (expect for the global one, but let's
" skip that special case; there's no default mapping for that, anyway).
let s:cache = {
\   'local' : { 'bufnr': 0, 'abbreviations': [] },
\   'global': { 'bufnr': 0, 'abbreviations': [] },
\   'all'   : { 'bufnr': 0, 'abbreviations': [] },
\}
function! s:GetAbbreviations( which, pattern )
    let l:cache = s:cache[a:which]
    if empty(l:cache.abbreviations) || l:cache.bufnr != bufnr('')
	let l:cache.abbreviations = SnippetComplete#Abbreviations#RetrieveAbbreviations(a:which)
	let l:cache.bufnr = bufnr('')
    endif
    return filter(copy(l:cache.abbreviations), 'v:val.word =~# ' . string(a:pattern))
endfunction


function! s:ForFullid( which )
    return s:GetAbbreviations(a:which, '^\k\+$')
endfunction
function! s:ForEndid( which )
    return s:GetAbbreviations(a:which, '^\%(\k\@\!\S\)\+\k$')
endfunction
function! s:ForNonid( which )
    return s:GetAbbreviations(a:which, '^\S*\%(\k\@!\S\)$')
endfunction

function! SnippetComplete#Abbreviations#fullid()
    return s:ForFullid('all')
endfunction
function! SnippetComplete#Abbreviations#endid()
    return s:ForEndid('all')
endfunction
function! SnippetComplete#Abbreviations#nonid()
    return s:ForNonid('all')
endfunction

function! SnippetComplete#Abbreviations#LocalFullid()
    return s:ForFullid('local')
endfunction
function! SnippetComplete#Abbreviations#LocalEndid()
    return s:ForEndid('local')
endfunction
function! SnippetComplete#Abbreviations#LocalNonid()
    return s:ForNonid('local')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
