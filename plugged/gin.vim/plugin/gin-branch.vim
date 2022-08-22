if exists('g:loaded_gin_branch')
  finish
endif
let g:loaded_gin_branch = 1

augroup gin_plugin_branch_internal
  autocmd!
  autocmd BufReadCmd ginbranch://*
        \ call denops#request('gin', 'branch:edit', [bufnr(), expand('<amatch>')])
augroup END

function! s:command(bang, mods, args) abort
  if denops#plugin#wait('gin')
    return
  endif
  call denops#request('gin', 'branch:command', [a:bang, a:mods, a:args])
endfunction

command! -bang -bar -nargs=* GinBranch call s:command(<q-bang>, <q-mods>, [<f-args>])
