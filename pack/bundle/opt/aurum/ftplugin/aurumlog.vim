"▶1
scriptencoding utf-8
setlocal textwidth=0
setlocal nolist
if has('conceal')
    setlocal concealcursor+=n conceallevel=2
endif
setlocal nonumber
if exists('+relativenumber')
    setlocal norelativenumber
endif
setlocal noswapfile
setlocal nomodeline
execute frawor#Setup('0.1', {'@%aurum/cmdutils': '4.0',
            \                '@%aurum/maputils': '0.0',
            \                 '@%aurum/bufvars': '0.0',
            \                    '@%aurum/edit': '1.0',
            \                 '@%aurum/vimdiff': '1.1',
            \                            '@/os': '0.0',
            \                      '@/mappings': '0.0',})
let s:_messages={
            \    'noprev': 'Can’t find any revision before %s',
            \    'nonext': 'Can’t find any revision after %s',
            \    'nopars': 'Revision %s has no parents',
            \  'novfiles': 'No viewable files found for revision %s',
            \'novfilesff': 'No viewable files found for revision %s. '.
            \              'Consider using “open” value of ignfiles option',
        \}
let s:ignkeys=['crrestrict', 'filepats', 'revs', 'cmd', 'repo']
"▶1 findCurSpecial :: bvar, hex, blockstart + cursor → special
"▶2 s:spSort :: special, special → -1|0|1
let s:sufweights={'-': 3, 'r': 2, 'l': 1, 'R': 0,}
function s:spSort(s1, s2)
    let s1=a:s1[0]
    let s2=a:s2[0]
    let suf1=s:sufweights[((s1[-2:-2] is# '_')?(s1[-1:]):('-'))]
    let suf2=s:sufweights[((s2[-2:-2] is# '_')?(s2[-1:]):('-'))]
    return ((suf1==suf2)?(0):((suf1>suf2)?(-1):(1)))
endfunction
let s:_functions+=['s:spSort']
"▲2
function s:F.findCurSpecial(bvar, hex, blockstartline)
    let special=a:bvar.specials[a:hex]
    let line=line('.')-1-a:blockstartline
    let col=col('.')-1
    if col<len(matchstr(getline('.'), '\v^[@o|+\-/\\ ]+'))
        return 'linestart'
    endif
    for [spname, splist] in sort(items(special), function('s:spSort'))
        let suffix=((spname[-2:-2] is# '_')?(spname[-1:]):('-'))
        let r=matchstr(spname, '\v^\l+\d*')
        if suffix is# '-'
            if [line, col]==splist[:1]
                return r
            endif
        elseif suffix is# 'r'
            if line>=splist[0][0] && line<=splist[1][0] &&
                        \col>=splist[0][1] && col<=splist[1][1]
                return r
            endif
        elseif suffix is# 'R'
            if line>=splist[0][0] && line<=splist[1][0]
                return r
            endif
        elseif suffix is# 'l'
            if line==splist[0]
                return r
            endif
        endif
    endfor
    return 0
endfunction
"▶1 cwin
function s:F.cwin(bvar)
    if a:bvar.cw
        if winnr('$')!=1
            close
        endif
    else
        new
    endif
endfunction
"▶1 cr
function s:F.cr(...)
    "▶2 Get changeset, current special, encode options
    let bvar=s:_r.bufvars[bufnr('%')]
    let [blockstart, blockend, hex]=bvar.getblock(bvar)
    if a:0
        let spname=a:1
    else
        let spname=s:F.findCurSpecial(bvar, hex, blockstart[0])
    endif
    let cs=bvar.repo.changesets[hex]
    let crrcond=((has_key(bvar.opts, 'crrestrict'))?
                \   (string(bvar.opts.crrestrict).' isnot# v:key &&'):
                \   (''))
    let opts=filter(copy(bvar.opts), crrcond.'index(s:ignkeys, v:key)==-1')
    "▶2 Commit actions based on current special
    "▶3 branch: add `branch' filter
    if spname is# 'branch'
        let cargs=[s:_r.run, ['silent edit', 'log',
                    \         bvar.repo, extend(copy(opts),
                    \                           {    'branch': cs.branch,
                    \                            'crrestrict': 'branch' })]]
    "▶3 user: add `user' filter
    elseif spname is# 'user'
        let cargs=[s:_r.run, ['silent edit', 'log',
                    \         bvar.repo,
                    \         extend(copy(opts),
                    \                {      'user': '\V'.escape(cs.user, '\'),
                    \                 'crrestrict': 'user' })]]
    "▶3 time: add `date' filter (only show commits done in the current month)
    elseif spname is# 'time'
        let cargs=[s:_r.run, ['silent edit', 'log',
                    \         bvar.repo,
                    \         extend(copy(opts),
                    \                {      'date': strftime('%Y-%m', cs.time),
                    \                 'crrestrict': 'date' })]]
    "▶3 changeset: show only ancestors of the current changeset
    elseif spname is# 'hex' || spname is# 'rev'
        let cargs=[s:_r.run, ['silent edit', 'log',
                    \         bvar.repo,
                    \         extend(copy(opts),
                    \                {  'revision': hex,
                    \                 'crrestrict': 'revision' })]]
    "▶3 file: view file
    elseif spname=~#'\v^file\d+$'
        " XXX If fileN special exists, then files property was definitely added, 
        " so no need to use getcsprop()
        let file=cs.files[str2nr(spname[4:])]
        let cargs=[s:_r.mrun, ['silent edit', 'file', bvar.repo, hex, file]]
    "▶3 view diff between changeset and current state or its parent
    else
        let args=['silent edit', 'diff', bvar.repo]
        if spname is# 'curdiff'
            let args+=['', hex]
        else
            let args+=[hex, '']
        endif
        if has_key(bvar.opts, 'files') && !has_key(bvar.opts.ignorefiles,'diff')
            let args+=[bvar.opts.csfiles[hex]]
        else
            let args+=[[]]
        endif
        let args+=[{}]
        let cargs=[s:_r.mrun, args]
    endif
    "▲3
    call s:F.cwin(bvar)
    return call('call', cargs+[{}])
endfunction
"▶1 fvdiff
function s:F.fvdiff(...)
    let bvar=s:_r.bufvars[bufnr('%')]
    let hex=bvar.getblock(bvar)[2]
    let cmd=':AuVimDiff full noonlymodified '
    if has_key(bvar.opts, 'files') && !has_key(bvar.opts.ignorefiles, 'diff')
        let cmd.=join(map(copy(bvar.opts.files),
                    \     '"files ".escape(v:val, " ")')).' '
    endif
    if !a:0
        return cmd.'curfile '.hex."\n"
    else
        let cs=bvar.repo.changesets[hex]
        if empty(cs.parents)
            call s:_f.throw('nopars', hex)
        endif
        return cmd.hex.' '.cs.parents[0]."\n"
    endif
endfunction
"▶1 getfile
function s:F.getfile(bvar, files, hex, more, cbargs, pvargs)
    if empty(a:files)
        return 0
    endif
    if has_key(a:bvar.opts, 'files') &&
                \!has_key(a:bvar.opts.ignorefiles, 'open')
        if a:more
            let files=[]
            let rej=copy(a:files)
            for pattern in a:bvar.opts.filepats
                call filter(rej, 'v:val!~#pattern || [0, add(files, v:val)][0]')
            endfor
        else
            let files=copy(a:bvar.opts.csfiles[a:hex])
            call filter(files, 'index(a:files, v:val)!=-1')
        endif
        if empty(files)
            call s:_f.throw('novfilesff', a:hex)
        endif
    else
        let files=a:files
        if empty(files)
            call s:_f.throw('novfiles', a:hex)
        endif
    endif
    let file=0
    if len(files)==1
        return call(a:cbargs[0], [files[0]]+a:cbargs[1:], {})
    else
        return s:_r.maputils.promptuser(files, a:cbargs, a:pvargs)
    endif
endfunction
"▶1 gethexfile
function s:F.gethexfile(more, cbargs)
    let bvar=s:_r.bufvars[bufnr('%')]
    let [blockstart, blockend, hex]=bvar.getblock(bvar)
    let spname=s:F.findCurSpecial(bvar, hex, blockstart[0])
    let cs=bvar.repo.changesets[hex]
    let file=0
    let cbargs=copy(a:cbargs)
    let cbargs[0]=s:F.callbacks[cbargs[0]]
    let pvargs=[s:_r.maputils.readfilewrapper, bvar.repo, hex]
    call extend(cbargs, [bvar, hex], 1)
    if spname=~#'\v^file\d+$'
        " XXX If fileN special exists, then files property was definitely added, 
        " so no need to use getcsprop()
        return call(cbargs[0], [cs.files[str2nr(spname[4:])]]+cbargs[1:], {})
    else
        let file=s:F.getfile(bvar,
                    \        bvar.repo.functions.getcsprop(bvar.repo, cs,
                    \                                      ((a:more)?
                    \                                           ('allfiles'):
                    \                                           ('files'))),
                    \        hex, a:more, cbargs, pvargs)
    endif
endfunction
"▶1 Callbacks
let s:F.callbacks={}
"▶2 open
function s:F.callbacks.open(file, bvar, hex)
    call s:F.cwin(a:bvar)
    call s:_r.mrun('silent edit', 'file', a:bvar.repo, a:hex, a:file)
endfunction
"▶2 annotate
function s:F.callbacks.annotate(file, bvar, hex)
    call s:F.callbacks.open(a:file, a:bvar, a:hex)
    AuAnnotate
endfunction
"▶2 diff
function s:F.callbacks.diff(file, bvar, hex, ...)
    call s:F.cwin(a:bvar)
    if a:0 && a:1
        call s:_r.mrun('silent edit', 'diff', a:bvar.repo,a:hex,'',[a:file],{})
    else
        call s:_r.mrun('silent edit', 'diff', a:bvar.repo,'',a:hex,[a:file],{})
    endif
endfunction
"▶2 filehistory
function s:F.callbacks.filehistory(file, bvar, hex)
    let crrcond=((has_key(a:bvar.opts, 'crrestrict'))?
                \   (string(a:bvar.opts.crrestrict).' isnot# v:key &&'):
                \   (''))
    let opts=filter(copy(a:bvar.opts), crrcond.'index(s:ignkeys, v:key)==-1')
    call extend(opts, {'files': [s:_r.cmdutils.globescape(a:file)],
                \ 'crrestrict': 'files'})
    call s:_r.run('silent edit', 'log', a:bvar.repo, opts)
endfunction
"▶2 vimdiff
function s:F.callbacks.vimdiff(file, bvar, hex, ...)
    let cs=a:bvar.repo.changesets[a:hex]
    call s:F.cwin(a:bvar)
    if a:0 && a:1
        execute 'silent edit'
                    \ fnameescape(s:_r.os.path.join(a:bvar.repo.path, a:file))
        call s:_r.vimdiff.split([['file', a:bvar.repo, a:hex, a:file]], 0)
    elseif !empty(cs.parents)
        call s:_r.run('silent edit', 'file', a:bvar.repo, a:hex, a:file)
        call s:_r.vimdiff.split([['file', a:bvar.repo, cs.parents[0], a:file]],
                    \           0)
    else
        call s:_f.throw('nopars', a:hex)
    endif
endfunction
"▶1 findfirstvisible :: n → hex
function s:F.findfirstvisible(n)
    let bvar=s:_r.bufvars[bufnr('%')]
    let repo=bvar.repo
    let hex=bvar.getblock(bvar)[2]
    let oldhex=hex
    let n=abs(a:n)
    let direction=((a:n>0)?('parents'):('children'))
    let tocheck=[]
    let checked={}
    let lastfoundhex=hex
    while n>0
        let tocheck+=repo.functions.getcsprop(repo, hex, direction)
        let prevn=n
        while !empty(tocheck)
            let hex=remove(tocheck, 0)
            let checked[hex]=1
            if has_key(bvar.csstarts, hex)
                let tocheck=[]
                let lastfoundhex=hex
                let n-=1
            else
                let tocheck+=filter(copy(
                            \repo.functions.getcsprop(repo, hex, direction)),
                            \'!has_key(checked, v:val)')
            endif
        endwhile
        if n==prevn
            break
        endif
    endwhile
    if lastfoundhex is# oldhex
        call s:_f.throw('no'.((a:n>0)?('prev'):('next')), hex)
    endif
    return "\<C-\>\<C-n>".(bvar.csstarts[lastfoundhex]+1).'gg'
endfunction
"▶1 next
function s:F.next()
    return s:F.findfirstvisible(-v:count1)
endfunction
"▶1 prev
function s:F.prev()
    return s:F.findfirstvisible(v:count1)
endfunction
"▶1 update
function s:F.update()
    let bvar=s:_r.bufvars[bufnr('%')]
    let hex=bvar.getblock(bvar)[2]
    call s:_r.maputils.update(bvar.repo, hex, v:count)
    return "\<C-\>\<C-n>:silent edit\n"
endfunction
"▶1 AuLog mapping group
function s:m(f, ...)
    return ':<C-u>call <SNR>'.s:_sid.'_Eval(''s:F.'.a:f.
                \                   '('.string(string(a:000))[2:-3].')'')<CR>'
endfunction
function s:c(f, m, ...)
    return ':<C-u>call call(<SNR>'.s:_sid.'_Eval("s:F.gethexfile"), '.
                \'['.a:m.', ["'.a:f.'", '.string(a:000)[1:-2].']], {})<CR>'
endfunction
call s:_f.mapgroup.add('AuLog', {
            \      'Enter': {'lhs': "\n", 'rhs': s:m('cr'),             },
            \       'File': {'lhs': 'gF', 'rhs': s:c('filehistory', 0)  },
            \       'User': {'lhs': 'gu', 'rhs': s:m('cr', 'user')      },
            \       'Date': {'lhs': 'gM', 'rhs': s:m('cr', 'time')      },
            \     'Branch': {'lhs': 'gb', 'rhs': s:m('cr', 'branch')    },
            \        'Rev': {'lhs': 'gr', 'rhs': s:m('cr', 'rev')       },
            \     'FVdiff': {'lhs': 'gD', 'rhs': s:F.fvdiff             },
            \    'RFVdiff': {'lhs': 'gC', 'rhs': [1], 'func': s:F.fvdiff},
            \      'Fdiff': {'lhs': 'gd', 'rhs': s:m('cr', 'curdiff')   },
            \     'RFdiff': {'lhs': 'gc', 'rhs': s:m('cr', 'revdiff')   },
            \       'Diff': {'lhs':  'd', 'rhs': s:c('diff', 0, 1)      },
            \      'Rdiff': {'lhs':  'c', 'rhs': s:c('diff', 0)         },
            \      'Vdiff': {'lhs':  'D', 'rhs': s:c('vimdiff', 0, 1)   },
            \     'RVdiff': {'lhs':  'C', 'rhs': s:c('vimdiff', 0)      },
            \       'Next': {'lhs':  'K', 'rhs': s:F.next               },
            \       'Prev': {'lhs':  'J', 'rhs': s:F.prev               },
            \       'Open': {'lhs':  'o', 'rhs': s:c('open', 0)         },
            \    'OpenAny': {'lhs':  'O', 'rhs': s:c('open', 1)         },
            \   'Annotate': {'lhs':  'a', 'rhs': s:c('annotate', 0)     },
            \'AnnotateAny': {'lhs':  'A', 'rhs': s:c('annotate', 1)     },
            \     'Update': {'lhs':  'U', 'rhs': s:F.update             },
            \       'Exit': {'lhs':  'X', 'rhs': ':<C-u>bwipeout<CR>'   },
            \}, {'func': s:F.cr, 'silent': 1, 'mode': 'n'})
delfunction s:m
delfunction s:c
"▶1
call frawor#Lockvar(s:, '_r')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
