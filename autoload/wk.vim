"
" Functions specific for work enviroment
"

function! wk#getFoldLevel_Log(lnum)
  let numChars = g:wk.numCharsFront
  let flag = getline(a:lnum)[:numChars] ==? getline(a:lnum-1)[:numChars]
  return flag ? 1 : 0
endfunction

function! wk#setFoldingPatternNumCharsFront()
  if v:count > 0
    let g:wk.numCharsFront = v:count
  endif
  setlocal fdm=expr foldexpr=wk#getFoldLevel_Log(v:lnum)
endfunction

function! wk#jumpToNextNonMatchingSetLength()
  if v:count != 0
    let g:wk.jumpToNextNonMatchingNTimes = v:count
    echom "Setting numbers of matching chars to " . v:count
  endif
endfunction

function! wk#jumpToNextNonMatching(direction)
  if !exists("g:wk.jumpToNextNonMatchingNTimes")
    let g:wk.jumpToNextNonMatchingNTimes = 2
  endif
  let flags = ''
  if a:direction < 0
    let flags = flags . 'b'
  endif
  let ntimes = max([v:count, 1])
  for icnt in range(ntimes)
    let curr_line = getline('.')
    let spattern = '^'
    for icol in range(g:wk.jumpToNextNonMatchingNTimes)
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
    let g:wk.echoOrPrintTimeSetting = v:count
  endif

  "We now adjust for time zone right here. This might lead to some confusion
  let hours_adjust = ($TZ == 'GMT0') ? 0 : 7
  let time_display = strftime("%a, %d %b %Y %H:%M", (expand("<cWORD>") + hours_adjust*3600))

  if g:wk.echoOrPrintTimeSetting != 1
    " try writting text after current word
    let @u = " " . time_display
    normal he"up
  endif
  echo time_display
endfunction

function! wk#jumpToUncovered()
  let save_cursor = getcurpos()
  call cursor([line('$'), 1, 0])
  let search_res = search('**Uncovered crews:', 'b')
  if search_res > 0
    normal zz
  else
    call cursor(save_cursor)
  endif
endfunction

function! wk#jumpToLoadedData()
  let save_cursor = getcurpos()
  call cursor([1, 1, 0])
  let search_res = search('Loaded Data information')
  if search_res > 0
    normal zt
  else
    call cursor(save_cursor)
  endif
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

function! wk#cleanVSCallStack()
  %substitute/) Line.*/)/e
  %substitute/=.\{-},/,/eg
  %substitute/=.\{-})/)/eg
endfunction
