
"attemp to fix delimate and echofunc incompability problems
"inoremap does not work here
imap <silent> ( <Plug>delimitMate(<c-r>=EchoFunc()<cr>


"map <c-j> to ultisnips jump forward, but would still like to have
"it in latex files
"inoremap <silent> <NL> <c-r>=UltiSnips_JumpForwards()<cr>
"snoremap <silent> <NL> <esc>:call UltiSnips_JumpForwards()<cr>
