execute frawor#Setup('0.0', {'autoload/frawor/resources': '0.0'})
function Test()
endfunction
let s:T=function('Test')
delfunction Test
call s:_f.postresource('r', {}, s:T)

