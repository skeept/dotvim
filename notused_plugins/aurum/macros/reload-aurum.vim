for s:plug in ['@%aurum/bufvars',
            \  '@%aurum/lineutils',
            \  '@%aurum/log/templates',
            \  '@aurum/cache',
            \  '@%aurum/drivers/common/xml',
            \  '@%aurum/drivers/common/utils',
            \  '@%aurum/drivers/common/hypsites',]
    try
        call FraworUnload(s:plug)
    catch /^Frawor:\(\\.\|[^:]\)\+:notloaded:/
    endtry
endfor
if has('python')
    python aurum=None
endif
unlet s:plug
for s:plug in ['plugin/aurum']
    execute 'runtime' s:plug.'.vim'
endfor
unlet s:plug
