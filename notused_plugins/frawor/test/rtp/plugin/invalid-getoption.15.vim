execute frawor#Setup('0.0', {'autoload/frawor/options': '0.0'})
let s:_oprefix='test'
let s:_options={"test": {'merger': 'extend'}}
call s:_f.getoption("test")
