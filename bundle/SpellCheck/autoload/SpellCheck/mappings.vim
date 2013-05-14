" SpellCheck/mappings.vim: Special quickfix window mappings.
"
" DEPENDENCIES:
"   - SpellCheck.vim autoload script
"   - ingocollections.vim autoload script
"
" Copyright: (C) 2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.13.004	01-May-2012	ENH: Apply undo to the target buffer to allow a
"				quick revert of a spell correction.
"   1.11.003	30-Apr-2012	ENH: Capture corrected text and include in
"				quickfix status message.
"   1.10.002	30-Apr-2012	Add quickfix mappings for word list management.
"				Add indication of spell command's result as a
"				status message appended to the quickfix list
"				entry.
"				Avoid staying in target buffer by temporarily
"				reducing 'updatetime'.
"   1.10.001	29-Apr-2012	file creation

function! SpellCheck#mappings#SpellSuggestWrapper( ... )
    let l:addendum = ''
    let l:followUpCommands = copy(a:000)

    if ! &l:spell
	if SpellCheck#CheckEnabledSpelling()
	    call insert(l:followUpCommands, 'setlocal nospell', 0)
	else
	    setlocal nospell    " This might have been set by SpellCheck#CheckEnabledSpelling().
	    return ''
	endif
    endif

    if ! empty(l:followUpCommands)
	" If no [count] is given, the z= command queries the spell suggestion.
	" Unfortunately, the querying is disturbed by any following typeahead,
	" even when submitted via feedkeys(). To work around this, we set up a
	" temporary autocmd that fires once at the next possible point in time,
	" then deletes itself.
	if v:count
	    " No querying, so we can simply append the command to undo the
	    " temporary enabling of spelling.
	    let l:addendum = ':' . join(l:followUpCommands, '|') . "\<CR>"
	else
	    " Turn off 'spell' at the next possible event:
	    " BufLeave: Before another buffer is loaded in the current window.
	    " WinLeave: Before the window is left.
	    " InsertEnter: Editing is started (or resumed from an insert mode
	    "              <C-O>{cmd}).
	    " CursorHold: Nothing happened after the {cmd}.
	    "             ... and reduce the time period by temporarily reducing
	    "             'updatetime'. Otherwise, the cursor may stay in the
	    "             target buffer, and suddenly move back to the quickfix
	    "             window after many seconds, or immediately after the
	    "             user moves the cursor.
	    let s:save_updatetime = &updatetime
	    set updatetime=100
	    " CursorMoved: The user jumped around in the current buffer.
	    augroup SpellSuggestOff
		autocmd!
		execute 'autocmd BufLeave,WinLeave,InsertEnter,CursorHold,CursorMoved <buffer> let &updatetime = s:save_updatetime | execute "autocmd! SpellSuggestOff" | ' . join(l:followUpCommands, '|')
	    augroup END
	endif
    endif

    return 'z=' . l:addendum
endfunction
function! SpellCheck#mappings#SpellRepeat()
    try
	" Always print the number of repeated spell corrections, even if there
	" is only one.
	let l:save_report = &report
	set report=0

	spellrepall
    catch /^Vim\%((\a\+)\)\=:E75[23]/  " E752: No previous spell replacement; E753: Not found: ...
	" Silently ignore the fact that the misspelled word didn't occur
	" elsewhere.
    finally
	let &report = l:save_report
    endtry
endfunction


function! s:SetCount()
    let s:count = (v:count ? v:count : '')
endfunction
function! s:GetCountAndRecordBefore()
    let s:beforeTick = b:changedtick
    let s:beforeLineContent = getline('.')
    return s:count
endfunction
function! s:RecordAfter()
    let s:afterTick = b:changedtick
    let s:afterLineContent = getline('.')
endfunction
function! s:IsChangeRecorded()
    return (s:afterTick > s:beforeTick)
