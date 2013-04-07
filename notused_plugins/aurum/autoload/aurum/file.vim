"▶1 
scriptencoding utf-8
execute frawor#Setup('0.1', {'@%aurum/cmdutils': '4.3',
            \                '@%aurum/maputils': '0.1',
            \                 '@%aurum/bufvars': '0.0',
            \               '@%aurum/lineutils': '0.0',
            \                 '@%aurum/vimdiff': '1.0',
            \                    '@%aurum/edit': '1.2',
            \                     '@/functions': '0.1',
            \                           '@/fwc': '0.0',
            \                            '@/os': '0.0',
            \                      '@/mappings': '0.0',})
let s:_messages={
            \ 'wfail': 'Writing to %s failed',
            \ 'dfail': 'Failed to delete %s',
            \'nopars': 'Revision %s has no parents',
        \}
"▶1 callbacks
let s:F.callbacks={}
"▶2 callbacks.open
function s:F.callbacks.open(file, repo, rev, cmd, hasbuf)
    if a:hasbuf
        let filetype=&filetype
    endif
    let oldlastbuf=bufnr('$')
    let existed=s:_r.run(a:cmd, 'file', a:repo, a:rev, a:file)
    if exists('filetype') && &filetype isnot# filetype
        let &filetype=filetype
    endif
    let buf=bufnr('%')
    if !existed && buf>oldlastbuf
        setlocal bufhidden=wipe
    endif
    call s:_f.mapgroup.map('AuFile', buf)
endfunction
"▶2 callbacks.replace
function s:F.callbacks.replace(file, repo, rev, cmd, hasbuf)
    let winview=winsaveview()
    silent %delete _
    call s:_r.lineutils.setlines(a:repo.functions.readfile(a:repo,a:rev,a:file),
                \                0)
    call winrestview(winview)
