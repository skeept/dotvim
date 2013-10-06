"▶1
scriptencoding utf-8
execute frawor#Setup('0.1', {'@%aurum/drivers/common/hypsites': '0.0',
            \                                   '@%aurum/repo': '5.8',
            \                   '@%aurum/drivers/common/utils': '1.1',
            \                     '@%aurum/drivers/common/xml': '0.0',
            \                                           '@/os': '0.0',
            \                                       '@/python': '1.0',})
let s:_messages={
            \  'rnimp': 'Reversing diff between working directory and '.
            \           'any revision is not implemented',
            \  'animp': 'Unable to specify commit author',
            \  'dnimp': 'Unable to specify commit date',
            \ 'cbnimp': 'Subversion driver is not able to close branch',
            \  'difff': 'Failed to get diff between revisions %s and %s '.
            \           'for files %s in the repository %s: %s',
            \    'csf': 'Failed to obtain information about revision %s '.
            \           'in the repository %s: %s',
            \    'cif': 'Failed to commit changes to the repository %s: %s',
            \   'updf': 'Failed to update to revision %s '.
            \           'in the repository %s: %s',
            \  'pullf': 'Failed to update repository %s: %s',
            \    'mvf': 'Failed to move file %s to %s in the repository %s: %s',
            \    'cpf': 'Failed to copy file %s to %s in the repository %s: %s',
            \    'rmf': 'Failed to remove file %s in the repository %s: %s',
            \    'fgf': 'Failed to forget file %s in the repository %s: %s',
            \  'filef': 'Failed to get revision %s of the file %s '.
            \           'from the repository %s: %s',
            \   'annf': 'Failet to annotate revision %s of the file %s '.
            \           'in the repository %s: %s',
            \   'ignf': 'Failed to ignore %s in the repository %s: %s',
            \  'infof': 'Failed to get information about repository %s: %s',
            \   'addf': 'Failed to add file %s to the repository %s: %s',
            \  'listf': 'Failed to list file of revision %s '.
            \           'in the repository %s: %s',
            \   'logf': 'Failed to get log of the repository %s: %s',
            \  'statf': 'Failed to get status of the repository %s: %s',
            \  'nocfg': 'Failed to get property %s of repository %s',
            \'fcunsup': 'Forced copy is not supported',
            \'perrtag': 'Parser error: expected tag %s, but got %s',
            \'perratt': 'Parser error: expected attribute %s, but got only %s',
            \ 'perrtv': 'Parser error: expected something like %s in text, '.
            \           'but got %s',
            \'perratv': 'Parser error: expected something like %s '.
            \           'in %s value, but got %s',
            \   'derr': 'Program “date” failed to parse date “%s” obtained '.
            \           'by parsing “%s”: %s',
            \'infoerr': 'Failed to get information for the repository %s: '.
            \           'there are no lines starting with “%s: ” '.
            \           'in the output of “svn info”',
            \  'ndate': 'You must install “date” programm in order to get '.
            \           'time information for Subversion revisions',
            \  'r2fst': 'Second revision (%s) was found before the first (%s)',
            \     'u3': 'Subversion supports only three lines '.
            \           'of unified context, not requested %u',
            \ 'iediff': 'Diff parser error: expected at least one more line '.
            \           'after “====<…>====” separator line',
            \ 'punimp': 'Cannot “pull” from non-default location',
            \'pulnimp': 'Cannot pull: use update instead',
            \'aconimp': 'Can only get current status for one file',
        \}
let s:svn={}
let s:iterfuncs={}
"▶1 s:hypsites
let s:hypsites=s:_r.hypsites.svn
"▶1 svncmd :: cmd, args, kwargs → String
function s:F.svncmd(...)
    return ['svn']+call(s:_r.utils.getcmd, a:000, {})
endfunction
"▶1 svn :: repo, cmd, args, kwargs, has0[, msgid[, marg1[, …]]] → [String] + ?
function s:F.svn(repo, cmd, args, kwargs, hasnulls, ...)
    let cmd=s:F.svncmd(a:cmd, a:args, a:kwargs)
    let [r, exit_code]=s:_r.utils.run(cmd, a:hasnulls, a:repo.path)
    if exit_code && a:0
        call call(s:_f.throw, a:000+[a:repo.path, join(r[:-1-(a:hasnulls)],
                    \                                  "\n")], {})
    endif
    return r
endfunction
"▶1 svnm :: {svn args} → + :echom
function s:F.svnm(...)
    return s:_r.utils.printm(call(s:F.svn, a:000, {}))
