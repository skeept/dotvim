"▶1
execute frawor#Setup('5.5', { '@/resources': '0.0',
            \                        '@/os': '0.0',
            \                   '@/options': '0.0',
            \                    '@/python': '1.0',
            \           '@%aurum/lineutils': '0.0',
            \             '@%aurum/bufvars': '0.0',
            \'@%aurum/drivers/common/utils': '1.1',})
let s:drivers={}
let s:repos={}
let s:bufrepos={}
" FIXME deduplicate data
let s:diffopts=['git', 'reverse', 'ignorews', 'iwsamount', 'iblanks',
            \   'numlines', 'showfunc', 'alltext', 'dates']
let s:_options={
            \'diffopts':  {'default': {},
            \              'checker': 'dict {numlines      range 0 inf '.
            \                               '?in diffopts  bool}'},
        \}
let s:_messages={
            \    'nrm': 'Failed to remove file %s from repository %s',
            \  'iname': 'Error while registering driver for plugin %s: '.
            \           'invalid name: it must be a non-empty sting, '.
            \           'containing only latin letters, digits and underscores',
            \   'nimp': 'Function %s was not implemented in driver %s',
            \  'tgtex': 'Target already exists: %s',
            \ 'cpfail': 'Failed to copy %s to %s: %s',
            \ 'wrfail': 'Failed to write copy of %s to %s',
        \}
call extend(s:_messages, map({
            \   'dreg': 'driver was already registered by plugin %s',
            \  'fndct': 'second argument is not a dictionary',
            \   'fmis': 'some required functions are missing',
            \   'nfun': 'some of dictionary values are not '.
            \           'callable function references',
        \}, '"Error while registering driver %s for plugin %s: ".v:val'))
let s:deffuncs={}
let s:iterfuncs={}
"▶1 sort_in_topological_order :: [cs] → [cs]
" TODO put sorting requirement on getchangesets and revrange functions.
function s:F.sort_in_topological_order(repo, css)
    try
        call map(copy(a:css), 'extend(v:val, {"indegree": 1})')
        for parents in map(copy(a:css), 'v:val.parents')
            for parent in filter(map(filter(copy(parents),
                        \                   'has_key(a:repo.changesets,v:val)'),
                        \            'a:repo.changesets[v:val]'),
                        \        'get(v:val, "indegree", 0)')
                let parent.indegree+=1
            endfor
        endfor
        let work=[]
        call map(copy(a:css), 'v:val.indegree==1 ? add(work, v:val) : 0')
        call sort(work, 's:DateCmp')
        let r=[]
        while !empty(work)
            let cs=remove(work, 0)
            for parent in filter(map(filter(copy(cs.parents),
                        \                   'has_key(a:repo.changesets,v:val)'),
                        \            'a:repo.changesets[v:val]'),
                        \        'get(v:val, "indegree", 0)')
                let parent.indegree-=1
                if parent.indegree==1
                    let j=0
                    let lwork=len(work)
                    while j<lwork && work[j].time<parent.time
                        let j+=1
                    endwhile
                    call insert(work, parent, j)
                endif
            endfor
            let cs.indegree=0
            call add(r, cs)
        endwhile
    finally
        call map(copy(a:css), 'remove(v:val, "indegree")')
    endtry
    return r
endfunction
"▶1 getnthparent :: repo, rev, n → cs
function s:deffuncs.getnthparent(repo, rev, n)
    let r=a:repo.functions.getcs(a:repo, a:rev)
    let key=((a:n>0)?('parents'):('children'))
    for i in range(1, abs(a:n))
        let rl=a:repo.functions.getcsprop(a:repo, r, key)
        if empty(rl)
            break
        endif
        let r=a:repo.functions.getcs(a:repo, rl[0])
    endfor
    return r
endfunction
"▶1 getcsprop :: repo, Either cs rev, propname → a
function s:deffuncs.getcsprop(repo, csr, propname)
    if type(a:csr)==type({})
        let cs=a:csr
    else
        let cs=a:repo.functions.getcs(a:repo, a:csr)
    endif
    if has_key(cs, a:propname)
        return cs[a:propname]
    endif
    call a:repo.functions.setcsprop(a:repo, cs, a:propname)
    " XXX There is much code relying on the fact that after getcsprop property 
    " with given name is added to changeset dictionary
    return cs[a:propname]
