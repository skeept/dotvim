"▶1
scriptencoding utf-8
execute frawor#Setup('1.5', {'@/resources': '0.0',
            \                       '@/os': '0.0',
            \                '@/functions': '0.1',
            \               '@%aurum/repo': '5.0',
            \          '@%aurum/lineutils': '0.0',
            \            '@%aurum/bufvars': '0.0',})
let s:commands={}
let s:_messages={
            \    'ucmd': 'Unknown command: %s',
            \     'nwr': 'Write feature is not implemented for command %s',
            \'nosource': 'Can not source %s',
            \   'nrepo': 'No repository found for path %s',
        \}
call extend(s:_messages, map({
            \'creg': 'command was already registered by plugin %s',
            \'ndct': 'command description is not a dictionary',
            \'mfun': '“function” key is missing',
            \'nfun': 'value of key “%s” must be a callable function reference',
            \'odct': 'key “options” is not a dictionary',
            \'nnum': 'key “%s” is not a natural number',
            \ 'nbl': 'key “%s” is not 1 or 0',
            \'nlst': 'key “%s” is not a list of strings',
            \'nstr': 'key “%s” is not a string',
            \ 'ift': 'invalid filetype: “%s” '.
            \        '(only lowercase latin letters allowed)',
            \ 'img': 'invalid mgroup: “%s”',
            \ 'dup': 'string “%s” from key “%s” was already listed',
            \'nmap': 'plugin dictionary does not contain '.
            \        'g._f.mapgroup.map function',
        \}, '"Error while registering command %s for plugin %s: ".v:val'))
"▶1 globtopat :: glob[, catchstars] → pattern
function s:F.globtopat(glob, ...)
    let r='\V\^'
    let g=substitute(a:glob, '\V//\+', '/', 'g')
    if g[-1:] is# '/'
        let g=g[:-2]
    endif
    let catchstars=(a:0&&a:1)
    let incurl=0
    let curlit=[]
    let outr=[]
    while !empty(g)
        let lit=matchstr(g, '\v^(\\.|[^*?[{,}])*')
        let r.=substitute(lit, '\v\\([^\\])', '\1', 'g')
        let g=g[len(lit):]
        if empty(g)
            break
        endif
        let c=g[0]
        let g=g[1:]
        if c is# '*'
            if catchstars
                let r.='\('
            endif
            if g[0] is# '*'
                let g=g[1:]
                if g[0] is# '/'
                    let g=g[1:]
                    let r.='\%(\.\+/\)\='
                else
                    let r.='\.\*'
                endif
            else
                let r.='\[^/]\*'
            endif
            if catchstars
                let r.='\)'
            endif
        elseif c is# '?'
            let r.=((catchstars)?('\(\[^/]\)'):('\[^/]'))
        elseif c is# '[' && stridx(g, ']')!=-1
            let r.='\['
            if g[0] is# '!'
                let g=g[1:]
                let r.='^'
            elseif g[0] is# '^'
                let g=g[1:]
                let r.='\^'
            elseif g[0] is# ']'
                let g=g[1:]
                let r.='\]'
            endif
            let colinner=matchstr(g, '\v^(\\.|[^\]])+')
            let g=g[len(colinner):]
            let r.=substitute(colinner, '\v\\([^\^\]\-\\])', '\1', 'g')
        elseif c is# '{'
            let incurl+=1
            let curlit+=[[]]
            let outr+=[r]
            let r=''
        elseif incurl && c is# ','
            let curlit[-1]+=[r]
            let r=''
        elseif incurl && c is# '}'
            let incurl-=1
            let cl=remove(curlit, -1)
            if empty(cl)
                let r='{'.r.'}'
            else
                let r='\%('.join(cl+[r], '\|').'\)'
            endif
            let r=remove(outr, -1).r
        else
            let r.=c
        endif
    endwhile
    if incurl
        let curlit[-1]+=[r]
        let r=''
        for cl in curlit
            let r.=remove(outr, 0).'{'.join(cl, ',')
        endfor
    endif
    let r.='\v($|\/)'
    return r
