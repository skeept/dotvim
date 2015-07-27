execute frawor#Setup('0.0', {'autoload/frawor/mappings': '0.0'})
W+ test
call s:_f.mapgroup.add('Buffer', {'test': {'rhs': ":W test\n", 'lhs': "a"}},
            \                    {'buffer': 1, 'mode': 'n'})
normal b
normal a

W> 2
new
normal b
normal a

W+ tset
call s:_f.mapgroup.add('Buffer', {'tset': {'rhs': ":W tset\n", 'lhs': "b"}},
            \                    {'mode': 'n'})
normal b
normal a

W> 1
wincmd p
normal b
normal a

W<
