execute frawor#Setup('0.0', {})
let s:_messages={'testmsg': 'This is a test message: %s'}
function s:F.testfeaturecons(plugdict, fdict)
    try
        call s:_f.throw('testmsg', 'test')
    catch /^Frawor:plugin\%x2Fplugin-with-feature:testmsg:This is a test message: test$/
        call WriteFile(v:exception, 'cons: '.a:plugdict.id)
    endtry
endfunction
function s:F.testfeatureload(plugdict, fdict)
    call WriteFile('feature-load: '.a:plugdict.id)
endfunction
call s:_f.newfeature('testfeature', {'cons': s:F.testfeaturecons,
            \                        'load': s:F.testfeatureload})

