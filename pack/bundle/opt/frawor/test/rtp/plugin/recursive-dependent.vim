execute frawor#Setup('1.1', {'@recursive-dependent.2':    [1, 1],
            \                '@plugin-with-dependencies': [1, 1]})
call call("WriteFile", map(sort(keys(s:_frawor)),
            \               'v:val.": ".string(s:_frawor[v:val])'))

