"▶1
scriptencoding utf-8
let s:pp='aurum.augit'
execute frawor#Setup('0.1', {'@%aurum/drivers/common/hypsites': '0.0',
            \                                   '@%aurum/repo': '5.0',
            \                   '@%aurum/drivers/common/utils': '1.2',
            \                                           '@/os': '0.1',
            \                                      '@/options': '0.0',
            \                                       '@/python': '1.0',})
let s:_messages={
            \   'hexf': 'Failed to obtain hex string for revision %s '.
            \           'in the repository %s: %s',
            \   'logf': 'Failed to list all revisions in the repository %s: %s',
            \  'rlogf': 'Failed to list revisions %s..%s '.
            \           'in the repository %s: %s',
            \    'csf': 'Failed to obtain information about revision %s '.
            \           'in the repository %s: %s',
            \    'cif': 'Failed to commit changes to the repository %s: %s',
            \   'updf': 'Failed to checkout commit %s in the repository %s: %s',
            \    'mvf': 'Failed to move file %s to %s in the repository %s: %s',
            \    'rmf': 'Failed to remove file %s in the repository %s: %s',
            \    'fgf': 'Failed to forget file %s in the repository %s: %s',
            \  'filef': 'Failed to get revision %s of the file %s '.
            \           'from the repository %s: %s',
            \   'annf': 'Failet to annotate revision %s of the file %s '.
            \           'in the repository %s: %s',
            \  'difff': 'Failed to get diff between %s and %s for files %s '.
            \           'in the repository %s: %s',
            \ 'sdifff': 'Failed to get status information '.
            \           'for the repository %s: %s',
            \ 'rdifff': 'Failed to property %s for changeset %s '.
            \           'in the repository %s: %s',
            \    'lsf': 'Failed to list files in the changeset %s '.
            \           'of the repository %s: %s',
            \'statusf': 'Failed to obtain status of the repository %s: %s',
            \ 'lsignf': 'Failed to list ignored files '.
            \           'in the repository %s: %s',
            \    'rlf': 'Failed to list commits in repository %s: %s',
            \    'lbf': 'Failed to create/remove %s %s for revision %s '.
            \           'in the repository %s: %s',
            \'branchf': 'Failed to get list of branches '.
            \           'from the repository %s: %s',
            \  'grepf': 'Failed to search through the repository %s: %s',
            \ 'stripf': 'Failed to strip revision %s '.
            \           'from the repository %s: %s',
            \   'tagf': 'Failed to get list of tags from the repository %s: %s',
            \   'addf': 'Failed to add file %s to the repository %s: %s',
            \ 'cbnimp': 'Git driver is not able to close branch',
            \   'nloc': 'Git driver does not suppport local tags or branches',
            \   'chbf': 'Failed to create branch %s in the repository %s: %s',
            \  'nocfg': 'Failed to get property %s of repository %s',
            \ 'invrng': 'Range %s..%s is invalid for the repository %s, '.
            \           'as well as reverse',
            \    'ppf': 'Failed to run “git %s” for the repository %s: %s',
            \
            \'anbnimp': 'Can only get branch property using agetrepoprop',
            \'aconimp': 'Can only get current status for one file',
            \'as2nimp': 'Can only get current status',
            \
            \ 'norepo': 'Repository %s not found',
            \  'norev': 'Revision %s not found in repository %s',
            \'uresrev': 'Don’t know how to resolve %s into a commit object. '.
            \           'Occured when resolving %s in the repository %s',
            \ 'nohead': 'Failed to obtain HEAD revision in the repository %s',
            \ 'sfnsup': 'Forced strip is not supported',
        \}
let s:git={}
let s:_options={
            \'git_maxitercsnum': {'default': 1000, 'checker': 'range 0 inf'},
        \}
"▶1 s:hypsites
let s:hypsites=s:_r.hypsites.git
"▶1 refile :: gitfname → path
function s:F.refile(fname)
    return a:fname[0] is# '"' ? eval(a:fname) : a:fname
endfunction
"▶1 gitcmd :: cmd, args, kwargs → String
function s:F.gitcmd(...)
    return ['git']+call(s:_r.utils.getcmd, a:000, {})
endfunction
"▶1 git :: repo, cmd, args, kwargs, has0[, msgid[, marg1[, …]]] → [String] + ?
function s:F.git(repo, cmd, args, kwargs, hasnulls, ...)
    let cmd=s:F.gitcmd(a:cmd, a:args, a:kwargs)
    let [r, exit_code]=s:_r.utils.run(cmd, a:hasnulls, a:repo.path)
    if a:0
        if a:1 is 0
            return [r, exit_code]
        elseif exit_code
            call call(s:_f.throw, a:000+[a:repo.path, join(r[:-1-(a:hasnulls)],
                        \                                  "\n")], {})
        endif
    endif
    return r
