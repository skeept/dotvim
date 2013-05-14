" SnippetComplete/Abbreviations.vim: Retrieval of defined Vim abbreviations.
"
" DEPENDENCIES:
"
" Copyright: (C) 2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   2.00.001	03-May-2012	file creation

let s:filterExpr = {
\   'none': '^\S\+$'
\}
function! SnippetComplete#Abbreviations#RetrieveAbbreviations()
    let l:abbreviations = ''
    let l:save_verbose = &verbose
    try
	set verbose=0	" Do not include any "Last set from" info.
	redir => l:abbreviations
	silent iabbrev
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

    " A buffer-local abbreviation overrides an existing global abbreviation with
    " the same {lhs}.
    for l:localWord in map(copy(l:localMatches), 'v:val.word')
	call filter(l:globalMatches, 'v:val.word !=# ' . string(l:localWord))
    endfor
    return l:globalMatches + l:localMatches
endfunction

" All three different types of abbreviations are backed by the same query of
" defined abbreviations. As a balance between memory and performance, let's
" cache the abbreviations for the current buffer, so that all three queries of
" the different abbreviation types can be handled with a single lookup, and
" subsequent lookups in the same buffer, too. As there can be buffer-local
" abbreviations, the cache has to be re-generated when the buffer changes.
let s:bufnr = 0
let s:cache = []
function! s:GetAbbreviations( pattern )
    if empty(s:cache) || s:bufnr != bufnr('')
	let s:cache = SnippetComplete#Abbreviations#RetrieveAbbreviations()
	let s:bufnr = bufnr('')
    endif
    return filter(copy(s:cache), 'v:val.word =~# ' . string(a:pattern))
endfunction

function! SnippetComplete#Abbreviations#fullid()
    return s:GetAbbreviations('^\k\+$')
endfunction
function! SnippetComplete#Abbreviations#endid()
    return s:GetAbbreviations('^\%(\k\@\!\S\)\+\k$')
endfunction
function! SnippetComplete#Abbreviations#nonid()
    return s:GetAbbreviations('^\S*\%(\k\@!\S\)$')
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