endfunction
"▶1 dirty :: repo, file → Bool
function s:deffuncs.dirty(repo, file)
    let status=a:repo.functions.status(a:repo, 0, 0, [a:file])
    for [type, files] in items(status)
        if type is# 'ignored' || type is# 'clean'
            continue
        endif
        if index(files, a:file)!=-1
            return 1
        endif
    endfor
    return 0
endfunction
"▶1 move
function s:deffuncs.move(repo, force, source, target)
    call a:repo.functions.copy(a:repo, a:force, a:source, a:target)
    call a:repo.functions.remove(a:repo, a:source)
endfunction
"▶1 copy
function s:deffuncs.copy(repo, force, source, target)
    let src=s:_r.os.path.normpath(s:_r.os.path.join(a:repo.path, a:source))
    let tgt=s:_r.os.path.normpath(s:_r.os.path.join(a:repo.path, a:target))
    if filewritable(tgt)==1
        if a:force
            call delete(tgt)
        else
            call s:_f.throw('tgtex', tgt)
        endif
    elseif s:_r.os.path.exists(tgt)
        " Don’t try to delete directories and non-writable files.
        call s:_f.throw('tgtex', tgt)
    endif
    let cmd=0
    if executable('cp')
        let cmd='cp --'
    elseif executable('copy')
        let cmd='copy'
    endif
    if cmd is 0
        try
            if writefile(readfile(src, 'b'), tgt, 'b')!=0
                call s:_f.throw('wrfail', src, tgt)
            endif
        endtry
    else
        let hasnls=(stridx(src.tgt, "\n")==-1)
        let cmd.=' '.shellescape(src, hasnls).' '.shellescape(tgt, hasnls)
        if hasnls
            let shout=system(cmd)
        else
            noautocmd tabnew
            noautocmd setlocal buftype=nofile
            noautocmd execute 'silent! %!'.cmd
            let shout=join(getline(1, '$'), "\n")
            noautocmd tabclose
        endif
        if v:shell_error
            call s:_f.throw('cpfail', src, tgt, shout)
        endif
    endif
    call a:repo.functions.add(a:repo, tgt)
endfunction
"▶1 remove
function s:deffuncs.remove(repo, file)
    call a:repo.functions.forget(a:repo, a:file)
    let file=s:_r.os.path.join(a:repo.path, a:file)
    if s:_r.os.path.isfile(file)
        if delete(file)
            call s:_f.throw('nrm', a:file, a:repo.path)
        endif
    endif
endfunction
"▶1 grep :: repo, pattern, [file], [Either hex (hex, hex)], ic, _ → qflist
function s:deffuncs.grep(repo, pattern, files, revs, ic, wdf)
    if empty(a:revs)
        let cs=a:repo.functions.getwork(a:repo)
        let filelist=copy(a:repo.functions.getcsprop(a:repo, cs, 'allfiles'))
        if !empty(a:files)
            call filter(filelist, 'index(a:files, v:val)!=-1')
        endif
        call map(filelist, 's:_r.os.path.join(a:repo.path, v:val)')
        call filter(filelist, 'filereadable(v:val)')
        let expr='readfile(fspec, "b")'
    else
        let css=[]
        for rspec in a:revs
            if type(rspec)==type([])
                let css+=a:repo.functions.revrange(a:repo, rspec[0], rspec[1])
            else
                let css+=[a:repo.functions.getcs(a:repo, rspec)]
            endif
            unlet rspec
        endfor
        let filelist=[]
        let gcspexpr='a:repo.functions.getcsprop(a:repo, v:val, "allfiles")'
        let mexpr='extend(filelist, '.
                    \    'map('.((empty(a:files))?
                    \               (gcspexpr):
                    \               ('filter(copy('.gcspexpr.'), '.
                    \                       '"index(a:files, v:val)!=-1")')).
                    \        ', "[css[".v:key."].hex, v:val]"))'
        call map(copy(css), mexpr)
        let expr='a:repo.functions.readfile(a:repo, fspec[0], fspec[1])'
    endif
    let r=[]
    let fexpr='v:val[1]=~'.('?#'[!a:ic]).string(a:pattern)
    for fspec in filelist
        let r+=map(filter(map(copy(eval(expr)), '[v:key, v:val]'), fexpr),
                    \'{"filename": fspec,"lnum": v:val[0]+1,"text": v:val[1]}')
    endfor
    return r
