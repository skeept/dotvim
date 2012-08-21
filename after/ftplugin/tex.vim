"make the f1 key save-buffer key, 
"for some reason it keeps being remaped by the vim-latex plugin
inoremap <buffer> <silent> <F1> <ESC>:wa<cr>
noremap <buffer> <silent> <F1> :wa<cr>

"imap <NL> <Plug>IMAP_JumpForward
imap <buffer><silent> <c-\><F9> <Plug>Tex_Completion


imap <c-s> <Plug>IMAP_JumpForward
nmap <c-s> <Plug>IMAP_JumpForward
vmap <c-s> <Plug>IMAP_JumpForward
vmap <c-s> <Plug>IMAP_DeleteAndJumpForward

"imap <c-l> <Plug>IMAP_JumpForward
""nmap <c-l> <Plug>IMAP_JumpForward
"vmap <c-l> <Plug>IMAP_JumpForward
"vmap <c-l> <Plug>IMAP_DeleteAndJumpForward

"the following should help complete fig:whatever
set iskeyword+=:

"just for latex switch keys for ultisnip
inoremap <silent> <C-L> <c-r>=UltiSnips_ExpandSnippetOrJump()<CR>
snoremap <silent> <C-L> <esc>:call UltiSnips_ExpandSnippetOrJump()<CR>

imap <silent> <NL> <Plug>IMAP_JumpForward
"nmap <silent> <NL> <Plug>IMAP_JumpForward
"vmap <silent> <NL> <Plug>IMAP_JumpForward
"vmap <silent> <NL> <Plug>IMAP_DeleteAndJumpForward

function! SelectImapOrUlti()
  let save_cursor = getpos(".")
  "execute "normal \<Plug>IMAP_JumpForward"
  "execute "normal \<Plug>IMAP_DeleteAndJumpForward"
  call UltiSnips_ExpandSnippetOrJump()
  "let current_cursor = getpos(".")
  "if save_cursor == current_cursor
    ""call UltiSnips_ExpandSnippetOrJump()
    "execute "normal UltiSnips_ExpandSnippetOrJump"
  "endif
  "return ""
  return ''
endfunction
imap <c-l> <c-r>=SelectImapOrUlti()<cr>
vmap <c-l> <esc>:call SelectImapOrUlti()<cr>
snoremap <c-l> <esc>:call SelectImapOrUlti()<cr>
