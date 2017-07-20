" SnippetCompleteSnipMate.vim: Integrate snipMate snippets into SnippetComplete plugin.
"
" DEPENDENCIES:
"   - GetSnipsInCurrentScope() function grafted into plugin/snipMate.vim
"
" Copyright: (C) 2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.003	17-Oct-2012	Remove truncation of snippet expansion, this is
"				now handled by the SnippetComplete plugin
"				(version 2.10) itself.
"	002	23-May-2012	Handle multi-snippets, as are defined for HTML.
"	001	04-May-2012	file creation
let s:save_cpo = &cpo
set cpo&vim

function! s:RenderMultiSnippet( name, snippet )
    return printf("-- %s --\n%s\n", a:name, a:snippet)
endfunction
function! s:SnippetToMatch( trigger, snippet )
    if type(a:snippet) == type([])
	let l:snippet = a:snippet[0][1] " multi-snippet := [[multi1, snippet1], ...]
	let l:snipMateSigil = len(a:snippet) . '*'
    else
	let l:snippet = a:snippet
	let l:snipMateSigil = ' %'
    endif

    let l:lineNum = len(split(l:snippet, "\n", 1))
    let l:prefix = (l:lineNum == 1 ? printf('%s  ', l:snipMateSigil) : printf('%s%d ', l:snipMateSigil, l:lineNum))
    let l:matchObject = { 'word': a:trigger, 'menu': l:prefix . l:snippet }

    let l:matchObject.info = (type(a:snippet) == type([]) ?
    \   join(map(copy(a:snippet), 's:RenderMultiSnippet(v:val[0], v:val[1])'), "\n") :
    \   l:snippet
    \)

    return l:matchObject
endfunction

function! SnippetCompleteSnipMate#Generator()
    let l:snippets = GetSnipsInCurrentScope()
    return map(keys(l:snippets), 's:SnippetToMatch(v:val, l:snippets[v:val])')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
