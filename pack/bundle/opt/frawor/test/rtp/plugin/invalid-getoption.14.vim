execute frawor#Setup('0.0', {'autoload/frawor/options': '0.0'})
let s:_oprefix='test'
let s:_options={"test": {}}
call s:_f.getoption("test", 'a')
