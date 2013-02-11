execute frawor#Setup('0.0', {'@/functions': '0.0',
            \     '@/decorators/altervars': '0.0'})
function s:F.getopts()
    let r=[]
    for optname in sort(['list', 'fmr'])
        call add(r, '&l:'.optname.': '.string(eval('&l:'.optname)))
        call add(r, '&g:'.optname.': '.string(eval('&g:'.optname)))
    endfor
    return r
endfunction
function s:F.wrappedfunc(...)
    setlocal nolist
    setglobal list
    let r=s:F.getopts()
    call add(r, 'args: ('.string(a:000)[1:-2].')')
    call WriteFile(r)
endfunction
call s:_f.addextfunctions({'Function': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['&g:testfile', ['ignored']],
            \                                        ['&g:list'],
            \                                        ['&l:list'],
            \                                        ['&g:fmr', '+++,---'],
            \                                        ['&l:fmr', '---,+++']]}})
call WriteFile(s:F.getopts())
call WriteFile('>>>')
call Function()
call WriteFile('<<<')
call WriteFile(s:F.getopts())