endfunction
"▶1 difftobuffer
function s:deffuncs.difftobuffer(repo, buf, ...)
    let diff=call(a:repo.functions.diff, [a:repo]+a:000, {})
    let oldbuf=bufnr('%')
    if oldbuf!=a:buf
        execute 'buffer' a:buf
    endif
    call s:_r.lineutils.setlines(diff, 0)
    if oldbuf!=a:buf
        execute 'buffer' oldbuf
    endif
endfunction
"▶1 diffname :: _, line, diffre, _ → rpath
function s:deffuncs.diffname(repo, line, diffre, opts)
    return get(matchlist(a:line, a:diffre), 1, 0)
endfunction
"▶1 getstats :: _, diff, diffopts → stats
" stats :: { ( "insertions" | "deletions" ): UInt,
"            "files": { ( "insertions" | "deletions" ): UInt } }
function s:deffuncs.getstats(repo, diff, opts)
    let diffre=a:repo.functions.diffre(a:repo, a:opts)
    let i=0
    let llines=len(a:diff)
    let stats={'files': {}, 'insertions': 0, 'deletions': 0}
    let file=0
    let pmlines=0
    while i<llines
        let line=a:diff[i]
        let newfile=a:repo.functions.diffname(a:repo, line, diffre, a:opts)
        if newfile isnot 0
            let file=newfile
            let stats.files[file]={'insertions': 0, 'deletions': 0,}
            let pmlines=2
        elseif file is 0
        elseif pmlines
            let lstart=line[:2]
            if lstart is# '+++' || lstart is# '---'
                let pmlines-=1
            endif
        elseif line[0] is# '+'
            let stats.insertions+=1
            let stats.files[file].insertions+=1
        elseif line[0] is# '-'
            let stats.deletions+=1
            let stats.files[file].deletions+=1
        endif
        let i+=1
    endwhile
    return stats
endfunction
"▶1 reltorepo :: repo, path → rpath
function s:deffuncs.reltorepo(repo, path)
    " Symlinks are managed by mercurial as regular files with special attribute 
    " containing linked path, thus no need to resolve symlinks if they are at 
    " the last component. But file under directory symlinks are not managed 
    " (because directory symlink is managed as a regular file) thus to normalize 
    " path you need to resolve directory, but not resolve file
    " Same for git.
    return join(s:_r.os.path.split(s:_r.os.path.relpath(
                \s:_r.os.path.join(
                \   s:_r.os.path.realpath(s:_r.os.path.dirname(a:path)),
                \   s:_r.os.path.basename(a:path)),
                \a:repo.path))[1:], '/')
endfunction
"▶1 checkremote
function s:deffuncs.checkremote(...)
    return 0
endfunction
"▶1 aget, aremove, XXX _unload
let s:userepeatedcmd=0
if has('python')
    try
        python import aurum.repeatedcmd
        let s:userepeatedcmd=1
        function s:._unload()
            python reload(aurum.repeatedcmd)
        endfunction
    catch
    endtry
endif
if s:userepeatedcmd
    augroup AuRCFinish
        autocmd! VimLeave * python aurum.repeatedcmd.finish()
    augroup END
    let s:_augroups+=['AuRCFinish']
    function s:deffuncs.aget(repo, rcid, ...)
        return s:_r.utils.pyeval(
                    \'aurum.repeatedcmd.get('.string(a:rcid).', '.
                    \                       (a:0 && a:1? 'True': 'False').
                    \                     ')')
    endfunction
    for s:f in ['pause', 'resume', 'remove']
        execute      'function s:deffuncs.a'.s:f."(repo, rcid)\n".
                    \'    execute "python '.
                    \     'aurum.repeatedcmd.'.s:f.'(".string(a:rcid).")"'."\n".
                    \'endfunction'
    endfor
    unlet s:f
endif
"▶1 iterfuncs: cs generators
" startfunc (here)  :: repo, opts → d
"▶2 ancestors
function s:iterfuncs.ancestors(repo, opts)
    let cs=a:repo.functions.getcs(a:repo,
                \a:repo.functions.getrevhex(a:repo, a:opts.revision))
    let indegree={cs.hex : 1}
    for parenthex in cs.parents
        let indegree[parenthex]=2
    endfor
    return {'addrevs': [cs], 'revisions': {}, 'repo': a:repo,
                \'hasrevisions': get(a:repo, 'hasrevisions', 1),
                \'hasphases': get(a:repo, 'hasphases', 0),
                \'indegree': indegree, 'incremented': {cs.hex : 1},
                \'next': s:F.ancestorsnext}
