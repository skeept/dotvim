execute frawor#Setup('1.1', {'plugin/recursive-dependent': [1]})
call call("WriteFile", map(sort(keys(s:_frawor)),
            \               'v:val.": ".string(s:_frawor[v:val])'))

