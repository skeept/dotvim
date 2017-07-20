execute frawor#Setup('0.0', {'plugin/postresource-single': '0.0'})
call WriteFile(expand('<sfile>:t:r:e').': '.string(s:_r))
let s:_r.single.abc="def"