endfunction
"▶1 gitm :: {git args} → + :echom
function s:F.gitm(...)
    return s:_r.utils.printm(call(s:F.git, a:000, {}))
endfunction
"▶1 parsecs :: csdata, lstart::UInt → (cs, line::UInt)
" hash-parent hashes-timestamp
"  (refs)
" author name
" author email
" 1-indented commit message
let s:logformat='%h-%H-%P-%at%n%an%n%ae%n%d%n%w(0,1,1)%B'
let s:logkwargs={'format': s:logformat, 'encoding': 'utf-8', 'date-order': 1}
function s:F.parsecs(csdata)
    let cs={'branch': 'default', 'phase': 'unknown', 'bookmarks': []}
    let [rev, hex, parents, time]=split(remove(a:csdata, 0), '-', 1)
    let cs.hex=hex
    let cs.parents=split(parents)
    let cs.time=+time
    let cs.rev=rev
    let aname=remove(a:csdata, 0)
    let aemail=remove(a:csdata, 0)
    let cs.user=aname.' <'.aemail.'>'
    let cs.tags=split(remove(a:csdata, 0)[2:-2], ', ')
    "▶2 get description
    let description=[]
    while !empty(a:csdata) && a:csdata[0][0] is# ' '
        let description+=[remove(a:csdata, 0)[1:]]
    endwhile
    let cs.description=join(description, "\n")
    if get(a:csdata, 0, 0) is# ''
        call remove(a:csdata, 0)
    endif
    "▲2
    return cs
endfunction
"▶1 git.getcs :: repo, rev → cs
function s:git.getcs(repo, rev)
    let cs=s:F.parsecs(s:F.git(a:repo, 'log', ['-n1', a:rev], s:logkwargs,
                \              0, 'csf', a:rev))
    " XXX This construct is used to preserve information like “allfiles” etc
    let a:repo.changesets[cs.hex]=extend(get(a:repo.changesets, cs.hex, {}), cs)
    return a:repo.changesets[cs.hex]
endfunction
"▶1 git.getwork :: repo → cs
function s:git.getwork(repo)
    return a:repo.functions.getcs(a:repo, 'HEAD')
endfunction
"▶1 prepgitargs
function s:F.prepgitargs(repo, ...)
    "▶2 Prepare s:F.git arguments
    let args=[]
    let kwargs=copy(s:logkwargs)
    let revargs=[]
    let revkwargs={}
    if a:0
        let revargs+=[((a:1 is 0)?(''):(a:1.'^..')).
                    \ ((a:2 is 0)?(''):(a:2))]
    else
        let revkwargs.all=1
        let revkwargs['full-history']=1
    endif
    let gitargs=[a:repo, 'log', args, kwargs, 0]
    if a:0
        let gitargs+=['rlogf', a:1, a:2]
    else
        let gitargs+=['logf']
    endif
    "▶2 Prepare hexslist in case git_maxitercsnum is greater then zero
    if a:repo.maxitercsnum
        let gitrlargs=copy(gitargs)
        let gitrlargs[2]=copy(gitrlargs[2])+revargs
        let gitrlargs[3]=extend(extend(copy(gitrlargs[3]),
                    \           s:rlkwargs),
                    \           revkwargs)
        let hexlist=call(s:F.git, gitrlargs, {})[:-2]
        let kwargs['no-walk']=1
    else
        call extend(kwargs, revkwargs)
        call extend(  args, revargs  )
        let hexlist=1
    endif
    "▲2
    return [hexlist, gitargs]
endfunction
"▶1 git.getchangesets :: repo[, rangestart[, rangeend]] → [cs]
let s:rlkwargs={'format': '%H'}
function s:git.getchangesets(repo, ...)
    let [hexlist, gitargs]=call(s:F.prepgitargs, [a:repo]+a:000, {})
    let args=gitargs[2]
    let cslist=[]
    while !empty(hexlist)
        if hexlist is 1
            let hexlist=0
        else
            let curhexs=remove(hexlist, 0,
                        \      min([a:repo.maxitercsnum, len(hexlist)])-1)
            let gitargs[2]=args+curhexs
        endif
        let log=call(s:F.git, gitargs, {})[:-2]
        "▶2 Parse changeset information
        while !empty(log)
            let cs=s:F.parsecs(log)
            let a:repo.changesets[cs.hex]=extend(get(a:repo.changesets, cs.hex,
                        \                            {}),
                        \                        cs)
            call insert(cslist, a:repo.changesets[cs.hex])
        endwhile
        "▲2
    endwhile
    return cslist
