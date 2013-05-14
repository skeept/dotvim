execute frawor#Setup('0.0', {'@/functions': '0.0',
            \                   '@/checks': '0.0'})
function s:F.wrappedfunc(bool)
    call WriteFile('arg:'.a:bool)
endfunction
function s:F.filter(args)
    call WriteFile('filtering '.string(a:args))
    if empty(a:args)
        return [0]
    elseif (len(a:args)==1 && index([0, 1], a:args[0])!=-1)
        return a:args
    else
        return 0
    endif
endfunction
call s:_f.addextfunctions({'Function': {'function': s:F.wrappedfunc,
            \                            '@filter': s:F.filter,}})
call Function()
call Function(0)
call Function(1)
call Function(2)
