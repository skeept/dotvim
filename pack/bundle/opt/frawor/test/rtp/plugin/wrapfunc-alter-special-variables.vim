execute frawor#Setup('0.0', {'@/functions': '0.0',
            \     '@/decorators/altervars': '0.0'})
function s:F.getvars(v)
    let r=[]
    let d=eval(a:v)
    for varname in sort(keys(d))
        call add(r, a:v.varname.': '.string(d[varname]))
    endfor
    return r
endfunction
function s:F.wrappedfunc(...)
    let g:outfile='xxx'
    let g:xxx_new_var=['abc']
    let b:xxx_new_var=0
    let w:xxx_new_var=1
    unlet g:testfile
    let r=s:F.getvars('g:')+s:F.getvars('b:')+s:F.getvars('w:')
    call add(r, 'args: ('.string(a:000)[1:-2].')')
    call WriteFile(r)
endfunction
call s:_f.addextfunctions({'Function': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['+variables'],
            \                                        ['+variables(b)', {'xxx_new_var_2': 0}],
            \                                        ['+variables(w)']]}})
call WriteFile(s:F.getvars('g:')+s:F.getvars('b:')+s:F.getvars('w:'))
call WriteFile('>>>')
call Function()
call WriteFile('<<<')
call WriteFile(s:F.getvars('g:')+s:F.getvars('b:')+s:F.getvars('w:'))
