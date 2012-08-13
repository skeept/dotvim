"make the f1 key save-buffer key, 
"for some reason it keeps being remaped by the vim-latex plugin
inoremap <buffer> <silent> <F1> <ESC>:wa<cr>
noremap <buffer> <silent> <F1> :wa<cr>

"imap <NL> <Plug>IMAP_JumpForward
imap <buffer><silent> <c-\><F9> <Plug>Tex_Completion


imap  <c-s> <Plug>IMAP_JumpForward
nmap  <c-s> <Plug>IMAP_JumpForward
vmap  <c-s> <Plug>IMAP_JumpForward
vmap  <c-s> <Plug>IMAP_DeleteAndJumpForward

imap  <c-l> <Plug>IMAP_JumpForward
"nmap  <c-l> <Plug>IMAP_JumpForward
vmap  <c-l> <Plug>IMAP_JumpForward
vmap  <c-l> <Plug>IMAP_DeleteAndJumpForward

"the following should help complete fig:whatever
set iskeyword+=:
