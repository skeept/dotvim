"▶1
scriptencoding utf-8
let s:pp='aurum.aumercurial'
execute frawor#Setup('0.2', {'@%aurum/drivers/common/hypsites': '0.0',
            \                                   '@%aurum/repo': '5.0',
            \                   '@%aurum/drivers/common/utils': '1.0',
            \                                       '@/python': '1.0',
            \                                           '@/os': '0.0',
            \                                      '@/options': '0.0',})
let s:hg={}
let s:iterfuncs={}
let s:nullrev=repeat('0', 40)
"▶1 Messages
let s:_messages={
            \ 'norepo': 'Repository %s not found',
            \ 'norev' : 'No revision %s in repository %s',
            \ 'nofile': 'File %s is not present in revision %s '.
            \           'from repository %s',
            \'statuns': 'Unable to get working directory status '.
            \           'of repository %s: operation not supported',
            \ 'comuns': 'Unable to commit to repository %s: '.
            \           'operation not supported',
            \'diffuns': 'Unable to create a diff for repository %s: '.
            \           'operation not supported',
            \ 'upduns': 'Unable to update working directory state for '.
            \           'repository %s: operation not supported',
            \ 'destex': 'Cannot copy %s to %s: destination already exists',
            \ 'nhgiwr': 'File %s is either a directory or not writeable',
            \'reponwr': 'Unable to write to repository root (%s)',
            \  'nocfg': 'No such property of repository %s: %s',
            \'failcfg': 'Failed to get property %s of repository %s',
            \'nlocbms': 'Bookmarks can’t be local',
            \'anbnimp': 'Can only get branch property using agetrepoprop',
            \'parsefail': 'Failed to parse changeset information',
            \ 'filefail': 'Failed to get file %s '.
            \             'from the repository %s: %s',
            \ 'difffail': 'Failed to get diff between %s and %s '.
            \             'for files %s from the repository %s: %s',
            \ 'statfail': 'Failed to obtain status information '.
            \             'for the repository %s: %s',
            \  'annfail': 'Failed to annotate revision %s of file %s '.
            \             'in the repository %s: %s',
            \  'cspfail': 'Failed to get property %s for changeset %s '.
            \             'in the repository %s: %s',
            \  'logfail': 'Failed to get log for the repository %s: %s',
            \  'keyfail': 'Failed to get %s for the repository %s: %s',
            \   'csfail': 'Failed to get changeset %s '.
            \             'from the repository %s: %s',
            \    'bfail': 'Failed to get current branch '.
            \             'from the repository %s: %s',
            \  'renfail': 'Failed to get renames list for revision %s '.
            \             'in the repository %s: %s',
            \  'cmdfail': 'Failure while running command %s '.
            \             'for the repository %s: %s',
            \ 'grepfail': 'Failed to search through the repository %s: %s',
            \   'scfail': 'Failed to show [paths] section '.
            \             'for the repository %s: %s',
            \  'svnfail': 'Failed to run “hg svn info” '.
            \             'for the repository %s: %s',
            \ 'stat1mis': 'You must specify first revision as well',
            \ 'nosvnrev': 'Failed to find revision in “hg svn info” output '.
            \             'in the repository %s. Output:%s',
            \ 'nohggitc': 'It appears that hg-git is not enabled '.
            \             '(tried options extensions.hggit and extensions.git)',
            \  'nohggit': 'It appears that hg-git is not installed '.
            \             '(importing GitHandler threw ImportError)',
            \ 'nogitrev': 'No git revision associated with revision %s '.
            \             'in repository %s',
            \ 'uknphase': 'Unknown phase: %s. Known phases: %s.',
        \}
"▶1 Options
let s:_options={
            \'hg_useshell':  {'default': [],
            \                  'filter':
            \                    '(if type "" (|=split(@.@,''\L\+'')) any '.
            \                     'list match /\v^\l+$/)'},
        \}
            " \'hg_itercsnum': {'default': ((s:usepythondriver)?(0):(1000)),
            " \                 'checker': 'range 0 inf'},
"▶1 s:hypsites
let s:hypsites=[]
let s:bookmarks='repo.functions.getcsprop(repo, hex, "bookmarks")'
let s:tags='repo.functions.getcsprop(repo, hex, "tags")'
if s:usepythondriver
    let s:gitrev='repo.functions.githex(repo, hex)'
else
    let s:gitrev='((!empty('.s:bookmarks.'))?'.
                \      '('.s:bookmarks.'[0]):'.
                \   '((!empty('.s:tags.'))?'.
                \      '(matchstr(get(filter(copy('.s:tags.'), '.
                \                           '"stridx(v:val, ''/'')!=-1"), 0, '.
                \           '"master"), "\\v[^/]+$"))'.
                \   ':'.
                \      '("master")))'
endif
unlet s:bookmarks s:tags
let s:hypsites+=map(copy(s:_r.hypsites.git), '["protocol[:2] is# ''git'' && (".v:val[0].")", '.
            \                                 'map(copy(v:val[1]), '.
            \                                     '''(v:key is# "clone" || v:key is# "push")?'.
            \                                           '(substitute(v:val, "\\v^\"%(git)@!", "\"git+", "")):'.
            \                                           '(substitute(v:val, "\\v<hex>", s:gitrev, "g"))'')]')
unlet s:gitrev
let s:hypsites+=s:_r.hypsites.mercurial
let s:svnrev='repo.functions.svnrev(repo, hex)'
let s:hypsites+=map(copy(s:_r.hypsites.svn), '[v:val[0], map(copy(v:val[1]), '.
            \                                               '''substitute(v:val, "\\v<hex>", s:svnrev, "g")'')]')
unlet s:svnrev
"▶1 removechangesets :: repo, start_rev_num → + repo
function s:F.removechangesets(repo, start)
    let changesets=a:repo.changesets
    for cs in remove(a:repo.mutable.cslist, a:start, -1)
        let hex=cs.hex
        for parenthex in filter(cs.parents, 'has_key(changesets, v:val)')
            call filter(changesets[parenthex].children, 'v:val isnot# cs.hex')
        endfor
        for childhex in filter(cs.children, 'has_key(changesets, v:val)')
            call filter(changesets[childhex].parents, 'v:val isnot# cs.hex')
        endfor
    endfor
endfunction
"▶1 hgcmd :: cmd, args, kwargs → String
function s:F.hgcmd(...)
    return ['hg']+call(s:_r.utils.getcmd, a:000, {})
endfunction
"▶1 runshellcmd :: repo, attr, args, kwargs → + ?
function s:F.runshellcmd(repo, attr, args, kwargs, ...)
    let e=(a:0 && a:1)
    let args=copy(a:args)
    if !empty(args)
        call insert(args, '--')
    endif
    return s:_r.utils.printm(s:F.hg(a:repo, a:attr, args, a:kwargs, e)[:-2+e])
