execute frawor#Setup('0.0', {'autoload/frawor/mappings': '0.0'})
function s:Write(...)
    call WriteFile(a:000)
    return ""
endfunction
W* add
let s:mgroup=s:_f.mapgroup.add("", {'1': {'rhs': ':<C-u>call <SID>Write("a")<CR>', 'lhs': 'a'}},
            \                      {'mode': 'n'})
normal a
W* unmap
call s:_f.mapgroup.unmap(s:mgroup)
normal a
W* map
call s:_f.mapgroup.map(s:mgroup)
normal a
W* delete
call s:_f.mapgroup.del(s:mgroup)
normal a

