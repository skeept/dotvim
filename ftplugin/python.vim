" PY_GetFunction: generates a function prototype {{{
" " Description: 
function! PY_MakeFunctionTemplate()
	let line = getline('.')

	return IMAP_PutTextWithMovement("\<C-o>cc# ".line." {{{\<CR>\<C-u>def ".line.":\<CR><++>\<CR>\<C-u># }}}")
endfunction " }}}

inoremap <buffer> <C-_> <C-r>=PY_MakeFunctionTemplate()<CR>
