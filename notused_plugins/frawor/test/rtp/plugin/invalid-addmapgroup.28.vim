execute frawor#Setup('0.0', {'autoload/frawor/mappings': '0.0'})
let g:frawormap_Mgroup_test=[{}]
try
    call s:_f.mapgroup.add("Mgroup", {'test': {'rhs': 'h', 'lhs': 'a'}})
catch /^Frawor:autoload\/frawor\/options:filfail:/
endtry

