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
call s:_f.addextfunctions({'Function': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['+winview']]}})
call Function()
if winview !=# winsaveview()
    call WriteFile('notmatch')
else
    call WriteFile('match')
endif
