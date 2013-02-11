execute frawor#Setup('0.0', {'@/functions': '0.0',
            \     '@/decorators/altervars': '0.0'})
let matches=getmatches()
function s:F.wrappedfunc(...)
    call clearmatches()
    match ErrorMsg /error/
    if g:matches !=# getmatches()
        call WriteFile('notmatch')
    else
        call WriteFile('match')
    endif
endfunction
let Function=s:_f.wrapfunc({'function': s:F.wrappedfunc,
            \             '@altervars': [['+matches']]})
call call(Function, [], {})
if matches !=# getmatches()
    call WriteFile('notmatch')
else
    call WriteFile('match')
endif
