scriptencoding utf-8
execute frawor#Setup('0.0', {'@%aurum/cmdutils': '4.3',
            \                    '@%aurum/edit': '1.0',
            \                       '@/options': '0.0',
            \                     '@/functions': '0.1',
            \                           '@/fwc': '0.0',})
let s:_messages={
            \   'nogf': 'No files found',
        \}
let s:_options={
            \'workdirfiles': {'default': 1,
            \                  'filter': 'bool',},
        \}
let s:_aufunctions.cmd={'@FWC': ['-onlystrings '.
            \'type "" '.
            \'{     repo       '.s:_r.cmdutils.comp.repo.
            \' ?*+2 revrange   '.join(repeat([s:_r.cmdutils.comp.rev], 2)).
            \' ?*   revision   '.s:_r.cmdutils.comp.rev.
            \' ?*   files      '.s:_r.cmdutils.comp.file.
            \' ?    location   range 0 $=winnr("$")'.
            \' ?   !workmatch'.
            \' ?   !wdfiles'.
            \' ?   !ignorecase '.
            \'}', 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \                                     [], s:_f.fwc.compile)
function s:F.setlist(opts, list)
    if has_key(a:opts, 'location')
        return setloclist(a:opts.location, a:list)
    else
        return setqflist(a:list)
    endif
endfunction
function s:_aufunctions.cmd.function(pattern, opts)
    if has_key(a:opts, 'files') && a:opts.repo is# ':'
        let repo=s:_r.cmdutils.checkedgetrepo(a:opts.files[0])
    else
        let repo=s:_r.cmdutils.checkedgetrepo(a:opts.repo)
    endif
    let revisions=copy(get(a:opts, 'revision', []))
    let revrange=get(a:opts, 'revrange', [])
    while !empty(revrange)
        let [rev1, rev2; revrange]=revrange
        let cs1=repo.functions.getcs(repo, rev1)
        let cs2=repo.functions.getcs(repo, rev2)
        if type(cs1.rev)==type(0) && cs1.rev>cs2.rev
            let [cs1, cs2]=[cs2, cs1]
        elseif cs1 is cs2
            let revisions+=[cs1.hex]
            continue
        endif
        let revisions+=[[cs1.hex, cs2.hex]]
    endwhile
    let files=[]
    if has_key(a:opts, 'files')
        if empty(revisions)
            if get(a:opts, 'workmatch', 1)
                let css=[repo.functions.getwork(repo)]
            else
                call repo.functions.getchangesets(repo)
                let css=values(repo.changesets)
            endif
        else
            let css=[]
            for s in revisions
                if type(s)==type([])
                    let css+=repo.functions.revrange(a:repo, s[0], s[1])
                else
                    let css+=[repo.functions.getcs(repo, s)]
                endif
                unlet s
            endfor
        endif
        let allfiless=map(copy(css), 'repo.functions.getcsprop(repo, v:val,'.
                    \                                         '"allfiles")')
        let allfiles=[]
        call map(copy(allfiless),
                    \'extend(allfiles, filter(v:val, '.
                    \                        '"index(allfiles, v:val)==-1"))')
        for pattern in map(copy(a:opts.files),
                    \'s:_r.globtopat(repo.functions.reltorepo(repo, v:val))')
            let files+=filter(copy(allfiles),
                        \     'v:val=~#pattern && index(files, v:val)==-1')
        endfor
        if empty(files)
            call s:_f.warn('nogf')
            return s:F.setlist(a:opts, [])
        endif
    endif
    let wdfiles=((has_key(a:opts, 'wdfiles'))?(a:opts.wdfiles):
                \                             (s:_f.getoption('workdirfiles')))
    let qf=repo.functions.grep(repo, a:pattern, files, revisions,
                \              get(a:opts, 'ignorecase', 0), wdfiles)
    for item in filter(copy(qf), 'type(v:val.filename)=='.type([]))
        let item.filename=s:_r.fname('file', repo, item.filename[0],
                    \                item.filename[1])
    endfor
    return s:F.setlist(a:opts, qf)
endfunction
"▶1
call frawor#Lockvar(s:, '')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
