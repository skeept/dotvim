execute frawor#Setup('0.0', {'@/functions': '0.0',
            \     '@/decorators/altervars': '0.0'})
function s:F.getvars(v)
    let r=[]
    for varname in sort(keys(eval(a:v)))
        call add(r, a:v.varname.': ')
        if type(eval(a:v.varname))==2
            let r[-1].='function('.(string(g:{varname})[10:-3]-s:funcshift).')'
        else
            let r[-1].=string(g:{varname})
        endif
    endfor
    return r
endfunction
function s:F.wrappedfunc(...)
    let r=s:F.getvars('g:')
    call add(r, 'args: ('.string(a:000)[1:-2].')')
    call WriteFile(r)
    let g:outfile='xxx'
endfunction
let s:funcshift=+string(s:F.wrappedfunc)[10:-3]
let Function=s:_f.wrapfunc({'function': s:F.wrappedfunc,
            \             '@altervars': [['g:testfile', []],
            \                            ['g:xxx_new_var', 0],
            \                            ['g:outfile']]})
call WriteFile(s:F.getvars('g:'))
call WriteFile('>>>')
call call(Function, [], {})
call WriteFile('<<<')
call WriteFile(s:F.getvars('g:'))