endfunction
"▶1 getfrominfo
function s:F.getfrominfo(repo, line, ...)
    let str=a:line.': '
    let strlidx=len(str)-1
    for line in s:F.svn(a:repo, 'info', [], get(a:000, 0, {}), 0, 'infof')
        if line[:(strlidx)] is# str
            return line[strlidx+1:]
        endif
    endfor
    call s:_f.throw('infoerr', a:repo.path, a:line)
endfunction
"▶1 svn.getrevhex :: repo, rev → hex
function s:svn.getrevhex(repo, rev)
    if a:rev=~#'\v^%(0|[1-9]\d*)$'
        return a:rev
    endif
    return s:F.getfrominfo(a:repo, 'Revision', {'revision': ''.a:rev})
endfunction
"▶1 decodeentities :: String → String
let s:F.decodeentities=s:_r.xml.decodeentities
"▶1 parsecs :: repo, xml → cs
let s:logseparator=repeat('-', 72)
let s:csinit={
            \'branch': 'default',
            \'renames': {},
            \'copies': {},
            \'tags': [],
            \'bookmarks': [],
            \'status': {'added': [], 'removed': [], 'modified': []},
            \'phase': 'public',
        \}
let s:logstatchars={
            \'M': 'modified',
            \'R': 'modified',
            \'A': 'added',
            \'D': 'removed',
        \}
let s:hasdateexe=executable('date')
" TODO HEAD, ... in cs.tags
" TODO use merge information if available
function s:F.parsecs(repo, xml)
    let cs=deepcopy(s:csinit)
    "▶2 <logentry> → rev, hex; parents
    let [tagname, attributes]=a:xml.parsetag()
    call a:xml.skipws()
    if tagname isnot# 'logentry'
        call s:_f.throw('perrtag', 'logentry', tagname)
    elseif !has_key(attributes, 'revision')
        call s:_f.throw('perratt', 'revision', join(keys(attributes), ', '))
    endif
    let cs.hex=attributes.revision
    let cs.rev=str2nr(cs.hex)
    let cs.parents=((cs.rev>1)?([''.(cs.rev-1)]):([]))
    "▲2
    while !a:xml.checkctag()
        let [tagname, attributes]=a:xml.parsetag()
        if tagname is# 'author'
            let cs.user=join(a:xml.parsetextintag(), "\n")
        elseif tagname is# 'date'
            if s:hasdateexe || executable('date')
                let s:hasdateexe=1
                let date=join(a:xml.parsetextintag(), "\n")
                let dcomponents=matchlist(date,
                            \             '\v(\d{4,})\-(\d\d)\-(\d\d)'.
                            \              'T(\d\d)\:(\d\d)\:(\d\d)\.\d+Z')[1:6]
                if empty(dcomponents)
                    call s:_f.throw('perrtv', 'yyyy-mm-ddTHH:MM:SS.nnnnnnZ',
                                \   date)
                endif
                let [y, mon, d, h, min, s]=dcomponents
                let datearg=y.'-'.mon.'-'.d.' '.h.':'.min.':'.s.' UTC'
                let time=system('date --date='.shellescape(datearg).' +%s')
                if v:shell_error
                    call s:_f.throw('derr', datearg, a:csdata[line], time)
                else
                    let cs.time=str2nr(time)
                endif
            else
                call s:_f.warn('ndate')
                let cs.time=0
            endif
        elseif tagname is# 'paths'
            let svnplidx=len(a:repo.svnprefix)-1
            call a:xml.skipws()
            while !a:xml.checkctag()
                let [tagname, attributes]=a:xml.parsetag()
                if !has_key(attributes, 'action')
                    call s:_f.throw('perratt', 'action',
                                \   join(keys(attributes), ", "))
                elseif tagname isnot# 'path'
                    call s:_f.throw('perrtag', 'path', tagname)
                endif
                if has_key(attributes, 'copyfrom-path')
                    if attributes['copyfrom-path'][0] isnot# '/'
                        call s:_f.throw('perratv', '/path/to/file',
                                    \   'copyfrom-path',
                                    \   attributes['copyfrom-path'])
                    endif
                    let source=attributes['copyfrom-path'][1:]
                    if svnplidx==-1 || source[:(svnplidx)] is# a:repo.svnprefix
                        let source=source[(svnplidx+1):]
                    else
                        unlet source
                    endif
                endif
                let file=join(a:xml.parsetextintag(), "\n")
                if file[0] isnot# '/'
                    call s:_f.throw('perrtv', '/path/to/file', file)
                endif
                let file=file[1:]
                let action=attributes.action
                if svnplidx==-1 || file[:(svnplidx)] is# a:repo.svnprefix
                    let file=file[(svnplidx+1):]
                    if has_key(s:logstatchars, action)
                        let status=s:logstatchars[action]
                        let cs.status[status]+=[file]
                    else
                        call s:_f.throw('perratv',
                                    \   join(keys(s:logstatchars, '/')),
                                    \   'action', action)
                    endif
                    if exists('source')
                        let cs.copies[file]=source
                    endif
                endif
                call a:xml.skipws()
                unlet! source
            endwhile
            for [destination, source] in items(cs.copies)
                if index(cs.status.removed, source)!=-1
                    let cs.renames[destination]=source
                    unlet cs.copies[destination]
                endif
            endfor
            let cs.files=cs.status.added+cs.status.modified
            let cs.removes=cs.status.removed
            let cs.changes=cs.files+cs.removes
            call a:xml.skipctag()
        elseif tagname is# 'msg'
            let cs.description=join(a:xml.parsetextintag(), "\n")
        endif
        call a:xml.skipws()
    endwhile
    return cs
