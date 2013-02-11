"▶1 
scriptencoding utf-8
setlocal textwidth=0
setlocal nolist nowrap
if has('conceal')
    setlocal concealcursor+=n conceallevel=2
endif
setlocal nonumber
if exists('+relativenumber')
    setlocal norelativenumber
endif
setlocal noswapfile
setlocal nomodeline
execute frawor#Setup('0.0', {'@%aurum/bufvars': '0.0',
            \                '@%aurum/vimdiff': '1.1',
            \               '@%aurum/annotate': '1.0',
            \               '@%aurum/cmdutils': '4.0',
            \               '@%aurum/maputils': '0.1',
            \                   '@%aurum/edit': '1.2',
            \                     '@/mappings': '0.0',
            \                           '@/os': '0.0',})
let s:_messages={
            \  'nofile': 'File %s was added in revision %s',
            \ 'norfile': 'File %s is not present in the working directory '.
            \            'or is not readable',
            \  'noprev': 'Can’t find any revision before %s',
            \  'nonext': 'Can’t find any revision after %s',
            \  'nopars': 'Revision %s has no parents',
        \}
"▶1 getfile :: repo, cs → path
function s:F.getfile(repo, cs)
    let file=0
    let files=a:repo.functions.getcsprop(a:repo, a:cs, 'files')
    if !empty(files)
        if len(files)==1
            let file=files[0]
        else
            let choice=inputlist(['Select file (0 to cancel):']+
                        \               map(copy(files),
                        \                   '(v:key+1).". ".v:val'))
            if choice
                let file=files[choice-1]
            endif
        endif
    endif
    return file