endfunction
"▶1 git.revrange :: repo, rev1, rev2 → [cs]
let s:git.revrange=s:git.getchangesets
"▶1 git.updatechangesets :: repo → _
function s:git.updatechangesets(...)
endfunction
"▶1 git.getrevhex :: repo, rev → hex
let s:prevrevhex={}
if s:usepythondriver
function s:git.getrevhex(repo, rev)
    let d={}
    try
        execute s:pya.'getrevhex(vim.eval("a:repo.path"), vim.eval("a:rev"))'
    endtry
    return d.hex
endfunction
else
function s:git.getrevhex(repo, rev)
    if a:rev=~#'\v^[0-9a-f]{40}$'
        if has_key(s:prevrevhex, a:repo.path)
            unlet s:prevrevhex[a:repo.path]
        endif
        return a:rev
    endif
    let r=s:F.git(a:repo, 'rev-parse', [a:rev], {}, 0, 'hexf', a:rev)[0]
    let s:prevrevhex[a:repo.path]=[a:rev, r]
    return r
endfunction
endif
"▶1 git.getworkhex :: repo → hex
function s:git.getworkhex(repo)
    return a:repo.functions.getrevhex(a:repo, 'HEAD')
endfunction
"▶1 git.gettiphex
" XXX Uses HEAD instead of latest revision
let s:git.gettiphex=s:git.getworkhex
"▶1 git.setcsprop :: repo, cs, propname → propvalue
function s:git.setcsprop(repo, cs, prop)
    if a:prop is# 'allfiles'
        let r=map(s:F.git(a:repo, 'ls-tree', ['--', a:cs.hex],
                    \                        {'name-only': 1, 'r': 1}, 0,
                    \     'lsf', a:cs.hex)[:-2], 's:F.refile(v:val)')
    elseif a:prop is# 'children'
        let lines=filter(map(s:F.git(a:repo, 'rev-list', [], {'all': 1,
                    \                                'full-history': 1,
                    \                                    'children': 1}, 0,
                    \                'rlf')[:-2],
                    \        'split(v:val)'),
                    \    'has_key(a:repo.changesets, v:val[0])')
        for [hex; children] in lines
            let a:repo.changesets[hex].children=children
        endfor
        return a:cs.children
    elseif       a:prop is# 'renames' || a:prop is# 'copies' ||
                \a:prop is# 'changes' || a:prop is# 'files'  ||
                \a:prop is# 'removes'
        let lparents=len(a:cs.parents)
        if lparents==0
            let allfiles=a:repo.functions.getcsprop(a:repo, a:cs, 'allfiles')
            let a:cs.renames={}
            let a:cs.copies={}
            let a:cs.changes=copy(allfiles)
            let a:cs.files=copy(a:cs.changes)
            let a:cs.removes=[]
        elseif lparents==1
            let args=[a:cs.parents[0].'..'.a:cs.hex]
            let kwargs={'name-status': 1, 'M': 1, 'diff-filter': 'ADMR'}
            if a:prop is# 'copies'
                let kwargs.C=1
                let kwargs['find-copies-harder']=1
                let kwargs['diff-filter'].='C'
            endif
            let d=map(s:F.git(a:repo, 'diff', args, kwargs, 'rdifff', a:prop,
                        \     a:cs.hex)[:-2], 'split(v:val, "\t")')
            if a:prop is# 'copies'
                let a:cs.copies={}
            endif
            let a:cs.renames={}
            let a:cs.files=[]
            let a:cs.removes=[]
            for [status; files] in d
                call map(files, 's:F.refile(v:val)')
                if status[0] is# 'M' || status[0] is# 'A'
                    let a:cs.files+=[files[0]]
                elseif status[0] is# 'D'
                    let a:cs.removes+=[files[0]]
                elseif status[0] is# 'R'
                    let a:cs.renames[files[1]]=files[0]
                elseif status[0] is# 'C'
                    let a:cs.copies[files[1]]=files[0]
                endif
            endfor
            let a:cs.changes=a:cs.files+a:cs.removes
        elseif lparents>=2
            " FIXME Here must be files that had merge conflicts
            let a:cs.renames={}
            let a:cs.copies={}
            let a:cs.changes=[]
            let a:cs.files=[]
            let a:cs.removes=[]
        endif
        return a:cs[a:prop]
    endif
    let a:cs[a:prop]=r
    return r
endfunction
"▶1 get_status :: repo, files, clean, ignored -> status
if s:usepythondriver "▶2
    function s:F.get_status(repo, files, clean, ignored)
        let d={}
        try
            execute s:pya.'get_status(vim.eval("a:repo.path"), '.
                        \             (empty(a:files)?
                        \                'None':
                        \                'vim.eval("a:files")').', '.
                        \             (a:clean   ? 'True' : 'False').', '.
                        \             (a:ignored ? 'True' : 'False').', '.
                        \           ')'
        endtry
        return d
    endfunction
