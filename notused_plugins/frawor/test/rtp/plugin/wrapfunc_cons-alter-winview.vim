execute frawor#Setup('0.0', {'@/functions': '0.0',
            \     '@/decorators/altervars': '0.0'})
call setline('.', range(0, 10))
let winview=winsaveview()
function s:F.wrappedfunc(...)
    normal! G
    if g:winview !=# winsaveview()
        call WriteFile('notmatch')
    else
        call WriteFile('match')
    endif
endfunction
let Function=s:_f.wrapfunc({'function': s:F.wrappedfunc,
            \             '@altervars': [['+winview']]})
call call(Function, [], {})
if winview !=# winsaveview()
    call WriteFile('notmatch')
else
    call WriteFile('match')
endif
