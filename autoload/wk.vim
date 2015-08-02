let work_settings=1

let g:work = {}

function! wk#getFoldLevel_Log(lnum)
  let numChars = g:numCharsFront
  let flag = getline(a:lnum)[:numChars] ==? getline(a:lnum-1)[:numChars]
  return flag ? 1 : 0
endfunction

function! wk#setFoldingPatternNumCharsFront()
  if v:count > 0
    let g:numCharsFront = v:count
  endif
  setlocal fdm=expr foldexpr=wk#getFoldLevel_Log(v:lnum)
endfunction

function! wk#jumpToNextNonMatchingSetLength()
  if v:count != 0
    let g:jumpToNextNonMatchingNTimes = v:count
    echom "Setting numbers of matching chars to " . v:count
  endif
endfunction

function! wk#jumpToNextNonMatching(direction)
  if !exists("g:jumpToNextNonMatchingNTimes")
    let g:jumpToNextNonMatchingNTimes = 2
  endif
  let flags = ''
  if a:direction < 0
    let flags = flags . 'b'
  endif
  let ntimes = max([v:count, 1])
  for icnt in range(ntimes)
    let curr_line = getline('.')
    let spattern = '^'
    for icol in range(g:jumpToNextNonMatchingNTimes)
      let spattern .= '[^' . curr_line[icol] . ']'
    endfor
    call search(spattern, flags)
  endfor
  nohlsearch
  if a:direction == 2
    mark >
  endif
  if a:direction == -2
    mark <
  endif
endfunction

" useful mapping to convert time, get the word under cursor and convert it to
" regular date format
function! wk#echoOrPrintTime()
  if v:count != 0
    let g:echoOrPrintTimeSetting = v:count
  endif
  "We now adjust for time zone right here. This might lead to some confusion
  let time_display = strftime("%a, %d %b %Y %H:%M", (expand("<cWORD>") + 7*3600))

  if g:echoOrPrintTimeSetting != 1
    " try writting text after current word
    let @u = " " . time_display
    normal he"up
  endif
  echo time_display
endfunction

function! wk#jumpToUncovered()
  normal G
  call search('**Uncovered crews:', 'b')
endfunction

function! wk#jumpToLoadedData()
  normal gg
  call search('Loaded Data information')
  normal zt
endfunction

function! wk#jumpToStartGlobal()
  let flags = ''
  if v:count == 1
    let flags = 'b'
  endif
  for _ in range(max([v:count, 1]))
    call search('Start of Global Iteration', flags)
  endfor
endfunction
nnoremap <silent> <Plug>JumpToStartGlobalMap :call JumpToStartGlobal()<CR>
      \:call repeat#set("\<Plug>JumpToStartGlobalMap")<CR>
nmap glg <Plug>JumpToStartGlobalMap


function! wk#jumpToGlobalProblem()
  let flags = ''
  if v:count == 1
    let flags = 'b'
  endif
  for _ in range(max([v:count, 1]))
    " should search for: 'Selector Ended:'
    " and then
    " search for: 'Initializing Optimization Controller'
    " but what if the cursor is between the 2? it will go to next global iteration...
    call search('Selector Ended:', flags)
  endfor
  call search('Initializing Optimization Controller', flags)
endfunction
nnoremap <silent> <Plug>JumpStartGlobalProb :call g:work.jumpToGlobalProblem()<CR>
      \:call repeat#set("\<Plug>JumpStartGlobalProb")<CR>
nmap glm <Plug>JumpStartGlobalProb

let work_lines=52
let work_columns=126
