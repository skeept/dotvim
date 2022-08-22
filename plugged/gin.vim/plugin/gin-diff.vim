if exists('g:loaded_gin_diff')
  finish
endif
let g:loaded_gin_diff = 1

augroup gin_plugin_diff_internal
  autocmd!
  autocmd BufReadCmd gindiff://*
        \ call denops#request('gin', 'diff:edit', [bufnr(), expand('<amatch>')])
  autocmd FileReadCmd gindiff://*
        \ call denops#request('gin', 'diff:read', [bufnr(), expand('<amatch>')])
augroup END

function! s:command(bang, mods, args) abort
  if denops#plugin#wait('gin')
    return
  endif
  call denops#request('gin', 'diff:command', [a:bang, a:mods, a:args])
endfunction

command! -bang -bar -nargs=* GinDiff call s:command(<q-bang>, <q-mods>, [<f-args>])
