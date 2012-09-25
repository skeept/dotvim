" SnippetComplete.vim: Insert mode completion that completes defined
" abbreviations and snippets.
"
" DEPENDENCIES:
"
" Copyright: (C) 2010-2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   2.00.003	05-May-2012	Rewrite s:RegistryTypeCompare() so that it
"				doesn't need to access
"				g:SnippetComplete_Registry.
"				Allow to pass in types instead of accessing
"				g:SnippetComplete_Registry.
"   2.00.002	03-May-2012	Generalize for completing other types of
"				snippets (e.g. from snipMate):
"				Introduce g:SnippetComplete_Registry for snippet
"				types.
"				Move resolution of Vim abbreviations to
"				SnippetComplete/Abbreviations.vim autoload
"				script.
"   1.01.001	25-Sep-2010	Moved functions from plugin to separate autoload
"				script.
"				The autocmd uses a global variable so that it
"				can pass the
"				g:SnippetComplete_LastInsertStartPosition to the
"				autoload script's functions without loading the
"				autoload script on the first InsertEnter.
"			    	file creation
let s:save_cpo = &cpo
set cpo&vim

function! s:TypeCompare( c1, c2 )
    let l:p1 = a:c1[1].priority
    let l:p2 = a:c2[1].priority
    return (l:p1 ==# l:p2 ? 0 : l:p1 ># l:p2 ? 1 : -1)
endfunction
function! s:GetSortedTypes( types )
    return map(sort(items(a:types), 's:TypeCompare'), 'v:val[0]')
endfunction
function! s:GetSnippetPatternsPerType( types )
    return map(
    \   s:GetSortedTypes(a:types),
    \	'[v:val, a:types[v:val].pattern]'
    \)
endfunction
function! s:GetSnippets( types, type )
    if a:type ==# 'none'
	" There is no base, so the snippet type can not be determined. Ask all
	" registered types for their snippets.
	let l:snippets = []
	for l:type in s:GetSortedTypes(a:types)
	    let l:snippets += call(a:types[l:type].generator, [])
	endfor
	return l:snippets
    else
	return call(a:types[a:type].generator, [])
    endif
endfunction

function! s:DetermineBaseCol( types )
"*******************************************************************************
"* PURPOSE:
"   Check the text before the cursor to determine possible base columns where
"   snippets of the various types may start.
"* ASSUMPTIONS / PRECONDITIONS:
"   None.
"* EFFECTS / POSTCONDITIONS:
"   None.
"* INPUTS:
"   None.
"* RETURN VALUES:
"   List of possible base columns, more stringently defined and shorter snippet
"   types come first. Each element consists of a [type, baseCol] tuple.
"*******************************************************************************
    " Locate possible start positions of the snippet, searching for full-id,
    " end-id and non-id abbreviations, and whatever else was registered.

    let l:insertedTextExpr = ''
    if line('.') == g:SnippetComplete_LastInsertStartPosition[1]
	" If the insertion started in the current line, only consider characters
	" that were inserted by the last insertion for Vim abbreviations,
	" because they only apply then. For this, we match with the stored start
	" position of the current insert mode, if insertion started in the
	" current line. The matched text must definitely be somewhere after it,
	" but need not start with the start-of-insert position.
	let l:insertedTextExpr = '\%(\%' . g:SnippetComplete_LastInsertStartPosition[2] . 'c.\)\?\%>' . g:SnippetComplete_LastInsertStartPosition[2] . 'c.*\%#\&'
    endif

    let l:baseColumns = []
    for [l:type, l:pattern] in s:GetSnippetPatternsPerType(a:types)
	let l:needsInsertionAtOnce = get(a:types[l:type], 'needsInsertionAtOnce', 0)
	let l:startCol = searchpos(
	\   (l:needsInsertionAtOnce ? l:insertedTextExpr : '') .
	\   '\%(' . l:pattern . '\)\%#',
	\   'bn', line('.'))[1]
	if l:startCol != 0
	    call add(l:baseColumns, [l:type, l:startCol])
	endif
    endfor
    if empty(l:baseColumns)
	call add(l:baseColumns, ['none', col('.')])
    endif
    return l:baseColumns
endfunction

function! s:GetBase( baseCol, cursorCol )
    return strpart(getline('.'), a:baseCol - 1, (a:cursorCol - a:baseCol))
endfunction
function! s:MatchSnippets( snippets, baseCol )
    let l:base = s:GetBase(a:baseCol, col('.'))
"****D echomsg '****' a:baseCol l:base
    return (empty(l:base) ?
    \   a:snippets :
    \   filter(copy(a:snippets), 'strpart(v:val.word, 0, ' . len(l:base) . ') ==# ' . string(l:base))
    \)
endfunction
function! s:GetSnippetCompletions( types )
    let l:baseColumns = s:DetermineBaseCol(a:types)
"****D echomsg '####' string(l:baseColumns)
    let l:completionsByBaseCol = {}
    for [l:type, l:baseCol] in l:baseColumns
	let l:snippets = s:GetSnippets(a:types, l:type)
	let l:matches = s:MatchSnippets(l:snippets, l:baseCol)
"****D echomsg '****' l:type string(l:matches)
	if ! empty(l:matches)
	    let l:completions = get(l:completionsByBaseCol, l:baseCol, [])
	    let l:completions += l:matches
	    let l:completionsByBaseCol[l:baseCol] = l:completions
	endif
    endfor
"****D echomsg '****' string(l:completionsByBaseCol)
    return l:completionsByBaseCol
endfunction
function! s:CompletionCompare( c1, c2 )
    return (a:c1.word ==# a:c2.word ? 0 : a:c1.word ># a:c2.word ? 1 : -1)
endfunction

function! s:SetupCmdlineForBaseMessage()
    " The message about multiple bases should appear in the same way as Vim's
    " built-in "match m of n" completion mode messages. Unfortunately, an active
    " 'showmode' setting may prevent the user from seeing the message in a
    " one-line command line. Thus, we temporarily disable the 'showmode'
    " setting.
    if &showmode && &cmdheight == 1
	set noshowmode

	" Use a single-use autocmd to restore the 'showmode' setting when the
	" cursor is moved (this already happens when a next match is selected,
	" but then the "match m of n" message takes over) or insert mode is
	" left.
	augroup SnippetCompleteTemporaryNoShowMode
	    autocmd!
	    autocmd CursorMovedI,InsertLeave * set showmode | autocmd! SnippetCompleteTemporaryNoShowMode
	augroup END
    endif
endfunction
function! s:ShowMultipleBasesMessage( nextIdx, baseNum, nextBase )
    call s:SetupCmdlineForBaseMessage()

    echohl ModeMsg
    echo '-- Snippet completion (^X]^N^P) '
    echohl Question
    echon printf('base %d of %d; next: ', a:nextIdx, a:baseNum)
    echohl None
    echon a:nextBase
endfunction
function! s:RecordPosition()
    " The position record consists of the current cursor position, the buffer,
    " window and tab page number and the buffer's current change state.
    " As soon as you make an edit, move to another buffer or even the same
    " buffer in another tab page or window (or as a minor side effect just close
    " a window above the current), the position changes.
    return getpos('.') + [bufnr(''), winnr(), tabpagenr()]
endfunction
let s:lastCompletionsByBaseCol = {}
let s:nextBaseIdx = 0
let s:initialCompletePosition = []
let s:lastCompleteEndPosition = []
function! SnippetComplete#SnippetComplete( types )
"****D echomsg '****' string(s:RecordPosition())
    let l:baseNum = len(keys(s:lastCompletionsByBaseCol))
    if s:initialCompletePosition == s:RecordPosition() && l:baseNum > 1
	" The Snippet complete mapping is being repeatedly executed on the same
	" position, and we have multiple completion bases. Use the next/first
	" base from the cached completions.
	let l:baseIdx = s:nextBaseIdx
    else
	" This is a new completion.
	let s:lastCompletionsByBaseCol = s:GetSnippetCompletions(a:types)

	let l:baseIdx = 0
	let l:baseNum = len(keys(s:lastCompletionsByBaseCol))
	let s:initialCompletePosition = s:RecordPosition()
	let s:initialCompletionCol = col('.')	" Note: The column is also contained in s:initialCompletePosition, but a separate variable is more expressive.
    endif

    " Multiple bases are presented from shortest base (i.e. largest base column)
    " to longest base. Full-id abbreviations have the most restrictive pattern
    " and thus always generate the shortest bases; end-id and non-id
    " abbreviations accept more character classes and can result in longer
    " bases.
    let l:baseColumns = reverse(sort(keys(s:lastCompletionsByBaseCol)))

    if l:baseNum > 0
	" Show the completions for the current base.
	call complete(l:baseColumns[l:baseIdx], sort(s:lastCompletionsByBaseCol[l:baseColumns[l:baseIdx]], 's:CompletionCompare'))
	let s:lastCompleteEndPosition = s:RecordPosition()

	if l:baseNum > 1
	    " There are multiple bases; make subsequent invocations cycle
	    " through them.
	    let s:nextBaseIdx = (l:baseIdx < l:baseNum - 1 ? l:baseIdx + 1 : 0)

	    " Note: Setting the completions typically inserts the first match
	    " and thus advances the cursor. We need the initial cursor position
	    " to resolve the next base(s) only up to what has actually been
	    " entered.
	    let l:nextBase = s:GetBase(l:baseColumns[s:nextBaseIdx], s:initialCompletionCol)

	    " Indicate to the user that additional bases exist, and offer a
	    " preview of the next one.
	    call s:ShowMultipleBasesMessage(l:baseIdx + 1, l:baseNum, l:nextBase)
	endif
    endif

    return ''
endfunction
function! SnippetComplete#PreSnippetCompleteExpr()
    " To be able to detect a repeat completion, we need to return the cursor to
    " the initial completion position, but setting the completions typically
    " inserts the first match and thus advances the cursor. That resulting
    " completion end position (after the completions are shown) is recorded in
    " s:lastCompleteEndPosition. This position can change if the user selects
    " another completion match (via CTRL-N) that has a different length, and
    " only then re-triggers the completion for the next abbreviation base.
    " We can still handle this situation by checking for an active popup menu;
    " that means that (presumably, could be from another completion type)
    " another abbreviation completion had been triggered.
    " To return the cursor to the inital completion position, CTRL-E is used to
    " end the completion; this may only not work when 'completeopt' contains
    " "longest" (Vim returns to what was typed or longest common string).
    let l:baseNum = len(keys(s:lastCompletionsByBaseCol))
    return (pumvisible() || s:lastCompleteEndPosition == s:RecordPosition() && l:baseNum > 1 ? "\<C-e>" : '')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