endfunction
"▶1 oescape :: String → String
let s:ecodes={
            \'%': '%',
            \',': 'c', ':': '.', ';': 's',
            \'/': '-', '\': '+',
            \'[': 'b', ']': 'B',
            \'{': 'f', '}': 'F',
            \'*': 'a', '?': 'q',
            \'`': "'", '$': 'd',
        \}
let s:epattern='\v['.escape(join(keys(s:ecodes), ''), '\]-^').']'
let s:fbecodes=copy(s:ecodes)
unlet s:fbecodes['%']
function s:F.oescape(str)
    if substitute('a', '.', '\="a"', '') is# 'a'
        return substitute(a:str, s:epattern, '\="%".s:ecodes[submatch(0)]', 'g')
    else
        let r=substitute(a:str, '\V%', '%%', 'g')
        for [c, l] in items(s:fbecodes)
            let r=substitute(r, '\V'.escape(c, '\'), '%'.escape(l, '\~&'), 'g')
        endfor
        return r
    endif
endfunction
"▶1 ounescape :: String → String
let s:unecodes={}
call map(copy(s:ecodes), 'extend(s:unecodes, {v:val : v:key}, "error")')
let s:unepattern='\V%\(\['.escape(join(keys(s:unecodes), ''), '\]-^').']\)'
function s:F.ounescape(str)
    if substitute('a', '.', '\="a"', '') is# 'a'
        return substitute(a:str, s:unepattern, '\=s:unecodes[submatch(1)]', 'g')
    else
        let lstr=len(a:str)
        let i=0
        let r=''
        while i<lstr
            let idx=stridx(a:str, '%', i)
            if idx==-1
                let r.=a:str[(i):]
                break
            else
                if idx
                    let r.=a:str[(i):(idx-1)]
                endif
                let r.=s:unecodes[a:str[idx+1]]
                let i=idx+2
            endif
        endwhile
        return r
    endif
endfunction
"▶1 encodeopts :: opts → String
function s:F.encodeopts(opts)
    let r=''
    for [key, value] in filter(items(a:opts), 'type(v:val[1])!=2 &&'.
                \                             'type(v:val[1])!='.type({}))
        let r.=key.':'
        if type(value)==type([])
            let r.=join(map(copy(value), 's:F.oescape(v:val)'), ';')
        else
            let r.=s:F.oescape(value)
        endif
        let r.=','
        unlet value
    endfor
    return r
endfunction
"▶1 copy
function s:F.copy(buf, read, file)
    call s:_r.lineutils.setlines(readfile(a:file, 'b'), a:read)
    if !a:read
        let s:_r.bufvars[a:buf]={'file': a:file, 'command': 'copy'}
        if exists('#filetypedetect#BufRead')
            execute 'doautocmd filetypedetect BufRead' fnameescape(a:file)
        endif
    endif
endfunction
"▶1 edit
function s:F.ewrite(bvar, lines, file)
    return writefile(a:lines, a:file, 'b')
endfunction
function s:F.edit(buf, rw, file)
    if a:rw>=0
        call s:F.copy(a:buf, a:rw, a:file)
        if !a:rw
            setlocal buftype=acwrite nomodified modifiable noreadonly
            let s:_r.bufvars[a:buf]={'file': a:file, 'command': 'edit',
                        \            'write': s:F.ewrite}
        endif
    elseif a:rw==-1
        let bvar=s:_r.bufvars[a:buf]
        call bvar.write(bvar, s:_r.lineutils.wtransform(getline(1, '$')), a:file)
        setlocal nomodified
    endif
endfunction
"▶1 repotuplesplit :: str, UInt → (repo, String, ...)
function s:F.repotuplesplit(str, num)
    let tail=a:str
    let repopath=matchstr(tail, '\v^[^:]+')
    let tail=tail[len(repopath)+1:]
    let r=[repopath]
    let i=0
    while i<a:num-1
        let chunk=matchstr(tail, '\v^[^:]+')
        let tail=tail[len(chunk)+1:]
        call add(r, chunk)
        let i+=1
    endwhile
    call add(r, tail)
    return r
endfunction
"▶1 repotupleoptssplit :: str, UInt → (repo, ..., opts::Dictionary)
function s:F.repotupleoptssplit(str, num)
    let [repo; strings]=s:F.repotuplesplit(a:str, a:num+1)
    let ostr=remove(strings, -1)
    let opts={}
    for o in split(ostr, ',')
        let colonidx=stridx(o, ':')
        if colonidx==-1
            continue
        endif
        let opts[o[:(colonidx-1)]]=o[(colonidx+1):]
    endfor
    return [repo]+strings+[opts]
endfunction
"▶1 patchbvar
function s:F.patchbvar(cdescr, amatch, args, bvar, buf)
    if has_key(s:_r.bufvars, a:buf) &&
                \has_key(s:_r.bufvars[a:buf], 'prevbuf')
        let a:bvar.prevbuf=s:_r.bufvars[a:buf].prevbuf
    endif
    let a:bvar.amatch=a:amatch
    let a:bvar.command=a:cdescr.id
    let a:bvar.repo=a:args[1]
    if has_key(a:cdescr, 'options')
        let a:bvar.opts=a:args[-1]
    endif
    return a:bvar
endfunction
"▶1 setfiletype
function s:F.setfiletype(cdescr)
    if has_key(a:cdescr, 'filetype')
        let &l:filetype=a:cdescr.filetype
        execute 'runtime! ftplugin/'.a:cdescr.filetype.'.vim'
    endif
endfunction
"▶1 runcmd
function s:F.runcmd(cdescr, amatch, args)
    let buf=bufnr('%')
    if has_key(a:cdescr, 'write')
        setlocal buftype=acwrite
    else
        setlocal buftype=nofile
    endif
    if get(a:cdescr, 'requiresbvar', 0)
        let bvar=s:F.patchbvar(a:cdescr, a:amatch, a:args, {}, buf)
        let args=a:args+[bvar]
        let s:_r.bufvars[buf]=bvar
        call s:F.setfiletype(a:cdescr)
        call call(a:cdescr.function, args, {})
    else
        let bvar=call(a:cdescr.function, a:args, {})
        call s:F.patchbvar(a:cdescr, a:amatch, a:args, bvar, buf)
        let s:_r.bufvars[buf]=bvar
        call s:F.setfiletype(a:cdescr)
    endif
    if bufnr('%')!=buf
        return
    endif
    if !get(a:cdescr, 'modifiable', 0)
        setlocal nomodifiable readonly
        augroup AurumNoInsert
            autocmd! InsertEnter <buffer> : if !&modifiable
                        \                 |     call feedkeys("\e", 'n')
                        \                 | endif
        augroup END
    endif
    if exists('g:Powerline_loaded')
        if has_key(a:cdescr, 'plstrgen')
            let bvar.ploptions=a:cdescr.plstrgen(bvar)
        endif
    endif
    file
endfunction
let s:_augroups+=['AurumNoInsert']
"▶1 checkcmd :: command → _ + :throw?
function s:F.checkcmd(command)
    if !has_key(s:commands, a:command)
        call FraworLoad('@%aurum/'.a:command)
        if !has_key(s:commands, a:command)
            call s:_f.throw('ucmd', a:command)
        endif
    endif
endfunction
"▶1 addpats :: args → + args
function s:F.addpats(cdescr, args)
    let opts=a:args[-1]
    for o in filter(copy(a:cdescr.options.pats), 'has_key(opts, v:val)')
        let opts[o[:-2].'pats']=map(copy(opts[o]), 's:F.globtopat(v:val)')
    endfor
endfunction
"▶1 aurum://
let s:okeys={
            \'list': 'map(split(opts[o],";"), "s:F.ounescape(v:val)")',
            \'bool': '!!(+opts[o])',
            \ 'num': '+opts[o]',
            \ 'str': 's:F.ounescape(opts[o])',
        \}
let s:_aufunctions.event={}
function s:_aufunctions.event.function(rw)
    " XXX On windows all forward slashes are transformed to backward in @%,
    "     all backward are transformed to forward in <amatch>
    let buf=expand('<abuf>')
    " FIXME expand("<amatch>") truncates long filenames
    let amatch=expand('<amatch>')
    let tail=amatch[len('aurum://'):]
    let command=tolower(matchstr(tail, '\v^\w+'))
    let tail=tail[len(command)+1:]
    if command is# 'copy' && (a:rw==0 || a:rw==1)
        return s:F.copy(buf, a:rw, tail)
    elseif command is# 'edit' && abs(a:rw)<=1
        return s:F.edit(buf, a:rw, tail)
    endif
    call s:F.checkcmd(command)
    "▶2 Launch bvar.write if applicable
    if a:rw==-1 && has_key(s:_r.bufvars,buf)            &&
                \  has_key(s:_r.bufvars[buf], 'amatch') &&
                \  has_key(s:_r.bufvars[buf], 'write')  &&
                \          s:_r.bufvars[buf].amatch is# amatch
        return s:_r.bufvars[buf].write(s:_r.bufvars[buf])
    endif
    "▲2
    let cdescr=s:commands[command]
    "▶2 Check SourceCmd support
    if a:rw==2 && !get(cdescr, 'sourceable', 0)
        call s:_f.throw('nosource', amatch)
    endif
    "▲2
    let arguments=get(cdescr, 'arguments', 0)
    let argnum=arguments+get(cdescr, 'listargs', 0)
    let hasopts=has_key(cdescr, 'options')
    let fname='repotuple'.((hasopts)?('opts'):('')).'split'
    let args=s:F[fname](tail, argnum)
    "▶2 Get string arguments
    for i in range(1, arguments)
        let args[i]=s:F.ounescape(args[i])
    endfor
    "▶2 Get list arguments
    if argnum>arguments
        for i in range(arguments+1, argnum)
            let args[i]=map(split(args[i],';'), 's:F.ounescape(v:val)')
        endfor
    endif
    "▶2 Get options
    if hasopts
        let opts=remove(args, -1)
        let newopts={}
        for [key, expr] in items(s:okeys)
            for o in filter(copy(get(cdescr.options, key, [])),
                        \   'has_key(opts, v:val)')
                let newopts[o]=eval(expr)
            endfor
        endfor
        call add(args, newopts)
        if has_key(cdescr.options, 'pats')
            call s:F.addpats(cdescr, args)
        endif
    endif
    "▶2 Get repository
    let path=s:F.ounescape(args[0])
    let repo=s:_r.repo.get(path)
    if repo is 0
        call s:_f.throw('nrepo', path)
    endif
    let args[0]=repo
    "▲2
    if a:rw==0
        setlocal modifiable noreadonly
    endif
    if a:rw<0
        call call(cdescr.write,
                    \[s:_r.lineutils.wtransform(
                    \            call('getline', ((a:rw==-1)?([ 1,   '$' ]):
                    \                                        (["'[", "']"]))))]+
                    \args, {})
    else
        let args=[a:rw]+args
        if a:rw==0
            call s:F.runcmd(cdescr, amatch, args)
        else
            call call(cdescr.function, args, {})
        endif
    endif
endfunction
"▶1 newcommand :: {f}, cdescr → + s:commands
function s:F.newcommand(plugdict, fdict, cdescr)
    let cname=a:plugdict.id[strridx(a:plugdict.id, '/')+1:]
    if has_key(s:commands, cname)
        call s:_f.throw('creg', cname, a:plugdict.id, s:commands[cname].plid)
    elseif type(a:cdescr)!=type({})
        call s:_f.throw('ndct', cname, a:plugdict.id)
    elseif !has_key(a:cdescr, 'function')
        call s:_f.throw('mfun', cname, a:plugdict.id)
    elseif !exists('*a:cdescr.function')
        call s:_f.throw('nfun', cname, a:plugdict.id, 'function')
    endif
    let cdescr={'function': a:cdescr.function}
    "▶2 Numeric (natural numbers) keys: arguments, listargs
    for key in filter(['arguments', 'listargs'],
                \     'has_key(a:cdescr, v:val)')
        if type(a:cdescr[key])!=type(0) || a:cdescr[key]<=0
            call s:_f.throw('nnum', cname, a:plugdict.id, key)
        endif
        let cdescr[key]=a:cdescr[key]
    endfor
    "▶2 Boolean keys: modifiable, sourceable, requiresbvar
    for key in ['modifiable', 'sourceable', 'requiresbvar']
        if has_key(a:cdescr, key)
            if type(a:cdescr[key])!=type(0)
                call s:_f.throw('nbl')
            endif
            let cdescr[key]=(!!a:cdescr[key])
        endif
    endfor
    "▶2 `options' dictionary
    if has_key(a:cdescr, 'options')
        if type(a:cdescr.options)!=type({})
            call s:_f.throw('odct', cname, a:plugdict.id)
        endif
        let cdescr.options={}
        let cdescr.okeys=[]
        for key in filter(['list', 'bool', 'num', 'str'],
                    \     'has_key(a:cdescr.options, v:val)')
            if type(a:cdescr.options[key])!=type([]) ||
                        \!empty(filter(copy(a:cdescr.options[key]),
                        \       'type(v:val)!='.type('')))
                call s:_f.throw('nlst', cname, a:plugdict.id, key)
            endif
            let cdescr.options[key]=[]
            for v in a:cdescr.options[key]
                if index(cdescr.okeys, key)!=-1
                    call s:_f.throw('dup', cname, a:plugdict.id, v, key)
                endif
                let cdescr.options[key]+=[v]
                let cdescr.okeys+=[v]
            endfor
        endfor
        if has_key(a:cdescr.options, 'pats')
            let cdescr.options.pats=filter(copy(a:cdescr.options.pats),
                        \                  'index(cdescr.okeys, v:val)!=-1')
        endif
    endif
    "▶2 `filetype' key
    if has_key(a:cdescr, 'filetype')
        if type(a:cdescr.filetype)!=type('')
            call s:_f.throw('nstr', cname, a:plugdict.id, 'filetype')
        elseif a:cdescr.filetype!~#'\v^\l+$'
            call s:_f.throw('ift', cname, a:plugdict.id, a:cdescr.filetype)
        endif
        let cdescr.filetype=a:cdescr.filetype
    endif
    "▶2 “mgroup” key
    if has_key(a:cdescr, 'mgroup')
        if type(a:cdescr.mgroup)!=type('')
            call s:_f.throw('nstr', cname, a:plugdict.id, 'mgroup')
        elseif a:cdescr.mgroup!~#'\v^\u[a-zA-Z0-9]*$'
            call s:_f.throw('img', cname, a:plugdict.id, a:cdescr.mgroup)
        elseif !exists('*a:plugdict.g._f.mapgroup.map')
            call s:_f.throw('nmap', cname, a:plugdict.id)
        endif
        let cdescr.mgroup=a:cdescr.mgroup
        let cdescr.mmap=a:plugdict.g._f.mapgroup.map
    endif
    "▶2 Function keys: “write”, “plstrgen”
    for key in ['write', 'plstrgen']
        if has_key(a:cdescr, key)
            if !exists('*a:cdescr.'.key)
                call s:_f.throw('nfun', cname, a:plugdict.id, key)
            endif
            let cdescr[key]=a:cdescr[key]
        endif
    endfor
    "▲2
    let cdescr.id=cname
    let cdescr.plid=a:plugdict.id
    let s:commands[cname]=cdescr
endfunction
"▶1 delcommand :: {f} → + s:commands
function s:F.delcommand(plugdict, fdict)
    let cname=a:plugdict.id[strridx(a:plugdict.id, '/')+1:]
    if has_key(s:commands, cname)
        unlet s:commands[cname]
    endif
endfunction
"▶1 Register feature
call s:_f.newfeature('newcommand', {'cons': s:F.newcommand,
            \                     'unload': s:F.delcommand,})
"▶1 encodecmd
function s:F.encodecmd(args)
    let r=join(map(copy(a:args), '((type(v:val)=='.type('').')?'.
                \                   '(s:F.oescape(v:val)):'.
                \                '((type(v:val)=='.type(00).')?'.
                \                   '("".v:val):'.
                \                '((type(v:val)=='.type([]).')?'.
                \                   '(join(map(copy(v:val), '.
                \                           '"s:F.oescape(v:val)"), '.
                \                         '";"))'.
                \                ':'.
                \                   '(s:F.encodeopts(v:val)))))'),
                \':')
    return r
endfunction
"▶1 fname :: command, repo[, arg1[, …]] → filename(aurum://)
function s:F.fname(command, repo, ...)
    let repopath=((type(a:repo)==type({}))?(a:repo.path):(a:repo))
    return 'aurum://'.a:command.':'.s:F.encodecmd([repopath]+a:000)
endfunction
"▶1 run
function s:F.run(vcommand, command, repo, ...)
    let file=call(s:F.fname, [a:command, a:repo]+a:000, {})
    let existed=bufexists(file)
    call s:F.checkcmd(a:command)
    if type(a:repo)==type({}) &&
                \a:vcommand=~#'\v^%(%(sil%[ent]|vert%[ical]|lefta%[bove]|'.
                \                    'abo%[veleft]|rightb%[elow]|'.
                \                    'bel%[owright]|to%[pleft]|bo%[tright]|'.
                \                    '\d*tab)\ )*'.
                \                '%(%(tab)?%(e%[dit]|new)|view?|[ev]new?|'.
                \                  'sp%[lit]|vs%[plit]|sv%[iew])$'
        let args=copy(a:000)
        let cdescr=s:commands[a:command]
        if has_key(cdescr, 'options') && has_key(cdescr.options, 'pats')
            let args[-1]=copy(args[-1])
            call s:F.addpats(cdescr, args)
        endif
        let prevbuf=s:F.prevbuf()
        try
            let savedei=&eventignore
            set eventignore+=BufReadCmd
            execute a:vcommand fnameescape(file)
        finally
            let &eventignore=savedei
        endtry
        setlocal modifiable noreadonly
        silent call s:F.runcmd(s:commands[a:command], file, [0, a:repo]+args)
        if bufexists(prevbuf)
            let s:_r.bufvars[bufnr('%')].prevbuf=prevbuf
        endif
        if stridx(a:vcommand, 'sil')==-1
            file
        endif
    else
        execute a:vcommand fnameescape(file)
    endif
    return existed
endfunction
"▶1 mrun
function s:F.mrun(...)
    let r=call(s:F.run, a:000, {})
    let cdescr=s:commands[a:2]
    if has_key(cdescr, 'mgroup')
        call cdescr.mmap(cdescr.mgroup, bufnr('%'))
    endif
    return r
endfunction
"▶1 prevbuf :: () + bufvars → buf
function s:F.prevbuf()
    let r=bufnr('%')
    if has_key(s:_r.bufvars, r) && (&bufhidden is# 'wipe' ||
                \                   &bufhidden is# 'delete') &&
                \has_key(s:_r.bufvars[r], 'prevbuf')
        let r=s:_r.bufvars[r].prevbuf
    endif
    return r
endfunction
"▶1 Register resources
call s:_f.postresource('run',       s:F.run)
call s:_f.postresource('mrun',      s:F.mrun)
call s:_f.postresource('fname',     s:F.fname)
call s:_f.postresource('globtopat', s:F.globtopat)
call s:_f.postresource('prevbuf',   s:F.prevbuf)
"▶1
call frawor#Lockvar(s:, '_r,commands')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
