let work_settings=1

let g:wk = {}

if has("autocmd")
  augroup ft_scratch
    autocmd!
    autocmd FileType scratch setlocal fdm=expr
          \ foldexpr=wk#getFoldLevel_Log(v:lnum)
  augroup END
endif

"by default 6 chars
let g:wk.numCharsFront = 6

nnoremap ,z1 :<C-U>call wk#setFoldingPatternNumCharsFront()<CR>
nnoremap ,sj :<C-U>call wk#jumpToNextNonMatchingSetLength()<CR>

" go to next non-matching
nnoremap <Plug>JumpToNextNonMatchingFMap :<C-U>call wk#jumpToNextNonMatching(1)<CR>
      \:call repeat#set("\<Plug>JumpToNextNonMatchingFMap")<CR>
nmap ,n <Plug>JumpToNextNonMatchingFMap

" go to previous non-matching
nnoremap <Plug>JumpToNextNonMatchingBMap :<C-U>call wk#jumpToNextNonMatching(-1)<CR>
      \:call repeat#set("\<Plug>JumpToNextNonMatchingBMap")<CR>
nmap ,N <Plug>JumpToNextNonMatchingBMap

"nnoremap ,N :<C-U>call JumpToNextNonMatching(-1)<CR>
vnoremap ,n :<C-U>call wk#jumpToNextNonMatching(2)<CR>gvoo
vnoremap ,N :<C-U>call wk#jumpToNextNonMatching(-2)<CR>gv

" useful mapping to convert time, get the word under cursor and convert it to
" regular date format
"
" settings 1: displays time in last line 2: writes time in front of current
" word
let g:wk.echoOrPrintTimeSetting = 2
nnoremap \e :<C-U>call wk#echoOrPrintTime()<CR>

if has("autocmd")
  augroup log_files
    autocmd!
    autocmd! BufRead *.log
          \ setlocal nowrap
  augroup END
endif

" Jump to uncovered crews
nnoremap glu :call wk#jumpToUncovered()<CR>

" Jump to loaded data
nnoremap gli :call wk#jumpToLoadedData()<CR>

" Jump to start of next global iteration
nnoremap <silent> <Plug>JumpToStartGlobalMap :call wk#jumpToStartGlobal(1)<CR>
      \:call repeat#set("\<Plug>JumpToStartGlobalMap")<CR>
nmap glg <Plug>JumpToStartGlobalMap

" Global Backward
nnoremap <silent> <Plug>JumpToStartGlobalMapBack :call wk#jumpToStartGlobal(-1)<CR>
      \:call repeat#set("\<Plug>JumpToStartGlobalMapBack")<CR>
nmap glG <Plug>JumpToStartGlobalMapBack

" Jump to start of global problem
nnoremap <silent> <Plug>JumpStartGlobalProb :call wk#jumpToGlobalProblem()<CR>
      \:call repeat#set("\<Plug>JumpStartGlobalProb")<CR>
nmap glm <Plug>JumpStartGlobalProb

" mnemonic: glc: get log content
" i: iteration s: selection g: global
nnoremap <silent> glci :call wk#getIteration()<CR>
nnoremap <silent> glcs :call wk#getSelection()<CR>
nnoremap <silent> glcg :call wk#getGlobal()<CR>
