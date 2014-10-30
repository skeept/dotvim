" SnippetComplete.vim: Insert mode completion that completes defined
" abbreviations and snippets.
"
" DEPENDENCIES:
"   - Requires Vim 7.0 or higher.
"   - SnippetComplete.vim autoload script
"   - SnippetComplete/Abbreviations.vim autoload script
"
" Copyright: (C) 2010-2014 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   2.01.007	13-Aug-2012	FIX: Vim 7.0/1 need preloading of functions
"				referenced in Funcrefs.
"   2.00.006	05-May-2012	Rename g:SnippetComplete_Registry to
"				g:SnippetComplete_RegisteredTypes and pass this
"				to SnippetComplete#SnippetComplete() to allow
"				other uses of the completion excluding the Vim
"				abbreviations.
"   2.00.005	03-May-2012	Generalize for completing other types of
"				snippets (e.g. from snipMate):
"				Introduce g:SnippetComplete_Registry for snippet
"				types.
"   1.02.004	03-Oct-2011	Change <Plug>-mapping to <Plug>(SnippetComplete)
"				for consistency with my other completion plugins.
"   1.01.003	25-Sep-2010	Moved functions from plugin to separate autoload
"				script.
"   1.00.002	12-Jan-2010	Completed implementation for defined
"				:iabbrev's.
"	001	08-Jan-2010	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_SnippetComplete') || (v:version < 700)
    finish
endif
let g:loaded_SnippetComplete = 1
let s:save_cpo = &cpo
set cpo&vim


"- configuration ---------------------------------------------------------------

if ! exists('g:SnippetComplete_AbbreviationTypes')
    if v:version < 702 | runtime autoload/SnippetComplete/Abbreviations.vim | endif  " The Funcref doesn't trigger the autoload in older Vim versions.

    let g:SnippetComplete_AbbreviationTypes = {
    \   'fullid': {
    \       'priority': 10,
    \       'pattern': '\k\+',
    \       'generator': function('SnippetComplete#Abbreviations#fullid'),
    \       'needsInsertionAtOnce': 1
    \   },
    \   'endid': {
    \       'priority': 20,
    \       'pattern': '\%(\k\@!\S\)\+\k\?',
    \       'generator': function('SnippetComplete#Abbreviations#endid'),
    \       'needsInsertionAtOnce': 1
    \   },
    \   'nonid': {
    \       'priority': 30,
    \       'pattern': '\S\+\%(\k\@!\S\)\?',
    \       'generator': function('SnippetComplete#Abbreviations#nonid'),
    \       'needsInsertionAtOnce': 1
    \   },
    \}
    let g:SnippetComplete_LocalAbbreviationTypes = deepcopy(g:SnippetComplete_AbbreviationTypes)
    let g:SnippetComplete_LocalAbbreviationTypes.fullid.generator = function('SnippetComplete#Abbreviations#LocalFullid')
    let g:SnippetComplete_LocalAbbreviationTypes.endid.generator  = function('SnippetComplete#Abbreviations#LocalEndid')
    let g:SnippetComplete_LocalAbbreviationTypes.nonid.generator  = function('SnippetComplete#Abbreviations#LocalNonid')
endif
if ! exists('g:SnippetComplete_RegisteredTypes')
    let g:SnippetComplete_RegisteredTypes = copy(g:SnippetComplete_AbbreviationTypes)
endif
if ! exists('g:SnippetComplete_LocalRegisteredTypes')
    let g:SnippetComplete_LocalRegisteredTypes = copy(g:SnippetComplete_LocalAbbreviationTypes)
endif


"- autocmds --------------------------------------------------------------------

" In order to determine the base column of the completion, we need the start
" position of the current insertion. Mark '[ isn't set until we (at least
" temporarily via i_CTRL-O) move out of insert mode; however doing so then
" prevents the completed abbreviation from being expanded: The insertion was
" interrupted, and Vim doesn't consider the full expanded abbreviation to have
" been inserted in the current insert mode.
" To work around this, we use an autocmd to capture the cursor position whenever
" insert mode is entered.
augroup SnippetComplete
    autocmd!
    autocmd InsertEnter * let g:SnippetComplete_LastInsertStartPosition = getpos('.')
augroup END


"- mappings --------------------------------------------------------------------

" Triggering a completion typically inserts the first match and thus
" advances the cursor. We need the original cursor position to detect the
" repetition of the completion at the same position, in case the user wants to
" use another completion base. The reset of the cursor position is done in a
" preceding expression mapping, because it is not allowed to change the cursor
" position from within the actual SnippetComplete#SnippetComplete() expression.
inoremap <silent> <Plug>(SnippetComplete)      <C-r>=SnippetComplete#PreSnippetCompleteExpr()<CR><C-r>=SnippetComplete#SnippetComplete(g:SnippetComplete_RegisteredTypes)<CR>
inoremap <silent> <Plug>(SnippetCompleteLocal) <C-r>=SnippetComplete#PreSnippetCompleteExpr()<CR><C-r>=SnippetComplete#SnippetComplete(g:SnippetComplete_LocalRegisteredTypes)<CR>
if ! hasmapto('<Plug>(SnippetComplete)', 'i')
    imap <C-x>] <Plug>(SnippetComplete)
endif
if ! hasmapto('<Plug>(SnippetCompleteLocal)', 'i')
    imap <C-x>g] <Plug>(SnippetCompleteLocal)
endif

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
