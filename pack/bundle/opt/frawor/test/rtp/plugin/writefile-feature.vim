execute frawor#Setup('0.0', {})
function s:F.writefile(plugdict, fdict, ...)
    return call("WriteFile", a:000)
endfunction
call s:_f.newfeature('writefile', {'cons': s:F.writefile})

