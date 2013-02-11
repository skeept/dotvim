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
call s:_f.addextfunctions({'Function': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['+matches']]}})
call Function()
if matches !=# getmatches()
    call WriteFile('notmatch')
else
    call WriteFile('match')
endif
