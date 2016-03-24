execute frawor#Setup('0.0', {'autoload/frawor/checks': '0.0'})
function Test()
endfunction
let s:T=function('Test')
delfunction Test
call s:_f.conschecker(s:T)
