execute frawor#Setup('0.0', {})
call WriteFile('Registered '.s:_frawor.id)
let s:testfeature={}
function s:testfeature.depadd(plugdict, fdict, dplid)
    call WriteFile('feature-depadd: '.s:_frawor.id.' '.a:dplid)
endfunction
function s:testfeature.load(plugdict, fdict)
    call WriteFile('feature-load: '.s:_frawor.id)
endfunction
function s:testfeature.register(plugdict, fdict)
    call WriteFile('feature-register: '.s:_frawor.id)
endfunction
function s:testfeature.unload(plugdict, fdict)
    call WriteFile('feature-unload: '.s:_frawor.id)
endfunction
function s:testfeature.unloadpre(plugdict, fdict)
    call WriteFile('feature-unloadpre: '.s:_frawor.id)
endfunction
call s:_f.newfeature('testfeature'.s:_frawor.id[-1:], s:testfeature)
call WriteFile('Loaded '.s:_frawor.id)
