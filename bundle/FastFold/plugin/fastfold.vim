scriptencoding utf-8

" LICENCE PUBLIQUE RIEN À BRANLER
" Version 1, Mars 2009
"
" Copyright (C) 2009 Sam Hocevar
" 14 rue de Plaisance, 75014 Paris, France
"
" La copie et la distribution de copies exactes de cette licence sont
" autorisées, et toute modification est permise à condition de changer
" le nom de la licence.
"
" CONDITIONS DE COPIE, DISTRIBUTON ET MODIFICATION
" DE LA LICENCE PUBLIQUE RIEN À BRANLER
"
" 0. Faites ce que vous voulez, j’en ai RIEN À BRANLER.

if exists('g:loaded_fastfold') || &cp
  finish
endif
let g:loaded_fastfold = 1

let s:keepcpo         = &cpo
set cpo&vim
" ------------------------------------------------------------------------------

if !exists('g:fastfold_fdmhook')    | let g:fastfold_fdmhook   = 0 | endif
if !exists('g:fastfold_savehook')    | let g:fastfold_savehook   = 1 | endif
if !exists('g:fastfold_fold_command_suffixes')
  let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C']
endif
if !exists('g:fastfold_fold_movement_commands')
  let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
endif
if !exists('g:fastfold_skip_filetypes')   | let g:fastfold_skip_filetypes = [] | endif

function! s:EnterWin()
  if exists('w:unchanged')
    unlet w:unchanged
  elseif s:Skip()
    if exists('w:lastfdm')
      unlet w:lastfdm
    endif
  else
    let w:lastfdm = &l:foldmethod
    setlocal foldmethod=manual
  endif
endfunction

function! s:LeaveWin()
  if exists('w:predifffdm')
    if empty(&l:foldmethod) || &l:foldmethod is# 'manual'
      let &l:foldmethod = w:predifffdm
      unlet w:predifffdm
      return
    elseif &l:foldmethod isnot# 'diff'
      unlet w:predifffdm
    endif
  endif

  if exists('w:lastfdm') && &l:foldmethod is# 'diff'
    let w:predifffdm = w:lastfdm
  endif

  if exists('w:lastfdm') && &l:foldmethod is# 'manual' 
    if !exists('b:last_changedtick') || b:changedtick > b:last_changedtick
      let &l:foldmethod = w:lastfdm
      let b:last_changedtick = b:changedtick
    else
      let w:unchanged = 1
    endif
  endif
endfunction

" Like windo but restore the current buffer.
" See http://vim.wikia.com/wiki/Run_a_command_in_multiple_buffers#Restoring_position
function! s:WinDo( command )
  " avoid errors in CmdWin
  if exists('*getcmdwintype') && !empty(getcmdwintype())
    return
  endif
  " Work around Vim bug.
  " See https://groups.google.com/forum/#!topic/vim_dev/LLTw8JV6wKg
  let curaltwin = winnr('#') ? winnr('#') : 1
  let currwin=winnr()
  if &scrollopt =~# '\<jump\>'
    set scrollopt-=jump
    let l:restore = 'set scrollopt+=jump'
  endif
  silent! execute 'keepjumps noautocmd windo ' . a:command
  silent! execute 'noautocmd ' . curaltwin . 'wincmd w'
  silent! execute 'noautocmd ' . currwin . 'wincmd w'
  if exists('l:restore')
    exe l:restore
  endif
endfunction

" WinEnter then TabEnter then BufEnter then BufWinEnter
function! s:UpdateWin(check)
  " skip if another session still loading
  if a:check && exists('g:SessionLoad') | return | endif

  let s:curwin = winnr()
  call s:WinDo('if winnr() is s:curwin | call s:LeaveWin() | endif')
  call s:WinDo('if winnr() is s:curwin | call s:EnterWin() | endif')
endfunction

function! s:UpdateBuf(feedback)
  let s:curbuf = bufnr('%')
  call s:WinDo("if bufnr('%') is s:curbuf | call s:LeaveWin() | endif")
  call s:WinDo("if bufnr('%') is s:curbuf | call s:EnterWin() | endif")

  if !a:feedback | return | endif

  if !exists('w:lastfdm')
    echomsg "'" . &l:foldmethod . "' folds already continuously updated"
  else
    echomsg "updated '" . w:lastfdm . "' folds"
  endif
