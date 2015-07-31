let work_settings=1

let g:work = {}

function! GetFoldLevel_Log(lnum)
  let numChars = g:numCharsFront
  let flag = getline(a:lnum)[:numChars] ==? getline(a:lnum-1)[:numChars]
  return flag ? 1 : 0
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

function! JumpToNextNonMatchingSetLength()
  if v:count != 0
    let g:jumpToNextNonMatchingNTimes = v:count
    echom "Setting numbers of matching chars to " . v:count
  endif
endfunction
nnoremap ,sj :<C-U>call JumpToNextNonMatchingSetLength()<CR>

function! JumpToNextNonMatching(direction)
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
nnoremap <Plug>JumpToNextNonMatchingFMap :<C-U>call JumpToNextNonMatching(1)<CR>
      \:call repeat#set("\<Plug>JumpToNextNonMatchingFMap")<CR>
nmap ,n <Plug>JumpToNextNonMatchingFMap
"nnoremap ,n :<C-U>call JumpToNextNonMatching(1)<CR>
nnoremap <Plug>JumpToNextNonMatchingBMap :<C-U>call JumpToNextNonMatching(-1)<CR>
      \:call repeat#set("\<Plug>JumpToNextNonMatchingBMap")<CR>
nmap ,N <Plug>JumpToNextNonMatchingBMap
"nnoremap ,N :<C-U>call JumpToNextNonMatching(-1)<CR>
vnoremap ,n :<C-U>call JumpToNextNonMatching(2)<CR>gvoo
vnoremap ,N :<C-U>call JumpToNextNonMatching(-2)<CR>gv

" useful mapping to convert time, get the word under cursor and convert it to
" regular date format
function! EchoOrPrintTime()
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
let g:echoOrPrintTimeSetting = 2

nnoremap \e :<C-U>call EchoOrPrintTime()<CR>

if has("autocmd")
  augroup log_files
    autocmd!
    autocmd! BufRead *.log
          \ setlocal nowrap
  augroup END
endif


function! JumpToUncovered()
  normal G
  call search('**Uncovered crews:', 'b')
endfunction
nnoremap glu :call JumpToUncovered()<CR>
"nnoremap <silent> <Plug>JumpToUncoveredMap :call JumpToUncovered()<CR>
      "\:call repeat#set("\<Plug>JumpToUncoveredMap")<CR>
"nmap glu <Plug>JumpToUncoveredMap

function! g:work.jumpToLoadedData()
  normal gg
  call search('Loaded Data information')
  normal zt
endfunction
nnoremap gli :call g:work.jumpToLoadedData()<CR>

function! JumpToStartGlobal()
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


function! g:work.jumpToGlobalProblem()
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