endfunction
function! s:InsertMessage( entry, statusMessage )
    let l:entry = a:entry
    if a:statusMessage =~# '\<undo '
	let l:entry = substitute(l:entry, '\C\V' . printf(' [%s]\$', escape(substitute(a:statusMessage, 'undo ', '', ''), '\')), '', '')
    endif
    if l:entry ==# a:entry
	let l:entry .= printf(' [%s]', a:statusMessage)
    endif

    return l:entry
endfunction
function! s:QuickfixSetline( lnum, text )
    if &l:buftype !=# 'quickfix'
	" Oops, the return to the quickfix window went wrong.
	return
    endif

    let l:save_modified = &l:modified
    let l:save_modifiable = &l:modifiable
    setlocal modifiable
    call setline(a:lnum, a:text)
    let &l:modifiable = l:save_modifiable   " Keep the normally immutable state of the quickfix list.
    let &l:modified = l:save_modified   " We don't want Vim prompting for saving of the changes, and can't just add 'buftype+=nofile'.
endfunction
function! s:QuickfixInsertMessage( lnum, statusMessage )
    call s:QuickfixSetline(a:lnum, s:InsertMessage(getline(a:lnum), a:statusMessage))
endfunction
function! SpellCheck#mappings#OnSpellAdd( command, statusMessage )
    execute "normal! \<CR>"
    let l:isSuccess = call(g:SpellCheck_OnSpellAdd, [(v:count ? v:count : ''), a:command])
    wincmd p

    if ! l:isSuccess || empty(a:statusMessage) | return | endif
    call s:QuickfixInsertMessage(line('.'), a:statusMessage)
endfunction
function! s:GetCorrectedText()
    " XXX: Unfortunately, Vim doesn't set the change marks `[ `] on z=, so we
    " have to split the line where the correction occurred manually into words
    " and cut away identical words from the front and end until we've narrowed
    " it down to the change.
    let l:beforeWords = ingocollections#SplitKeepSeparators(s:beforeLineContent, '\k\@!.')
    let l:afterWords = ingocollections#SplitKeepSeparators(s:afterLineContent, '\k\@!.')

    let l:startIdx = 0
    while get(l:beforeWords, l:startIdx, '') ==# get(l:afterWords, l:startIdx, '')
	let l:startIdx += 1
    endwhile
    let l:endIdx = 0
    while get(l:beforeWords, -1 * l:endIdx, '') ==# get(l:afterWords, -1 * l:endIdx, '')
	let l:endIdx += 1
    endwhile

    return join(l:afterWords[l:startIdx : (-1 * l:endIdx)], '')
endfunction
function! s:QuickfixInsertCorrectionMessage()
    let l:changedText = s:GetCorrectedText()

    call s:QuickfixInsertMessage(line('.'), 'corrected' . (empty(l:changedText) ? '' : ': ' . l:changedText))
endfunction
function! s:UndoCorrectedQuickfixEntry( lnum )
    let l:correctionMessgePattern = ' \[corrected: .*]$'
    if getline(a:lnum) =~# l:correctionMessgePattern
	call s:QuickfixSetline(a:lnum, matchstr(getline(a:lnum), '^.*\ze' . l:correctionMessgePattern))
	return 1
    endif
    return 0
endfunction
function! s:UndoWrapper()
    execute "normal! \<CR>"
	let l:isAfterSpellCorrection = (exists('s:afterLineContent') && getline('.') ==# s:afterLineContent)
    normal u
	let l:isSpellCorrectionUndone = (l:isAfterSpellCorrection && exists('s:beforeLineContent') && getline('.') ==# s:beforeLineContent)
	unlet! s:beforeLineContent s:afterLineContent
    wincmd p
	if l:isSpellCorrectionUndone
	    if ! s:UndoCorrectedQuickfixEntry(line('.'))
		" The user might have already progressed to the next quickfix
		" entry when he realized he wanted to undo the previous
		" correction.
		call s:UndoCorrectedQuickfixEntry(line('.') - 1)
	    endif
	endif
endfunction
function! SpellCheck#mappings#MakeMappings()
    " Intercept word list management commands.
    " The command wrapper itself checks for the success of the wrapped command,
    " and updates the list entry accordingly.
    for [l:command, l:statusMessage] in [['zg', 'added'], ['zG', 'good'], ['zw', 'added as wrong'], ['zW', 'wrong'], ['zug', 'removed'], ['zuG', 'undo good'], ['zuw', 'removed as wrong'], ['zuW', 'undo wrong']]
	execute printf('nnoremap <silent> <buffer> %s :<C-u>call SpellCheck#mappings#OnSpellAdd(%s, %s)<CR>', l:command, string(l:command), string(l:statusMessage))
    endfor

    " Intercept spell suggestion command.
    " To find out whether a suggestion was accepted (or the query canceled via
    " <Esc>), we record b:changetick after moving into the target buffer, then
    " record again before moving back to the quickfix list, and evaluate and
    " update the list entry after we're back in the quickfix list.
    nnoremap <silent> <expr> <SID>(SpellSuggestWrapper) <SID>GetCountAndRecordBefore() . SpellCheck#mappings#SpellSuggestWrapper('call <SID>RecordAfter()', 'call SpellCheck#mappings#SpellRepeat()', 'wincmd p', 'if <SID>IsChangeRecorded()<Bar>call <SID>QuickfixInsertCorrectionMessage()<Bar>endif')
    nnoremap <silent> <script> <buffer> z= :<C-u>call <SID>SetCount()<CR><CR><SID>(SpellSuggestWrapper)

    " Apply undo to the target buffer to allow a quick revert of a spell
    " correction. As the quickfix window usually is not modifiable, the undo
    " command normally doesn't make sense there.
    nnoremap <silent> <buffer> u :<C-u>call <SID>UndoWrapper()<CR>
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
