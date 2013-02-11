"▶1 
scriptencoding utf-8
execute frawor#Setup('1.2', {'@%aurum/cmdutils': '4.3',
            \                    '@%aurum/edit': '1.0',
            \                     '@/functions': '0.1',
            \                           '@/fwc': '0.0',
            \                       '@/options': '0.0',
            \                     '@/resources': '0.0',})
let s:statchars={
            \ 'deleted': '!',
            \ 'unknown': '?',
        \}
let s:_options={
            \'usestatwin': {'default': 1, 'filter': 'bool'},
        \}
let s:defshow=['modified', 'added', 'removed', 'deleted', 'unknown']
let s:allshow=s:defshow+['ignored', 'clean']
let s:showchars={}
call map(copy(s:statchars), 'extend(s:showchars, {v:val            : v:key})')
call map(copy(s:allshow),   'extend(s:showchars, {toupper(v:val[0]): v:val})')
"▶1 parseshow :: [Either type tabbr] → [type]
function s:F.parseshow(show)
    if index(a:show, 'all')!=-1
        return copy(s:allshow)
    endif
    let r=[]
    for type in a:show
        if type[0]=~#'^\l'
            let r+=[type]
        else
            let r+=map(split(type, '\v.@='), 's:showchars[v:val]')
        endif
    endfor
    return r
endfunction
"▶1 setup
function s:F.setup(read, repo, opts)
    let opts=a:opts
    for key in filter(['rev', 'wdrev'], 'has_key(opts, v:val)')
        let opts[key]=a:repo.functions.getrevhex(a:repo, opts[key])
    endfor
    let bvar={}
    let requiresclean=0
    let requiresignored=0
    if has_key(opts, 'show')
        let show=s:F.parseshow(opts.show)
        let requiresclean=(index(show, 'clean')!=-1)
        let requiresignored=(index(show, 'ignored')!=-1)
    else
        let show=s:defshow
    endif
    let status=a:repo.functions.status(a:repo, get(opts, 'rev',   0),
                \                              get(opts, 'wdrev', 0),
                \                              0, requiresclean,
                \                              requiresignored)
    let bvar.status=status
    let bvar.types=[]
    let bvar.chars=[]
    let bvar.files=[]
    let isrecord=get(opts, 'record', 0)
    let statlines=[]
    for [type, files] in filter(sort(items(status)), 'index(show,v:val[0])!=-1')
        let char=has_key(s:statchars, type)? s:statchars[type]: toupper(type[0])
        for file in files
            let ignore=0
            if has_key(opts, 'files')
                let ignore=1
                for pattern in opts.filepats
                    if file=~#pattern
                        let ignore=0
                        break
                    endif
                endfor
            endif
            if ignore
                continue
            endif
            let statlines+=[((isrecord)?('-'):('')).char.' '.file]
            let bvar.types+=[type]
            let bvar.chars+=[char]
            let bvar.files+=[file]
        endfor
    endfor
    if empty(statlines)
        let statlines=['No changes found']
    endif
    if a:read
        call append('.', statlines)
    else
        call setline('.', statlines)
        setlocal readonly nomodifiable
    endif
    return bvar
endfunction
"▶1 statfunc
let s:defcmd='silent botright new'
let s:_aufunctions.cmd={'@FWC': ['-onlystrings '.
            \'['.s:_r.cmdutils.comp.repo.']'.
            \'{ *?files     '.s:_r.cmdutils.comp.file.
            \'   ?rev       '.s:_r.cmdutils.comp.rev.
            \'   ?wdrev     '.s:_r.cmdutils.comp.rev.
            \'   ?changes   '.s:_r.cmdutils.comp.rev.
            \'  *?show      (either (in [modified added '.
            \                           'removed deleted '.
            \                           'unknown ignored '.
            \                           'clean all] ~start, '.
            \                       'match /\v^[MARDUIC!?]+$/))'.
            \'   ?cmd       '.s:_r.cmdutils.comp.cmd.
            \'}', 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \                                     [], s:_f.fwc.compile)
function s:_aufunctions.cmd.function(repopath, opts)
    if has_key(a:opts, 'files') && a:repopath is# ':'
        let repo=s:_r.cmdutils.checkedgetrepo(a:opts.files[0])
    else
        let repo=s:_r.cmdutils.checkedgetrepo(a:repopath)
    endif
    let opts=copy(a:opts)
    if has_key(opts, 'changes')
        let cs=repo.functions.getcs(repo, opts.changes)
        let opts.rev=cs.hex
        if empty(cs.parents)
            return
        endif
        let opts.wdrev=cs.parents[0]
    endif
    if has_key(opts, 'files')
        call map(opts.files, 'repo.functions.reltorepo(repo, v:val)')
    endif
    if has_key(opts, 'cmd')
        call s:_r.run(opts.cmd, 'status', repo, opts)
    elseif s:_f.getoption('usestatwin') &&
                \!empty(filter(tabpagebuflist(),
                \              'bufname(v:val)=~#''\v^aurum:(.)\1status'''))
        let statf=s:_r.fname('status', repo, opts)
        if bufexists(statf) && bufwinnr(statf)!=-1
            execute bufwinnr(statf).'wincmd w'
            silent edit
        else
            call s:_r.run(s:defcmd, 'status', repo, opts)
        endif
    else
        call s:_r.run(s:defcmd, 'status', repo, opts)
    endif
    if !has_key(opts, 'cmd')
        let lnum=line('$')
        if winnr('$')>1 && ((winheight(0)>lnum) ||
                    \       (winheight(0)!=lnum && lnum<(&lines/3)))
            execute 'resize' lnum
        endif
        setlocal bufhidden=wipe
    endif
endfunction
"▶1 aurum://status
call s:_f.newcommand({
            \'function': s:F.setup,
            \ 'options': {'list': ['files', 'show'],
            \             'bool': ['record'],
            \              'str': ['rev', 'wdrev'],
            \             'pats': ['files'],},
            \'filetype': 'aurumstatus',
            \})
"▶1 status resource
call s:_f.postresource('status', {'parseshow': s:F.parseshow})
"▶1
call frawor#Lockvar(s:, '_r,_pluginloaded')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
