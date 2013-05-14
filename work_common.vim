function! GetFoldLevel_Log(lnum)
  let flag = getline(a:lnum)[:g:numCharsFront] ==? getline(a:lnum-1)[:g:numCharsFront]
  return flag?1:0
endfunction

if has("autocmd")

  augroup ft_scratch
    autocmd!
    autocmd FileType scratch setlocal fdm=expr
          \ foldexpr=GetFoldLevel_Log(v:lnum)
  augroup END

endif " has("autocmd")

command! -nargs=1 SNumCharsFront let g:numCharsFront = <args>
"by default 6 chars
let g:numCharsFront = 6
nnoremap ,z1 :<C-U>setlocal fdm=expr foldexpr=GetFoldLevel_Log(v:lnum)<CR>