endfunction
"▶1 hg :: repo, cmd, args, kwargs, esc, msgid[, throwarg1[, …]] → [String]
function s:F.hg(repo, cmd, args, kwargs, hasnulls, ...)
    let cmd=s:F.hgcmd(a:cmd, a:args, a:kwargs)
    let [r, exit_code]=s:_r.utils.run(cmd, a:hasnulls, a:repo.path)
    if a:0
        if a:1 is 0
            return [r, exit_code]
        elseif exit_code
            let args=copy(a:000)
            let args[0].='fail'
            call call(s:_f.throw, args+[a:repo.path, join(r[:-1-(a:hasnulls)],
                        \                                 "\n")], {})
        endif
    endif
    return r
endfunction
if s:usepythondriver "▶1
"▶2 addchangesets :: repo, [cs] → _ + repo
function s:F.addchangesets(repo, css)
    call map(copy(a:css), 'extend(a:repo.changesets, {v:val.hex : v:val})')
    for cs in a:css
        for parenthex in cs.parents
            call add(a:repo.changesets[parenthex].children, cs.hex)
        endfor
    endfor
endfunction
"▶2 runcmd :: repo, attr, args, kwargs[, bkwargs] → + ?
function s:F.runcmd(repo, attr, args, kwargs, ...)
    if index(s:_f.getoption('hg_useshell'), a:attr)!=-1
        return s:F.runshellcmd(a:repo, a:attr, a:args, a:kwargs)
    endif
    execute s:pya.'call_cmd(vim.eval("a:repo.path"), '.
                \           'vim.eval("a:attr"), '.
                \           ((a:0)?(string(a:1)):('None')).', '.
                \           '*vim.eval("a:args"), '.
                \           '**vim.eval("a:kwargs"))'
endfunction
"▶2 trycmd :: repo, attr → Bool
function s:F.trycmd(repo, cmd)
    execute s:py 'vim.command("let r="+str(int(hasattr('.s:pp.',"'.a:cmd.'"))))'
    return r
endfunction
"▲2
else "▶1
"▶2 addchangesets :: repo, [cs] → _ + repo
function s:F.addchangesets(repo, css)
    call map(copy(a:css), 'extend(a:repo.changesets, {v:val.hex : v:val})')
    for cs in a:css
        call map(cs.parents, 'type(v:val)=='.type(0).' ? '.
                    \           'a:repo.mutable.cslist[v:val].hex : '.
                    \           'v:val')
        for parenthex in cs.parents
            call add(a:repo.changesets[parenthex].children, cs.hex)
        endfor
    endfor
endfunction
"▶2 unesc :: String → String
let s:F.unesc=function('eval')
"▶2 refile :: path → path
function s:F.refile(path)
    return join(s:_r.os.path.split(a:path)[1:], '/')
endfunction
"▶2 parsecs :: csdata, lstart::UInt → (cs, line::UInt)
let s:stylefile=s:_r.os.path.join(s:_frawor.runtimepath,
                \                 'misc', 'map-cmdline.csinfo')
let s:chars = [['P', 'parents'  ],
            \  ['T', 'tags'     ],
            \  ['B', 'bookmarks']]
let s:fchars= [['C', 'changes'  ],
            \  ['R', 'removes'  ]]
function s:F.parsecs(csdata, lstart)
    "▶3 Initialize variables, check for changeset start
    let cs={}
    let line=a:lstart
    let lcsdata=len(a:csdata)
    if lcsdata<6 || a:csdata[line] isnot# ':'
        call s:_f.throw('parsefail')
    endif
    let line+=1
    "▶3 Simple keys: rev, hex, branch, time, user
    let null=''
    let cs.rev    = str2nr(a:csdata[line])       | let line+=1
    let cs.hex    = a:csdata[line]               | let line+=1
    let cs.phase  = a:csdata[line]               | let line+=1
    let cs.branch = s:F.unesc(a:csdata[line])[0] | let line+=1
    let cs.time   = str2nr(a:csdata[line])       | let line+=1
    let cs.user   = s:F.unesc(a:csdata[line])    | let line+=1
    if empty(cs.phase)
        let cs.phase='unknown'
    endif
    if empty(cs.branch)
        let cs.branch='default'
    endif
    "▶3 List keys: parents, tags, bookmarks, changes, removes
    for [char, key] in s:chars
        let cs[key]=[]
        while line<lcsdata && a:csdata[line][0] is# char
            let cs[key]+=[s:F.unesc(a:csdata[line][1:])]
            let line+=1
        endwhile
    endfor
    "▶3 List file keys: changes, removes
    for [char, key] in s:fchars
        let cs[key]=[]
        while line<lcsdata && a:csdata[line][0] is# char
            let cs[key]+=[s:F.refile(s:F.unesc(a:csdata[line][1:]))]
            let line+=1
        endwhile
    endfor
    "▶3 Add data to cs.parents in case it is empty
    if empty(cs.parents)
        if cs.rev>0
            let cs.parents=[cs.rev-1]
        else
            let cs.parents=[s:nullrev]
        endif
    endif
    "▶3 Filter cs.removes, add cs.files
    call filter(cs.removes, 'index(cs.changes, v:val)!=-1')
    let cs.files=filter(copy(cs.changes), 'index(cs.removes, v:val)==-1')
    "▶3 Copies, renames
    let copies={}
    while line<lcsdata && a:csdata[line][0] is# 'D'
        let copies[s:F.refile(s:F.unesc(a:csdata[line][1:]))]=
                    \                   s:F.refile(s:F.unesc(a:csdata[line+1]))
        let line+=2
    endwhile
    let cs.copies  = filter(copy(copies), 'index(cs.removes, v:val)==-1')
    let cs.renames = filter(copy(copies), '!has_key(cs.copies, v:key)')
    "▶3 Description
    let cs.description=s:F.unesc(a:csdata[line][1:])
    let line+=1
    "▲3
    return [cs, line]
endfunction
"▶2 getcslist :: repo, start, end
function s:F.getcslist(repo, start)
    let kwargs={'style': s:stylefile}
    let lines=s:F.hg(a:repo, 'log', [],
                \    extend({'rev': a:start.':-1'}, kwargs), 0, 'log')[:-2]
    let css=[]
    if has_key(a:repo.changesets, s:nullrev)
        let cs0=a:repo.changesets[s:nullrev]
    else
        let lines0=s:F.hg(a:repo, 'log', [], extend({'rev': s:nullrev}, kwargs),
                    \     0, 'log')
        let cs0=s:F.parsecs(lines0, 0)[0]
    endif
    let llines=len(lines)
    let line=0
    let prevrev=-1
    while line<llines
        let [cs, line]=s:F.parsecs(lines, line)
        if cs.rev-prevrev!=1 && prevrev!=-1
            let css+=map(range(prevrev+1, cs.rev-1),
                        \'s:F.parsecs(s:F.hg(a:repo, "log", [], '.
                        \            'extend({"rev": "".v:val}, kwargs), 0, '.
                        \            '"log"), 0)[0]')
        endif
        let css+=[cs]
        let prevrev=cs.rev
    endwhile
    let css+=[cs0]
    return css
