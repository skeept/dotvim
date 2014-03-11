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
  if a:direction < 0
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
  nohlsearch
  if a:direction == 2
    mark >
  endif
  if a:direction == -2
    mark <
  endif
endfunction
nnoremap ,n :<C-U>call JumpToNextNonMatching(1)<CR>
nnoremap ,N :<C-U>call JumpToNextNonMatching(-1)<CR>
vnoremap ,n :<C-U>call JumpToNextNonMatching(2)<CR>gvoo
vnoremap ,N :<C-U>call JumpToNextNonMatching(-2)<CR>gv

" useful mapping to convert time, get the word under cursor and convert it to
" regular date format
function! EchoOrPrintTime()
  if v:count != 0
    let g:echoOrPrintTimeSetting = v:count
  endif
  python << EOF
import time
import vim
currWord = float(vim.eval('expand("<cWORD>")'))
vim.command('let g:echoOrPrintTimeSettingTime = "{}"'.format(
  time.strftime("%a, %d %b %Y %H:%M", time.localtime(currWord))))
EOF

  if g:echoOrPrintTimeSetting != 1 
    " try writting text after current word
    let @u = " " . g:echoOrPrintTimeSettingTime
    normal he"up
  endif
  echo g:echoOrPrintTimeSettingTime
endfunction
let g:echoOrPrintTimeSetting = 1

"nnoremap \e :<C-U>py import time; print time.strftime("%a, %d %b %Y %H:%M",
      "\ time.localtime(<C-R><C-w>))<CR>
nnoremap \e :<C-U>call EchoOrPrintTime()<CR>
