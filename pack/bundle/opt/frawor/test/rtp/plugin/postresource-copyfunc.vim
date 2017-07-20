execute frawor#Setup('0.0', {'@/resources': '0.0'})
let s:d={}
call s:_f.postresource('sd0', s:d, 0)
call s:_f.postresource('sd1', s:d, 1)
let s:d.def=1
call s:_f.postresource('sdf', '{"abc": 1}', function('eval'))

