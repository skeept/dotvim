execute frawor#Setup('0.0', {'@/functions': '0.0',
            \     '@/decorators/altervars': '0.0'})
function s:F.getvars(v)
    let r=[]
    let d=eval(a:v)
    for varname in sort(keys(d))
        call add(r, a:v.varname.': ')
        if type(d[varname])==2
            let r[-1].='function('.(string(d[varname])[10:-3]-s:funcshift).')'
        else
            let r[-1].=string(d[varname])
        endif
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
let s:funcshift=+string(s:F.wrappedfunc)[10:-3]
let Function=s:_f.wrapfunc({'function': s:F.wrappedfunc,
            \             '@altervars': [['+variables'],
            \                            ['+variables(b)', {'xxx_new_var_2': 0}],
            \                            ['+variables(w)']]})
call WriteFile(s:F.getvars('g:')+s:F.getvars('b:')+s:F.getvars('w:'))
call WriteFile('>>>')
call call(Function, [], {})
call WriteFile('<<<')
call WriteFile(s:F.getvars('g:')+s:F.getvars('b:')+s:F.getvars('w:'))