else "▶2
    function s:F.get_status(repo, files, clean, ignored)
        let r=deepcopy(s:_r.utils.emptystatdct)
        let kwargs={'porcelain': 1, 'z': 1, 'untracked-files': 'all'}
        let args=empty(a:files)?[]:['--']+a:files
        let s=s:_r.utils.nullnl(
                    \s:F.git(a:repo, 'status', args, kwargs, 2, 'statusf'))[:-2]
        let files={}
        while !empty(s)
            let line=remove(s, 0)
            let status=line[:1]
            let file=line[3:]
            if has_key(files, file)
                continue
            endif
            let files[file]=1
            if status[0] is# 'R'
                let r.added+=[file]
                let old=remove(s, 0)
                if (empty(a:files)) ? 1 : (index(a:files, old)!=-1)
                    let r.removed+=[old]
                endif
            elseif status[0] is# 'C'
                let r.added+=[file]
                call remove(s, 0)
            elseif status[0] is# 'D'
                let r.removed+=[file]
            elseif status[1] is# 'D'
                let r.deleted+=[file]
            elseif status[0] is# 'A'
                let r.added+=[file]
            elseif stridx(status, 'M')!=-1
                let r.modified+=[file]
            elseif status is# '??'
                let r.unknown+=[file]
            endif
        endwhile
        if a:clean
            let allfiles=copy(a:repo.functions.getcsprop(a:repo,
                        \                                'HEAD', 'allfiles'))
            if !empty(a:files)
                call filter(allfiles, 'index(a:files, v:val)!=-1')
            endif
            let r.clean=filter(allfiles, '!has_key(files, v:val)')
        endif
        if a:ignored
            let r.ignored=s:_r.utils.nullnl(
                        \ s:F.git(a:repo, 'ls-files', args,
                        \                 {'ignored': 1, 'z': 1,
                        \                  'exclude-standard': 1,
                        \                  'others': 1}, 2,
                        \                 'lsignf', a:repo))[:-2]
        endif
        return r
    endfunction
endif
"▶1 git.status :: repo[, rev1[, rev2[, files[, clean[, ignored]]]]]
let s:statchars={
            \'A': 'added',
            \'M': 'modified',
            \'D': 'removed',
        \}
function s:git.status(repo, ...)
    let requiresclean=(a:0>3 && a:4)
    if a:0 && (a:1 isnot 0 || (a:0>1 && a:2 isnot 0))
        let r=deepcopy(s:_r.utils.emptystatdct)
        let args=((a:0>2 && !empty(a:3))?(['--']+a:3):([]))
        let rspec=[]
        let reverse=0
        if a:1 is 0
            if a:0>1 && a:2 isnot 0
                let reverse=1
            endif
        else
            let rspec+=[a:1]
        endif
        if a:0>1 && a:2 isnot 0
            let rspec+=[a:2]
        endif
        call insert(args, join(rspec, '..'))
        let kwargs={'diff-filter': 'AMD', 'name-status': 1, 'no-renames': 1}
        let d=s:F.git(a:repo, 'diff', args, kwargs, 0, 'sdifff')[:-2]
        let files=map(copy(d), 's:F.refile(v:val[2:])')
        call map(copy(d), 'add(r[s:statchars[v:val[0]]], files[v:key])')
        if reverse
            let [r.deleted, r.unknown]=[r.unknown, r.deleted]
            let [r.added,   r.removed]=[r.removed, r.added  ]
        endif
        if requiresclean
            let allfiles=a:repo.functions.getcsprop(a:repo,rspec[0],'allfiles')
            if a:0>2 && !empty(a:3)
                let allfiles=filter(copy(allfiles), 'index(a:3, v:val)!=-1')
            endif
            let r.clean=filter(copy(allfiles), '!has_key(files, v:val)')
        endif
    else
        return s:F.get_status(a:repo, (a:0>2 ? a:3 : 0), requiresclean,
                    \         (a:0>4 && a:5))
    endif
    return r
endfunction
"▶1 git.commit :: repo, message[, files[, user[, date[, _]]]]
function s:git.commit(repo, message, ...)
    let kwargs={'cleanup': 'verbatim'}
    let args=[]
    if a:0
        if empty(a:1)
            let kwargs.all=1
        else
            let args+=['--']+a:1
            call s:_r.utils.addfiles(a:repo, a:1)
        endif
        if a:0>1 && !empty(a:2)
            let kwargs.author=a:2
        endif
        if a:0>2 && !empty(a:3)
            let kwargs.date=a:3
        endif
        if a:0>3 && !empty(a:4)
            call s:_f.throw('cbnimp')
        endif
    else
        let kwargs.all=1
    endif
    return s:_r.utils.usefile(a:repo, a:message, 'file', 'message',
                \             s:F.gitm, args, kwargs, 0, 'cif')
