execute frawor#Setup('0.0', {'@/functions': '0.0',
            \     '@/decorators/altervars': '0.0'})
function s:F.getvars(v)
    let r=[]
    for varname in sort(keys(eval(a:v)))
        call add(r, a:v.varname.': '.string(g:{varname}))
    endfor
    return r
endfunction
function s:F.wrappedfunc(...)
    let r=s:F.getvars('g:')
    call add(r, 'args: ('.string(a:000)[1:-2].')')
    call WriteFile(r)
    let g:outfile='xxx'
endfunction
call s:_f.addextfunctions({'Function': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['g:testfile', []],
            \                                        ['g:xxx_new_var', 0],
            \                                        ['g:outfile']]}})
call WriteFile(s:F.getvars('g:'))
call WriteFile('>>>')
call Function()
call WriteFile('<<<')
call WriteFile(s:F.getvars('g:'))
