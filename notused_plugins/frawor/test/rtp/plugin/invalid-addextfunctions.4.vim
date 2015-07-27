execute frawor#Setup('0.0', {'@/functions': '0.0'})
function s:F.redefineself()
    call s:_f.addextfunctions({'Function': {'function': s:F.redefineself,
                \                           'redefine': 1}})
endfunction
call s:_f.addextfunctions({'Function': {'function': s:F.redefineself}})
call Function()
