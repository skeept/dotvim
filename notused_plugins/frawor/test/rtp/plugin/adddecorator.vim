execute frawor#Setup('0.0', {'@/functions': '0.0',
            \              '@adddecorator': '0.0',
            \               '@/decorators': '0.0',
            \     '@/decorators/altervars': '0.0',
            \                   '@/checks': '0.0'})
function s:F.testdecorator(plugdict, ...)
    call WriteFile('decargs: {'.a:plugdict.id.'}, '.string(a:000)[1:-2])
    return [10, '@@@', 0, ['try',
                \              'call WriteFile("[[[")'],
                \         ['finally',
                \              'call WriteFile("]]]")',
                \          'endtry'], 0]
endfunction
function s:F.test2decorator(plugdict, ...)
    call WriteFile('dec2args: {'.a:plugdict.id.'}, '.string(a:000)[1:-2])
    return [255, 'ags', 0, ['try',
                \               'call WriteFile("<<<")',
                \               'let ags=[]'],
                \          ['finally',
                \               'call WriteFile(">>>")',
                \           'endtry'], 0]
endfunction
function s:F.privdecorator(plugdict, ...)
    call WriteFile('privdecargs: {'.a:plugdict.id.'}, '.string(a:000)[1:-2])
    return [256, '@%@', a:000[-1], ['try',
                \                       'let @%@+=@@@'],
                \                  ['finally',
                \                       'call WriteFile("priv: ".string(@%@))',
                \                       'let @%@=[@%@]',
                \                   'endtry'], 0]
endfunction
function s:F.lvardecorator(plugdict, ...)
    call WriteFile('lvardecargs: {'.a:plugdict.id.'}, '.string(a:000)[1:-2])
    return [512, '@$@_args', a:000[-1], ['let @$@=len(@@@)',
                \                        'let @$@_args=[@$@]+@@@',],
                \                       [], 0]
endfunction
function s:F.reqretdecorator(plugdict, ...)
    call WriteFile('reqretdecargs: {'.a:plugdict.id.'}, '.string(a:000)[1:-2])
    return [1024, '@@@', 0, [], ['call WriteFile("retval: ".@=@)'], 1]
endfunction
function s:F.reqret2decorator(plugdict, ...)
    call WriteFile('reqret2decargs: {'.a:plugdict.id.'}, '.string(a:000)[1:-2])
    return [9,'@@@',0, [], ['call WriteFile("retval2: ".@=@)', 'let @=@=0'], 1]
endfunction
function s:F.filter(args)
    return ((empty(a:args))?(a:args):(0))
endfunction
function s:F.filter2(args)
    return ((empty(a:args))?(0):(a:args))
endfunction
function s:F.wrappedfunc(...)
    call WriteFile('args: ('.string(a:000)[1:-2].')')
    return string(a:000)
endfunction
call s:_f.adddecorator('test', s:F.testdecorator)
call s:_f.adddecorator('test2', s:F.test2decorator)
call s:_f.adddecorator('priv', s:F.privdecorator)
call s:_f.adddecorator('lvar', s:F.lvardecorator)
call s:_f.adddecorator('reqret2', s:F.reqret2decorator)
call s:_f.adddecorator('reqret', s:F.reqretdecorator)
call s:_f.addextfunctions({'Function': {'function': s:F.wrappedfunc,
            \                              '@test': "abc",
            \                         '@altervars': [],},
            \             'Function2': {'function': s:F.wrappedfunc,
            \                              '@test': "abc",
            \                             '@test2': "def",
            \                              '@priv': [0],
            \                            '@filter': s:F.filter,
            \                         '@altervars': [],},
            \             'Function3': {'function': s:F.wrappedfunc,
            \                              '@priv': [2],
            \                              '@lvar': 1,},
            \             'Function4': {'function': s:F.wrappedfunc,
            \                              '@test': "abc",
            \                              '@priv': [0],
            \                            '@filter': s:F.filter2,
            \                            '@reqret': "ghi",
            \                           '@reqret2': "jkl",
            \                         '@altervars': [],},
            \})
call Function(0)
call Function2(0)
call Function3(1)
call Function3(3)
call Function4(["abc"])
