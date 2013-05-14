"▶1
scriptencoding utf-8
execute frawor#Setup('0.0', {'@/resources': '0.0',})
let s:resource={}
"▶1 crnl :: [String] → [String]
function s:F.crnl(text)
    let r=['']
    for crsplit in map(copy(a:text), 'split(v:val, "\r", 1)')
        let r[-1].="\r".crsplit[0]
        call extend(r, crsplit[1:])
    endfor
    if empty(r[0])
        call remove(r, 0)
    else
        let r[0]=r[0][1:]
    endif
    return r
endfunction
"▶1 parsecmdarg :: + v:cmdarg + opts → Dictionary
function s:F.parsecmdarg()
    let r={}
    for arg in filter(split(v:cmdarg),
                \     'v:val =~# ''\V\^++\v%(%(enc|ff)\=|%(no)?bin)''')
        let idx=stridx(arg, '=')
        let r[arg[2]]=arg[(idx+1):]
    endfor
    if has_key(r, 'b')
        let r.b=1
    elseif has_key(r, 'n')
        let r.b=0
        unlet r.n
    endif
    return r
endfunction
"▶1 getopts :: Bool → Dictionary
function s:F.getopts()
    let r=s:F.parsecmdarg()
    if !has_key(r, 'b')
        let r.b=&binary
    endif
    if !has_key(r, 'e') && !empty(&fileencoding)
        let r.e=&fileencoding
    endif
    if has_key(r, 'e') && r.e is# &encoding
        unlet r.e
    endif
    if !has_key(r, 'f')
        let r.f=&fileformat
    endif
    return r
endfunction
"▶1 setlines :: [String], read::Bool → + buffer
function s:resource.setlines(lines, read)
    let lines=a:lines
    if !empty(v:cmdarg)
        let a=s:F.parsecmdarg()
        if has_key(a, 'f') && !(has_key(a, 'b') && a.b) && !&binary
            if a.f is# 'dos'
                let lines=map(copy(lines), 'v:val[-1:] is# "\r" ? '.
                            \                   'v:val[:-2] : '.
                            \                   'v:val')
            elseif a.f is# 'mac'
                let lines=s:F.crnl(lines)
            endif
            if !a:read
                let &l:fileformat=a.f
            endif
        endif
        if has_key(a, 'e')
            let lines=map(copy(lines), 'iconv(v:val, "'.(a.e).'", "'.&enc.'")')
            if !a:read
                let &l:fileencoding=a.e
            endif
        endif
        if !a:read && has_key(a, 'b')
            let &l:binary=a.b
        endif
    endif
    let d={'set': function((a:read)?('append'):('setline'))}
    if len(lines)>1 && empty(lines[-1])
        call d.set('.', lines[:-2])
    else
        if !a:read
            setlocal binary noendofline
        endif
        call d.set('.', lines)
    endif
endfunction
"▶1 wtransform :: [String] → [String] +? [String]
function s:resource.wtransform(lines)
    let r=a:lines
    let a=s:F.getopts()
    if a.b
        if &endofline
            call add(r, '')
        endif
    else
        call add(r, '')
        if a.f is# 'dos'
            call map(r, 'v:val."\n"')
        elseif a.f is# 'mac'
            let r=s:F.crnl(r)
        endif
    endif
    if has_key(a, 'e')
        call map(r, 'iconv(v:val, "'.&encoding.'","'.(a.e).'")')
    endif
    return r
endfunction
"▶1 Post resource
call s:_f.postresource('lineutils', s:resource)
"▶1
call frawor#Lockvar(s:, '')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