endfunction
"▶1 svn.getcs :: repo, rev → cs
function s:svn.getcs(repo, rev)
    "▶2 Do the best trying to get it from repo.changesets
    if has_key(a:repo.changesets, a:rev)
        return a:repo.changesets[a:rev]
    else
        let rev=a:repo.functions.getrevhex(a:repo, a:rev)
        if has_key(a:repo.changesets, rev)
            return a:repo.changesets[rev]
        elseif !empty(a:repo.mutable.cslist)
            call a:repo.functions.updatechangesets(a:repo)
            if has_key(a:repo.changesets, rev)
                return a:repo.changesets[rev]
            endif
        endif
    endif
    "▲2
    let cs=s:F.parsecs(a:repo,
                \      s:_r.xml.new(
                \      s:F.svn(a:repo, 'log', ['--', a:repo.svnroot],
                \              {'revision': rev, 'limit': '1', 'xml': 1,
                \               'verbose': 1},
                \              0, 'csf', a:rev)[2:]))
    let a:repo.changesets[cs.hex]=cs
    return a:repo.changesets[cs.hex]
endfunction
"▶1 svn.getwork :: repo → cs
function s:svn.getwork(repo)
    return a:repo.functions.getcs(a:repo, 'BASE')
endfunction
"▶1 svn.getnthchangerev :: repo, rev, n, [ file ] → (cs, [ file ])
function s:svn.getnthchangerev(repo, rev, n, files)
    " TODO Do not download all changesets
    if empty(a:repo.mutable.cslist)
        call a:repo.functions.getchangesets(a:repo)
    else
        call a:repo.functions.updatechangesets(a:repo)
    endif
    return s:_r.repo.defaultfuncs.getnthchangerev(a:repo, a:rev, a:n, a:files)
endfunction
"▶1 getchangesets :: repo[, hex[, hex]|limit] → [cs]
function s:F.getchangesets(repo, ...)
    let args=['--', a:repo.svnroot]
    let kwargs={'xml': 1, 'verbose': 1}
    if a:0==1
        if type(a:1)==type(0)
            let kwargs.limit=''.a:1
        else
            let kwargs.revision=''.a:1
        endif
    elseif a:0==2
        let kwargs.revision=a:1.':'.a:2
    endif
    let xml=s:_r.xml.new(s:F.svn(a:repo, 'log', args, kwargs, 0, 'logf')[2:])
    let cslist=[]
    while !xml.checkctag()
        let cs=s:F.parsecs(a:repo, xml)
        call xml.skipctag()
        call xml.skipws()
        let a:repo.changesets[cs.hex]=cs
        if !empty(cslist)
            let cs.children=[cslist[-1].hex]
            let cslist[-1].parents=[cs.hex]
        endif
        call add(cslist, cs)
    endwhile
    if !has_key(kwargs, 'revision')
        call reverse(cslist)
    endif
    return cslist
endfunction
"▶1 svn.getchangesets :: repo → [cs]
function s:svn.getchangesets(repo)
    if empty(a:repo.mutable.cslist)
        let cslist=s:F.getchangesets(a:repo)
        let cslist[-1].children=[]
        call map(cslist[:-2], 'extend(v:val, {"children": ["".(v:val.rev-1)]})')
        let a:repo.mutable.cslist+=cslist
    else
        call a:repo.functions.updatechangesets(a:repo)
    endif
    return a:repo.mutable.cslist
