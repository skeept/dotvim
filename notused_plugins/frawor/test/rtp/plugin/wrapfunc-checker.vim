execute frawor#Setup('0.0', {'@/functions': '0.0',
            \                   '@/checks': '0.0'})
function s:F.wrappedfunc(bool)
    call WriteFile('arg:'.a:bool)
endfunction
function s:F.checker(args)
    call WriteFile('checking '.string(a:args))
    return (len(a:args)==1 && index([0, 1], a:args[0])!=-1)
endfunction
call s:_f.addextfunctions({'Function': {'function': s:F.wrappedfunc,
            \                           '@checker': s:F.checker,}})
call Function(0)
call Function(1)
call Function(2)
