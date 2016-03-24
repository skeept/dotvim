execute frawor#Setup('0.0', {})
function Test()
endfunction
let s:T=function('Test')
delfunction Test
call s:_f.newfeature('test', {'cons': s:T})