endfunction
"▶1 svn.revrange :: repo, rev1, rev2 → [cs]
function s:svn.revrange(repo, rev1, rev2)
    if empty(a:repo.mutable.cslist)
        call a:repo.functions.getchangesets(a:repo)
    else
        call a:repo.functions.updatechangesets(a:repo)
    endif
    let hex1=a:repo.functions.getrevhex(a:repo, a:rev1)
    let hex2=a:repo.functions.getrevhex(a:repo, a:rev2)
    let i=len(a:repo.mutable.cslist)-1
    while i>=0 && a:repo.mutable.cslist[i].hex isnot# hex1
        if a:repo.mutable.cslist[i].hex is# hex2
            let r2i=i
        endif
        let i-=1
    endwhile
    if !exists('r2i')
        call s:_f.throw('r2fst', a:rev2, a:rev1)
    endif
    return a:repo.mutable.cslist[(i):(r2i)]
endfunction
"▶1 svn.updatechangesets :: repo → _
function s:svn.updatechangesets(repo)
    if empty(a:repo.mutable.cslist)
        return
    endif
    let oldtiprev=a:repo.mutable.cslist[-1].rev
    let tiprev=+a:repo.functions.gettiphex(a:repo)
    if tiprev<oldtiprev
        while !empty(a:repo.mutable.cslist) &&
                    \a:repo.mutable.cslist[-1].rev>tiprev
            call remove(a:repo.mutable.cslist, -1)
        endwhile
    elseif tiprev>oldtiprev
        let cslist=s:F.getchangesets(a:repo, ''.(oldtiprev+1), ''.tiprev)
        if !empty(cslist)
            let a:repo.mutable.cslist[-1].children=[cslist[0].hex]
            let cslist[0].parents=[a:repo.mutable.cslist[-1].hex]
            let a:repo.mutable.cslist+=cslist
        endif
    endif
    let a:repo.mutable.cslist[-1].children=[]
endfunction
"▶1 svn.gettiphex :: repo → hex
function s:svn.gettiphex(repo)
    return a:repo.functions.getrevhex(a:repo, 'HEAD')
endfunction
"▶1 svn.getworkhex :: repo → hex
function s:svn.getworkhex(repo)
    return a:repo.functions.getrevhex(a:repo, 'BASE')
endfunction
"▶1 svn.setcsprop :: repo, cs, propname → propvalue
function s:svn.setcsprop(repo, cs, prop)
    if a:prop is# 'allfiles'
        let r=s:F.svn(a:repo, 'list', ['.'], {'recursive': 1,
                    \                         'revision': a:cs.hex}, 0,
                    \ 'listf', a:cs.hex)[:-2]
        let dirs=[]
        " FIXME Investigate whether s:_r.os.pathsep should be used here instead
        call filter(r, 'v:val[-1:] is# "/" ? [0, add(dirs, v:val)][0] : 1')
        let a:cs.alldirs=dirs
    elseif a:prop is# 'children'
        let lastrev=str2nr(a:repo.functions.gettiphex(a:repo))
        if a:cs.rev<lastrev
            let r=[''.(a:cs.rev+1)]
        endif
    endif
    let a:cs[a:prop]=r
    return r
endfunction
"▶1 status :: repo, files → (status, revstatus)
let s:statchars=[{
            \'C': 'modified',
            \'M': 'modified',
            \'~': 'modified',
            \'R': 'modified',
            \'A': 'added',
            \'D': 'removed',
            \'!': 'deleted',
            \'?': 'unknown',
            \'I': 'ignored',}, {
            \'C': 'modified',
            \'M': 'modified',}]
function s:F.status(repo, args, kwargs)
    let r=deepcopy(s:_r.utils.emptystatdct)
    let slines=s:F.svn(a:repo, 'status', a:args, a:kwargs, 0, 'statf')
    let revstatus={}
    for line in slines
        let status=line[:6]
        let file=line[8:]
        let col=0
        for colschars in s:statchars
            if has_key(colschars, status[col])
                let state=colschars[status[col]]
                let r[state]+=[file]
                let revstatus[file]=state
                break
            endif
            let col+=1
        endfor
    endfor
    return [r, revstatus]
