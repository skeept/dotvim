execute frawor#Setup('0.0', {'autoload/frawor/options': '0.0'})
let s:_options={"test": {'scopes': 0}}
call s:_f.getoption("test")
