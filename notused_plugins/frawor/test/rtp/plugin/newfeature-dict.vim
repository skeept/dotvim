execute frawor#Setup('0.0', {'plugin/newfeature-dict': '0.0'})
function s:F.feature(plugdict, fdict, ...)
    let a:fdict.calls+=1
    call WriteFile('args: ('.string(a:000)[1:-2].')',
                \  'fdict: '.string(a:fdict))
endfunction
function s:F.feature2(plugdict, fdict, ...)
    let a:fdict.calls+=1
    call WriteFile('args2: ('.string(a:000)[1:-2].')',
                \  'fdict2: '.string(a:fdict))
endfunction
let feature={'cons': s:F.feature, 'inner': {'cons': s:F.feature2}}
let feature.feature=feature
call s:_f.newfeature('test', {'cons': feature, 'init': {'calls': 0}})
call s:_f.test.cons(1)
call s:_f.test.inner.cons(2)
call s:_f.test.feature.cons(3)
call s:_f.test.feature.inner.cons(4)
