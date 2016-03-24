execute frawor#Setup('0.0', {'@/commands': '0.0'})
function Test()
endfunction
let s:T=function('Test')
delfunction Test
call s:_f.command.add('Abc', s:T, {})