endfunction

function! s:UpdateTab()
  " skip if another session still loading
  if exists('g:SessionLoad') | return | endif

  call s:WinDo('call s:LeaveWin()')
  call s:WinDo('call s:EnterWin()')
endfunction

function! s:Skip()
  if !s:isReasonable() | return 1 | endif
  if !&l:modifiable    | return 1 | endif
  if s:inSkipList()    | return 1 | endif

  return 0
endfunction

function! s:isReasonable()
  if &l:foldmethod is# 'syntax' || &l:foldmethod is# 'expr'
    return 1
  else
    return 0
  endif
endfunction

function! s:inSkipList()
  for ifiles in g:fastfold_skip_filetypes
    if index(g:fastfold_skip_filetypes, &l:filetype) >= 0
      return 1
    endif
  endfor
  return 0
endfunction

command! -bar -bang FastFoldUpdate call s:UpdateBuf(<bang>0)

nnoremap <silent> <Plug>(FastFoldUpdate) :<c-u>FastFoldUpdate!<CR>

if !hasmapto('<Plug>(FastFoldUpdate)', 'n') && empty(mapcheck('zuz', 'n'))
  nmap zuz <Plug>(FastFoldUpdate)
endif

for suffix in g:fastfold_fold_command_suffixes
  execute 'nnoremap <silent> z'.suffix.' :<c-u>call <SID>UpdateWin(0)<CR>z'.suffix
endfor

for cmd in g:fastfold_fold_movement_commands
  exe "nnoremap <silent><expr> " . cmd. " ':<c-u>call <SID>UpdateWin(0)<CR>'.v:count." . "'".cmd."'"
  exe "xnoremap <silent><expr> " . cmd. " ':<c-u>call <SID>UpdateWin(0)<CR>gv'.v:count." . "'".cmd."'"
  exe "onoremap <silent><expr> " . cmd. " '<esc>:<c-u>call <SID>UpdateWin(0)<CR>' . '\"' . v:register . v:operator . v:count1 . " . "'".cmd."'"
endfor

augroup FastFold
  autocmd!
  autocmd VimEnter * call s:init()
  autocmd BufEnter,WinEnter * 
        \ if !exists('b:last_changedtick') | let b:last_changedtick = b:changedtick | endif
augroup end

function! s:init()
  call s:UpdateTab()
  augroup FastFoldEnter
    autocmd!
    " Make &l:foldmethod local to Buffer and NOT Window.
    autocmd BufEnter,WinEnter *
          \ if exists('b:lastfdm') | let w:lastfdm = b:lastfdm | call s:LeaveWin() | call s:EnterWin() | endif
    autocmd BufLeave,WinLeave *
          \ call s:LeaveWin() | call s:EnterWin() |
          \ if exists('w:lastfdm')     | let b:lastfdm = w:lastfdm |
          \ elseif exists('b:lastfdm') | unlet b:lastfdm | endif

    autocmd BufEnter,WinEnter *
          \ if &l:foldmethod isnot# 'diff' && exists('b:predifffdm') | call s:UpdateBuf(0) | endif
    autocmd BufLeave,WinLeave *
          \ if exists('w:predifffdm')     | let b:predifffdm = w:predifffdm |
          \ elseif exists('b:predifffdm') | unlet b:predifffdm | endif

    " UpdateBuf/Win(1) = skip if another session is still loading.
    autocmd TabEnter                      * call s:UpdateTab()

    " BufWinEnter = to change &l:foldmethod by modelines.
    autocmd BufWinEnter,FileType          * call s:UpdateWin(1)
    " So that FastFold functions correctly after :loadview.
    autocmd SessionLoadPost               * call s:UpdateWin(0)

    " Update folds on reload.
    autocmd BufReadPost                   * 
          \ if !exists('b:already_loaded') | let b:already_loaded = 1 |
          \ else                          | call s:UpdateBuf(0) | endif
    " Update folds on saving.
    if g:fastfold_savehook
      autocmd BufWritePost                * call s:UpdateBuf(0)
    endif
    if g:fastfold_fdmhook
      if exists('##OptionSet')
        autocmd OptionSet foldmethod call s:UpdateBuf(0)
      endif
    endif
  augroup end
endfunction

" ------------------------------------------------------------------------------
let &cpo= s:keepcpo
unlet s:keepcpo
