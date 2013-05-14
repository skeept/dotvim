"▶1
scriptencoding utf-8
execute frawor#Setup('1.2', {'@/resources': '0.0',
            \                       '@/os': '0.2',
            \                   '@/python': '1.0',})
let s:utils={}
"▶1 _unload
function s:._unload()
python <<EOF
try :
    reload(aurum.auutils)
except Exception :
    pass
EOF
endfunction
"▶1 utils.kwargstolst :: kwargs → [str]
function s:utils.kwargstolst(kwargs)
    let r=[]
    for [key, value] in filter(items(a:kwargs), 'v:val[1] isnot 0')
        let long=(len(key)>1)
        let r+=[repeat('-', 1+long).key]
        if value is 1
            continue
        elseif type(value)==type([])
            let k=remove(r, -1)
            let r+=map(copy(value), 'k.'.(long? '"=".': '').'v:val')
        else
            let r[-1].=(long? '=': '').value
        endif
        unlet value
    endfor
    return r
endfunction
"▶1 utils.getcmd :: cmd, args, kwargs → sh
function s:utils.getcmd(cmd, args, kwargs)
    let cmd=[a:cmd]
    if !empty(a:kwargs)
        let cmd+=s:utils.kwargstolst(a:kwargs)
    endif
    if !empty(a:args)
        let cmd+=a:args
    endif
    return cmd
endfunction
"▶1 readsystem :: cmd[, cdpath] → [String]
if has('python') && exists('*pyeval')
    try
        " This way is much faster
        python import aurum.utils
        " No need in using pyeval emulation: it will degrade performance a lot
        function s:F.readsystem(...)
            return pyeval('aurum.utils.readsystem(*vim.eval("a:000"))')
        endfunction
    catch
    endtry
endif
"▶1 utils.run :: cmd, hasnulls::0|1|2, path → [String] + shell
" TODO Add utils.runtobuf for use in difftobuf functions
function s:utils.run(cmd, hasnulls, cdpath)
    if a:hasnulls==2
        if has_key(s:F, 'readsystem')
            return s:F.readsystem(a:cmd, a:cdpath)
        elseif !empty(&shellredir)
            let lines=call(s:_r.os.readsystem, [a:cmd]+(empty(a:cdpath)?
                        \                                 ([]):
                        \                                 ([a:cdpath])), {})
            return [lines, v:shell_error]
        endif
    endif
    if a:hasnulls
        " XXX Remove this code? Or keep as-is as it avoids temporary files in 
        "     some cases?
        let savedlazyredraw=&lazyredraw
        let savedeventignore=&eventignore
        set eventignore=all
        set lazyredraw
        try
            try
                tabnew
            catch /^Vim(tabnew):E523:/
                let r=s:utils.run(a:cmd, 2, a:cdpath)
                if empty(r[-1])
                    call remove(r, -1)
                endif
                return r
            endtry
            setlocal buftype=nofile modifiable noreadonly
            if !empty(a:cdpath)
                execute 'lcd' fnameescape(a:cdpath)
            endif
            " XXX this is not able to distinguish between output with and 
            " without trailing newline, and also is “smart” about lineendings
            silent execute '%!'.join(map(copy(a:cmd), 'shellescape(v:val, 1)'))
            let r=getline(1, '$')
            bwipeout!
        finally
            let &lazyredraw=savedlazyredraw
            let &eventignore=savedeventignore
        endtry
    else
        let cmd=join(map(copy(a:cmd), 'shellescape(v:val, 0)'))
        if !empty(a:cdpath)
            let cmd='cd '.shellescape(a:cdpath).' && '.cmd
        endif
        let r=split(system(cmd), "\n", 1)
    endif
    return [r, v:shell_error]
endfunction
"▶1 utils.diffopts :: opts, opts, difftrans → diffopts
function s:utils.diffopts(opts, defaultdiffopts, difftrans)
    let opts=extend(copy(a:defaultdiffopts), a:opts)
    if has_key(opts, 'numlines')
        let opts.numlines.=''
    endif
    let r={}
    call map(filter(copy(a:difftrans), 'has_key(opts, v:key)'),
            \'extend(r, {v:val : opts[v:key]})')
    if has_key(opts, 'dates') && has_key(a:difftrans, 'dates')
        let r[a:difftrans.dates]=!opts.dates
    endif
    return r
