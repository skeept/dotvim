execute frawor#Setup('0.0', {'@/table': '0.0'})
hi PreProc ctermfg=Blue
hi User1   ctermfg=Red
hi User2   ctermfg=Green
call s:_r.printtable([['abc def', 'ghi', 'jklmno'],
            \         ["a\ts", '-']])
call s:_r.printtable([['abc def', 'ghi', 'jklmno'],
            \         ["a\ts", '-']], {'header': ['A', 'B', 'C']})
call s:_r.printtable([['abc def', 'ghi', 'jklmno'],
            \         ["a\ts", '-']], {'header': ['A', 'B', 'C'],
            \                          'halign': 'center'})
call s:_r.printtable([['abc def', 'ghi', 'jklmno'],
            \         ["a\ts", '-']], {'header': ['A', 'B', 'C'],
            \                         'haligns': ['left', 'center', 'right']})
call s:_r.printtable([['abc def', 'ghi', 'jklmno'],
            \         ["a\ts", '-']], {'header': ['A', 'B', 'C'],
            \                         'haligns': ['left', 'center', 'right']})
call s:_r.printtable([['abc def', 'ghi', 'jklmno'],
            \         ["a\ts", '-'],
            \         ['+', '-', ':']], {'header': ['A', 'B', 'C'],
            \                            'aligns': ['left', 'center', 'right']})
call s:_r.printtable([['abc def', 'ghi', 'jklmno'],
            \         ["a\ts", '-'],
            \         ['+', '-', ':']], {'header': ['A', 'B', 'C'],
            \                             'align': 'center'})
call s:_r.printtable([['abc def', 'ghi', 'jklmno'],
            \         ["a\ts", '-'],
            \         ['+', '-', ':']], {'header': ['A', 'B', 'C'],
            \                       'vseparators': [' | ', ' + ']})
call s:_r.printtable([['abc def', 'ghi', 'jklmno'],
            \         ["a\ts", '-'],
            \         ['+', '-', ':']], {'header': ['A', 'B', 'C'],
            \                        'vseparator': ' | '})

call s:_r.printtable([['abc def', 'ghi', 'jklmno'],
            \         ["a\ts", '-']], {'header': ['A', 'B', 'C'], 'hl': 'User1'})
call s:_r.printtable([['abc def', 'ghi', 'jklmno'],
            \         ["a\ts", '-']], {'header': ['A', 'B', 'C'], 'hls': ['User1', 'User2']})
call s:_r.printtable([['abc def', 'ghi', 'jklmno'],
            \         ["a\ts", '-'],
            \         ['+', '-', ':']], {'header': ['A', 'B', 'C'],
            \                       'vseparators': [[' | ', 'User2'], ' + ']})
