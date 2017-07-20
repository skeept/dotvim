execute frawor#Setup('0.0', {'@/mappings': '0.0',
            \       '@invalid-mapgroup.6': '0.0',})
call s:_f.mapgroup.add('Mgroup', {'mapping': {'rhs': 'abc', 'lhs': 'a'}},
            \                    {'buffer': 0})
call s:_f.mapgroup.unmap('Mgroup', 0)

