execute frawor#Setup('0.0', {'plugin/writefile-feature': '0'})
function s:F.testfeaturecons(plugdict, fdict)
    call s:_f.writefile('cons: '.a:plugdict.id)
endfunction
function s:F.testfeatureload(plugdict, fdict)
    call s:_f.writefile('load: '.a:plugdict.id)
endfunction
function s:F.testfeatureunload(plugdict, fdict)
    call s:_f.writefile('unload: '.a:plugdict.id)
endfunction
function s:F.testfeatureregister(plugdict, fdict)
    call s:_f.writefile('register: '.a:plugdict.id)
endfunction
function s:F.testfeatureunloadpre(plugdict, fdict)
    call s:_f.writefile('unloadpre: '.a:plugdict.id)
endfunction
function s:._unload()
    call s:_f.writefile('_unload')
endfunction
call s:_f.newfeature('testfeature', {'cons': s:F.testfeaturecons,
            \                        'load': s:F.testfeatureload,
            \                      'unload': s:F.testfeatureunload,
            \                    'register': s:F.testfeatureregister,
            \                   'unloadpre': s:F.testfeatureunloadpre,
            \                  'ignoredeps': 1,})