endfunction
"▶1 git.strip :: [rev[, force]]
function s:git.strip(repo, ...)
    let args=[(a:0 && !empty(a:1))?(a:1):('HEAD^')]
    if a:0>1 && !empty(a:2)
        call s:_f.throw('sfnsup')
    endif
    return s:F.gitm(a:repo, 'reset', args, {}, 0, 'stripf', args[0])
endfunction
"▶1 git.branch :: repo, branchname, force → + FS
function s:git.branch(repo, branch, force)
    if a:force
        return s:F.gitm(a:repo, 'checkout', [a:branch], {'B': 1}, 0,
                    \   'chbf', a:branch)
    else
        call a:repo.functions.label(a:repo, 'branch', a:branch, 'HEAD', 0, 0)
        call a:repo.functions.update(a:repo, a:branch, 0)
    endif
endfunction
"▶1 git.label :: repo, type, label, rev, force, local → + FS
function s:git.label(repo, type, label, rev, force, local)
    if a:local
        call s:_f.throw('nloc')
    endif
    let args=['--', a:label]
    let kwargs={}
    if a:rev is 0
        " No need to forced tag delete
        if a:force && a:type is# 'branch'
            let kwargs.D=1
        else
            let kwargs.d=1
        endif
    else
        if a:force
            let kwargs.force=1
        endif
        let args+=[a:rev]
    endif
    return s:F.gitm(a:repo, a:type, args, kwargs, 0,
                \   'lbf', a:type, a:label, a:rev)
endfunction
"▶1 git.update :: repo, rev, force → + FS
" XXX This must not transform {rev} into hash: it will break rf-branch()
function s:git.update(repo, rev, force)
    let kwargs={}
    if a:force
        let kwargs.force=1
    endif
    "▶2 XXX (hacks): Avoid “detached HEAD” state if possible
    if a:rev=~#'\v^[0-9a-z]{40}$'
        if has_key(s:prevrevhex, a:repo.path) &&
                    \a:rev is# s:prevrevhex[a:repo.path][1] &&
                    \filereadable(s:_r.os.path.join(a:repo.githpath,
                    \                             s:prevrevhex[a:repo.path][0]))
            let rev=s:prevrevhex[a:repo.path][0]
            unlet s:prevrevhex[a:repo.path]
        else
            for [d, ds, fs] in s:_r.os.walk(a:repo.githpath)
                for f in fs
                    let reffile=s:_r.os.path.join(d, f)
                    if a:rev is# get(readfile(reffile, 'b'), 0, 0)
                        let rev=join(s:_r.os.path.split(
                                    \s:_r.os.path.relpath(reffile,
                                    \                     a:repo.githpath))[1:],
                                    \"/")
                        break
                    endif
                endfor
            endfor
            if !exists('rev')
                let rev=a:rev
            endif
        endif
    else
        let rev=a:rev
    endif
    "▲2
    let args=[rev]
    return s:F.gitm(a:repo, 'checkout', args, kwargs, 0, 'updf', a:rev)
endfunction
"▶1 git.move :: repo, force, source, destination → + FS
function s:git.move(repo, force, source, destination)
    return s:F.gitm(a:repo, 'mv', ['--', a:source, a:destination],
                \   a:force ? {'force': 1} : {}, 0, 'mvf',
                \   a:source, a:destination)
