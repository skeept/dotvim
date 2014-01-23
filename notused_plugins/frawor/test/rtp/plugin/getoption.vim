execute frawor#Setup('0.0', {'autoload/frawor/options': '0.0'})
function s:F.filter(args)
    return [filter(a:args[0], 'type(v:val)=='.type("").
                \                   ' && v:val=~#"\\vdef|var|dict"')]
endfunction
function s:F.checker(args)
    return 1
endfunction
function s:F.merger(a, b, oid, plid, ovar)
    return extend(a:a, a:b, 0)
endfunction
let s:_options={
            \ 1 : {},
            \'2': {'scopes': 'tw'},
            \'!': {'checker': s:F.checker},
            \'_': {'filter': s:F.filter},
            \'+': {'merger': 'extend'},
            \'a': {'scopes': 'wtbg',
            \     'checker': s:F.checker,
            \      'filter': s:F.filter,
            \      'merger': s:F.merger,
            \     'default': ['default']},
            \'F': {'default': function("tr")},
            \'b': {'default': '1',
            \      'merger': 'extend',
            \      'override': 'g',},
        \}
function s:F.writeoption(...)
    call WriteFile('('.string(a:000)[1:-2].'): '.
                \       string(call(s:_f.getoption, a:000, {})))
endfunction
function s:F.testoptions(...)
    let oldvars=map([g:, b:, t:, w:], 'deepcopy(v:val)')
    call map(copy(a:000), 'call(s:F.writeoption, v:val, {})')
    for vardictname in ['g:', 'b:', 't:', 'w:']
        if eval(vardictname)!=#remove(oldvars, 0)
            call WriteFile('!!! '.vardictname)
        endif
    endfor
endfunction

let b:getoptionOptions={}
let g:getoptionOptions={}

let b:getoptionOptions.1='abc'
let b:getoption_1='def'
let g:getoption_1='ghi'
call s:F.testoptions(['1'], ['1', 'g'])

let g:getoption_2='g'
let b:getoption_2='b'
let t:getoption_2='t'
let w:getoption_2='w'
call s:F.testoptions(['2'], ['2', 'wt'])

let b:getoptionOptions['!']='!b'
let g:getoptionOptions['!']='!g'
call s:F.testoptions(['!'])

let g:getoptionOptions._=["abcdef", "ghi"]
call s:F.testoptions(['_'])

let g:getoptionOptions['+']='g'
let b:getoptionOptions['+']='b'
call s:F.testoptions(['+'])

let g:getoptionOptions.a=['gdict']
let g:getoption_a=       ['gvar']
let b:getoptionOptions.a=['bdict']
let b:getoption_a=       ['bvar']
let t:getoptionOptions={'a': ['tdict']}
let t:getoption_a=       ['tvar']
let w:getoption_a=       ['wvar']
call s:F.testoptions(['a'])

let g:getoptionOptions.F=function('string')
call s:F.testoptions(['F'])
call s:F.testoptions(['F', 'b'])

call s:F.testoptions(['b'])
let b:getoption_b='b'
call s:F.testoptions(['b'])
let g:getoption_b='g'
call s:F.testoptions(['b'])