endfunction
"▶1 AuFile
let s:_aufunctions.cmd={'@FWC': ['-onlystrings '.
            \'[:=(0)   type ""'.
            \'[:=(0)   either (match /\L/, path fr)]]'.
            \'{  repo   '.s:_r.cmdutils.comp.repo.
            \' !?replace'.
            \' !?prompt'.
            \'  ?cmd    '.s:_r.cmdutils.comp.cmd.
            \'}', 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \[['\V:=(0)\s\+either (\[^)]\+)', 'path', ''],
            \ ['\V:=(0)\s\+type ""',
            \               'either (type "" '.s:_r.cmdutils.comp.rev.')', ''],
            \ ['\v\[(.{-})\]',                '\1',   ''],
            \],
            \s:_f.fwc.compile)
function s:_aufunctions.cmd.function(rev, file, opts)
    let opts=copy(a:opts)
    if a:rev isnot 0 && a:rev isnot ':'
        let opts.rev=a:rev
    endif
    let prompt=get(a:opts, 'prompt', 0)
    if !prompt && a:file isnot 0 && a:file isnot# ':'
        let opts.file=a:file
    endif
    let action=((prompt)?('getrr'):('open'))
    let message=((prompt)?('norev'):('noffile'))
    let [hasbuf, repo, rev, file]=s:_r.cmdutils.getrrf(opts, message, action)
    if repo is 0
        return
    endif
    if rev is 0
        let rev=repo.functions.getworkhex(repo)
    else
        let rev=repo.functions.getrevhex(repo, a:rev)
    endif
    if get(a:opts, 'replace', 0)
        let cbargs=[s:F.callbacks.replace]
    else
        let cbargs=[s:F.callbacks.open]
    endif
    let cbargs+=[repo, rev, get(a:opts, 'cmd', 'silent edit'), hasbuf]
    let pvargs=[s:_r.maputils.readfilewrapper, repo, rev]
    if prompt
        let files=repo.functions.getcsprop(repo, rev, 'allfiles')
        if a:file isnot# ':'
            let pattern=s:_r.globtopat(a:file)
            let files=filter(copy(files), 'v:val =~# pattern')
        endif
        return s:_r.maputils.promptuser(files, cbargs, pvargs)
    else
        call call(cbargs[0], [file]+cbargs[1:], {})
    endif
endfunction
"▶1 docmd :: [String], read::0|1|2 → _ + ?
function s:F.docmd(lines, read)
    if a:read==0 || a:read==1
        return s:_r.lineutils.setlines(a:lines, a:read)
    elseif a:read==2
        let tmpname=tempname()
        if writefile(a:lines, tmpname, 'b')==-1
            call s:_f.throw('wfail', tmpname)
        endif
        try
            execute 'source' fnameescape(tmpname)
        finally
            if delete(tmpname)
                call s:_f.throw('dfail', tmpname)
            endif
        endtry
    endif
endfunction
"▶1 aurum://file
let s:file={'arguments': 2, 'sourceable': 1, 'mgroup': 'AuFile'}
function s:file.function(read, repo, rev, file)
    let rev=a:repo.functions.getrevhex(a:repo, a:rev)
    call s:F.docmd(a:repo.functions.readfile(a:repo, rev, a:file), a:read)
    if !a:read && exists('#filetypedetect#BufRead')
        execute 'doautocmd filetypedetect BufRead'
                    \ fnameescape(s:_r.os.path.normpath(
                    \             s:_r.os.path.join(a:repo.path, a:file)))
    endif
    return {'rev': rev, 'file': a:file}
endfunction
call s:_f.newcommand(s:file)
unlet s:file
"▶1 aurum://file mappings
function s:F.runmap(action)
    let buf=bufnr('%')
    let bvar=s:_r.bufvars[buf]
    if a:action is# 'exit'
        execute s:_r.cmdutils.closebuf(bvar)
    elseif a:action is# 'update'
        call s:_r.maputils.update(bvar.repo, bvar.rev, v:count)
    elseif a:action is# 'previous' || a:action is# 'next'
        let c=((a:action is# 'previous')?(v:count1):(-v:count1))
        let [rev, file]=s:_r.maputils.getnthparentfile(bvar.repo, bvar.rev,
                    \                                  bvar.file, c)
        let bhwipe=(&bufhidden is# 'wipe')
        let existed=s:_r.mrun('silent edit', 'file', bvar.repo, rev, file)
                    \|| !bhwipe
        if bufexists(buf)
            execute 'bwipeout' buf
        endif
    elseif a:action is# 'vimdiff'
        let file=s:_r.os.path.normpath(s:_r.os.path.join(bvar.repo.path,
                    \                                    bvar.file))
        call s:_r.vimdiff.split([file], -1)
    elseif a:action is# 'revvimdiff'
        let rev=bvar.repo.functions.getnthparent(bvar.repo, bvar.rev,
                    \                            v:count1).hex
        call s:_r.vimdiff.split([['file', bvar.repo, rev, bvar.file]], -1)
    elseif a:action is# 'diff'
        let existed=s:_r.mrun('silent edit', 'diff', bvar.repo, '', bvar.rev,
                    \                                [bvar.file], {})
    elseif a:action is# 'revdiff'
        let existed=s:_r.mrun('silent edit', 'diff', bvar.repo, bvar.rev, '',
                    \                                [bvar.file], {})
    elseif a:action is# 'fulldiff'
        let existed=s:_r.mrun('silent edit', 'diff', bvar.repo, '', bvar.rev,
                    \                                [], {})
    elseif a:action is# 'revfulldiff'
        let existed=s:_r.mrun('silent edit', 'diff', bvar.repo, bvar.rev, '',
                    \                                [], {})
    elseif a:action is# 'fullvimdiff'
        call s:_r.vimdiff.full(bvar.repo, [0, bvar.rev], 1, [], 0)
    elseif a:action is# 'revfullvimdiff'
        let cs=bvar.repo.functions.getcs(bvar.repo, bvar.rev)
        if empty(cs.parents)
            call s:_f.throw('nopars', cs.hex)
        endif
        call s:_r.vimdiff.full(bvar.repo, [bvar.rev, cs.parents[0]], 1, [], 0)
    endif
    if exists('existed') && !existed
        setlocal bufhidden=wipe
    endif
endfunction
"▶2 s:m
function s:m(...)
    return ':<C-u>call call(<SID>Eval("s:F.runmap"), '.string(a:000).', {})<CR>'
endfunction
"▲2
call s:_f.mapgroup.add('AuFile', {
            \   'Next': {'lhs':  'K', 'rhs': s:m('next'          )},
            \   'Prev': {'lhs':  'J', 'rhs': s:m('previous'      )},
            \ 'Update': {'lhs':  'U', 'rhs': s:m('update'        )},
            \   'Exit': {'lhs':  'X', 'rhs': s:m('exit'          )},
            \   'Diff': {'lhs':  'd', 'rhs': s:m(          'diff')},
            \  'Rdiff': {'lhs':  'c', 'rhs': s:m('rev'.    'diff')},
            \  'Vdiff': {'lhs':  'D', 'rhs': s:m(       'vimdiff')},
            \ 'RVdiff': {'lhs':  'C', 'rhs': s:m('rev'. 'vimdiff')},
            \  'Fdiff': {'lhs': 'gd', 'rhs': s:m(   'full'.'diff')},
            \ 'RFdiff': {'lhs': 'gc', 'rhs': s:m('revfull'.'diff')},
            \ 'FVdiff': {'lhs': 'gD', 'rhs': s:m(   'fullvimdiff')},
            \'RFVdiff': {'lhs': 'gC', 'rhs': s:m('revfullvimdiff')},
        \}, {'silent': 1, 'mode': 'n', 'dontmap': 1,})
delfunction s:m
"▶1
call frawor#Lockvar(s:, '_r,_pluginloaded')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
