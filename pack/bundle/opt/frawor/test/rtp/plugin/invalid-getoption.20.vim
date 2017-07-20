execute frawor#Setup('0.0', {'autoload/frawor/options': '0.0'})
let s:_oprefix='test'
function s:F.checker(option)
    call WriteFile('checker: '.string(a:option))
    return 0
endfunction
function s:F.filter(option)
    call WriteFile('filter: '.string(a:option))
    return 0
endfunction
let g:test_test='abc'
let s:_options={"test": {'filter': s:F.filter, 'checker': s:F.checker}}
call s:_f.getoption("test")