endfunction
"▶1 statfromdiff :: repo, diff, ofs, fs, files → (status, revstatus)
" ofs :: [file]
"  fs :: Either status [file]
function s:F.statfromdiff(repo, diff, ofs, fs, files)
    "▶2 Initialize variables
    let diff=copy(a:diff)
    let r=deepcopy(s:_r.utils.emptystatdct)
    let diffre=a:repo.functions.diffre(a:repo, {})
    let revstatus={}
    let file=0
    let hasfiles=!empty(a:files)
    let usesstatus=(type(a:fs)==type({}))
    "▶2 Main cycle: get statuses
    while !empty(diff)
        let filematch=matchlist(remove(diff, 0), diffre)[1:1]
        if empty(filematch)
            if file is 0
                continue
            endif
            "▶3 Find === separator line
            while !empty(diff) && diff[0]!~#'[^=]'
                call remove(diff, 0)
            endwhile
            if empty(diff)
                break
            endif
            call remove(diff, 0)
            if empty(diff)
                call s:_f.throw('iediff')
            endif
            "▶3 Get file status
            let binary=0
            if diff[0][:2] isnot# '---'
                " Binary file
                let state='modified'
                let binary=1
            elseif diff[0][-12:] is# '(revision 0)'
                let state='added'
            else
                let state='modified'
            endif
            "▶3 If file was modified check: we can’t trust this information
            if state is# 'modified'
                if usesstatus
                    if index(a:ofs, file)==-1
                        let state='added'
                    elseif has_key(a:fs, file)
                        let state=a:fs[file]
                    endif
                else
                    " File additions are normally caught by ---.*(revision 0)?
                    " if index(a:ofs, file)==-1
                        " let state='added'
                    if index(a:fs, file)==-1
                        let state='removed'
                    endif
                endif
            endif
            "▶3 Reset values
            let r[state]+=[file]
            let revstatus[file]=state
            let file=0
            "▶3 Skip unneeded lines
            if !binary
                call remove(diff, 0, 1)
                while !empty(diff) && stridx('@-+ ', diff[0][0])!=-1
                    call remove(diff, 0)
                endwhile
            endif
            "▲3
        elseif hasfiles && index(a:files, filematch[0])==-1
            continue
        else
            let file=filematch[0]
        endif
    endwhile
    "▲2
    return [r, revstatus]
endfunction
"▶1 statreverse :: status → revstatus
function s:F.statreverse(status)
    let r={}
    call map(deepcopy(a:status),
                \'map(v:val, "extend(r, {v:val : ''".v:key."''})")')
    return r
endfunction
"▶1 svn.status :: repo[, rev1[, rev2[, files[, clean[, ign]]]]] → {type:[file]}
" TODO Try using diff --summarize
function s:svn.status(repo, ...)
    let requiresclean=(a:0>3 && a:4)
    let args=((a:0>2 && !empty(a:3))?(['--']+a:3):([]))
    "▶2 Simple case: we can use “svn status”
    if !a:0 || (a:1 is 0 && !(a:0>1 && a:2 isnot 0))
        let kwargs={}
        if a:0>4 && a:5
            let kwargs['no-ignore']=1
        endif
        let [r, revstatus]=s:F.status(a:repo, args, kwargs)
        if requiresclean
            let allfiles=a:repo.functions.getcsprop(a:repo, 'BASE', 'allfiles')
            if a:0>2 && !empty(a:3)
                let allfiles=filter(copy(allfiles), 'index(a:3, v:val)!=-1')
            endif
        endif
    "▶2 Not so complicated case: cs and its parent or itself
    elseif a:0>1 && !empty(a:1) && !empty(a:2) && a:1.a:2!~#'\D' &&
                \(abs(a:1-a:2)<=1 || (has_key(a:repo.changesets, a:1) &&
                \                     index(a:repo.changesets[a:1].parents+
                \                           a:repo.changesets[a:1].children,
                \                           a:2)!=-1) ||
                \                    (has_key(a:repo.changesets, a:2) &&
                \                     index(a:repo.changesets[a:2].parents+
                \                           a:repo.changesets[a:2].children,
                \                           a:1)!=-1))
        let r=copy(s:_r.utils.emptystatdct)
        if requiresclean
            let allfiles=copy(a:repo.functions.getcsprop(a:repo,a:1,'allfiles'))
            if a:0>2 && !empty(a:3)
                call filter(allfiles, 'index(a:3, v:val)!=-1')
            endif
        endif
        let reverse=(a:2<a:1)
        let s=a:repo.functions.getcs(a:repo, ''.max([+a:1, +a:2])).status
        if a:0>2 && !empty(a:3)
            let s=map(deepcopy(s), 'filter(v:val, "index(a:3,v:val)!=-1")')
        endif
        if requiresclean
            let revs=s:F.statreverse(s)
            call filter(allfiles, '!has_key(revs, v:val)')
        endif
        call extend(r, s)
        "▶3 Reversing range
        if reverse
            let [r.deleted, r.unknown]=[r.unknown, r.deleted]
            let [r.added,   r.removed]=[r.removed, r.added  ]
        endif
        "▲3
        if requiresclean
            let r.clean=allfiles
        endif
        return r
    "▶2 Complicated case: diff
    else
        "▶3 Get diff
        let dargs=[a:repo]
        let reverse=0
        let rspec=[]
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
        let dargs+=repeat([0], 2-len(rspec))+rspec
        if a:0>2 && !empty(a:3)
            let dargs+=[a:3]
        else
            let dargs+=[[]]
        endif
        let dargs+=[{}]
        let diff=call(a:repo.functions.diff, dargs, {})
        "▶3 Getting status
        let usescur=(len(rspec)==1)
        let rsallfiless=map(copy(rspec),
                    \       'a:repo.functions.getcsprop(a:repo, v:val, '.
                    \                                  '"allfiles")')
        if a:0>2 && !empty(a:3)
            call map(rsallfiless, 'filter(v:val, "index(a:3, v:val)!=-1")')
        endif
        if usescur
            let fs=s:F.status(a:repo, args, {})[1]
            call filter(fs, 'v:val is# "deleted" || v:val is# "removed"')
            let ofs=rsallfiless[0]
        else
            let [ofs, fs]=rsallfiless
        endif
        "▲3
        let [r, revstatus]=s:F.statfromdiff(a:repo, diff, ofs, fs,
                    \                       get(a:000, 2, []))
        "▶3 Reversing range
        if reverse
            let [r.deleted, r.unknown]=[r.unknown, r.deleted]
            let [r.added,   r.removed]=[r.removed, r.added  ]
        endif
        "▲3
        let allfiles=rsallfiless[0]
    endif
    "▲2
    if exists('allfiles')
        let r.clean=filter(copy(allfiles), '!has_key(revstatus, v:val)')
    endif
    return r
