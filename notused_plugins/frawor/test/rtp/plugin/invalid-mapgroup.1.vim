execute frawor#Setup('0.0', {'autoload/frawor/mappings': '0.0'})
call s:_f.mapgroup.add('Mgroup', {'mapping': {'rhs': 'abc', 'lhs': 'a'}},
            \                    {'buffer': 0})
call s:_f.mapgroup.map(0)