endfunction
function! s:RevCmp(cs1, cs2)
    let rev1=a:cs1.rev
    let rev2=a:cs2.rev
    return ((rev1==rev2)?(0):((rev1<rev2)?(1):(-1)))
endfunction
let s:_functions+=['s:RevCmp']
function s:F.ancestorsnext()
    if empty(self.addrevs)
        return 0
    endif
    " XXX cs variables should be kept after cycle ends
    let i=-1
    for cs in self.addrevs
        let i+=1
        if self.indegree[cs.hex]<=1
            break
        endif
    endfor
    call remove(self.addrevs, i)
    let self.revisions[cs.hex]=cs
    for parenthex in filter(copy(cs.parents), '!has_key(self.revisions, v:val)')
        let parent=self.repo.functions.getcs(self.repo, parenthex)
        let self.indegree[parenthex]=self.indegree[parenthex]-1
        if !has_key(self.incremented, parenthex)
            let self.incremented[parenthex]=1
            for pparhex in parent.parents
                let self.indegree[pparhex]=get(self.indegree, pparhex, 1)+1
            endfor
            let self.addrevs+=[parent]
        endif
    endfor
    return cs
endfunction
"▶2 revrange
function s:iterfuncs.revrange(repo, opts)
    if has_key(a:opts, 'revrange')
        call map(a:opts.revrange, 'a:repo.functions.getrevhex(a:repo, v:val)')
        let cslist=copy(call(a:repo.functions.revrange,
                    \   [a:repo]+a:opts.revrange, {}))
    else
        let cslist=copy(a:repo.functions.getchangesets(a:repo))
    endif
    if get(a:repo, 'requires_sort', 1)
        let cslist=s:F.sort_in_topological_order(a:repo, cslist)
    else
        call reverse(cslist)
    endif
    return {'cslist': cslist, 'next': s:F.revrangenext}
endfunction
function s:F.revrangenext()
    if empty(self.cslist)
        return 0
    endif
    return remove(self.cslist, 0)
endfunction
"▶2 changesets
let s:iterfuncs.changesets=s:iterfuncs.revrange
"▶1 getdriver :: path, type → Maybe driver
function s:F.getdriver(path, ptype)
    for driver in values(s:drivers)
        if driver.functions['check'.a:ptype](a:path)
            return driver
        endif
    endfor
    return 0
endfunction
"▶1 updaterepo :: repo → repo + repo
function s:F.updaterepo(repo)
    call a:repo.functions.updatechangesets(a:repo)
    return a:repo