endfunction
"▶1 svn.commit :: repo, message[, files[, user[, date[, _]]]]
function s:svn.commit(repo, message, ...)
    let args=[]
    if a:0
        if !empty(a:1)
            let args+=['--']+a:1
            call s:_r.utils.addfiles(a:repo, a:1)
        endif
        if a:0>1 && !empty(a:2)
            call s:_f.throw('animp')
        elseif a:0>2 && !empty(a:3)
            call s:_f.throw('dnimp')
        elseif a:0>3 && !empty(a:4)
            call s:_f.throw('cbnimp')
        endif
    endif
    return s:_r.utils.usefile(a:repo, a:message, 'file', 'message',
                \             s:F.svnm, args, {}, 0, 'cif')
endfunction
"▶1 svn.update :: repo, rev, force → + FS
function s:svn.update(repo, rev, force)
    let kwargs={}
    if a:force
        let kwargs.force=1
        let kwargs.accept='theirs-full'
    endif
    let kwargs.revision=''.a:rev
    return s:F.svnm(a:repo, 'update', [], kwargs, 0, 'updf', a:rev)
endfunction
"▶1 svn.move :: repo, force, source, destination → + FS
function s:svn.move(repo, force, source, destination)
    return s:F.svnm(a:repo, 'move', ['--', a:source, a:destination],
                \   a:force ? {'force': 1} : {}, 0, 'mvf',
                \   a:source, a:destination)
endfunction
"▶1 svn.copy :: repo, force, source, destination → + FS
function s:svn.copy(repo, force, source, destination)
    if a:force
        call s:_f.throw('fcunsup')
    endif
    return s:F.svnm(a:repo, 'copy', ['--', a:source, a:destination], {}, 0,
                \   'cpf', a:source, a:destination)
endfunction
"▶1 svn.add :: repo, file → + FS
function s:svn.add(repo, file)
    return s:F.svnm(a:repo, 'add', ['--', a:file], {}, 0, 'addf', a:file)
endfunction
"▶1 svn.forget :: repo, file → + FS
function s:svn.forget(repo, file)
    return s:F.svnm(a:repo, 'delete', ['--',a:file], {'keep-local':1}, 0, 'fgf',
                \   a:file)
endfunction
"▶1 svn.remove :: repo, file → + FS
" FIXME For some reason :AuJ in drivers-subversion-subdir test is not actually 
" removing file
function s:svn.remove(repo, file)
    return s:F.svnm(a:repo, 'delete', ['--', a:file], {}, 0, 'rmf', a:file)
endfunction
"▶1 svn.ignore :: repo, file → + FS
function s:svn.ignore(repo, file)
    return a:repo.functions.ignoreglob(a:repo, escape(a:file, '\*?[]'))
endfunction
"▶1 svn.ignoreglob :: repo, glob → + FS
function s:svn.ignoreglob(repo, glob)
    let dir=s:_r.os.path.dirname(a:glob)
    let glob=s:_r.os.path.basename(a:glob)
    return s:F.svnm(a:repo, 'propset', ['svn:ignore', glob, dir], {}, 0,
                \   'ignf', a:glob)
endfunction
"▶1 svn.readfile :: repo, rev, file → [String]
function s:svn.readfile(repo, rev, file)
    return s:F.svn(a:repo, 'cat', ['--', a:file], {'revision': a:rev}, 2,
                \  'filef', a:rev, a:file)
