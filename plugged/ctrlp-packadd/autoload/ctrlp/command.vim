if exists('g:loaded_ctrlp_command') && g:loaded_ctrlp_command
  finish
endif
let g:loaded_ctrlp_command = 1

let s:command_var = {
\  'init':   'ctrlp#command#init()',
\  'exit':   'ctrlp#command#exit()',
\  'accept': 'ctrlp#command#accept',
\  'lname':  'command',
\  'sname':  'command',
\  'type':   'command',
\  'sort':   0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:command_var)
else
  let g:ctrlp_ext_vars = [s:command_var]
endif

if exists("g:ctrlp_command_commands")
  unlet g:ctrlp_command_commands
endif

function! ctrlp#command#get_commands()
  let more_val=&more
  set nomore
  redir => out
  silent command
  redir end
  let &more=more_val

  " split in lines
  let all_lines = split(out, "\n")
  let all_files_base = []

  let idx = 0
  for p in all_lines
    let idx += 1
    if idx <= 1
      continue
    endif
    let endIdx = stridx(p, " ", 4)
    let name = p[4:endIdx]
    call add(all_files_base, name)
  endfor

  let g:ctrlp_command_commands = all_files_base
endfunction

function! ctrlp#command#command()
  call ctrlp#command#get_commands()
  call ctrlp#init(ctrlp#command#id())
endfunction

function! ctrlp#command#init()
  call ctrlp#command#get_commands()
  return g:ctrlp_command_commands
endfunction

function! ctrlp#command#accept(mode, str)
  call ctrlp#exit()
  let name = fnamemodify(a:str, ":t")
  echom 'executing ' . name
  call feedkeys(":" . name, "n")
	"exe "normal! g'".matchstr(a:str, '^\s*\zs\S\+\ze\s.*')

endfunction

function! ctrlp#command#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#command#id()
  return s:id
endfunction

" vim:fen:fdl=0:ts=2:sw=2:sts=2