endfunction
"▶1 git.add :: repo, file → + FS
function s:git.add(repo, file)
    return s:F.gitm(a:repo, 'add', ['--', a:file], {}, 0, 'addf',
                \   escape(a:file, '\'))
endfunction
"▶1 git.forget :: repo, file → + FS
function s:git.forget(repo, file)
    return s:F.gitm(a:repo, 'rm', ['--', a:file], {'cached': 1}, 0, 'fgf',
                \   escape(a:file, '\'))
endfunction
"▶1 git.remove :: repo, file → + FS
function s:git.remove(repo, file)
    return s:F.gitm(a:repo, 'rm', ['--', a:file], {}, 0, 'rmf',
                \   escape(a:file, '\'))
endfunction
"▶1 addtoignfile :: file, line → + FS
function s:F.addtoignfile(ignfile, line)
    let r=[]
    if filereadable(a:ignfile)
        let r+=readfile(a:ignfile, 'b')
    endif
    if !empty(r) && empty(r[-1])
        call remove(r, -1)
    endif
    let r+=[a:line, '']
    return writefile(r, a:ignfile, 'b')
endfunction
"▶1 git.ignore :: repo, file → + FS
function s:git.ignore(repo, file)
    return s:F.addtoignfile(s:_r.os.path.join(a:repo.path, '.gitignore'),
                \           '/'.escape(a:file, '\*?[]'))
endfunction
"▶1 git.ignoreglob :: repo, glob → + FS
function s:git.ignoreglob(repo, glob)
    return s:F.addtoignfile(s:_r.os.path.join(a:repo.path,'.gitignore'), a:glob)
endfunction
"▶1 git.grep :: repo, files, revisions, ignorecase, wdfiles::Bool → qflist
"▶2 parsegrep :: lines → [(file, lnum, String)]
function s:F.parsegrep(lines)
    let r=[]
    let contline=0
    while !empty(a:lines)
        let sp=split(remove(a:lines, 0), "\n", 1)
        if contline
            let r[-1][0].="\n".sp[0]
            if len(sp)>1
                let r[-1]+=sp[1:]
                let contline=0
            endif
        elseif len(sp)==1
            let contline=1
            let r+=[sp]
        else
            let r+=[sp]
        endif
    endwhile
    call map(r, '[v:val[0], str2nr(v:val[1]), v:val[2]]')
    return r
endfunction
"▲2
function s:git.grep(repo, pattern, files, revisions, ic, wdfiles)
    let args=['-e', a:pattern, '--']+a:files
    let kwargs={'full-name': 1, 'extended-regexp': 1, 'n': 1, 'z': 1}
    let r=[]
    if !empty(a:revisions)
        let revs=[]
        for s in a:revisions
            if type(s)==type([])
                let revs+=map(copy(a:repo.functions.revrange(a:repo,s[0],s[1])),
                            \ 'v:val.hex')
            else
                let revs+=[a:repo.functions.getrevhex(a:repo, s)]
            endif
            unlet s
        endfor
        call extend(args, revs, 2)
    endif
    let [lines, exit_code]=s:F.git(a:repo, 'grep', args, kwargs, 1, 0)
    if exit_code
        " Grep failed because it has found nothing
        if lines ==# ['']
            return []
        " Grep failed for another reason
        else
            call s:_f.throw('grepf', a:repo.path, join(lines, "\n"))
        endif
    endif
    if empty(a:revisions)
        for [file, lnum, text] in s:F.parsegrep(lines)
            let r+=[{'filename': file, 'lnum': lnum, 'text': text}]
        endfor
    else
        for [revfile, lnum, text] in s:F.parsegrep(lines)
            let cidx=stridx(revfile, ':')
            let rev=revfile[:(cidx-1)]
            let file=revfile[(cidx+1):]
            let r+=[{'filename': [rev, file], 'lnum': lnum, 'text': text}]
        endfor
    endif
    return r
endfunction
"▶1 git.readfile :: repo, rev, file → [String]
function s:git.readfile(repo, rev, file)
    return s:F.git(a:repo, 'cat-file', ['blob', a:rev.':'.a:file], {}, 2,
                \  'filef', a:rev, a:file)
endfunction
"▶1 git.annotate :: repo, rev, file → [(file, hex, linenumber)]
function s:git.annotate(repo, rev, file)
    let args=[a:rev, '--', a:file]
    let kwargs={'porcelain': 1, 'C': 1, 'M': 1}
    let lines=s:F.git(a:repo, 'blame', args, kwargs, 1, 'annf', a:rev, a:file)
    call filter(lines, 'v:val=~#''\v^(\x{40}\ |filename\ )''')
    let r=[]
    let filename=a:file
    while !empty(lines)
        let line=remove(lines, 0)
        if !empty(lines) && lines[0][:8] is# 'filename '
            let filename=s:F.refile(remove(lines, 0)[9:])
        endif
        let r+=[[filename, line[:39], str2nr(line[41:])]]
    endwhile
    return r
endfunction
"▶1 git.diff :: repo, rev, rev, files, opts → [String]
let s:difftrans={
            \  'reverse': 'R',
            \ 'ignorews': 'ignore-all-space',
            \'iwsamount': 'ignore-space-change',
            \ 'numlines': 'unified',
            \  'alltext': 'text',
        \}
function s:git.diff(repo, rev1, rev2, files, opts)
    let diffopts=s:_r.utils.diffopts(a:opts, a:repo.diffopts, s:difftrans)
    let kwargs=copy(diffopts)
    let args=[]
    if empty(a:rev2)
        if !empty(a:rev1)
            let args+=[a:rev1.'^..'.a:rev1]
        endif
    else
        let args+=[a:rev2]
        if !empty(a:rev1)
            let args[-1].='..'.a:rev1
        endif
    endif
    if !empty(a:files)
        let args+=['--']+a:files
    endif
    let r=s:F.git(a:repo, 'diff', args, kwargs, 1,
                \ 'difff', a:rev1, a:rev2, join(a:files, ', '))
    return r
endfunction
"▶1 git.diffre :: _, opts → Regex
let s:diffre='\m^diff --git \v((\")?%s\/.{-}\2) \2%s\/'
function s:git.diffre(repo, opts)
    if get(a:opts, 'reverse', 0)
        return printf(s:diffre, 'b', 'a')
    else
        return printf(s:diffre, 'a', 'b')
    endif
endfunction
"▶1 git.diffname :: _, line, diffre, _ → rpath
function s:git.diffname(repo, line, diffre, opts)
    let file=get(matchlist(a:line, a:diffre), 1, 0)
    if file is 0
        return 0
    else
        return s:F.refile(file)[2:]
    endif
endfunction
"▶1 git.getrepoprop :: repo, propname → a
if s:usepythondriver "▶2
    function s:git.getrepoprop(repo, prop)
        let d={}
        try
            execute s:pya.'get_repo_prop(vim.eval("a:repo.path"), '.
                        \               'vim.eval("a:prop"))'
        endtry
        return d[a:prop]
    endfunction
else "▶2
    function s:git.getrepoprop(repo, prop)
        if a:prop is# 'branch'
            let branches=s:F.git(a:repo, 'branch', [], {'l': 1}, 0,
                        \        'branchf')[:-2]
            return get(filter(branches, 'v:val[0] is# "*"'), 0, '')[2:]
        elseif a:prop is# 'url'
            let [l, exit_code]=s:F.git(a:repo, 'config',
                        \              ['remote.origin.pushurl'], {}, 0, 0)
            let r=get(l, 0, 0)
            if exit_code || r is 0
                let r=get(s:F.git(a:repo, 'config', ['remote.origin.url'],{},0),
                            \0, 0)
            endif
            if r isnot 0
                return r
            endif
        elseif a:prop is# 'branchslist' || a:prop is# 'brancheslist'
            " XXX stridx(v:val, " ")==-1 filters out “(no branch)” item
            return filter(map(s:F.git(a:repo, 'branch', [], {'l': 1}, 0,
                        \             'branchf')[:-2], 'v:val[2:]'),
                        \     'stridx(v:val, " ")==-1')
        elseif a:prop is# 'tagslist'
            return s:F.git(a:repo, 'tag', [], {}, 0, 'tagf')[:-2]
        elseif a:prop is# 'bookmarkslist'
            return []
        endif
        call s:_f.throw('nocfg', a:prop, a:repo.path)
    endfunction
endif
"▶1 pushpull :: cmd, repo, dryrun, force[, URL[, rev]] → + ?
function s:F.pushpull(cmd, repo, dryrun, force, ...)
    let kwargs1={}
    let kwargs2={'all': 1}
    let args=[]
    let cmd=a:cmd
    let args=[]
    if a:0
        if a:1 isnot 0
            let args+=['--', a:1]
        endif
        if a:0>1 && a:2 isnot 0
            if empty(args)
                let args+=['--', 'origin']
            endif
            let args+=[a:2]
        endif
    endif
    if (a:cmd is# 'pull' && !empty(args)) || len(args)>2
        unlet kwargs2.all
    endif
    if a:force
        let kwargs2.force=1
    endif
    if a:dryrun
        if cmd is# 'pull'
            let cmd='fetch'
        endif
        let kwargs2['dry-run']=1
    endif
    if a:cmd is# 'pull'
        let kwargs1['ff-only']=1
    endif
    let args=s:_r.utils.kwargstolst(kwargs1)+s:_r.utils.kwargstolst(kwargs2)
                \+args
    return s:F.gitm(a:repo, a:cmd, args, {}, 0, 'ppf', a:cmd)
endfunction
"▶1 git.push :: repo, dryrun, force[, URL[, rev]]
function s:git.push(...)
    return call(s:F.pushpull, ['push']+a:000, {})
endfunction
"▶1 git.pull :: repo, dryrun, force[, URL[, rev]]
function s:git.pull(...)
    return call(s:F.pushpull, ['pull']+a:000, {})
endfunction
"▶1 git.repo :: path → repo
function s:git.repo(path)
    let repo={'path': a:path, 'changesets': {}, 'mutable': {},
                \'local': (stridx(a:path, '://')==-1),
                \'labeltypes': ['tag', 'branch'],
                \'hasrevisions': 0, 'requires_sort': 0,
                \'githpath': s:_r.os.path.join(a:path, '.git', 'refs', 'heads'),
                \'hypsites': deepcopy(s:hypsites),
                \'maxitercsnum': s:_f.getoption('git_maxitercsnum'),
                \'iterfuncs': deepcopy(s:iterfuncs),
                \}
    if has_key(s:prevrevhex, a:path)
        unlet s:prevrevhex[a:path]
    endif
    return repo
endfunction
"▶1 git.checkdir :: dir → Bool
function s:git.checkdir(dir)
    return s:_r.os.path.isdir(s:_r.os.path.join(a:dir, '.git'))
endfunction
"▶1 iterfuncs
let s:iterfuncs={}
"▶2 nextcs
function s:F.nextcs()
    if empty(self.log)
        if empty(self.hexlist)
            return 0
        endif
        let curhexs=remove(self.hexlist, 0, min([self.maxitercsnum,
                    \                            len(self.hexlist)])-1)
        let gitargs=copy(self.gitargs)
        let gitargs[2]=gitargs[2]+curhexs
        let self.log=call(s:F.git, gitargs, {})[:-2]
    endif
    let cs=s:F.parsecs(self.log)
    let self.repo.changesets[cs.hex]=extend(get(self.repo.changesets, cs.hex,
                \                               {}),
                \                          cs)
    return self.repo.changesets[cs.hex]
endfunction
"▶2 iterfuncs.revrange, iterfuncs.changesets
function s:iterfuncs.revrange(repo, opts)
    let pgaargs=[a:repo]
    if has_key(a:opts, 'revrange')
        let pgaargs+=a:opts.revrange
    elseif has_key(a:opts, 'revision')
        let pgaargs+=[0, a:opts.revision]
    endif
    let [hexlist, gitargs]=call(s:F.prepgitargs, pgaargs, {})
    let r={'repo': a:repo, 'maxitercsnum': a:repo.maxitercsnum,
                \'gitargs': gitargs, 'next': s:F.nextcs}
    if hexlist is 1
        let hexlist=0
        let log=call(s:F.git, gitargs, {})[:-2]
    else
        let log=[]
        let r.csnum=len(hexlist)
    endif
    let r.hexlist=hexlist
    let r.log=log
    return r
endfunction
let s:iterfuncs.changesets=s:iterfuncs.revrange
let s:iterfuncs.ancestors=s:iterfuncs.revrange
"▶1 astatus, agetcs, agetrepoprop
if s:_r.repo.userepeatedcmd
    if s:usepythondriver
        function s:git.astatus(repo, interval, ...)
            if a:0<3 || a:1 isnot 0 || a:2 isnot 0
                call s:_f.throw('as2nimp')
            endif
            return s:_r.utils.pyeval('aurum.repeatedcmd.new('.
                        \        string(a:interval).', '.
                        \        s:pp.'._get_status, '.
                        \        s:_r.utils.pystring(a:repo.path).', '.
                        \        s:_r.utils.pystring(a:3).', True, True)')
        endfunction
        function s:git.agetrepoprop(repo, interval, prop)
            return s:_r.utils.pyeval('aurum.repeatedcmd.new('.
                        \        string(a:interval).', '.
                        \       'aurum.auutils.get_one_prop, '.
                        \        s:pp.'._get_repo_prop, '.
                        \        s:_r.utils.pystring(a:repo.path).', '.
                        \        string(a:prop).')')
        endfunction
    else
        try
            python import aurum.rcdriverfuncs
            let s:addafuncs=1
        catch
            let s:addafuncs=0
        endtry
        if s:addafuncs
            function s:git.astatus(repo, interval, ...)
                if a:0<3 || a:1 isnot 0 || a:2 isnot 0 ||
                            \type(a:3)!=type([]) || len(a:3)!=1
                    call s:_f.throw('aconimp')
                endif
                return s:_r.utils.pyeval('aurum.repeatedcmd.new('.
                            \        string(a:interval).', '.
                            \       'aurum.rcdriverfuncs.git_status, '.
                            \        s:_r.utils.pystring(a:repo.path).', '.
                            \        s:_r.utils.pystring(a:3[0]).')')
            endfunction
            function s:git.agetrepoprop(repo, interval, prop)
                if a:prop isnot# 'branch'
                    call s:_f.throw('anbnimp')
                endif
                return s:_r.utils.pyeval('aurum.repeatedcmd.new('.
                            \        string(a:interval).', '.
                            \       'aurum.rcdriverfuncs.git_branch, '.
                            \        s:_r.utils.pystring(a:repo.path).')')
            endfunction
        endif
    endif
endif
"▶1 Register driver
call s:_f.regdriver('Git', s:git)
"▶1
call frawor#Lockvar(s:, '_pluginloaded,prevrevhex')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
