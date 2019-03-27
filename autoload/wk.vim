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
    let g:wk.echoOrPrintTimeRanOnce = 1 "user remembers setting
  endif

  "first time calling this function give a message how to change setting
  if !exists('g:wk.echoOrPrintTimeRanOnce')
    let g:wk.echoOrPrintTimeRanOnce = 1
    echom 'prefix mapping 1: print 2: write'
  endif

  " We now adjust for time zone right here. Offset in Dallas is 6 or 7 hours
  let is_winter = 0 "Time changes in Dallas, need to adjust computation
  let hours_adjust = ($TZ == 'GMT0') ? 0 : (is_winter ? 7 : 6)
  let time_display = strftime("%a, %d %b %Y %H:%M:%S %p", (expand("<cword>") + hours_adjust*3600))

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

function! wk#jumpToStartGlobal(direction)
  let flags = ''
  if a:direction == -1
    let flags = 'b'
  endif
  for _ in range(max([v:count, 1]))
    call search('Start of Global Iteration', flags)
  endfor
endfunction

function! wk#jumpToGlobalProblem()
  " Improve this call. In general should go to start of current iteration
  " global problem. Also maybe it is not necessary to account for v:count
  " here.
  " But should consider before or after current selection in current iteration
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

function! wk#getIteration()
  " search back for previous start of global iteration
  " mark where iteration starts
  " search forward for end of this iteration
  " copy iteration lines to new buffer (scratch buffer)
  " open that scratch buffer
  mark q
  let curr_line = line('.')
  call search('Start of Global Iteration', 'bW')
  let start_line = line('.')
  call search('Start of Global Iteration', 'W')
  let end_line = line('.')
  let to_copy = start_line . ',' . end_line . 'yank w'
  execute to_copy
  enew
  normal "wp
endfunction

function! wk#getSelection()
  " search back for start of iteration
  " search for start of global problem
  " save selection to scratch buffer and open it
endfunction

function! wk#getGlobal()
  "similar to wk#getSelection() but get global part instead
endfunction

function! wk#getIterationNum()
  "get current iteration. Later try harder to check if before first or after
  "last
  " 0: before first -1: after last

  let curr_line = line('.')
  let res = search('Start of Global Iteration', 'bnW')
  if res > 0
    echom getline(res)
  endif
endfunction


function! wk#cleanVSCallStack()
  %substitute/) Line.*/)/e
  %substitute/=.\{-},/,/eg
  %substitute/=.\{-})/)/eg
endfunction
