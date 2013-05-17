" TextTransform.vim: Create text transformation mappings and commands.
"
" DEPENDENCIES:
"   - TextTransform#Arbitrary.vim autoload script
"   - TextTransform#Lines.vim autoload script
"
" Copyright: (C) 2011-2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"   Idea, design and implementation based on unimpaired.vim (vimscript #1590)
"   by Tim Pope.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.04.011	28-Dec-2012	Minor: Correct lnum for no-modifiable buffer
"				check.
"   1.00.010	05-Apr-2012	Initial release.
"	010	19-Oct-2011	BUG: Variable rename from LineTypes to
"				l:selectionModes broke Funcref arguments; my
"				test suite would have caught this, if only I had
"				run it :-)
"	009	11-Apr-2011	Implement customization of mappings (by having
"				mappings to the <Plug>-mappings) and no custom
"				mappings (by passing an empty a:key), just the
"				<Plug>-mappings.
"	008	10-Apr-2011	Define commands with bang; otherwise,
"				buffer-local commands defined by ftplugins will
"				cause errors when the filetype changes (to one
"				that defines the same commands).
"	007	05-Apr-2011	Add TextTransform#MakeSelectionCommand() command
"				variant that uses s:Transform() and allows to
"				operate on text objects, motions, visual
"				selection, ...
"				Replace "unimpaired" prefix with "TextT" to
"				remove the last remnant of the original
"				unimpaired.vim script and make this fully
"				independent.
"	006	05-Apr-2011	Limit the amount of script that gets sourced
"				when commands / mappings are defined during Vim
"				startup:
"				Extract actual transformations on lines to
"				TextTransform#Lines.vim.
"			    	Extract actual transformations in mappings to
"			    	TextTransform#Arbitrary.vim.
"	005	29-Mar-2011	Rename TextTransform#MapTransform() to
"				TextTransform#MakeMappings().
"				Implement 'isProcessEntireText' option.
"				Factor out s:TransformCommand() function and
"				make it delegate to the passed
"				a:ProcessFunction, which is either
"				s:TransformLinewise() or s:TransformWholeText().
"	004	28-Mar-2011	ENH: Allow use of Funcref for a:algorithm in
"				order to support script-local transformation
"				functions.
"	003	25-Mar-2011	ENH: Use s:TransformExpression() instead of
"				s:TransformSetup() to enable passing <count>
"				before the operator-pending mapping.
"				Tighten pattern to detect visualmode() arguments
"				in s:Transform().
"				Implement TextTransform#MakeCommand() for
"				linewise application of the algorithm.
"				ENH: Catch and report errors in algorithm.
"				ENH: Do not make the buffer modified if no
"				transformation is done.
"	002	16-Mar-2011	Fix off-by-one errors with some modes and
"				'selection' settings.
"				FIX: Parsing for l:doubledKey now also accepts
"				key modifiers like "<S-...>".
"	001	07-Mar-2011	file creation from plugin/unimpaired.vim

function! s:Before()
    let s:isModified = &l:modified
endfunction
function! s:After()
    if ! s:isModified
	setlocal nomodified
    endif
    unlet s:isModified
endfunction
nnoremap <expr> <SID>Reselect '1v' . (visualmode() !=# 'V' && &selection ==# 'exclusive' ? ' ' : '')
function! TextTransform#MakeMappings( mapArgs, key, algorithm, ... )
    " This will cause "E474: Invalid argument" if the mapping name gets too long.
    let l:mappingName = 'TextT' . (
    \	type(a:algorithm) == type('') ?
    \	    a:algorithm :
    \	    substitute(substitute(string(a:algorithm), '^function(''\(.*\)'')', '\1', ''), '<SNR>', '', 'g')
    \)
    let l:plugMappingName = '<Plug>' . l:mappingName

    execute printf('nnoremap <silent> <expr> %s %sOperator TextTransform#Arbitrary#Expression(%s, %s)',
    \	a:mapArgs,
    \	l:plugMappingName,
    \	string(a:algorithm),
    \	string(l:mappingName)
    \)

    let l:noopModificationCheck = 'call <SID>Before()<Bar>call setline(".", getline("."))<Bar>call <SID>After()<Bar>'

    " Repeat not defined in visual mode.
    execute printf('vnoremap <silent> %s <SID>%sVisual :<C-u>%scall TextTransform#Arbitrary#Visual(%s, %s)<CR>',
    \	a:mapArgs,
    \	l:mappingName,
    \	l:noopModificationCheck,
    \	string(a:algorithm),
    \	string(l:mappingName)
    \)
    execute printf('vnoremap <silent> <script> %sVisual <SID>%sVisual',
    \	l:plugMappingName,
    \	l:mappingName
    \)
    execute printf('nnoremap <silent> <script> %sVisual <SID>Reselect<SID>%sVisual',
    \	l:plugMappingName,
    \	l:mappingName
    \)

    let l:SelectionModes = (a:0 ? a:1 : 'lines')
    execute printf('nnoremap <silent> %s %sLine :<C-u>%scall TextTransform#Arbitrary#Line(%s, %s, %s)<CR>',
    \	a:mapArgs,
    \	l:plugMappingName,
    \	l:noopModificationCheck,
    \	string(a:algorithm),
    \	string(l:SelectionModes),
    \	string(l:mappingName)
    \)


    if empty(a:key)
	return
    endif

    let l:operatorPlugMappingName = l:plugMappingName . 'Operator'
    if ! hasmapto(l:operatorPlugMappingName, 'n')
	execute 'nmap' a:mapArgs a:key l:operatorPlugMappingName
    endif

    let l:visualPlugMappingName = l:plugMappingName . 'Visual'
    if ! hasmapto(l:visualPlugMappingName, 'x')
	execute 'xmap' a:mapArgs a:key l:visualPlugMappingName
    endif

    let l:linePlugMappingName = l:plugMappingName . 'Line'
    if ! hasmapto(l:linePlugMappingName, 'n')
	let l:doubledKey = matchstr(a:key, '\(<[[:alpha:]-]\+>\|.\)$')
	execute 'nmap' a:mapArgs a:key . l:doubledKey l:linePlugMappingName
    endif
endfunction


function! TextTransform#MakeCommand( commandOptions, commandName, algorithm, ... )
    let l:options = (a:0 ? a:1 : {})
    execute printf('command! -bar %s %s %s call TextTransform#Lines#TransformCommand(<line1>, <line2>, %s, %s)',
    \	a:commandOptions,
    \	(a:commandOptions =~# '\%(^\|\s\)-range\%(=\|\s\)' ? '' : '-range'),
    \	a:commandName,
    \	string(a:algorithm),
    \	string('TextTransform#Lines#Transform' . (get(l:options, 'isProcessEntireText', 0) ? 'WholeText' : 'Linewise'))
    \)
endfunction


function! TextTransform#MakeSelectionCommand( commandOptions, commandName, algorithm, selectionModes )
    execute printf('command -bar -count %s %s call TextTransform#Arbitrary#Command(<line1>, <line2>, <count>, %s, %s)',
    \	a:commandOptions,
    \	a:commandName,
    \	string(a:algorithm),
    \	string(a:selectionModes)
    \)
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