endfunction
"▶1 runmap
" TODO investigate why Prev mapping is causing next character consumption under
"      wine
function s:F.runmap(action, ...)
    "▶2 Initialize variables
    let bvar=s:_r.bufvars[bufnr('%')]
    let hex=bvar.revisions[line('.')-1]
    let file=bvar.files[line('.')-1]
    let hasannbuf=has_key(bvar, 'annbuf')
    if hasannbuf
        let annwin=bufwinnr(bvar.annbuf)
        let hasannbuf=(annwin!=-1)
    endif
    "▶2 Various *diff actions
    if a:action[-4:] is# 'diff'
        if a:action[:2] is# 'rev'
            let cs1=bvar.repo.functions.getcs(bvar.repo, hex)
            if empty(cs1.parents)
                call s:_f.throw('nopars', cs1.hex)
            endif
            let rev1=cs1.parents[0]
        elseif bvar.rev isnot# bvar.repo.functions.getworkhex(bvar.repo)
            let rev1=bvar.rev
        else
            let rev1=''
        endif
        let rev2=hex
        if hasannbuf
            close
            execute annwin.'wincmd w'
        endif
        if a:action[-7:-5] is# 'vim'
            if a:0 && a:1
                return s:_r.vimdiff.full(bvar.repo,
                            \            [(empty(rev1)?(0):(rev1)), rev2],
                            \            0, [], 0)
            else
                if empty(rev1)
                    let file1=s:_r.os.path.join(bvar.repo.path, bvar.file)
                    let existed=bufexists(file1)
                    if !filereadable(file1)
                        call s:_f.throw('norfile', file1)
                    endif
                    execute 'silent edit' fnameescape(file1)
                else
                    let existed=s:_r.mrun('silent edit',
                                \         'file', bvar.repo, rev1, file)
                endif
                if existed
                    setlocal bufhidden=wipe
                    unlet existed
                endif
                call s:_r.vimdiff.split([['file', bvar.repo, rev2, file]], -1)
            endif
        else
            if empty(rev1)
                let rev1=rev2
                let rev2=''
            endif
            if a:action[:2] is# 'rev'
                let dfile=bvar.file
            else
                let dfile=file
            endif
            let existed=s:_r.mrun('silent edit', 'diff', bvar.repo, rev1, rev2,
                        \         ((a:0 && a:1)?([]):([dfile])), {})
        endif
    "▶2 `open' action
    elseif a:action is# 'open'
        if a:0 && a:1
            let file=bvar.files[line('.')-1]
            let lnr=bvar.linenumbers[line('.')-1]
            if lnr is 0
                unlet lnr
            endif
        else
            let file=s:F.getfile(bvar.repo,
                        \        bvar.repo.functions.getcs(bvar.repo, hex))
            if file is 0
                return
            endif
        endif
        if hasannbuf
            let lnr=bvar.linenumbers[line('.')-1]
            if lnr is 0
                let ablnr=line('.')
                execute annwin.'wincmd w'
                let line=getline(ablnr)
                unlet lnr
                wincmd p
            endif
            call s:_r.run('silent edit', 'annotate', bvar.repo, hex, file)
            if exists('lnr')
                execute lnr
            endif
            let newbvar=s:_r.bufvars[bufnr('%')]
            execute annwin.'wincmd w'
        endif
        let existed=s:_r.mrun('silent edit', 'file', bvar.repo, hex, file)
        let annbuf=bufnr('%')
        if exists('lnr')
            execute lnr
        elseif exists('line')
            0
            call search('\V\^'.escape(line, '\').'\$', 'cW')
            let lnr=line('.')
            wincmd p
            execute lnr
            wincmd p
        endif
        if hasannbuf
            if exists('lnr')
                call s:_r.annotate.foldopen()
            endif
            wincmd p
            call s:_r.annotate.setannbuf(newbvar, annbuf)
        endif
    "▶2 `update' action
    elseif a:action is# 'update'
        call s:_r.maputils.update(bvar.repo, hex, v:count)
    "▶2 `previous' and `next' actions
    elseif a:action is# 'previous' || a:action is# 'next'
        let c=((a:action is# 'previous')?(v:count1):(-v:count1))
        let [rev, file]=s:_r.maputils.getnthparentfile(bvar.repo, bvar.rev,
                    \                                  bvar.file, c)
        if rev is# bvar.rev
            call s:_f.throw('no'.a:action[:3], bvar.rev)
        endif
        call s:_r.run('silent edit', 'annotate', bvar.repo, rev, file)
        let newbvar=s:_r.bufvars[bufnr('%')]
        if hasannbuf
            execute annwin.'wincmd w'
        else
            vsplit
            wincmd p
            vertical resize 42
            wincmd p
        endif
        let existed=s:_r.mrun('silent edit', 'file', bvar.repo, rev, file)
        let annbuf=bufnr('%')
        wincmd p
        call s:_r.annotate.setannbuf(newbvar, annbuf)
    endif
    "▲2
    if exists('existed') && !existed
        setlocal bufhidden=wipe
    endif
endfunction
"▶1 AuAnnotate mapping group
"▶2 getrhs
function s:F.getrhs(...)
    return ':<C-u>call call(<SID>Eval("s:F.runmap"), '.string(a:000).', {})<CR>'
endfunction
"▲2
" TODO Investigate why there is no previous window when using non-python version 
"      of driver
call s:_f.mapgroup.add('AuAnnotate', {
            \    'Enter': {'lhs': '<CR>', 'rhs': s:F.getrhs(   'vimdiff'   )},
            \   'FVdiff': {'lhs': 'gD',   'rhs': s:F.getrhs(   'vimdiff', 1)},
            \  'RFVdiff': {'lhs': 'gC',   'rhs': s:F.getrhs('revvimdiff', 1)},
            \    'Fdiff': {'lhs': 'gd',   'rhs': s:F.getrhs(      'diff', 1)},
            \   'RFdiff': {'lhs': 'gc',   'rhs': s:F.getrhs('rev'.'diff', 1)},
            \     'Diff': {'lhs':  'd',   'rhs': s:F.getrhs(      'diff'   )},
            \    'Rdiff': {'lhs':  'c',   'rhs': s:F.getrhs('rev'.'diff'   )},
            \    'Vdiff': {'lhs':  'D',   'rhs': s:F.getrhs(   'vimdiff'   )},
            \   'RVdiff': {'lhs':  'C',   'rhs': s:F.getrhs('revvimdiff'   )},
            \ 'Annotate': {'lhs':  'a',   'rhs': s:F.getrhs('open'      , 1)},
            \     'Open': {'lhs':  'o',   'rhs': s:F.getrhs('open'         )},
            \   'Update': {'lhs':  'U',   'rhs': s:F.getrhs(    'update'   )},
            \     'Next': {'lhs':  'K',   'rhs': s:F.getrhs('next'         )},
            \     'Prev': {'lhs':  'J',   'rhs': s:F.getrhs('previous'     )},
            \     'Exit': {'lhs':  'X',   'rhs': ':<C-u>bwipeout!<CR>'      },
            \}, {'silent': 1, 'mode': 'n'})
"▶1
call frawor#Lockvar(s:, '_r')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
