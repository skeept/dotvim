
"attemp to fix delimate and echofunc incompability problems
"inoremap does not work here
imap <silent> ( <Plug>delimitMate(<c-r>=EchoFunc()<cr>


"map <c-j> to ultisnips jump forward, but would still like to have
"it in latex files
"inoremap <silent> <NL> <c-r>=UltiSnips_ExpandSnippetOrJump()<CR>
"snoremap <silent> <NL> <esc>:call UltiSnips_ExpandSnippetOrJump()<CR>

"inoremap <silent> <buffer> <NL> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0) ?  "" : IMAP_Jumpfunc('', 0)<CR>
"snoremap <silent> <buffer> <NL> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0) ?  "" : IMAP_Jumpfunc('', 0)<CR>

"inoremap <silent> <F10> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0) ? "" : UltiSnips_ListSnippets()<CR>


vnoremap [q :<C-U>cprevious<CR>
vnoremap ]q :<C-U>cnext<CR>
nnoremap [q :<C-U>cprevious<CR>
nnoremap ]q :<C-U>cnext<CR>

vnoremap [b :<C-U>bprevious<CR>
vnoremap ]b :<C-U>bnext<CR>
nnoremap [b :<C-U>bprevious<CR>
nnoremap ]b :<C-U>bnext<CR>
