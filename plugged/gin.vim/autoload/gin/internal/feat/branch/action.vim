function! gin#internal#feat#branch#action#register() abort
  noremap <buffer> <Plug>(gin-action-switch)
        \ <Cmd>call gin#action#fn({ xs -> <SID>switch(xs) })<CR>

  nnoremap <buffer> <Plug>(gin-action-new)
        \ <Cmd>call gin#action#fn({ xs -> <SID>new('-c', xs) })<CR>
  nnoremap <buffer> <Plug>(gin-action-new:force)
        \ <Cmd>call gin#action#fn({ xs -> <SID>new('-C', xs) })<CR>
  nnoremap <buffer> <Plug>(gin-action-new:orphan)
        \ <Cmd>call gin#action#fn({ xs -> <SID>new_orphan(xs) })<CR>

  noremap <buffer> <Plug>(gin-action-move)
        \ <Cmd>call gin#action#fn({ xs -> <SID>move(v:false, xs) })<CR>
  noremap <buffer> <Plug>(gin-action-move:force)
        \ <Cmd>call gin#action#fn({ xs -> <SID>move(v:true, xs) })<CR>

  noremap <buffer> <Plug>(gin-action-delete)
        \ <Cmd>call gin#action#fn({ xs -> <SID>delete(v:false, xs) })<CR>
  noremap <buffer> <Plug>(gin-action-delete:force)
        \ <Cmd>call gin#action#fn({ xs -> <SID>delete(v:true, xs) })<CR>

  nnoremap <buffer> <Plug>(gin-action-merge:ff)
        \ <Cmd>call gin#action#fn({ xs -> <SID>merge("--ff", xs) })<CR>
  nnoremap <buffer> <Plug>(gin-action-merge:no-ff)
        \ <Cmd>call gin#action#fn({ xs -> <SID>merge("--no-ff", xs) })<CR>
  nnoremap <buffer> <Plug>(gin-action-merge:ff-only)
        \ <Cmd>call gin#action#fn({ xs -> <SID>merge("--ff-only", xs) })<CR>
  nmap <buffer> <Plug>(gin-action-merge) <Plug>(gin-action-merge:ff)

  nnoremap <buffer> <Plug>(gin-action-rebase)
        \ <Cmd>call gin#action#fn({ xs -> <SID>rebase("", xs) })<CR>
  nnoremap <buffer> <Plug>(gin-action-rebase:i)
        \ <Cmd>call gin#action#fn({ xs -> <SID>rebase_interactive("", xs) })<CR>
endfunction

function! s:switch(xs) abort
  let branch = a:xs[0]
  execute printf('Gin! switch %s', branch.branch)
endfunction

function! s:new(suffix, xs) abort
  let from = a:xs[0].branch
  let name = input(printf('New branch (from %s): ', from))
  redraw | echo ''
  if empty(name)
    echohl WarningMsg
    echo 'Cancelled'
    echohl None
    return
  endif
  execute printf('Gin! switch %s %s %s', a:suffix, name, from)
endfunction

function! s:new_orphan(xs) abort
  let name = input('New branch (orphan): ')
  redraw | echo ''
  if empty(name)
    echohl WarningMsg
    echo 'Cancelled'
    echohl None
    return
  endif
  execute printf('Gin! switch --orphan %s', name)
endfunction

function! s:move(force, xs) abort
  let from = a:xs[0].branch
  let name = input(printf('Rename (from %s): ', from), from)
  redraw | echo ''
  if empty(name)
    echohl WarningMsg
    echo 'Cancelled'
    echohl None
    return
  endif
  execute printf(
        \ 'Gin! branch --move %s %s %s',
        \ a:force ? '--force' : '',
        \ from,
        \ name,
        \)
endfunction

function! s:delete(force, xs) abort
  for branch in a:xs
    if branch.kind ==# 'alias'
      continue
    endif
    if branch.kind ==# 'remote'
      execute printf(
            \ 'Gin! push --delete %s %s',
            \ branch.remote,
            \ branch.branch,
            \)
    else
      execute printf(
            \ 'Gin! branch %s %s',
            \ a:force ? '-D' : '-d',
            \ branch.branch,
            \)
    endif
  endfor
endfunction

function! s:merge(prefix, xs) abort
  for branch in a:xs
    if branch.kind ==# 'alias'
      continue
    endif
    execute printf(
          \ 'Gin! merge %s %s',
          \ a:prefix,
          \ branch.target,
          \)
  endfor
endfunction

function! s:rebase(prefix, xs) abort
  for branch in a:xs
    if branch.kind ==# 'alias'
      continue
    endif
    execute printf(
          \ 'Gin! rebase %s %s',
          \ a:prefix,
          \ branch.target,
          \)
  endfor
endfunction

function! s:rebase_interactive(prefix, xs) abort
  for branch in a:xs
    if branch.kind ==# 'alias'
      continue
    endif
    execute printf(
          \ 'Gin rebase --interactive %s %s',
          \ a:prefix,
          \ branch.target,
          \)
  endfor
endfunction