endfunction
"▶1 utils.addfiles :: repo, files + status → + add, forget
function s:utils.addfiles(repo, files)
    let status=a:repo.functions.status(a:repo, 0, 0, a:files)
    for file in status.unknown
        call a:repo.functions.add(a:repo, file)
    endfor
    for file in status.deleted
        call a:repo.functions.forget(a:repo, file)
    endfor
endfunction
"▶1 utils.usefile :: repo, message, kw, kw, func, args, kwargs, emes
function s:utils.usefile(repo, message, kwfile, kwmes, Func, args, kwargs, ...)
    if a:message=~#'\v[\r\n]'
        let tmpfile=tempname()
        call writefile(split(a:message, "\n", 1), tmpfile, 'b')
        let a:kwargs[a:kwfile]=tmpfile
        let usingfile=1
    else
        let a:kwargs[a:kwmes]=a:message
        let usingfile=0
    endif
    try
        return call(a:Func, [a:repo, 'commit', a:args, a:kwargs]+a:000, {})
    finally
        if usingfile && filereadable(tmpfile)
            call delete(tmpfile)
        endif
    endtry
endfunction
"▶1 utils.printm :: String → + :echo | :echom
if s:_f.require('autoload/ansi_esc_echo', [0, 0], 0)
    function s:utils.printm(str, ...)
        return call(s:_r.ansi_esc.echo, [a:str]+a:000, {})
    endfunction
    let s:utils.using_ansi_esc_echo=1
    if exists('*pyeval')
        python import aurum.auutils
        execute 'python aurum.auutils.register_ansi_esc_echo_func('.
                    \               'vim.bindeval("s:utils.printm"))'
    endif
else
    function s:utils.printm(m, ...)
        let prevempty=0
        for line in a:m
            if empty(line)
                let prevempty+=1
            else
                if prevempty
                    while prevempty
                        echom ' '
                        let prevempty-=1
                    endwhile
                endif
                echom line
            endif
        endfor
        return 0
    endfunction
    let s:utils.using_ansi_esc_echo=0
endif
"▶1 utils.pyeval
if exists('*pyeval')
    let s:utils.pyeval=function('pyeval')
else
    python import aurum.auutils
    function s:utils.pyeval(e)
        python vim.command('return '+
                    \aurum.auutils.nonutf_dumps(eval(vim.eval('a:e'))))
    endfunction
endif
"▶1 utils.pystring
function s:utils.pystring(v)
    return type(a:v)==type(0)  ?
                \string(a:v) :
                \substitute(string(a:v), "''", '\\''', 'g')
endfunction
"▶1 utils.emptystatdct
let s:utils.emptystatdct={
            \'modified': [],
            \   'added': [],
            \ 'removed': [],
            \ 'deleted': [],
            \ 'unknown': [],
            \ 'ignored': [],
            \   'clean': [],
        \}
"▶1 nullnl :: [String] → [String]
" Convert between lines (NL separated strings with NULLs represented as NLs) and 
" NULL separated strings with NLs represented by NLs.
function s:utils.nullnl(text)
    let r=['']
    for nlsplit in map(copy(a:text), 'split(v:val, "\n", 1)')
        let r[-1].="\n".nlsplit[0]
        call extend(r, nlsplit[1:])
    endfor
    if empty(r[0])
        call remove(r, 0)
    else
        let r[0]=r[0][1:]
    endif
    return r
endfunction
"▶1 post resource
call s:_f.postresource('utils', s:utils)
"▶1 pyimport feature
if has('python')
    " TODO Add python3 support
    function s:F.pyimport(plugdict, fdict)
        let g=a:plugdict.g
        if !has_key(g, 'pp')
            return
        endif
        let g.py='python'
        let g.pya=g.py.' '.g.pp.'.'
        try
            execute g.py 'import' g.pp
            let g.usepythondriver=1
        catch
            let g.usepythondriver=0
        endtry
        let a:fdict.reloadcmd=(g.py.' reload('.g.pp.')')
    endfunction
else
    function s:F.pyimport(plugdict, fdict, pkg)
        let a:plugdict.g.usepythondriver=0
    endfunction
endif
function s:F.pyreload(plugdict, fdict)
    if has_key(a:fdict, 'reloadcmd')
        execute a:fdict.reloadcmd
    endif
endfunction
call s:_f.newfeature('pyimport', {  'load': s:F.pyimport,
            \                     'unload': s:F.pyreload})
"▶1
call frawor#Lockvar(s:, '')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
