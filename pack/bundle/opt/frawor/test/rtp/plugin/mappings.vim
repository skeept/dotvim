execute frawor#Setup('0.0', {'@/mappings': '0.0',
            \                 '@mappings': '0.0',})
function s:F.mapfunc(...)
    call WriteFile('args: ('.string(a:000)[1:-2].')')
    return ""
endfunction
call s:_f.mapgroup.add('Mgroup', { 'alpha': {'rhs': '<C-o>:W α<CR>',
            \                                'lhs': 'a',
            \                               'mode': 'i',},
            \                       'beta': {'rhs': ':<C-u>W β<CR>',
            \                                'lhs': 'a',},
            \                      'gamma': {'rhs': ':<C-u>W γ<CR>',}})

call s:_f.mapgroup.add('Mgroup2', {'delta': {'rhs': ':<C-u>W δ<CR>',
            \                                'lhs': 'd',},
            \                    'epsilon': {'rhs': ':<C-u>W ε<CR>',}})

call s:_f.mapgroup.add('Agroup', {  'zeta': {'rhs': '<C-o>:W ζ<CR>zeta',
            \                                'lhs': 'f',},
            \                        'eta': {'rhs': '<C-o>:W η<CR>eta',
            \                                'lhs': 0,},
            \}, {'type': 'abbr'})

call s:_f.mapgroup.add('Mgroup3', { 'iota': {'rhs': ["%lhs", "%mode",
            \                                        ["def"], "%mgid",
            \                                        "%mname", ["abc"]],
            \                               'func': s:F.mapfunc,},
            \                      'kappa': {'rhs': s:F.mapfunc,},})
