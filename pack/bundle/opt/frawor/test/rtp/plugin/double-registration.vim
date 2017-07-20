function s:Eval(expr)
    return eval(a:expr)
endfunction
let s:_sid=+matchstr(s:Eval('expand("<sfile>")'), '\m\d\+')
let s:_sfile=expand('<sfile>:p')
call FraworRegister([0, 0], s:_sid, s:_sfile, {}, s:)
delfunction s:Eval
