execute frawor#Setup('0.0', {'autoload/frawor/autocommands': '0.0',})
call s:_f.augroup.add('aug', [['BufNew', '*', 0, 'echo "abc"']])
