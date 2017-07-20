execute frawor#Setup('0.0', {'autoload/frawor/options': '0.0'})
let s:_options={"test": {'override': 'a'}}
call s:_f.getoption("test")
