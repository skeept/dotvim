"▶1
scriptencoding utf-8
execute frawor#Setup('0.1', {'@/resources': '0.0',
            \                       '@/os': '0.0',})
let s:_messages={
            \'plinst': 'If you install Command-T, Ctrlp, FuzzyFinder, unite, '.
            \          'ku or tlib you will be prompted with '.
            \          'much less sucking interface',
        \}
let s:r={}
"▶1 update
function s:r.update(repo, rev, count)
    let rev=a:rev
    if a:count>1
        let rev=a:repo.functions.getnthparent(a:repo, rev, a:count-1).hex
    endif
    return a:repo.functions.update(a:repo, rev, 0)
endfunction
"▶1 listplugs
let s:F.listplugs={}
let s:plug=0
"▶2 commandt
let s:F.listplugs.commandt={}
function s:F.listplugs.commandt.init()
    try
        execute 'rubyfile' fnameescape(s:_r.os.path.join(s:_frawor.runtimepath,
                    \'ruby', 'aurum-command-t-rubyinit.rb'))
        return 1
    catch
        return 0
    endtry
endfunction
function s:F.listplugs.commandt.call(files, cbargs, pvargs)
    let [b:aurum_cbfun; b:aurum_cbargs]=a:cbargs
    ruby $aurum_old_command_t = $command_t
    ruby $command_t = $aurum_command_t
    ruby $command_t.show_aurum_finder
    autocmd BufUnload <buffer> ruby $command_t = $aurum_old_command_t
endfunction
"▶2 ctrlp
function s:CtrlpAccept(mode, str)
    let d={}
    let d.cbfun=b:aurum_cbfun
    let cbargs=b:aurum_cbargs
    call ctrlp#exit()
    return call(d.cbfun, [a:str]+cbargs, {})
endfunction
let s:_functions+=['s:CtrlpAccept']
let s:ctrlp_ext_var={
            \'init': '<SNR>'.s:_sid.'_Eval("s:ctrlp_files")',
            \'accept': '<SNR>'.s:_sid.'_CtrlpAccept',
            \'lname': 'changeset files',
            \'sname': 'changeset file',
            \'type': 'path',
        \}
let s:ctrlp_id=0
let s:ctrlp_files=[]
let s:F.listplugs.ctrlp={}
function s:F.listplugs.ctrlp.init()
    try
        runtime plugin/ctrlp.vim
        call add(g:ctrlp_ext_vars, s:ctrlp_ext_var)
        let s:ctrlp_id=g:ctrlp_builtins+len(g:ctrlp_ext_vars)
        lockvar! s:ctlp_id
        return 1
    catch
        return 0
    endtry
endfunction
function s:F.listplugs.ctrlp.call(files, cbargs, pvargs)
    let s:ctrlp_files=a:files
    call ctrlp#init(s:ctrlp_id)
    let [b:aurum_cbfun; b:aurum_cbargs]=a:cbargs
endfunction
"▶2 fuf
let s:F.listplugs.fuf={}
function s:F.listplugs.fuf.init()
    try
        runtime plugin/fuf.vim
        call fuf#addMode('aurum')
        return 1
    catch
        return 0
    endtry
endfunction
function s:F.listplugs.fuf.call(files, cbargs, pvargs)
    call fuf#aurum#setAuVars({'files': a:files, 'cbargs': a:cbargs,
                \                               'pvargs': a:pvargs})
    call fuf#launch('aurum', '', 0)
endfunction
"▶2 tlib
" TODO it is possible that tlib is present, but tlib#input#List is not used for 
"      listing files and hence is “unfamiliar” interface. It should be checked 
"      last. Also add an option for the user to explicitely select one of the 
"      plugins.
let s:F.listplugs.tlib={}
function s:F.listplugs.tlib.init()
    try
        runtime autoload/tlib/input.vim
        return exists('*tlib#input#List')
    catch
        return 0
    endtry
endfunction
function s:F.listplugs.tlib.call(files, cbargs, pvargs)
    let file=tlib#input#List('s', 'Select changeset file', a:files)
    if empty(file)
        return 0
    endif
    return call(a:cbargs[0], [file]+a:cbargs[1:], {})
