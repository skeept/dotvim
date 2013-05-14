execute frawor#Setup('0.0', {'plugin/postresource-many': '0.0'})
call WriteFile(expand('<sfile>:t:r:e').': '.
            \join(sort(map(items(s:_r), 'string(v:val)'))))
