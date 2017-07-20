execute frawor#Setup('0.0',      {'@/functions': '0.0',
            \          '@/decorators/altervars': '0.0',
            \'@wrapfunc_cons-alter-special-new': '0.0'})
function s:F.writevar()
    if exists('g:abc')
        call WriteFile('g:abc: '.string(g:abc))
    else
        call WriteFile('~g:abc')
    endif
endfunction
function s:F.chkabc(arg)
    call WriteFile('checking '.string(a:arg))
    return 1
endfunction
function s:F.addabc(...)
    let g:abc=get(a:000, 0, 'abc')
    return get(g:, 'abc', 0)
endfunction
function s:F.delabc(...)
    call WriteFile('delabc: ('.string(a:000)[1:-2].')')
    unlet g:abc
endfunction
function s:F.wrappedfunc(...)
    call WriteFile('w-g:abc: '.string(g:abc))
endfunction
call s:_f.addaltspecial('abc', s:F.addabc, s:F.delabc)
call s:_f.addaltspecial('abc2', s:F.addabc, s:F.delabc, {'acceptsarg': 1})
call s:_f.addaltspecial('abc3', s:F.addabc, s:F.delabc, {'requiresarg': 1})
call s:_f.addaltspecial('abc4', s:F.addabc, s:F.delabc, {'checker': s:F.chkabc,
            \                                        'requiresarg': 1})
call s:_f.addaltspecial('abc5', s:F.addabc, s:F.delabc, {'checker': s:F.chkabc,
            \                                         'acceptsarg': 1})
let Function=s:_f.wrapfunc({'function': s:F.wrappedfunc,
            \             '@altervars': [['+abc']]})
let Function2=s:_f.wrapfunc({'function': s:F.wrappedfunc,
            \              '@altervars': [['+abc2']]})
let Function22=s:_f.wrapfunc({'function': s:F.wrappedfunc,
            \               '@altervars': [['+abc2(l)']]})
let Function3=s:_f.wrapfunc({'function': s:F.wrappedfunc,
            \              '@altervars': [['+abc3(l)']]})
let Function4=s:_f.wrapfunc({'function': s:F.wrappedfunc,
            \              '@altervars': [['+abc4(l)']]})
let Function5=s:_f.wrapfunc({'function': s:F.wrappedfunc,
            \              '@altervars': [['+abc5(l)']]})
let Function52=s:_f.wrapfunc({'function': s:F.wrappedfunc,
            \               '@altervars': [['+abc5']]})
call s:F.writevar()
call WriteFile('>>>')
call call(Function, [], {})
call call(Function2, [], {})
call call(Function22, [], {})
call call(Function3, [], {})
call call(Function4, [], {})
call call(Function5, [], {})
call call(Function52, [], {})
call WriteFile('<<<')
call s:F.writevar()
