function! SmartBd()
  let last_buffer = bufnr('%')
  bnext
  exec "bdelete ".last_buffer
endfunction

command SmartBd call SmartBd()