endfunction
"▶1 svn.annotate :: repo, rev, file → [(file, hex, linenumber)]
" TODO use merge history if available
function s:svn.annotate(repo, rev, file)
    let args=['--', a:file]
    let kwargs={'revision': ''.a:rev}
    let lines=s:F.svn(a:repo, 'blame', args, kwargs, 1, 'annf', a:rev, a:file)
    let r=[]
    for line in lines
        let r+=[[a:file, matchstr(line, '\v\d+'), 0]]
    endfor
    return r
endfunction
"▶1 svn.diff :: repo, rev, rev, files, opts → [String]
let s:difftrans={
            \ 'numlines': 'unified',
            \ 'ignorews': 'ignore-all-space',
            \'iwsamount': 'ignore-space-change',
            \ 'showfunc': 'show-c-function',
        \}
function s:svn.diff(repo, rev1, rev2, files, opts)
    let cancache=1
    "▶2 Get --extensions arguments
    let diffopts=s:_r.utils.diffopts(a:opts, a:repo.diffopts, s:difftrans)
    if has_key(diffopts, 'unified') && diffopts.unified && diffopts.unified!=3
        call s:_f.throw('u3', diffopts.unified)
    endif
    let reverse=get(a:opts, 'reverse', 0)
    let kwargs={}
    let args=[]
    for [k, v] in filter(items(diffopts), 'v:val[1]')
        let args+=['--extensions', '--'.k]
    endfor
    "▶2 Get revision arguments
    if empty(a:rev2)
        if !empty(a:rev1)
            if reverse
                let kwargs.revision=a:rev1.':'.(a:rev1-1)
            else
                let kwargs.change=''.a:rev1
            endif
        elseif reverse
            call s:_f.throw('rnimp')
        endif
    else
        let kwargs.revision=''.a:rev2
        if empty(a:rev1)
            if reverse
                call s:_f.throw('rnimp')
            endif
            let cancache=0
        else
            if reverse
                let kwargs.revision=a:rev1.':'.kwargs.revision
            else
                let kwargs.revision.=':'.a:rev1
            endif
        endif
    endif
    "▶2 Get files arguments
    if !empty(a:files)
        " FIXME Work with case when local repository root is not remote 
        " repository root
        let args+=['--']+a:files
    endif
    "▶2 Process cache
    if cancache
        let cachekey=string(args).string(sort(items(kwargs)))
        if !has_key(a:repo, 'diffcache')
            let a:repo.diffcache={}
        elseif has_key(a:repo.diffcache, cachekey)
            let cache=a:repo.diffcache[cachekey]
            let cache.acccount+=1
            return copy(cache.diff)
        endif
    endif
    "▲2
    let r=s:F.svn(a:repo, 'diff', args, kwargs, 1,
                \ 'difff', a:rev1, a:rev2, join(a:files, ', '))
    "▶2 Remove cache entries if needed
    if cancache
        let cache={'diff': copy(r), 'acccount': 1}
        if len(keys(a:repo.diffcache))==50
            let dcitems=items(a:repo.diffcache)
            let [minacccountkey, ccache]=remove(dcitems, 0)
            let minacccount=ccache.acccount
            for [key, ccache] in dcitems
                if ccache.acccount<minacccount
                    let minacccountkey=key
                    let minacccount=ccache.acccount
                endif
            endfor
            call remove(a:repo.diffcache, minacccountkey)
        endif
        let a:repo.diffcache[cachekey]=cache
    endif
    "▲2
    return r
endfunction
"▶1 svn.diffre :: _, opts → Regex
function s:svn.diffre(repo, opts)
    return '\m^Index: \v(.*)'
endfunction
"▶1 svn.getrepoprop :: repo, propname → a
function s:svn.getrepoprop(repo, prop)
    if a:prop is# 'branch'
        return substitute(a:repo.svnprefix, '/*$', '', '')
    elseif a:prop is# 'url'
        return a:repo.svnurl
    elseif a:prop is# 'tagslist'
        return ['HEAD', 'BASE', 'COMMITTED', 'PREV']
    elseif a:prop[-4:] is# 'list'
        return []
    endif
    call s:_f.throw('nocfg', a:prop, a:repo.path)
endfunction
"▶1 svn.pull :: repo, dryrun, force[, URL[, rev]]
function s:svn.pull(repo, dryrun, force, ...)
    if a:0>=1 && a:1 isnot 0
        call s:_f.throw('punimp')
    endif
    if a:dryrun
        return s:F.svnm(a:repo, 'log', [], {'revision': 'HEAD:BASE'}, 0)
    else
        return s:F.svnm(a:repo, 'update', [], {'force': a:force}, 0, 'pullf')
    endif
