execute frawor#Setup('0.0', {'autoload/frawor/mappings': '0.0'})
call s:_f.mapgroup.add("Mgroup", {'test': {'rhs': ':browse e<CR>', 'lhs': 'Browse.Edit', 'tip': 0}}, {'type': 'menu'})

