"        File: vim.vim
"      Author: Srinath Avadhanula
"     Created: Thu Mar 21 06:00 PM 2002 PST
" Last Change: Sun Apr 20 04:00 PM 2003 PDT
" Description: ftplugin for vim
" 
" Installation:
"      History: 
"         TODO:
"=============================================================================

" b:forceRedoVim allows this plugin to be forcibly re-sourced.
if exists('b:didLocalVim') && !exists('b:forceRedoVim')
	finish
end
let b:didLocalVim = 1

au BufWritePre *.vim :set ff=unix

" Vim Mappings {{{
let s:ml = exists('g:mapleader') ? g:mapleader : '\'

call IMAP ('while'.s:ml,    "let <++> = <++>\<cr>while <++> <= <++>\<cr><++>\<cr>let <++> = <++> + 1\<cr>endwhile<++>", 'vim')
call IMAP ('fdesc'.s:ml,    "\"Description: ", 'vim')
call IMAP ('sec'.s:ml,      "\" \<esc>78a=\<esc>o\" \<cr> \<esc>78i=\<esc>", 'vim')
call IMAP ('func'.s:ml,     "\<C-r>=AskVimFunc()\<cr>", 'vim')
" end vim mappings }}}
" AskVimFunc: asks for function name and sets up template {{{
" Description: 
function! AskVimFunc()
	let name = input('Name of the function : ')
	if name == ''
		let name = "<+Function Name+>"
	end
	let islocal = input('Is this function scriptlocal ? [y]/n : ', 'y')
	if islocal == 'y'
		let sidstr = '<SID>'
	else
		let sidstr = ''
	endif
	return IMAP_PutTextWithMovement( 
		\ "\" ".name.": <+short description+> {{{\<cr>" .
		\ "\" Description: <+long description+>\<cr>" . 
		\ "\<C-u>function! ".name."(<+arguments+>)<++>\<cr>" . 
		\       "<+function body+>\<cr>" . 
		\ "endfunction \" }}}"
		\ )
endfunction " }}}

" vim600:fdm=marker
