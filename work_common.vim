function! GetFoldLevel_Log(lnum)
  let numChars = g:numCharsFront
  let flag = getline(a:lnum)[:numChars] ==? getline(a:lnum-1)[:numChars]
  return flag?1:0
endfunction

if has("autocmd")
  augroup ft_scratch
    autocmd!
    autocmd FileType scratch setlocal fdm=expr
          \ foldexpr=GetFoldLevel_Log(v:lnum)
  augroup END
endif " has("autocmd")

"by default 6 chars
let g:numCharsFront = 6

function! SetFoldingPatternNumCharsFront()
  if v:count > 0
    let g:numCharsFront = v:count
  endif
  setlocal fdm=expr foldexpr=GetFoldLevel_Log(v:lnum)
endfunction

nnoremap ,z1 :<C-U>call SetFoldingPatternNumCharsFront()<CR>

function! JumpToNextNonMatching()
  let curr_line = getline('.')
  let spattern = '^[^' . curr_line[0] . '][^' . curr_line[1] . ']'
  call search(spattern)
endfunction
nnoremap ,n :<C-U>call JumpToNextNonMatching()<CR><C-L>
