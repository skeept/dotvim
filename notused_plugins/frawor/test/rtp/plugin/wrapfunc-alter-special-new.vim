execute frawor#Setup('0.0', {'@/functions': '0.0',
            \     '@/decorators/altervars': '0.0',
            \'@wrapfunc-alter-special-new': '0.0'})
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
call s:_f.addextfunctions({'Function': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['+abc']]},
            \             'Function2': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['+abc2']]},
            \            'Function22': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['+abc2(l)']]},
            \             'Function3': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['+abc3(l)']]},
            \             'Function4': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['+abc4(l)']]},
            \             'Function5': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['+abc5(l)']]},
            \            'Function52': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['+abc5']]},
            \             })
call s:F.writevar()
call WriteFile('>>>')
call Function()
call Function2()
call Function22()
call Function3()
call Function4()
call Function5()
call Function52()
call WriteFile('<<<')
call s:F.writevar()
