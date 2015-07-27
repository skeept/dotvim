execute frawor#Setup('1.1', {'plugin/register-return-value': [0]})
call call("WriteFile", map(sort(keys(s:_frawor)),
            \               'v:val.": ".string(s:_frawor[v:val])'))

