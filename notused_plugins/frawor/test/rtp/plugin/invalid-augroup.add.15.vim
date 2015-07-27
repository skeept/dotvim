execute frawor#Setup('0.0', {'autoload/frawor/autocommands': '0.0',})
call s:_f.augroup.add('test', [["BufAdd", "*", 0, "echo 'Foo'"],
            \                  ["BufAdd", "*", 0, {'function': function("s:Eval")}]])
