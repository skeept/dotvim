scriptencoding utf-8
execute frawor#Setup('0.1', {'@%aurum/cmdutils': '4.3',
            \                     '@/functions': '0.1',
            \                           '@/fwc': '0.0',
            \                       '@/options': '0.0',})
let s:_messages={
            \'uknurl': 'Failed to process url %s of repository %s',
            \'uunsup': 'Url type “%s” is not supported for repository %s '.
            \          'linked with %s',
            \'ldirty': 'Cannot attach line number to a dirty file %s '.
            \          'in the repository %s (dirty=having uncommited changes)',
        \}
let s:utypes=['html', 'raw', 'annotate', 'filehist', 'bundle', 'changeset',
            \ 'log', 'clone', 'push']
let s:_options={
            \'hypsites': {'default': [],
            \             'checker': 'list tuple ((type ""), '.
            \                                    'dict {?in utypes     type ""'.
            \                                          '/\v^[ah]line$/ type ""'.
            \                                         '})'
            \            },
        \}
"▶1 urlescape :: String → String
function s:F.urlescape(str)
    let r=''
    let lstr=len(a:str)
    let i=0
    while i<lstr
        let c=a:str[i]
        if c=~#'^[^A-Za-z0-9\-_.!~*''()/]'
            let r.=printf('%%%02X', char2nr(c))
        else
            let r.=c
        endif
        let i+=1
    endwhile
    return r
endfunction
"▶1 function
"TODO diff ?
let s:_aufunctions.cmd={'@FWC': ['-onlystrings _ _'.
            \'{   ?repo  '.s:_r.cmdutils.comp.repo.
            \'    ?rev   '.s:_r.cmdutils.comp.rev.
            \'    ?file  '.s:_r.cmdutils.comp.file.
            \' !+1?line  range 1 inf'.
            \' !+2?lines (range 1 inf)(range 1 inf)'.
            \'    ?cmd   '.s:_r.cmdutils.comp.cmd.
            \'    ?url   in utypes ~start'.
            \'}', 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \                                     [], s:_f.fwc.compile)
function s:_aufunctions.cmd.function(line1, line2, opts)
    let opts=copy(a:opts)
    let utype=get(opts, 'url', 'html')
    "▶2 Get line or line1+line2
    let hasline=1
    if has_key(a:opts, 'lines')
        let line1=a:opts.lines[0]
        let line2=a:opts.lines[1]
    elseif has_key(a:opts, 'line')
        let line=a:opts.line
    elseif !(a:line1==1 && a:line2==line('$'))
        if a:line1!=a:line2
            let line1=min([a:line1, a:line2])
            let line2=max([a:line1, a:line2])
        else
            let line=a:line1
        endif
    else
        let hasline=0
    endif
    "▶2 Get repo, hex and file
    "▶3 File needed: html, annotate, raw, filehist
    if utype is# 'html' || utype is# 'annotate' || utype is# 'raw'
                \       || utype is# 'filehist'
        let [repo, rev, file]=s:_r.cmdutils.getrrf(a:opts, 'nocurf', 'get')[1:]
        call s:_r.cmdutils.checkrepo(repo)
        let file=s:F.urlescape(file)
        if rev is 0
            if hasline && repo.functions.dirty(repo, file)
                let hasline=0
                call s:_f.warn('ldirty', file, repo.path)
            endif
            let hex=repo.functions.getworkhex(repo)
        else
            let hex=repo.functions.getrevhex(repo, rev)
        endif
    "▶3 File not needed: others
    else
        let repo=s:_r.cmdutils.checkedgetrepo(a:opts.repo)
        let [repo, rev] = s:_r.cmdutils.getrrf(a:opts, 'norev', 'getrr')[1:2]
        if utype is# 'bundle' || utype is# 'changeset' || utype is# 'log'
            if rev is 0
                let hex=repo.functions.getworkhex(repo)
            else
                let hex=repo.functions.getrevhex(repo, rev)
            endif
        endif
    endif
    "▲2
    let url=repo.functions.getrepoprop(repo, 'url')
    let [protocol, user, password, domain, port, path]=
                \matchlist(url, '\v^%(([^:]+)\:\/\/)?'.
                \                  '%(([^@/:]+)'.
                \                   '%(\:([^@/:]+))?\@)?'.
                \                   '([^/:]*)'.
                \                  '%(\:(\d+))?'.
                \                   '(.*)$')[1:6]
    for [matcher, dict] in s:_f.getoption('hypsites')+repo.hypsites
        if eval(matcher)
            if !has_key(dict, utype)
                call s:_f.throw('uunsup', utype, repo.path, url)
            endif
            let r=eval(dict[utype])
            if hasline && (utype is# 'html' || utype is# 'annotate')
                if exists('line')
                    let lkey=utype[0].'line'
                else
                    let lkey=utype[0].'lines'
                endif
                if has_key(dict, lkey)
                    let r.='#'.eval(dict[lkey])
                else
                    call s:_f.warn('uunsup', lkey, repo.path, url)
                endif
            endif
            let cmd=get(opts, 'cmd', 'let @+=%s')
            execute printf(cmd, string(r))
            return
        endif
    endfor
    call s:_f.throw('uknurl', url, repo.path)
endfunction
"▶1
call frawor#Lockvar(s:, '')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
