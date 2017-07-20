execute frawor#Setup('0.0', {'@/functions': '0.0',
            \     '@/decorators/altervars': '0.0',
            \                   '@/checks': '0.0'})
function s:F.wrappedfunc()
    call WriteFile('funcbefore:b'.bufnr('%'))
    new
    call WriteFile('funcafter:b'.bufnr('%'))
endfunction
function s:F.checker(args)
    call WriteFile('checkerbefore:b'.bufnr('%'))
    new
    call WriteFile('checkerafter:b'.bufnr('%'))
    return empty(a:args)
endfunction
function s:F.filter(args)
    call WriteFile('filterbefore:b'.bufnr('%'))
    new
    call WriteFile('filterafter:b'.bufnr('%'))
    return empty(a:args) ? a:args : 0
endfunction
call s:_f.addextfunctions({'Function': {'function': s:F.wrappedfunc,
            \                           '@checker': s:F.checker,
            \                            '@filter': s:F.filter,
            \                         '@altervars': [['+buffer']]}})
call WriteFile('start:b'.bufnr('%'))
call Function()
call WriteFile('end:b'.bufnr('%'))
call Function(0)
