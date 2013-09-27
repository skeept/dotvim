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

function! JumpToNextNonMatching(direction)
  let flags = ''
  if a:direction == -1
    let flags = flags . 'b'
  endif
  let ntimes = max([v:count, 1])
  let i = 1
  while i <= ntimes
    let i = i + 1
    let curr_line = getline('.')
    let spattern = '^[^' . curr_line[0] . '][^' . curr_line[1] . ']'
    call search(spattern, flags)
  endwhile
endfunction
noremap ,n :<C-U>call JumpToNextNonMatching(1)<CR><C-L>
noremap ,N :<C-U>call JumpToNextNonMatching(-1)<CR><C-L>