endfunction
"▶2 getkeylist :: repo, key → [(name, rev)]
function s:F.getkeylist(repo, key)
    let lines=s:F.hg(a:repo, a:key, [], {}, 0, 'key', a:key)[:-2]
    if len(lines)==1 && lines[0]!~#'\v\ [1-9]\d*\:\x{12}$'
        return []
    endif
    return map(copy(lines), 'matchlist(v:val, '.
                \                         '''\v^(.{-})\ +(\d+)\:\x{12}'')[1:2]')
endfunction
"▶2 runcmd :: repo, attr, args, kwargs[, bkwargs] → + ?
function s:F.runcmd(repo, attr, args, kwargs, ...)
    return s:F.runshellcmd(a:repo, a:attr, a:args, a:kwargs)
endfunction
"▶2 trycmd :: repo, attr → Bool
function s:F.trycmd(repo, cmd)
    try
        call s:F.hg(a:repo, 'help', [a:cmd], {}, 0, 'f')
        return 1
    catch
        return 0
    endtry
endfunction
"▲2
endif
"▶1 trycmdcached :: repo, attr → Bool
function s:F.trycmdcached(repo, cmd)
    if !has_key(a:repo.mutable.commands, a:cmd)
        let a:repo.mutable.commands[a:cmd]=s:F.trycmd(a:repo, a:cmd)
    endif
    return a:repo.mutable.commands[a:cmd]
endfunction
"▶1 getcs :: repo, rev → cs
if s:usepythondriver "▶2
    function s:F.getcs(repo, rev)
        let cs={}
        try
            execute s:pya.'get_cs(vim.eval("a:repo.path"), '.
                        \        'vim.eval("a:rev"))'
        endtry
        return cs
    endfunction
else "▶2
    function s:F.getcs(repo, rev)
        let csdata=s:F.hg(a:repo, 'log', [], {'rev': a:rev,
                    \                       'style': s:stylefile}, 0,
                    \     'cs', a:rev)
        let cs=s:F.parsecs(csdata, 0)[0]
        call map(cs.parents,
                    \'type(v:val)=='.type(0).'? '.
                    \   'a:repo.functions.getrevhex(a:repo, v:val): '.
                    \   'v:val')
        return cs
    endfunction
endif
"▶1 hg.getcs :: repo, rev → cs
function s:hg.getcs(repo, rev)
    if type(a:rev)==type('') && has_key(a:repo.changesets, a:rev)
        return a:repo.changesets[a:rev]
    elseif type(a:rev)==type(0)
        if !empty(a:repo.mutable.cslist) && a:rev<a:repo.csnum
            return a:repo.mutable.cslist[a:rev]
        endif
    endif
    if a:rev=~#'\v^[0-9a-f]{40}$'
        let hex=a:rev
    else
        let hex=a:repo.functions.getrevhex(a:repo, a:rev)
        if has_key(a:repo.changesets,hex)
            return a:repo.changesets[hex]
        endif
    endif
    let cs=s:F.getcs(a:repo, hex)
    let a:repo.changesets[cs.hex]=cs
    return cs
endfunction
"▶1 hg.getwork :: repo → hex
function s:hg.getwork(repo)
    return a:repo.functions.getcs(a:repo, '.')
endfunction
"▶1 hg.getchangesets :: repo → changesets + repo.changesets
function s:hg.getchangesets(repo)
    call a:repo.functions.updatechangesets(a:repo, 1)
    return a:repo.mutable.cslist[:-2]
endfunction
"▶1 hg.revrange :: repo, rev, rev → [cs]
function s:hg.revrange(repo, rev1, rev2)
    if empty(a:repo.mutable.cslist)
        let cslist=a:repo.functions.getchangesets(a:repo)
    else
        let cslist=a:repo.mutable.cslist
    endif
    let rev1=a:repo.functions.getcs(a:repo, a:rev1).rev
    let rev2=a:repo.functions.getcs(a:repo, a:rev2).rev
    if rev1>rev2
        let [rev1, rev2]=[rev2, rev1]
    endif
    return cslist[(rev1):(rev2)]
endfunction
"▶1 hg.updatechangesets :: repo → + repo
"▶2 updatewithtagsdict
function s:F.updatewithtagsdict(csmap, d)
    for key in ['tags', 'bookmarks']
        if has_key(a:d, key) && !empty(a:d[key])
            let cd=a:d[key]
            let expr='get(cd, v:key, [])'
        else
            let expr='[]'
        endif
        call map(copy(a:csmap), 'extend(v:val, {"'.key.'": '.expr.'})')
    endfor
endfunction
"▶2 python
if s:usepythondriver
    function s:F.getupdates(repo, start)
        let d={}
        try
            " XXX get_updates also modifies a:repo
            " execute s:py 'import cProfile as profile'
            " execute s:py 'profile.run("'.s:pp.'.get_updates(vim.eval(''a:repo.path''), '.a:start.')", "python.profile")'
            execute s:pya.'get_updates(vim.eval("a:repo.path"), "'.a:start.'")'
        endtry
        return d
    endfunction
    function s:F.updatetags(repo)
        if empty(a:repo.changesets)
            return
        endif
        let d={}
        try
            execute s:pya.'get_tags(vim.eval("a:repo.path"))'
        endtry
        call s:F.updatewithtagsdict(a:repo.changesets, d)
        if a:repo.hasphases
            try
                execute s:pya.'get_phases(vim.eval("a:repo.path"))'
            endtry
            " XXX empty() is here in order to prevent “using dictionary as 
            "     a Number” error
            call map(d.phasemap, 'has_key(a:repo.changesets, v:key) && '.
                        \           'empty(extend(a:repo.changesets[v:key], '.
                        \                        '{"phase": v:val}))')
        endif
    endfunction
"▶2 no python
else
    function s:F.getupdates(repo, start)
        let r={}
        let tip_hex=a:repo.functions.gettiphex(a:repo)
        let cschange=1
        if a:start isnot 0
            try
                " XXX It is needed to force obtaining revision information hence 
                "     s:F.getcs(), not rf-getcs()
                let oldtip=s:F.getcs(a:repo, a:start)
                if tip_hex is# oldtip.hex
                    let cschange=0
                endif
                let startrev=oldtip.rev
            catch
                let startrev=0
            endtry
        else
            let startrev=0
        endif
        let r.startrev=startrev
        if cschange
            let r.css=s:F.getcslist(a:repo, startrev)
        else
            let r.css=[]
        endif
        for key in a:repo.updkeys
            let list=s:F.getkeylist(a:repo, key)
            if cschange
                call filter(list, 'v:val[1]<'.startrev)
            endif
            let r[key]={}
            for [name, rev] in list
                let r[key][name]=a:repo.mutable.cslist[rev].hex
            endfor
        endfor
        if a:repo.hasphases && startrev
            let r.phases=map(s:F.hg(a:repo, 'phase', [],
                        \           {'rev': '0:'.(cschange?(startrev-1):-1)},
                        \           0)[:-2],
                        \           'v:val[stridx(v:val, " ")+1:]')
        endif
        let a:repo.csnum=startrev+len(r.css)
        return r
    endfunction
    function s:F.updatetags(repo)
        if empty(a:repo.changesets)
            return
        endif
        let revmap={}
        call map(copy(a:repo.changesets), 'extend(revmap, {v:val.rev : v:val})')
        let d={}
        for key in a:repo.updkeys
            try
                let list=s:F.getkeylist(a:repo, key)
            catch
                continue
            endtry
            let d[key]={}
            let cd=d[key]
            call map(copy(list), 'has_key(cd, v:val[1])?'.
                        \           'add(cd[v:val[1]], v:val[0]):'.
                        \           'extend(cd, {v:val[1] : [v:val[0]]})')
            call map(values(cd), 'sort(v:val)')
        endfor
        call s:F.updatewithtagsdict(revmap, d)
        if a:repo.hasphases
            call map(s:F.hg(a:repo, 'phase', [], {'rev': ':'}, 0),
                        \'has_key(revmap, v:key) && '.
                        \   'empty(extend(revmap[v:key], '.
                        \                '{"phase": '.
                        \                     'v:val[stridx(v:val, " ")+1:]}))')
        endif
    endfunction
endif
"▶2 hg.updatechangesets
" TODO test updating in cases of rollback
function s:hg.updatechangesets(repo, ...)
    if !(a:0 && a:1) && empty(a:repo.mutable.cslist)
        return s:F.updatetags(a:repo)
    endif
    let d={}
    let start=get(a:repo.mutable.cslist, -2, {'hex': 0}).hex
    " XXX getupdates may also modify repo
    let d=s:F.getupdates(a:repo, start)
    if empty(d)
        return
    endif
    call map(d.css, 'extend(v:val, {"children": []})')
    if !empty(a:repo.mutable.cslist) && !empty(d.css)
        call s:F.removechangesets(a:repo, d.startrev)
    endif
    for key in a:repo.updkeys
        call map(a:repo.mutable.cslist, 'extend(v:val, {key : []})')
        for [name, hex] in filter(items(d[key]),
                    \             'has_key(a:repo.changesets, v:val[1])')
            let cs=a:repo.changesets[hex]
            let cs[key]+=[name]
            call sort(cs[key])
        endfor
    endfor
    if has_key(d, 'phases')
        let i=0
        for phase in d.phases
            let a:repo.mutable.cslist[i].phase=phase
            let i+=1
        endfor
    endif
    let a:repo.mutable.cslist+=d.css
    call s:F.addchangesets(a:repo, d.css)
endfunction
"▶1 hg.getrevhex :: repo, rev → rev(hex)
if s:usepythondriver "▶2
function s:hg.getrevhex(repo, rev)
    try
        execute s:py 'vim.command(''return "''+'.
                    \      s:pp.'.g_cs('.
                    \           s:pp.'.g_repo(vim.eval("a:repo.path")), '.
                    \          'vim.eval("a:rev")).hex()+''"'')'
    catch /\v^Frawor:/
        throw v:exception
    catch
        call s:_f.throw('norev', a:rev, a:repo.path)
    endtry
endfunction
else "▶2
let s:getrevhextemplate='{node}'
function s:hg.getrevhex(repo, rev)
    if type(a:rev)==type('') && (has_key(a:repo.changesets, a:rev) ||
                \                a:rev=~#'\v^[0-9a-f]{40}$')
        return a:rev
    elseif type(a:rev)==type(0) && a:rev<len(a:repo.mutable.cslist)
        return a:repo.mutable.cslist[a:rev].hex
    endif
    let hex=get(s:F.hg(a:repo, 'log', [], {'template': s:getrevhextemplate,
                \                               'rev': ''.a:rev}, 0, 'log'),0,0)
    if hex is 0
        call s:_f.throw('norev', a:rev, a:repo.path)
    endif
    return hex
endfunction
endif
"▶1 hg.gettiphex :: repo → hex
function s:hg.gettiphex(repo)
    return a:repo.functions.getrevhex(a:repo, 'tip')
endfunction
"▶1 hg.getworkhex :: repo → hex
function s:hg.getworkhex(repo)
    return a:repo.functions.getrevhex(a:repo, '.')
endfunction
"▶1 hg.setcsprop :: repo, cs, propname → a
if s:usepythondriver "▶2
function s:hg.setcsprop(repo, cs, prop)
    try
        execute s:pya.'get_cs_prop(vim.eval("a:repo.path"), '.
                    \             'vim.eval("a:cs.hex"), '.
                    \             'vim.eval("a:prop"))'
    endtry
endfunction
else "▶2
function s:hg.setcsprop(repo, cs, prop)
    if a:prop is# 'allfiles'
        let r=s:F.hg(a:repo, 'manifest', [], {'rev': a:cs.hex}, 0,
                    \'csp', a:prop, a:cs.rev)[:-2]
    elseif a:prop is# 'children'
        " XXX str2nr('123:1f6de') will return number 123
        let r=map(split(s:F.hg(a:repo, 'log', [],
                    \          {'rev': a:cs.hex, 'template': '{children}'},
                    \          0, 'csp', a:prop, a:cs.rev)[0]), 'str2nr(v:val)')
        if empty(a:repo.mutable.cslist)
            call map(r, 'a:repo.functions.getrevhex(a:repo, v:val)')
        else
            call map(r, 'a:repo.mutable.cslist[v:val].hex')
        endif
    endif
    let a:cs[a:prop]=r
    return r
endfunction
endif
"▶1 hg.status :: repo[, rev1[, rev2[, files[, clean[, ign]]]]] → {type : [file]}
" type :: "modified" | "added" | "removed" | "deleted" | "unknown" | "ignored"
"       | "clean"
if s:usepythondriver "▶2
let s:revargsexpr='v:val is 0? '.
                \       '"None":'.
                \ 'v:key>=3?'.
                \       '(empty(v:val)?"False":"True"):'.
                \       '"vim.eval(''a:".(v:key+1)."'')"'
function s:hg.status(repo, ...)
    let revargs=join(map(copy(a:000), s:revargsexpr), ',')
    let d={}
    try
        execute s:pya.'get_status(vim.eval("a:repo.path"), '.revargs.')'
    endtry
    return d
endfunction
else "▶2
let s:statchars={
            \'M': 'modified',
            \'A': 'added',
            \'R': 'removed',
            \'!': 'deleted',
            \'?': 'unknown',
            \'I': 'ignored',
            \'C': 'clean',
        \}
function s:F.statargs(...)
    let args=[]
    let kwargs={'modified': 1,
                \  'added': 1,
                \'removed': 1,
                \'deleted': 1,
                \'unknown': 1,
                \'ignored': (a:0>4 && a:5),
                \  'clean': (a:0>3 && a:4)}
    let reverse=0
    if a:0
        if a:1 is 0
            if a:0>1 && a:2 isnot 0
                let reverse=1
            endif
        else
            let args+=['--rev', a:1]
        endif
        if a:0>1 && a:2 isnot 0
            let args+=['--rev', a:2]
        endif
        if a:0>2 && !empty(a:3)
            let args+=['--']+a:3
        endif
    endif
    return [args, kwargs, reverse]
endfunction
" TODO test whether zero revision may cause bugs in some commands
function s:hg.status(repo, ...)
    let [args, kwargs, reverse]=call(s:F.statargs, a:000, {})
    let slines=s:F.hg(a:repo, 'status', args, kwargs, 0, 'stat')[:-2]
    if !empty(filter(copy(slines), '!has_key(s:statchars, v:val[0])'))
        call s:_f.throw('statfail', a:repo.path, join(slines, "\n"))
    endif
    let r=deepcopy(s:_r.utils.emptystatdct)
    call map(copy(slines),'add(r[s:statchars[v:val[0]]],s:F.refile(v:val[2:]))')
    if reverse
        let [r.deleted, r.unknown]=[r.unknown, r.deleted]
        let [r.added,   r.removed]=[r.removed, r.added  ]
    endif
    return r
endfunction
endif
"▶1 hg.dirty :: repo, file → Bool
if s:usepythondriver "▶2
function s:hg.dirty(repo, file)
    try
        let r=0
        execute s:pya.'dirty(vim.eval("a:repo.path"), vim.eval("a:file"))'
        return r
    endtry
endfunction
endif
"▶1 hg.commit :: repo, message[, files[, user[, date[, closebranch[, force]]]]]
function s:hg.commit(repo, message, ...)
    let kwargs={}
    let args=[]
    if a:0
        if !empty(a:1)
            let args+=a:1
            let kwargs.addremove=1
        endif
        if a:0>1 && !empty(a:2)
            let kwargs.user=a:2
        endif
        if a:0>2 && !empty(a:3)
            let kwargs.date=a:3
        endif
        if a:0>3 && !empty(a:4)
            let kwargs.close_branch=1
        endif
    endif
    return s:_r.utils.usefile(a:repo, a:message, 'logfile', 'message',
                \             s:F.runcmd, args, kwargs)
endfunction
"▶1 hg.branch :: repo, branchname, force → + FS
function s:hg.branch(repo, branch, force)
    return s:F.runcmd(a:repo, 'branch', [a:branch], {'force': !!a:force})
endfunction
"▶1 hg.label :: repo, type, label, rev, force, local → + FS
function s:hg.label(repo, type, label, rev, force, local)
    let kwargs={}
    let kwargs.force=(!!a:force)
    if a:type is# 'tag'
        if a:local
            let kwargs.local=1
        endif
        if a:rev is 0
            let kwargs.remove=1
        else
            let kwargs.rev=a:rev
        endif
    elseif a:type is# 'bookmark'
        if a:local
            call s:_f.throw('nlocbms')
        endif
        if a:rev is 0
            let kwargs.delete=1
        else
            let kwargs.rev=a:rev
        endif
    endif
    return s:F.runcmd(a:repo, a:type, [a:label], kwargs)
endfunction
"▶1 hg.phase :: repo, rev, phase[, force] → + FS
let s:phaselist=['public', 'draft', 'secret']
let s:phaseliststr=join(s:phaselist, ', ')
function s:hg.phase(repo, rev, phase, ...)
    let kwargs={}
    let kwargs.force=(a:0 && a:1)
    if index(s:phaselist, a:phase)==-1
        call s:_f.throw('uknphase', a:phase, s:phaseliststr)
    endif
    for phase in s:phaselist
        " XXX something inside mercurial expects all these keys to be present
        let kwargs[phase]=(a:phase is# phase)
    endfor
    let kwargs.rev=[a:rev]
    return s:F.runcmd(a:repo, 'phase', [], kwargs, s:phaselist)
endfunction
"▶1 hg.update :: repo, rev, force
if s:usepythondriver "▶2
function s:hg.update(repo, rev, force)
    try
        execute s:pya.'update(vim.eval("a:repo.path"), '.
                    \        'vim.eval("a:rev"), '.
                    \        'int(vim.eval("a:force")))'
    endtry
endfunction
else "▶2
function s:hg.update(repo, rev, force)
    call s:F.runcmd(a:repo, 'update', [], {'clean': !empty(a:force),
                \                            'rev': ((type(a:rev)==type(0))?
                \                                       string(a:rev):
                \                                       a:rev)})
endfunction
endif
"▶1 hg.move :: repo, force, source, target → + FS
function s:hg.move(repo, force, ...)
    return s:F.runcmd(a:repo, 'rename', a:000, {'force': (!!a:force)})
endfunction
"▶1 hg.copy :: repo, force, source, target → + FS
function s:hg.copy(repo, force, ...)
    return s:F.runcmd(a:repo, 'copy', a:000, {'force': (!!a:force)})
endfunction
"▶1 hg.add :: repo, file → + FS
function s:hg.add(repo, ...)
    return s:F.runcmd(a:repo, 'add', a:000, {})
endfunction
"▶1 hg.forget :: repo, file → + FS
function s:hg.forget(repo, ...)
    " XXX “hg rm --after --force” works like forget, but this behavior is not 
    "     documented in “hg help remove”. Using it in order to support older 
    "     mercurial versions
    return s:F.runcmd(a:repo, 'remove', a:000, {'after': 1, 'force': 1})
endfunction
"▶1 hg.remove :: repo, file → + FS
function s:hg.remove(repo, ...)
    return s:F.runcmd(a:repo, 'remove', a:000, {})
endfunction
"▶1 addtosection :: repo, hgignore::path, section, line → + FS(hgignore)
function s:F.addtosection(repo, hgignore, section, line)
    let addsect=['syntax: '.a:section,
                \a:line,
                \'']
    if s:_r.os.path.exists(a:hgignore)
        if filewritable(a:hgignore)==1
            let lines=readfile(a:hgignore, 'b')
            let r=[]
            let addedline=0
            let foundsyntax=0
            for line in lines
                if !addedline
                    if line is# 'syntax: '.a:section
                        let foundsyntax=1
                    elseif line[:6] is# 'syntax:' && foundsyntax
                        if empty(r[-1])
                            call remove(r, -1)
                            let r+=[a:line, '']
                        else
                            let r+=[a:line]
                        endif
                        let addedline=1
                    endif
                endif
                let r+=[line]
            endfor
            if !addedline
                if foundsyntax
                    if empty(r[-1])
                        call remove(r, -1)
                        let r+=[a:line, '']
                    else
                        let r+=[a:line]
                    endif
                else
                    let r+=addsect
                endif
            endif
            return writefile(r, a:hgignore, 'b')
        else
            call s:_f.throw('nhgiwr', a:hgignore)
        endif
    elseif filewritable(a:repo.path)==2
        return writefile(addsect, a:hgignore, 'b')
    else
        call s:_f.throw('reponwr', a:repo.path)
    endif
endfunction
"▶1 hg.ignore :: repo, file → +FS
"▶2 determine s:usepython value
let s:usepython=0
if has_key(s:_r, 'py')
    try
        execute s:py 'import json, re'
        let s:usepython=1
    catch
        " s:usepython stays equal to 0, errors are ignored
    endtry
endif
if s:usepython "▶2
    function s:hg.ignore(repo, file)
        let hgignore=s:_r.os.path.join(a:repo.path, '.hgignore')
        let re='^'.s:_r.utils.pyeval('re.escape('.
                    \                       s:_r.utils.pystring(a:file).')').'$'
        return s:F.addtosection(a:repo, hgignore, 'regexp', re)
    endfunction
else           "▶2
    function s:hg.ignore(repo, file)
        let hgignore=s:_r.os.path.join(a:repo.path, '.hgignore')
        " According to the documentation, re.escape escapes all non-alphanumeric 
        " characters, we just do the same here.
        let re='^'.substitute(a:file, '\W', '\\\0', '').'$'
        return s:F.addtosection(a:repo, hgignore, 'regexp', re)
    endfunction
endif
"▶1 hg.ignoreglob :: repo, glob → + FS
function s:hg.ignoreglob(repo, glob)
    let hgignore=s:_r.os.path.join(a:repo.path, '.hgignore')
    return s:F.addtosection(a:repo, hgignore, 'glob', a:glob)
endfunction
"▶1 hg.grep :: repo, pattern, files, revisions, ignore_case, wdfiles → qflist
" revisions :: [Either rev (rev, rev)]
if s:usepythondriver "▶2
function s:hg.grep(repo, pattern, files, revisions, ignore_case, wdfiles)
    let r=[]
    execute s:pya.'grep(vim.eval("a:repo.path"), '.
                \      'vim.eval("a:pattern"), '.
                \      'vim.eval("a:files"), '.
                \      'vim.eval("a:revisions"), '.
                \      'bool(int(vim.eval("a:ignore_case"))), '.
                \      'bool(int(vim.eval("a:wdfiles"))))'
    return r
endfunction
else "▶2
"▶3 checknotmodifiedsince
function s:F.checknotmodifiedsince(repo, rev, file, cache)
    let key=a:rev.':'.a:file
    if has_key(a:cache, key)
        return a:cache[key]
    endif
    let status=a:repo.functions.status(a:repo, a:rev, 0, [a:file], 1)
    let r=(!empty(status.clean) && a:file is# status.clean[0])
    let a:cache[key]=r
    return r
endfunction
"▲3
function s:hg.grep(repo, pattern, files, revisions, ignore_case, wdfiles)
    let args=map(copy(a:revisions),
            \                '((type(v:val)=='.type([]).')?'.
            \                   '("--rev=".join(v:val, ":")):'.
            \                   '("--rev=".v:val))')+
            \['--', a:pattern]+a:files
    let kwargs={'line-number': 1}
    let allfiles=a:repo.functions.getcsprop(a:repo, '.', 'allfiles')
    let kwargs.follow=empty(filter(copy(a:files), 'index(allfiles, v:val)==-1'))
    if a:ignore_case
        let kwargs['ignore-case']=1
    endif
    let kwargs.print0=1
    let [lines, exit_code]=s:F.hg(a:repo, 'grep', args, kwargs, 2, 0)
    if exit_code
        " Grep failed because it has found nothing
        if lines ==# ['']
            return []
        " Grep failed for another reason
        else
            call s:_f.throw('grepfail', a:repo.path, join(lines, "\n"))
        endif
    endif
    let r=[]
    let cnmscache={}
    let lines=s:_r.utils.nullnl(lines)
    call remove(lines, -1)
    while !empty(lines)
        let [file, rev, lnum, text]=remove(lines, 0, 3)
        if a:wdfiles && index(allfiles, file)!=-1 &&
                    \s:F.checknotmodifiedsince(a:repo, rev, file, cnmscache)
            let filename=s:_r.os.path.normpath(s:_r.os.path.join(a:repo.path,
                        \                      file))
        else
            let filename=[rev, file]
        endif
        let r+=[{'filename': filename, 'lnum': lnum, 'text': text}]
        unlet filename
    endwhile
    return r
endfunction
endif
"▶1 hg.readfile :: repo, rev, file → [String]
if s:usepythondriver "▶2
function s:hg.readfile(repo, rev, file)
    let r=[]
    try
        execute s:pya.'get_file(vim.eval("a:repo.path"), '.
                    \          'vim.eval("a:rev"), '.
                    \          'vim.eval("a:file"))'
    endtry
    return r
endfunction
else "▶2
function s:hg.readfile(repo, rev, file)
    return s:F.hg(a:repo, 'cat', ['--',a:file], {'rev': ''.a:rev}, 2,
                \ 'file', a:file)
endfunction
endif
"▶1 hg.annotate :: repo, rev, file → [(file, rev, linenumber)]
if s:usepythondriver "▶2
function s:hg.annotate(repo, rev, file)
    let r=[]
    try
        execute s:pya.'annotate(vim.eval("a:repo.path"), '.
                    \          'vim.eval("a:rev"), '.
                    \          'vim.eval("a:file"))'
    endtry
    return r
endfunction
else "▶2
function s:hg.annotate(repo, rev, file)
    let r=[]
    " XXX Warning: --follow has the same effect as --file, but is not documented 
    "              in most recent mercurial
    let lines=s:F.hg(a:repo, 'annotate', ['--', a:file],
                \    {'rev': ''.a:rev, 'follow':1, 'number':1, 'line-number':1},
                \    1, 'ann', a:rev, a:file)
    for line in lines
        " XXX This won't work for files that start with spaces and also with 
        " some other unusual filenames that can be present in a repository
        let match=matchlist(line, '\v^\s*(\d+)\ +(.{-})\:\s*([1-9]\d*)\:\ ')
        if empty(match)
            call s:_f.throw('annfail', a:rev, a:file, line)
        endif
        let r+=[[match[2], match[1], str2nr(match[3])]]
    endfor
    return r
endfunction
endif
"▶1 hg.diff :: repo, rev1, rev2, [path], opts → diff::[String]
"▶2 s:difftrans
let s:difftrans={
            \      'git': 'git',
            \  'reverse': 'reverse',
            \ 'ignorews': 'ignore_all_space',
            \'iwsamount': 'ignore_space_change',
            \  'iblanks': 'ignore_blank_lines',
            \ 'numlines': 'unified',
            \ 'showfunc': 'show_function',
            \  'alltext': 'text',
            \    'dates': 'nodates',
        \}
if s:usepythondriver "▶2
function s:F.getdiffargs(repo, rev1, rev2, files, opts)
    return       'vim.eval("a:repo.path"), '.
                \(empty(a:rev1)  ? 'None' : 'vim.eval("a:rev1")' ).', '.
                \(empty(a:rev2)  ? 'None' : 'vim.eval("a:rev2")' ).', '.
                \(empty(a:files) ? '[]'   : 'vim.eval("a:files")').', '.
                \'vim.eval("diffopts")'
endfunction
function s:hg.diff(repo, rev1, rev2, files, opts)
    let r=[]
    let diffopts=s:_r.utils.diffopts(a:opts, a:repo.diffopts, s:difftrans)
    try
        execute s:pya.'diff('.s:F.getdiffargs(a:repo, a:rev1, a:rev2, a:files,
                    \                         a:opts).')'
    endtry
    return r
endfunction
else "▶2
"▶3 getdiffargs
function s:F.getdiffargs(repo, rev1, rev2, files, opts)
    let diffopts=s:_r.utils.diffopts(a:opts, a:repo.diffopts, s:difftrans)
    let args=[]
    let kwargs={}
    let rev1=((empty(a:rev1))?(0):(''.a:rev1))
    let rev2=((empty(a:rev2))?(0):(''.a:rev2))
    if rev2 is 0
        if rev1 isnot 0
            let kwargs.change=''.rev1
        endif
    elseif rev1 isnot 0
        let args+=['--rev', rev2, '--rev', rev1]
    else
        let kwargs.rev=rev2
    endif
    for [o, v] in items(diffopts)
        if o is# 'unified'
            let kwargs[o]=''.v
        elseif v
            let kwargs[tr(o, '_', '-')]=1
        endif
    endfor
    if has_key(kwargs, 'reverse')
        if (has_key(a:repo.mutable, 'noreverse')?
                \(a:repo.mutable.noreverse):
                \(empty(filter(s:F.hg(a:repo, 'help', ['diff'], {}, 0),
                \              'stridx(v:val, "--reverse")!=-1'))))
            let a:repo.mutable.noreverse=1
            unlet kwargs.reverse
        else
            let a:repo.mutable.noreverse=0
        endif
    endif
    if !empty(a:files)
        let args+=['--']+a:files
    endif
    return ['diff', args, kwargs]
endfunction
"▲3
function s:hg.diff(repo, rev1, rev2, files, opts)
    let args=s:F.getdiffargs(a:repo, a:rev1, a:rev2, a:files, a:opts)
    return call(s:F.hg, [a:repo]+args+[1, 'diff', a:rev1, a:rev2,
                \                      join(a:files, ', ')], {})
                \+['']
endfunction
endif
"▶1 hg.difftobuffer :: repo, buf, rev1, rev2, [path], opts → [String]
if s:usepythondriver "▶2
function s:hg.difftobuffer(repo, buf, rev1, rev2, files, opts)
    let r=[]
    let oldbuf=bufnr('%')
    if oldbuf!=a:buf
        execute 'buffer' a:buf
    endif
    try
        let diffopts=s:_r.utils.diffopts(a:opts, a:repo.diffopts, s:difftrans)
        execute s:pya.'diffToBuffer('.s:F.getdiffargs(a:repo, a:rev1, a:rev2,
                    \                                 a:files, a:opts).')'
    finally
        if oldbuf!=a:buf
            execute 'buffer' oldbuf
        endif
    endtry
endfunction
else "▶2
function s:hg.difftobuffer(repo, buf, rev1, rev2, files, opts)
    let args=s:F.getdiffargs(a:repo, a:rev1, a:rev2, a:files, a:opts)
    let cmd=call(s:F.hgcmd, args, {})
    let oldbuf=bufnr('%')
    if oldbuf!=a:buf
        execute 'buffer' a:buf
    endif
    try
        execute 'lcd' fnameescape(a:repo.path)
        execute '%!'.join(map(copy(cmd), 'shellescape(v:val, 1)'))
        lcd -
    finally
        if oldbuf!=a:buf
            execute 'buffer' oldbuf
        endif
    endtry
endfunction
endif
"▶1 hg.diffre :: _, opts → regex
function s:hg.diffre(repo, opts)
    " XXX first characters must be identical for hg.getstats(), but it must not 
    " match lines not containing filename for getdifffile()
    if get(a:opts, 'git', 0)
        return '\m^diff \V--git a/\(\.\{-}\) b/'
    else
        return '\m^diff \v.*\-r\ \w+\s(.*)$'
    endif
endfunction
"▶1 hg.getrepoprop :: repo, prop → a
if s:usepythondriver "▶2
function s:hg.getrepoprop(repo, prop)
    let d={}
    try
        execute s:pya.'get_repo_prop(vim.eval("a:repo.path"), '.
                    \               'vim.eval("a:prop"))'
    endtry
    return d[a:prop]
endfunction
else "▶2
function s:hg.getrepoprop(repo, prop)
    if a:prop is# 'branch'
        return s:F.hg(a:repo, 'branch', [], {}, 0, 'b')[0]
    elseif a:prop is# 'tagslist' || a:prop is# 'brancheslist' ||
                \                   a:prop is# 'bookmarkslist'
        if a:prop is# 'bookmarkslist' && !a:repo.hasbookmarks
            return []
        endif
        return map(copy(s:F.getkeylist(a:repo, a:prop[:-5])), 'v:val[0]')
    elseif a:prop is# 'url'
        let lines=s:F.hg(a:repo, 'showconfig', ['paths'], {}, 0, 'sc')[:-2]
        let confs={}
        call map(lines, 'matchlist(v:val, ''\C\v^paths\.([^=]+)\=(.*)$'')[1:2]')
        call map(copy(lines), 'extend(confs, {v:val[0]: v:val[1]})')
        if has_key(confs, 'default-push')
            return confs['default-push']
        elseif has_key(confs, 'default')
            return confs.default
        endif
    else
        call s:_f.throw('nocfg', a:repo.path, a:prop)
    endif
    call s:_f.throw('failcfg', a:prop, a:repo.path)
endfunction
endif
"▶1 pushpull :: cmd, repo, force[, URL[, rev]] → + ?
function s:F.pushpull(cmd, repo, force, ...)
    let kwargs={}
    let args=[]
    if a:0
        if a:1 isnot 0
            let args+=[a:1]
        endif
        if a:0>1 && a:2 isnot 0
            let kwargs.rev=''.a:2
        endif
    endif
    if a:force
        let kwargs.force=1
    elseif a:cmd is# 'push'
        let kwargs['new-branch']=1
    endif
    if a:cmd is# 'pull'
        let kwargs.update=1
    endif
    return s:F.runcmd(a:repo, a:cmd, args, kwargs)
endfunction
"▶1 hg.push :: repo, dryrun, force[, URL[, rev]]
function s:hg.push(repo, dryrun, ...)
    return call(s:F.pushpull, [((a:dryrun)?('outgoing'):
                \                          ('push')), a:repo]+a:000, {})
endfunction
"▶1 hg.pull :: repo, dryrun, force[, URL[, rev]]
function s:hg.pull(repo, dryrun, ...)
    return call(s:F.pushpull, [((a:dryrun)?('incoming'):
                \                          ('pull')), a:repo]+a:000, {})
endfunction
"▶1 hg.repo :: path + ? → repo
if s:usepythondriver "▶2
function s:hg.repo(path)
    let repo={}
    try
        " execute s:py 'import cProfile as profile'
        " execute s:py 'profile.run("'.s:pp.'.new_repo(vim.eval(''a:path''))", "python.profile")'
        execute s:pya.'new_repo(vim.eval("a:path"))'
    catch /\V\^Frawor:\[^:]\+:norepo:/
        return 0
    endtry
    let repo.hypsites=deepcopy(s:hypsites)
    let repo.iterfuncs=deepcopy(s:iterfuncs)
    return repo
endfunction
else "▶2
function s:hg.repo(path)
    let repo={'path': a:path, 'changesets': {}, 'mutable': {'cslist': [],
                \                                         'commands': {}},
                \'local': (stridx(a:path, '://')==-1),
                \'labeltypes': ['tag', 'bookmark'],
                \'has_octopus_merges': 0, 'requires_sort': 0,
                \'iterfuncs': deepcopy(s:iterfuncs),
                \'hypsites': deepcopy(s:hypsites),
                \'initprops': ['rev', 'hex', 'parents', 'tags', 'bookmarks',
                \              'branch', 'time', 'user', 'changes', 'removes',
                \              'copies', 'renames', 'files', 'description',
                \              'phase']}
    let repo.hasphases=s:F.trycmd(repo, 'phase')
    let repo.updkeys=['tags']
    if !s:F.trycmd(repo, 'bookmark')
        call filter(repo.labeltypes, 'v:val isnot# "bookmark"')
        let repo.hasbookmarks=0
    else
        let repo.hasbookmarks=1
        let repo.updkeys+=['bookmarks']
    endif
    return repo
endfunction
endif
"▶1 hg.checkdir :: dir → Bool
function s:hg.checkdir(dir)
    return s:_r.os.path.isdir(s:_r.os.path.join(a:dir, '.hg'))
endfunction
"▶1 iterfuncs
"▶2 getfromchangesets
function s:F.getfromchangesets(repo, hex)
    return a:repo.changesets[a:hex]
endfunction
"▶2 getrev
function s:F.getrev(repo, rev)
    let cs=s:F.getcs(a:repo, a:rev)
    let a:repo.changesets[cs.hex]=cs
    return cs
endfunction
"▶2 getgetcsfunc
function s:F.getgetcsfunc(repo)
    if empty(a:repo.mutable.cslist)
        return s:F.getrev
    else
        return s:F.getfromchangesets
    endif
endfunction
"▶2 iterfuncs.ancestors
function s:iterfuncs.ancestors(repo, opts)
    let cs=a:repo.functions.getcs(a:repo,
                \a:repo.functions.getrevhex(a:repo, a:opts.revision))
    return {'addrevs': [cs], 'revisions': {}, 'repo': a:repo,
                \'hasrevisions': get(a:repo, 'hasrevisions', 1),
                \'getcs': s:F.getgetcsfunc(a:repo),
                \'next': s:F.ancestorsnext,}
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
    let cs=remove(self.addrevs, 0)
    if has_key(self.revisions, cs.hex)
        return self.next()
    endif
    let self.revisions[cs.hex]=cs
    let parents=map(copy(cs.parents),'self.getcs(self.repo,v:val)')
    call extend(self.addrevs, parents)
    if self.hasrevisions
        call sort(self.addrevs, 's:RevCmp')
    endif
    return cs
endfunction
"▶1 astatus, agetcs, agetrepoprop
if s:_r.repo.userepeatedcmd
    if s:usepythondriver
        if exists('*pyeval')
            function s:hg.astatus(repo, interval, ...)
                let args = string(a:interval).', '.s:pp.'._get_status, '.
                            \'vim.eval("a:repo.path"), '
                let args.= join(map(copy(a:000), s:revargsexpr), ',')
                return s:_r.utils.pyeval('aurum.repeatedcmd.new('.args.')')
            endfunction
        else
            function s:hg.astatus(repo, interval, ...)
                let args = string(a:interval).', '.s:pp.'._get_status, '.
                            \'vim.eval("a:repo.path"), '
                let args.= join(map(copy(a:000), s:revargsexpr), ',')
                execute 'python vim.command("return "+'.
                            \       'aurum.auutils.nonutf_dumps('.
                            \               'aurum.repeatedcmd.new('.args.')))'
            endfunction
        endif
        function s:hg.agetcs(repo, interval, rev)
            return s:_r.utils.pyeval('aurum.repeatedcmd.new('.
                        \                 string(a:interval).', '.
                        \                 s:pp.'._get_cs, '.
                        \                 s:_r.utils.pystring(a:repo.path).', '.
                        \                 s:_r.utils.pystring(a:rev).')')
        endfunction
        function s:hg.agetrepoprop(repo, interval, prop)
            return s:_r.utils.pyeval('aurum.repeatedcmd.new('.
                        \                 string(a:interval).', '.
                        \                'aurum.auutils.get_one_prop, '.
                        \                 s:pp.'._get_repo_prop, '.
                        \                 s:_r.utils.pystring(a:repo.path).', '.
                        \                 string(a:prop).')')
        endfunction
    else
        try
            python import aurum.rcdriverfuncs
            let s:addafuncs=1
        catch
            let s:addafuncs=0
        endtry
        if s:addafuncs
            function s:hg.astatus(repo, interval, ...)
                let [args, kwargs, reverse]=call(s:F.statargs, a:000, {})
                let arglist=s:_r.utils.kwargstolst(kwargs)+args
                return s:_r.utils.pyeval('aurum.repeatedcmd.new('.
                            \        string(a:interval).', '.
                            \       'aurum.rcdriverfuncs.hg_status, '.
                            \       'vim.eval("a:repo.path"), '.
                            \       'vim.eval("arglist"), '.
                            \        (reverse ? 'True' : 'False').')')
            endfunction
            function s:hg.agetrepoprop(repo, interval, prop)
                if a:prop isnot# 'branch'
                    call s:_f.throw('anbnimp')
                endif
                return s:_r.utils.pyeval('aurum.repeatedcmd.new('.
                            \        string(a:interval).', '.
                            \       'aurum.rcdriverfuncs.hg_branch, '.
                            \       'vim.eval("a:repo.path"))')
            endfunction
        endif
    endif
endif
"▶1 hg.svnrev :: repo, rev → svnrev
function s:hg.svnrev(repo, rev)
    let lines=s:F.hg(a:repo, 'svn', ['info'], {'rev': ''.a:rev}, 0, 'svn')
    for line in lines
        if line[:9] is# 'Revision: '
            return +line[10:]
        endif
    endfor
    call s:_f.throw('nosvnrev', a:repo.path, "\n".join(lines, "\n"))
endfunction
"▶1 hg.gitrev :: repo, rev → githex
if s:usepythondriver
function s:hg.githex(repo, rev)
    let d={}
    try
        execute s:pya.'git_hash(vim.eval("a:repo.path"), vim.eval("a:rev"))'
    endtry
    return d.git_hex
endfunction
endif
"▶1 Register driver
call s:_f.regdriver('Mercurial', s:hg)
"▶1
call frawor#Lockvar(s:, '_pluginloaded')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