endfunction
"▶1 svn.repo :: path → repo
function s:svn.repo(path)
    let repo={'path': a:path, 'changesets': {}, 'mutable': {'cslist': []},
                \'local': (stridx(a:path, '://')==-1),
                \'labeltypes': [], 'hasrevisions': 1,
                \'requires_sort': 0, 'has_octopus_merges': 0,
                \'initprops': ['rev', 'hex', 'parents', 'tags', 'bookmarks',
                \              'branch', 'time', 'user', 'description',
                \              'renames', 'copies', 'files', 'changes',
                \              'removes', 'phase'],
                \'hypsites': deepcopy(s:hypsites),
                \'has_merges': 0, 'iterfuncs': deepcopy(s:iterfuncs),
                \'hexreg': '\v[1-9]\d*',}
    "▶2 Get svnprefix
    let str1='URL: '
    let str1lidx=len(str1)-1
    let str2='Repository Root: '
    let str2lidx=len(str2)-1
    for line in s:F.svn(repo, 'info', [], {}, 0, 'infof')
        if line[:(str1lidx)] is# str1
            let repo.svnurl=line[str1lidx+1:]
        elseif line[:(str2lidx)] is# str2
            let repo.svnroot=line[str2lidx+1:]
            " XXX Assuming repository root always goes after URL
            break
        endif
    endfor
    let repo.svnprefix=repo.svnurl[(len(repo.svnroot)+1):]
    if !empty(repo.svnprefix)
        let repo.svnprefix.='/'
    endif
    "▲2
    return repo
endfunction
"▶1 svn.checkdir :: dir → Bool
function s:F.checkdir(dir)
    return s:_r.os.path.isdir(s:_r.os.path.join(a:dir, '.svn'))
endfunction
let s:svn.checkdir=s:F.checkdir
" TODO Support remote repositories
"▶1 svn.getroot :: dir → Maybe dir
function s:svn.getroot(dir)
    let checkeddirs=[]
    let dir=s:_r.os.path.dirname(a:dir)
    while !(dir is# get(checkeddirs, -1, 0))
        if !s:F.checkdir(dir)
            break
        endif
        call insert(checkeddirs, dir)
        let dir=s:_r.os.path.dirname(dir)
    endwhile
    if empty(checkeddirs)
        return a:dir
    endif
    let uuid=s:F.getfrominfo({'path': a:dir}, 'Repository UUID')
    for dir in checkeddirs
        if s:F.getfrominfo({'path': dir}, 'Repository UUID') is# uuid
            return dir
        endif
    endfor
    return a:dir
endfunction
"▶1 iterfuncs.ancestors
function s:iterfuncs.ancestors(repo, opts)
    let cslist=copy(a:repo.functions.revrange(a:repo, '1', a:opts.revision))
    return {'cslist': cslist, 'next': s:F.ancestorsnext}
endfunction
function s:F.ancestorsnext()
    while !empty(self.cslist)
        let cs=remove(self.cslist, -1)
        if !empty(cs.changes)
            return cs
        endif
    endwhile
    return 0
endfunction
"▶1 iterfuncs.changesets
function s:iterfuncs.changesets(repo, opts)
    return {'cslist': copy(a:repo.functions.getchangesets(a:repo)),
                \'next': s:F.ancestorsnext}
endfunction
"▶1 iterfuncs.revrange
function s:iterfuncs.revrange(repo, opts)
    let cslist=copy(a:repo.functions.revrange(a:repo, a:opts.revrange[0],
                \                                     a:opts.revrange[1]))
    return {'cslist': cslist, 'next': s:F.ancestorsnext}
endfunction
"▶1 astatus, agetcs, agetrepoprop
if s:_r.repo.userepeatedcmd
    try
        python import aurum.rcdriverfuncs
        let s:addafuncs=1
    catch
        let s:addafuncs=0
    endtry
    if s:addafuncs
        function s:svn.astatus(repo, interval, ...)
            if a:0<3 || a:1 isnot 0 || a:2 isnot 0 ||
                        \type(a:3)!=type([]) || len(a:3)!=1
                call s:_f.throw('aconimp')
            endif
            return s:_r.utils.pyeval('aurum.repeatedcmd.new('.
                        \        string(a:interval).', '.
                        \       'aurum.rcdriverfuncs.svn_status, '.
                        \        s:_r.utils.pystring(a:repo.path).', '.
                        \        s:_r.utils.pystring(a:3[0]).')')
        endfunction
    endif
endif
"▶1 Register driver
call s:_f.regdriver('Subversion', s:svn)
"▶1
call frawor#Lockvar(s:, '_pluginloaded,hasdateexe')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
