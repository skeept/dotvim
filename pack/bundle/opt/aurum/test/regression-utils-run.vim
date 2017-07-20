execute frawor#Setup('0.0', {'@%aurum/drivers/common/utils': '1.0'})
edit abc
call setline(1, 'cba')
tabedit def
call setline(1, 'fed')
tabprevious
call WriteFile(tabpagenr())
call WriteFile(string(s:_r.utils.run(['echo', 'abc'], 1, 0)))
call WriteFile(tabpagenr())
call WriteFile(getline(1))
call WriteFile(getbufline(2, 1))