endfunction
"▶1 getrepo :: path → Maybe repo
function s:F.getrepo(path)
    "▶2 Pull in drivers if there are no
    if empty(s:drivers)
        runtime! autoload/aurum/drivers/*.vim
    endif
    "▶2 Get path
    if empty(a:path)
        let path=s:_r.os.path.realpath('.')
    elseif a:path is# ':'
        let buf=bufnr('%')
        if has_key(s:_r.bufvars, buf) && has_key(s:_r.bufvars[buf], 'repo')
            return s:F.updaterepo(s:_r.bufvars[buf].repo)
        elseif has_key(s:_r.bufvars,buf) && s:_r.bufvars[buf].command is# 'copy'
            let path=s:_r.os.path.dirname(
                        \s:_r.os.path.realpath(s:_r.bufvars[buf].file))
        elseif empty(&buftype) && !empty(bufname('%')) &&
                    \isdirectory(expand('%:p:h'))
            let path=s:_r.os.path.realpath(expand('%:p:h'))
        else
            let path=s:_r.os.path.realpath('.')
            unlet buf
        endif
    elseif stridx(a:path, '://')==-1
        let path=s:_r.os.path.realpath(a:path)
    else
        let path=a:path
    endif
    "▶2 Try to get repo from cache
    if exists('buf') && has_key(s:bufrepos, buf)
        return s:F.updaterepo(s:bufrepos[buf])
    elseif has_key(s:repos, path)
        return s:F.updaterepo(s:repos[path])
    endif
    "▶2 Get driver
    if stridx(path, '://')==-1
        let olddir=''
        let driver=0
        while path isnot# olddir
            unlet driver
            let driver=s:F.getdriver(path, 'dir')
            if driver isnot 0
                if has_key(driver.functions, 'getroot')
                    let newpath=driver.functions.getroot(path)
                    if newpath is 0
                        continue
                    endif
                    let path=newpath
                endif
                break
            endif
            let olddir=path
            let path=fnamemodify(path, ':h')
        endwhile
    else
        let driver=s:F.getdriver(path, 'remote')
    endif
    if driver is 0
        return 0
    endif
    "▶2 Try to get repo from cache, attempt 2
    if has_key(s:repos, path)
        return s:F.updaterepo(s:repos[path])
    endif
    "▲2
    let repo=driver.functions.repo(path)
    if repo is 0
        return 0
    endif
    let repo.type=driver.id
    let repo.path=path
    let repo.functions=copy(driver.functions)
    let repo.diffopts=copy(s:_f.getoption('diffopts'))
    if !has_key(repo, 'iterfuncs')
        let repo.iterfuncs=deepcopy(s:iterfuncs)
    else
        call extend(repo.iterfuncs, s:iterfuncs, 'keep')
    endif
    if !has_key(repo, 'initprops')
        let repo.initprops=['rev', 'hex', 'parents', 'tags', 'bookmarks',
                    \       'branch', 'time', 'user', 'description']
    endif
    lockvar! repo
    unlockvar! repo.mutable
    unlockvar! repo.changesets
    unlockvar 1 repo
    let s:repos[path]=repo
    if exists('buf')
        let s:bufrepos[buf]=repo
    endif
    return repo
endfunction
"▶1 Post resource
call s:_f.postresource('repo', {'get': s:F.getrepo,
            \        'userepeatedcmd': s:userepeatedcmd})
"▶1 regdriver feature
let s:requiredfuncs=['repo', 'getcs', 'checkdir']
let s:optfuncs=['readfile', 'annotate', 'diff', 'status', 'commit', 'update',
            \   'diffre', 'getrepoprop', 'forget', 'branch', 'label',
            \   'push', 'pull']
"▶2 regdriver :: {f}, name, funcs → + s:drivers
function s:F.regdriver(plugdict, fdict, name, funcs)
    "▶3 Check arguments
    if type(a:name)!=type('') || a:name!~#'\v^\w+$'
        call s:_f.throw('iname', a:plugdict.id)
    elseif has_key(s:drivers, a:name)
        call s:_f.throw('dreg', a:name, a:plugdict.id, s:drivers[a:name].plid)
    elseif type(a:funcs)!=type({})
        call s:_f.throw('fndct', a:name, a:plugdic.id)
    elseif !empty(filter(copy(s:requiredfuncs), '!exists("*a:funcs[v:val]")'))
        call s:_f.throw('fmis', a:name, a:plugdict.id)
    elseif !empty(filter(copy(a:funcs), '!exists("*v:val")'))
        call s:_f.throw('nfun', a:name, a:plugdict.id)
    endif
    "▲3
    let driver={'functions': copy(a:funcs)}
    let driver.plid=a:plugdict.id
    let driver.id=a:name
    call extend(driver.functions, s:deffuncs, 'keep')
    for funname in filter(copy(s:optfuncs), '!has_key(driver.functions, v:val)')
        execute      "function driver.functions.".funname."(...)\n".
                    \"    call s:_f.throw('nimp', '".funname."', ".
                    \                    "'".a:name."')\n".
                    \"endfunction"
    endfor
    lockvar! driver
    let a:fdict[a:name]=driver
    let s:drivers[a:name]=driver
endfunction
"▶2 deldriver :: {f} → + s:drivers
function s:F.deldriver(plugdict, fdict)
    for name in keys(a:fdict)
        for [buf, bvar] in filter(items(s:_r.bufvars),
                    \             'has_key(v:val[1], "repo") && '.
                    \             'v:val[1].repo.type is# name')
            if bufexists(buf)
                execute 'bwipeout' buf
            endif
        endfor
        call filter(s:bufrepos, 'v:val.type isnot# name')
        call filter(s:repos,    'v:val.type isnot# name')
        unlet s:drivers[name]
    endfor
endfunction
"▶2 Register feature
call s:_f.newfeature('regdriver', {'cons': s:F.regdriver,
            \                    'unload': s:F.deldriver})
"▶1
call frawor#Lockvar(s:, '_r,bufrepos,repos,drivers')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
