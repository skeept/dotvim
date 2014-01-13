let g:r=[]
function FormatRepository(repo)
    let g:r+=['>>> Repository']
    let maxlen=len('brancheslist')
    let g:r+=[' # Keys:']
    for f in split('local path')
        let g:r+=[' '.printf('%-*s', maxlen, f).':'.string(a:repo[f])]
    endfor
    let g:r+=[' # Properties:']
    for p in split('tagslist brancheslist url branch')
        let g:r+=[' '.printf('%-*s', maxlen, p).':'.
                    \string(a:repo.functions.getrepoprop(a:repo, p))]
    endfor
endfunction
let skippednewcsprops=['hex', 'time', 'user', 'parents']
function FormatCS(repo, cs, ...)
    let g:r+=[' >> Changeset']
    let maxlen=len('description')
    let g:r+=[' # Immediately available keys:']
    for f in split('hex rev time description user parents branch tags')
        if a:0 && index(a:1, f)!=-1
            continue
        endif
        let g:r+=['  '.printf('%-*s', maxlen, f).':'.string(a:cs[f])]
    endfor
    let g:r+=[' # Keys needed to be obtained by getcsprop:']
    for p in split('allfiles renames changes files removes')
        if a:0 && index(a:1, f)!=-1
            continue
        endif
        let g:r+=['  '.printf('%-*s', maxlen, p).':'.
                    \string(a:repo.functions.getcsprop(a:repo, a:cs, p))]
    endfor
endfunction
function FormatStatus(repo, args, ...)
    let status=call(a:repo.functions.status, [a:repo]+a:args, {})
    let g:r+=[' >> Status ('.fnamemodify(a:repo.path, ':t').'): '.
                \string(a:args)[1:-2]]
    let expr='"     ".'
    if a:0 && !empty(a:1)
        let expr.='"xr"[filereadable(a:1."/".v:val)]." ".v:val'
    else
        let expr.='v:val'
    endif
    for [key, files] in items(status)
        let g:r+=['  - '.key]+map(copy(files), expr)
    endfor
endfunction
let g:aurum_repocachetime=0
for R in ['A', 'B', 'C']
    cd `="bzrtestrepo/".R`
    let {R}repo=aurum#repository()
    cd -
endfor
unlet R
unlet g:aurum_repocachetime
call FormatRepository(Arepo)
let Acs=Arepo.functions.getwork(Arepo)
call FormatCS(Arepo, Acs)
for cs in Arepo.functions.getchangesets(Arepo)
    call FormatCS(Arepo, cs)
endfor
call FormatStatus(Arepo, [])
call FormatStatus(Arepo, [0,   0,   0,             1, 1])
call FormatStatus(Arepo, [0,   0,   [],            1, 1])
call FormatStatus(Arepo, ['7', 0,   0,             1, 1])
call FormatStatus(Arepo, ['5', 0,   0,             1, 1])
call FormatStatus(Arepo, [0,   '5', 0,             1, 1])
call FormatStatus(Arepo, ['5', '4', 0,             1, 1])
call FormatStatus(Arepo, ['4', 0,   ['lines.lst'], 1, 1])
call FormatStatus(Brepo, [0, 0, 0, 1, 1])
call Brepo.functions.commit(Brepo, 'Added added, modified and unknown',
            \                      ['added', 'modified', 'unknown'],
            \                      'Abc <abc@example.net>',
            \                      '2000-01-01 16:23:00')
call FormatCS(Brepo, Brepo.functions.getwork(Brepo), ['hex'])
call Brepo.functions.commit(Brepo, "Multiline\ncommit\ncomment")
call FormatCS(Brepo, Brepo.functions.getwork(Brepo), skippednewcsprops)
call Brepo.functions.branch(Brepo, 'B-mod', 0)
call Brepo.functions.label(Brepo, 'tag', 'seventh', '7', 0, 0)
call Brepo.functions.label(Brepo, 'tag', '--force', '7', 1, 0)
call Brepo.functions.label(Brepo, 'tag', 'rev-4',   0,   0, 0)
call FormatRepository(Brepo)
call FormatCS(Brepo, Brepo.functions.getcs(Brepo, '7'))
let r+=[' >> Update']
let fname=Brepo.path.'/lines.lst'
let r+=['   readable: '.filereadable(fname)]
call Brepo.functions.update(Brepo, '2', 0)
let r+=['   readable: '.filereadable(fname)]
let r+=['      fsize: '.getfsize(fname)]
call writefile(['abc'], fname)
let r+=['      fsize: '.getfsize(fname)]
try
    call Brepo.functions.update(Brepo, '3', 0)
catch /^Frawor:[^:]*:updatef:/
    let r+=[matchstr(v:exception, '\v^([^:]*\:){3}')]
endtry
let r+=['      fsize: '.getfsize(fname)]
call Brepo.functions.update(Brepo, '3', 1)
let r+=['      fsize: '.getfsize(fname)]
call Brepo.functions.update(Brepo, '-1', 0)
call writefile([], Brepo.path.'/completely-new', 'b')
call writefile([], Brepo.path.'/I-', 'b')
call writefile([], Brepo.path.'/Ign-', 'b')
call writefile([], Brepo.path.'/Ign+', 'b')
call Brepo.functions.move(Brepo, 0, 'added', '-added-moved')
call Brepo.functions.add(Brepo, 'completely-new')
call Brepo.functions.forget(Brepo, 'modified')
call Brepo.functions.remove(Brepo, 'unknown')
call Brepo.functions.ignore(Brepo, 'I-')
call Brepo.functions.ignoreglob(Brepo, 'Ign*')
call FormatStatus(Brepo, [0, 0, 0, 1, 1], Brepo.path)
function PurgeDiffPlusDates(lines)
    return map(a:lines, 'v:val[:3] is# "+++ " ? '.
                \           'substitute(v:val, "\t[^\t]\\+$", "", "") : '.
                \           'v:val')
endfunction
let r+=[' >> File bzrlines.lst']
let r+=['  > File (2)']
let r+=map(Brepo.functions.readfile(Brepo, '2', 'bzrlines.lst'), '"   ".v:val')
let r+=['  > Annotation (-1)']
let r+=map(Brepo.functions.annotate(Brepo, '-1', 'bzrlines.lst'), '"   ".string(v:val)')
let r+=[' >> Diff (default)']
let r+=PurgeDiffPlusDates(Brepo.functions.diff(Brepo, 0,   0,   0,                {}))
let r+=[' >> Diff (first revision)']
let r+=PurgeDiffPlusDates(Brepo.functions.diff(Brepo, '1', 0,   0,                {}))
let r+=[' >> Diff (second revision)']
let r+=PurgeDiffPlusDates(Brepo.functions.diff(Brepo, 0,   '1', 0,                {}))
let r+=[' >> Diff (both revisions)']
let r+=PurgeDiffPlusDates(Brepo.functions.diff(Brepo, '6', '1', 0,                {}))
let r+=[' >> Diff (with file)']
let r+=PurgeDiffPlusDates(Brepo.functions.diff(Brepo, '1', '6', ['bzrlines.lst'], {}))
let r+=[' >> Push B to A (:parent)']
call Brepo.functions.push(Brepo, 0, 0, ':parent')
call FormatCS(Arepo, Arepo.functions.getcs(Arepo, '-1'), skippednewcsprops)
let r+=[' >> Pull from B to C (default)']
call Crepo.functions.pull(Crepo, 0, 0)
call FormatCS(Crepo, Crepo.functions.getcs(Crepo, '-1'), skippednewcsprops)

call WriteFile(r)
source addEmessages.vim
