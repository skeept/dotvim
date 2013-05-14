execute frawor#Setup('0.0', {'autoload/frawor/options': '0.0'})
let s:_options={"test": {'scopes': 'a'}}
call s:_f.getoption("test")
