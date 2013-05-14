execute frawor#Setup('0.0', {'@/mappings': '0.0',
            \               '@/functions': '0.0'})
function s:F.opfunc(...)
    call WriteFile('args: ('.string(a:000)[1:-2].')')
endfunction
function s:F.strfunc(...)
    return [3, 0, 0]
endfunction
call s:_f.mapgroup.add('OMG', {'1': {'rhs': s:F.opfunc,
            \                        'lhs': 'α',
            \                   'operator':  1,
            \                       'mode': ' !',},
            \                  '2': {'rhs': ["%lhs"],
            \                        'lhs': 'β',
            \                       'func': s:F.opfunc,
            \                   'operator':  1,
            \                       'mode': ' !',},
            \                  '3': {'rhs': {'function': s:F.opfunc},
            \                        'lhs': 'γ',
            \                       'args': ['%str'],
            \                    'strfunc': s:F.strfunc,
            \                   'operator':  1,
            \                       'mode': ' !',},
            \})

