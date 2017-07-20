function s:Eval(expr)
    return eval(a:expr)
endfunction
let s:_sid=+matchstr(s:Eval('expand("<sfile>")'), '\m\d\+')
let s:_sfile=expand('<sfile>:p')
call FraworRegister([0, 0], s:_sid, s:_sfile, {'@/mappings': [0, 0]}, s:)
call s:_f.mapgroup.add('Mgroup', {'mapping': {'rhs': 'abc', 'lhs': 'a'}},
            \                    {'buffer': 0})
call FraworRegister(0, s:_sid, s:_sfile, {'@/mappings': [0, 0]}, s:)
call s:_f.mapgroup.unmap('Mgroup', 1)

