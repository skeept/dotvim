execute frawor#Setup('0.0', {'autoload/frawor/mappings': '0.0'})
function Test()
endfunction
let s:T=function('Test')
delfunction Test
call s:_f.mapgroup.add("Mgroup", {'test': {'rhs': ',', 'strfunc': s:T}})

