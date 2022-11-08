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
    let g:wk.numCharsFrontForMatch = v:count
    echom "Setting numbers of matching chars to " . v:count
  endif
endfunction

function! wk#jumpToNextNonMatching(direction)
  " given num of chars in front (default 2)
  " jump to next line that doesn't match
  if !exists("g:wk.numCharsFrontForMatch")
    let g:wk.numCharsFrontForMatch = 2
  endif
  let flags = ''
  if a:direction < 0
    let flags = flags . 'b'
  endif
  let ntimes = max([v:count, 1])
  let message = 'num chars: ' . g:wk.numCharsFrontForMatch . ' [change <num>,sj] pattern: '
  for icnt in range(ntimes)
    let curr_line = getline('.')
    let spattern = '^'
    let pattern = '^'
    for icol in range(g:wk.numCharsFrontForMatch)
      let spattern .= '[^' . curr_line[icol] . ']'
      let pattern .= curr_line[icol]
    endfor
    if icnt == 0
      let message .= pattern
    endif
    call search(spattern, flags)
  endfor
  nohlsearch
  if a:direction == 2
    mark >
  endif
  if a:direction == -2
    mark <
  endif
  echom message
endfunction

" useful mapping to convert time, get the word under cursor and convert it to
" regular date format
function! wk#echoOrPrintTime()
  " defaults
  if !exists('g:wk.ep_write')
    let g:wk.ep_write = 0
  endif
  if !exists('g:wk.ep_display_msg')
    let g:wk.ep_display_msg = 1 "display first time run
  endif
  if !exists('g:wk.ep_show_adjusted')
    let g:wk.ep_show_adjusted = 0
  endif

  " user passes count => modify one of defaults
  if v:count == 1
    let g:wk.ep_write = 1 - g:wk.ep_write
  elseif v:count == 2
    let g:wk.ep_display_msg = 1
  elseif v:count == 3
    let g:wk.ep_show_adjusted = 1 - g:wk.ep_show_adjusted
  endif

  " have the following global variables:
  " g:ep_offset hours offset
  " g:ep_format format used for print, some options are provided here
  if !exists('g:ep_offset')
    let g:ep_offset = 6
  endif

  if !exists('g:ep_format')
    let g:ep_format = 0
  endif
  let formats = [
        \ "%m/%d %H:%M",
        \ "%a, %d %b %Y %H:%M:%S %p",
        \ ]
  let format = formats[g:ep_format]


  "first time calling this function give a message how to change setting
  let use_msg = ""
  if g:wk.ep_display_msg == 1
    let g:wk.ep_display_msg = 0 "print once, unless requested again
    let write_fmt = (g:wk.ep_write == 1) ? '*' : ''
    let use_msg .= ' (prefix) 1: write[' . write_fmt . ']'
    let use_msg .= ' 2: this msg'
    let adjusted_fmt = (g:wk.ep_show_adjusted == 1) ? '*' : ''
    let use_msg .= ' 3: show adjusted[' . adjusted_fmt . ']'
    let use_msg .= ' g:ep_offset:' . g:ep_offset
    let use_msg .= ' format: ' . format
  endif

  let current_val = expand("<cword>")
  let current_val = substitute(current_val, "\\D", "", "g")

  let hours_diff = ''
  if exists('g:wk.ep_previous_val') && current_val != g:wk.ep_previous_val
    let d1 = (current_val - g:wk.ep_previous_val)
    let sign_t = d1 >= 0 ? "" : "-"
    if d1 < 0 | let d1 = -d1 | endif
    let hours_d =  d1 / 3600
    let mins_d = (d1 - hours_d * 3600) / 60
    let hours_diff = ' (' . sign_t . hours_d . ':' . mins_d . ')'
  endif
  let g:wk.ep_previous_val = current_val

  let adjusted_val = current_val + 3600 * g:ep_offset

  let time_display = strftime(format, current_val)
  if current_val != adjusted_val && g:wk.ep_show_adjusted
    let time_display .= ' # '  . strftime(format, adjusted_val)
  endif

  if g:wk.ep_write == 1
    " try writting text after current word
    let @u = " " . time_display
    normal he"up
  endif
  let time_display .= hours_diff
  let time_display .= use_msg
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

function! wk#hoursMinutes(total, denominator)
  " do the mapping for <F9>
  let mapping_msg = " "
  if !exists("g:hourMinutesMappingIsSet")
    nnoremap <f9> :<C-U>call wk#hoursMinutes(<C-R><C-W>, 3600)<CR>
    nnoremap <S-f9> :<C-U>call wk#hoursMinutes(<C-R><C-W>, 3600)
    let mapping_msg .= "-- Use <f9> mapping to compute result (<S-F9>) to edit"
    let g:hourMinutesMappingIsSet = 1
  endif

  let hours = a:total / a:denominator
  let minutes_left = (a:total - hours * a:denominator) / 60
  let days = hours / 24
  let additional_hours = hours - 24 * days
  let msg = hours . ' h '
  if minutes_left > 0
    let msg .= minutes_left . ' m '
  endif
  if days > 0
    let msg .= ' [ ' . days . ' days ' . additional_hours . ' hours ] '
  endif
  echo msg . mapping_msg
endfunction


"================== Get notes file ============================================{{{
function! wk#get_notes_files()
  let files = [
        \ "/zl/rem.org",
        \ "/mnt/c/zl/rem.org",
        \ expand("~") . "/rem.org"
        \ ]
  let file = '' "not sure if available after the loop so just initialize it here
  for file in files
    if filereadable(file)
      break
    endif
  endfor
  execute 'edit ' . file
  return ''
endfunction
"==============================================================================}}}
