execute frawor#Setup('0.0', {'@/mappings': '0.0',
            \               '@/functions': '0.0'})
let s:mappings={'lambda': {'rhs': {}, 'lhs': 'k', 'args': ["%lhs"]}}
call s:_f.mapgroup.add('MG', s:mappings)
function s:mappings.lambda.rhs.function(...)
    call WriteFile('lambda: ('.string(a:000)[1:-2].')')
    return ""
endfunction
