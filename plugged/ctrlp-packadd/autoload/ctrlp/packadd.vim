if exists('g:loaded_ctrlp_packadd') && g:loaded_ctrlp_packadd
  finish
endif
let g:loaded_ctrlp_packadd = 1

let s:packadd_var = {
\  'init':   'ctrlp#packadd#init()',
\  'exit':   'ctrlp#packadd#exit()',
\  'accept': 'ctrlp#packadd#accept',
\  'lname':  'packadd',
\  'sname':  'packadd',
\  'type':   'packadd',
\  'sort':   0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:packadd_var)
else
  let g:ctrlp_ext_vars = [s:packadd_var]
endif

if exists("g:ctrlp_packadd_packadds")
  unlet g:ctrlp_packadd_packadds
endif

function! ctrlp#packadd#get_packadds()
  " try the rtp thing
  let config_path = split(&rtp, ",")[0]
  let opt_path = config_path . "/pack/bundle/opt"
  let all_files = globpath(opt_path, '*')
  let all_files = split(all_files, "\n")
  let all_files_base = []

  for p in all_files
    call add(all_files_base, fnamemodify(p, ":t"))
  endfor

  let g:ctrlp_packadd_packadds = all_files_base
endfunction

function! ctrlp#packadd#command()
  call ctrlp#packadd#get_packadds()
  call ctrlp#init(ctrlp#packadd#id())
endfunction

function! ctrlp#packadd#init()
  call ctrlp#packadd#get_packadds()
  return g:ctrlp_packadd_packadds
endfunction

function! ctrlp#packadd#accept(mode, str)
  call ctrlp#exit()
  let name = fnamemodify(a:str, ":t")
  echom 'name' . name
  exe "packadd " . name
	"exe "normal! g'".matchstr(a:str, '^\s*\zs\S\+\ze\s.*')

endfunction

function! ctrlp#packadd#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#packadd#id()
  return s:id
endfunction

" vim:fen:fdl=0:ts=2:sw=2:sts=2