endfunction
"▶2 ku
let s:F.listplugs.ku={}
function s:KuOpen(candidate)
    return call(b:aurum_cbfun, [a:candidate.word]+b:aurum_cbargs, {})
endfunction
let s:_functions+=['s:KuOpen']
let s:ku_files=[]
function s:F.kulist(_)
    if !exists('b:aurum_files')
        let b:aurum_files=s:ku_files
    endif
    return map(copy(b:aurum_files), '{"word": v:val}')
endfunction
function s:F.listplugs.ku.init()
    try
        if !exists('*ku#define_source')
            runtime autoload/ku.vim
        endif
        if exists('*ku#define_source')
            call ku#define_kind({
                        \                'name': 'csfiles',
                        \'default_action_table': {'open':
                        \                   function('<SNR>'.s:_sid.'_KuOpen')},
                        \   'default_key_table': {},
                        \})
            call ku#define_source({
                        \             'name': 'aurum',
                        \            'kinds': ['csfiles'],
                        \'gather_candidates': s:F.kulist,
                        \})
            return 1
        else
            return 0
        endif
    catch
        return 0
    endtry
endfunction
function s:F.listplugs.ku.call(files, cbargs, pvargs)
    let [b:aurum_cbfun; b:aurum_cbargs]=a:cbargs
    let s:ku_files=a:files
    call ku#start(['aurum'])
endfunction
"▶2 unite
let s:F.listplugs.unite={}
function s:F.listplugs.unite.init()
    try
        if !exists('*unite#start')
            " XXX For some reason when doing “runtime autoload/unite.vim” vim 
            "     sources this file for the second time when it finds “function! 
            "     unite#version” statement. In this case s:save_cpo is unlet 
            "     when second sourcing is finished and trying to use it when 
            "     first sourcing is finished results in an error.
            call unite#version()
        endif
        return exists('*unite#start')
    catch
        return 0
    endtry
endfunction
function s:F.listplugs.unite.call(files, cbargs, pvargs)
    call unite#start([['aurum', a:files, a:cbargs]])
endfunction
"▶1 promptuser
function s:r.promptuser(files, cbargs, pvargs)
    if s:plug is 0
        for plug in values(s:F.listplugs)
            if plug.init()
                unlet s:plug
                let s:plug=plug
                break
            endif
        endfor
        if s:plug is 0
            let s:plug=-1
        endif
        lockvar s:plug
    endif
    if s:plug is -1
        try
            let choice=inputlist(['Select file (0 to cancel):']+
                        \        map(copy(a:files), '(v:key+1).". ".v:val'))
            if choice
                return call(a:cbargs[0], [a:files[choice-1]]+a:cbargs[1:], {})
            endif
        finally
            call s:_f.warn('plinst')
        endtry
    else
        return s:plug.call(a:files, a:cbargs, a:pvargs)
    endif
endfunction
"▶1 readfilewrapper :: file, repo, rev → [String]
function s:r.readfilewrapper(file, repo, rev)
    return a:repo.functions.readfile(a:repo, a:rev, a:file)
endfunction
"▶1 getnthparentfile :: repo, rev, file, n → (hex, file)
function s:r.getnthparentfile(repo, rev, file, n)
    let n=a:n
    let shift=(n>0 ? 1 : -1)
    let file=a:file
    let hex=a:repo.functions.getrevhex(a:repo, a:rev)
    while n
        let cs=a:repo.functions.getnthparent(a:repo, hex, shift)
        let rhex=(shift>0 ? hex : cs.hex)
        if cs.hex is# hex
            break
        endif
        let hex=cs.hex
        let renames=a:repo.functions.getcsprop(a:repo, rhex, 'renames')
        if shift<0
            let rrenames={}
            call map(copy(renames), 'extend(rrenames, {v:val : v:key})')
            let renames=rrenames
        endif
        if get(renames, file, 0) isnot 0
            let file=renames[file]
        endif
        let n-=shift
    endwhile
    return [hex, file]
endfunction
"▶1 Post maputils resource
call s:_f.postresource('maputils', s:r)
"▶1
call frawor#Lockvar(s:, 'plug,ctrlp_id,ctrlp_files,ku_files')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
