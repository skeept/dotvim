" SnippetCompleteSnipMate.vim: Integrate snipMate snippets into SnippetComplete plugin.
"
" DEPENDENCIES:
"   - SnippetComplete plugin (vimscript #2926)
"   - SnippetCompleteSnipMate.vim autoload script
"
" Copyright: (C) 2012-2013 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.01.005	14-Jan-2013	CHG: Change default mapping to the more
"				intuitive (for default snipMate trigger)
"				i_CTRL-X_<Tab>.
"   1.00.004	16-Aug-2012	FIX: No completion after e.g. '| or "base|.
"				snipMate actually uses the /\S\+/ pattern with a
"				fallback of removing everything up to the first
"				non-word character of the base. This is
"				difficult to model. Instead, just allow /\w/ and
"				-, as all snippet names I've seen and use stick
"				to them.
"	003	13-Aug-2012	FIX: Vim 7.0/1 need preloading of functions
"				referenced in Funcrefs.
"	002	05-May-2012	Separate type definition into
"				g:SnippetComplete_SnipMateTypes and define
"				separate completion mapping for snipMate
"				snippets only.
"	001	04-May-2012	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_SnippetCompleteSnipMate') || (v:version < 700)
    finish
endif
let g:loaded_SnippetCompleteSnipMate = 1

if ! exists('g:SnippetComplete_RegisteredTypes')
    " Apparently, the SnippetComplete plugin isn't installed or active.
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

"- integration -----------------------------------------------------------------

if v:version < 702 | runtime autoload/SnippetCompleteSnipMate.vim | endif  " The Funcref doesn't trigger the autoload in older Vim versions.
let g:SnippetComplete_SnipMateTypes = {
\   'snipMate': {
\       'priority': 100,
\       'pattern': '[-0-9A-Za-z_]\+',
\       'generator': function('SnippetCompleteSnipMate#Generator')
\   }
\}
call extend(g:SnippetComplete_RegisteredTypes, g:SnippetComplete_SnipMateTypes)


"- mappings --------------------------------------------------------------------

inoremap <silent> <Plug>(SnippetCompleteSnipMate) <C-r>=SnippetComplete#PreSnippetCompleteExpr()<CR><C-r>=SnippetComplete#SnippetComplete(g:SnippetComplete_SnipMateTypes)<CR>
if ! hasmapto('<Plug>(SnippetCompleteSnipMate)', 'i')
    imap <C-x><Tab> <Plug>(SnippetCompleteSnipMate)
endif

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
