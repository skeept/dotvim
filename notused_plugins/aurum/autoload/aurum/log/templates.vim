"▶1
scriptencoding utf-8
execute frawor#Setup('0.0', {'@/resources': '0.0',
            \                    '@/table': '0.0',})
let s:_messages={
            \'2multl': 'Two multiline statements on one line',
            \'argmis': 'Missing argument #%u for keyword %s',
        \}
"▶1 s:templates
let s:templates={
            \'default': "Changeset $rev#suf:\:#$hex$branch#hide,pref: (branch ,suf:)#\n".
            \           "Commited $time by $user\n".
            \           "Tags: $tags\n".
            \           "Bookmarks: $bookmarks\n".
            \           "Files: $changes\n".
            \           "Renamed $renames\n".
            \           "Copied $copies\n".
            \           "$hide#@# $description\n".
            \           "$hide#$#$stat\n".
            \           "$hide#:#$patch\n".
            \           "$empty",
            \'hgdef':   "changeset:   $rev#suf:\:#$hex\n".
            \           "branch:      $branch\n".
            \           "tag:         $tags_\n".
            \           "bookmark:    $bookmarks_\n".
            \           "user:        $user\n".
            \           "date:        $time#%a %b %d %H:%M:%S %Y#\n".
            \           "files:       $changes# #\n".
            \           "summary:     $summary\n".
            \           "$hide#$#$stat\n".
            \           "$hide#:#$patch\n".
            \           "$empty",
            \'hgdescr': "changeset:   $rev#suf:\:#$hex\n".
            \           "branch:      $branch\n".
            \           "tag:         $tags_\n".
            \           "bookmark:    $bookmarks_\n".
            \           "user:        $user\n".
            \           "date:        $time#%a %b %d %H:%M:%S %Y#\n".
            \           "files:       $changes# #\n".
            \           "description:\n".
            \           "$description\n".
            \           "$hide#$#$stat\n".
            \           "$hide#:#$patch\n".
            \           "$empty",
            \'compact': "$rev$tags#pref:[,suf:]#   $hex $time#%Y-%m-%d %H:%M# $user\n".
            \           "  $summary\n".
            \           "$hide#$# $stat\n".
            \           "$hide#:#$patch\n".
            \           "$empty",
            \'cdescr':  "$rev$tags#pref:[,suf:]#   $hex $time#%Y-%m-%d %H:%M# $user\n".
            \           "  $description\n".
            \           "$hide#$# $stat\n".
            \           "$hide#:#$patch\n".
            \           "$empty",
            \'git':     "commit $hex\n".
            \           "Author: $user\n".
            \           "Date:   $time#%a %b %d %T %Y#\n".
            \           "$empty\n".
            \           "    $description\n".
            \           "$empty\n".
            \           "$hide#$# $stat\n".
            \           "$hide#:#$patch",
            \'gitoneline': "$hex $summary\n".
            \              "$hide#$# $stat\n".
            \              "$hide#:#$patch",
            \'svn':     'r$rev | $user | $time#%Y-%m-%d %H:%M:%S (%a\, %d %b %Y)# | '.
            \               '$description#synreg:1 line\\|[1-9]\\d* lines,'.
            \                            'expr:[substitute((len(split(@@@\, "\\n"\, 1))+1)." lines"\, '.
            \                                             '"^1 .*"\, "1 line"\, "")]#'."\n".
            \           "$empty\n".
            \           "$description\n".
            \           "$empty\n".
            \           "$hide#$# $stat\n".
            \           "$hide#:#$patch\n",
            \'bzr':     "revno: $rev\n".
            \           "tags: $tags\n".
            \           "revision-id: $hex\n".
            \           "parent: $parents_\n".
            \           "author: $user\n".
            \           "branch nick: $branch\n".
            \           "timestamp: $time#%a %Y-%m-%d %H:%M:%S#\n".
            \           "message:\n".
            \           "$hide#@# $description\n".
            \           "$hide#$#$stat\n".
            \           "$hide#:#$patch\n".
            \           "$empty",
            \'bzrshort': '$rev $user#expr:matchstr(@@@\,''\v^%(%(\ \<)@!.)*'')# '.
            \               "$time#%Y-%m-%d#$tags#pref: {,suf:}#".
            \               "$parents#expr:len(@@@)>1?' [merge]'\\:'',".
            \                        "synreg:\\V\\( [merge]\\)\\?#\n".
            \            "$hide#@# $description\n".
            \            "$hide#$#$stat\n".
            \            "$hide#:#$patch\n".
            \            "$empty",
            \'bzrline': '$rev: $user#expr:matchstr(@@@\,''\v^%(%(\ \<)@!.)*'')# '.
            \               "$time#%Y-%m-%d#$tags#pref: {,suf:}#".
            \               "$parents#expr:len(@@@)>1?' [merge]'\\:'',".
            \                        "synreg:\\V\\( [merge]\\)\\?#".
            \               " $summary\n".
            \            "$hide#$#$stat\n".
            \            "$hide#:#$patch",
        \}
"▶1 s:kwexpr
" TODO Add bisection status and phases
let s:kwexpr={}
let s:kwexpr.hide        = [0, '@0@', 0]
let s:kwexpr.empty       = [0, '@@@']
let s:kwexpr.hex         = [0, '@@@']
let s:kwexpr.branch      = [0, '@@@', 'keep']
let s:kwexpr.phase       = [0, '@@@', 'skip']
let s:kwexpr.user        = [0, '@@@']
let s:kwexpr.rev         = [0, '@@@', 'ignore']
let s:kwexpr.time        = [0, 'strftime(@0@, @@@)', '%d %b %Y %H:%M']
let s:kwexpr.parents     = [0, 'join(@@@)']
let s:kwexpr.children    = [0, 'join(@@@)']
let s:kwexpr.tags        = [0, 'join(@@@, @0@)', ', ']
let s:kwexpr.bookmarks   = [0, 'join(@@@, @0@)', ', ']
let s:kwexpr.summary     = [0, '@@@']
" TODO Add tab expansion
let s:kwexpr.description = [1, 'split(@@@, "\n")']
let s:kwexpr.patch       = [1, '@@@']
let s:kwexpr.parents_    = [1, '@@@']
let s:kwexpr.children_   = [1, '@@@']
let s:kwexpr.tags_       = [1, '@@@']
let s:kwexpr.bookmarks_  = [1, '@@@']
let s:kwexpr.stat        = [2, 's:F.stat(@@@, @.@.files, @<@)']
let s:kwexpr.files       = [2, 's:F.multlfmt(@@@, @.@.files, '.
            \                                    '@<@, @0@, '.
            \                                    '"file", @-@)', ', ']
let s:kwexpr.changes     = [2, 's:F.multlfmt(@@@, @.@.changes, '.
            \                                    '@<@, @0@, '.
            \                                    '"file", @-@)', ', ']
let s:kwexpr.renames     = [2, 's:F.renames(@@@, @.@.files, '.
            \                                   '@<@, @0@)', ' to ']
let s:kwexpr.copies      = [2, 's:F.renames(@@@, @.@.files, '.
            \                                   '@<@, @0@)', ' to ']
let s:kwmarg={}
let s:kwmarg.summary='matchstr(@.@.description, "\\\\v^[^\\n]*")'
let s:kwmarg.stat='@:@.functions.getstats(@:@, diff, @o@)'
let s:kwmarg.patch='diff'
let s:kwmarg.empty=''''''
let s:kwpempt=['parents', 'children', 'tags', 'bookmarks']
let s:kwpemptml=['parents_', 'children_', 'tags_', 'bookmarks_',
            \    'files', 'changes']
let s:kwreg={
            \'phase': '\v(public|draft|secret)',
        \}
let s:kwreqseqkw=['hex', 'branch', 'user', 'rev', 'time', 'parents', 'children',
            \     'tags', 'bookmarks', 'description', 'files', 'changes',
            \     'phase', 'parents_', 'children_', 'tags_', 'bookmarks_']
let s:kwreqs = {'stat': {'files': 1},
            \'renames': {'files': 1, 'renames': 1},
            \ 'copies': {'files': 1, 'copies': 1},
            \}
call map(s:kwreqseqkw, 'extend(s:kwreqs, {v:val : '.
            \'{substitute(v:val, "_$", "", "") : 1}})')
unlet s:kwreqseqkw
"▶1 beatycode       :: function::[String] → function::[String]
let s:indents={
            \         'if': [ 0, 1],
            \     'elseif': [-1, 1],
            \       'else': [-1, 1],
            \      'endif': [-1, 0],
            \        'try': [ 0, 1],
            \      'catch': [-1, 1],
            \    'finally': [-1, 1],
            \     'endtry': [-1, 0],
            \   'function': [ 0, 1],
            \'endfunction': [-1, 0],
            \        'for': [ 0, 1],
            \     'endfor': [-1, 0],
            \      'while': [ 0, 1],
            \   'endwhile': [-1, 0],
        \}
function s:F.beatycode(func)
    let r=[]
    let indent=0
    for line in a:func
        let line=substitute(line, '^\s\+', '', '')
        let firstword=matchstr(line, '^\w\+')
        if has_key(s:indents, firstword)
            let indent+=s:indents[firstword][0]
            call add(r, repeat('    ', indent).line)
            let indent+=s:indents[firstword][1]
        else
            call add(r, repeat('    ', indent).line)
        endif
    endfor
    return r
endfunction
"▶1 stat :: stats, idxlist, linebeg → ([String], sp)
function s:F.stat(stats, idxlist, linebeg)
    let sitems=map(sort(keys(a:stats.files)),
                \  '[v:val, '.
                \  'a:stats.files[v:val].insertions, '.
                \  'a:stats.files[v:val].deletions, '.
                \  's:_r.strdisplaywidth(v:val), '.
                \  'index(a:idxlist, v:val)]')
    let maxflen=max(map(copy(sitems), 'v:val[3]'))
    let maxilen=len(a:stats.insertions)
    let maxdlen=len(a:stats.deletions)
    let rt=[]
    let special={}
    for [file, ins, del, flen, fi] in sitems
        if fi!=-1
            let special['file00'.fi.'_l']=[len(rt), 0]
        endif
        let rt+=['  '.file.repeat(' ', maxflen-flen+1).'|'.
                    \ repeat(' ', maxilen-len(ins)+1).ins.
                    \ repeat(' ', maxdlen-len(del)+1).del]
    endfor
    let special.stat_R=[[0, 0], [len(rt), 0]]
    let rt+=[printf('%u files changed, %u insertions, %u deletions',
                \   len(keys(a:stats.files)),
                \   a:stats.insertions, a:stats.deletions)]
    call map(rt, 'a:linebeg.v:val')
    return [rt, special]
endfunction
"▶1 renames :: renames, idxlist, linebeg, rensep → ([String], sp)
function s:F.renames(renames, idxlist, linebeg, rensep)
    let rt=[]
    let special={}
    let rsl=len(a:rensep)
    for [cur, old] in sort(items(filter(copy(a:renames),
                \                       'type(v:val)=='.type(''))))
        let cl=len(rt)
        let fl=len(cur)
        let ol=len(old)
        let rt+=[a:linebeg.old.a:rensep.cur]
        let ll=len(rt[-1])
        let fi=index(a:idxlist, cur)
        let special['file0'.fi.'_r']=[[cl, ll-fl], [cl, ll-1]]
        let special['oldname'.fi.'_r']=[[cl, ll-fl-rsl-ol], [cl, ll-fl-rsl]]
        let special['rename'.fi.'_l']=[cl, 0]
    endfor
    return [rt, special]
endfunction
"▶1 multlfmt :: list, idxlst, lbeg, isep, iname, width → ([String], sp)
function s:F.multlfmt(list, idxlist, linebeg, itemsep, itemname, width)
    let rt=[a:linebeg]
    let special={}
    let winwidth=winwidth(0)
    let initwidth=a:width+s:_r.strdisplaywidth(a:linebeg, a:width)
    let linewidth=initwidth
    let curfilenum=0
    let ii=-1
    let seplen=len(a:itemsep)
    for item in a:list
        let iwidth=s:_r.strdisplaywidth(item, linewidth)
        if curfilenum && iwidth+linewidth>winwidth
            let tail=item.a:itemsep
            let rt+=[a:linebeg.tail]
            let linewidth=initwidth+s:_r.strdisplaywidth(tail, initwidth)
            let curfilenum=0
        else
            let rt[-1].=item.a:itemsep
            let linewidth+=iwidth+
                        \  s:_r.strdisplaywidth(a:itemsep, linewidth+iwidth)
        endif
        let cl=len(rt)-1
        let ilen=len(item)
        let linelen=len(rt[-1])
        if a:list is a:idxlist
            let ii+=1
        else
            let ii=index(a:idxlist, item)
        endif
        let special[a:itemname.ii.'_r']=[[cl, linelen-ilen-seplen],
                    \                    [cl, linelen-seplen]]
        let curfilenum+=1
    endfor
    call map(rt, 'v:val[:-'.(seplen+1).']')
    return [rt, special]
endfunction
"▶1 parsearg :: String → dict
function s:F.parsearg(str)
    let s=a:str
    let r={}
    let i=0
    while !empty(s)
        let key=matchstr(s, '\C\v^%(expr|synreg|flbeg|pref|suf):')[:-2]
        if empty(key)
            let arg=matchstr(s, '\v(\\.|[^,])*')
            let s=s[len(arg)+1:]
            let r[i]=substitute(arg, '\v\\([\\:#,])', '\1', 'g')
            let i+=1
            continue
        endif
        let s=s[len(key)+1:]
        let arg=matchstr(s, '\v(\\.|[^,])*')
        let s=s[len(arg)+1:]
        let r[key]=substitute(arg, '\v\\([\\:#,])', '\1', 'g')
    endwhile
    return r
endfunction
"▶1 parse :: String → template
let s:parsecache={}
function s:F.parse(str)
    if has_key(s:parsecache, a:str)
        return s:parsecache[a:str]
    endif
    let s=a:str
    let r=[[[]]]
    let lr=r[-1]
    let t=lr[0]
    while !empty(s)
        let lit=matchstr(s, "\\v^[^$\n]*")
        let t+=[lit]
        let s=s[len(lit):]
        let c=s[0]
        let s=s[1:]
        if empty(s)
            break
        endif
        if c is# "\n"
            let r+=[[[]]]
            let lr=r[-1]
            let t=lr[0]
            continue
        endif
        let kw=matchstr(s, '\v^\w+')
        let s=s[len(kw):]
        if !has_key(s:kwexpr, kw)
            if len(t)>1
                let t[-2].=remove(t, -1)
            endif
            continue
        endif
        let astr=matchstr(s, '\v^\#(\\.|[^#])+\#')
        let arg=s:F.parsearg(astr[1:-2])
        let j=0
        for a in s:kwexpr[kw][2:]
            let a=get(arg, j, a)
            if a is 0
                call s:_f.throw('argmis', j, kw)
            endif
            let arg[j]=a
            let j+=1
        endfor
        if s:kwexpr[kw][0] && !empty(filter(lr[1:], 's:kwexpr[v:val[0]][0]'))
            call s:_f.throw('2multl')
        endif
        let s=s[len(astr):]
        let lr+=[[kw, arg]]
    endwhile
    let s:parsecache[a:str]=r
    return r
endfunction
"▶1 skip
function s:F.skip(meta, opts)
    for kw in map(copy(a:meta), 'v:val[0]')
        if (!get(a:opts, 'showfiles', 0) &&
                    \   (kw is# 'files' || kw is# 'changes')) ||
                    \(!get(a:opts, 'showrenames', 0) && kw is# 'renames') ||
                    \(!get(a:opts, 'showcopies',  0) && kw is# 'copies')  ||
                    \(!get(a:opts, 'patch',       0) && kw is# 'patch')   ||
                    \(!get(a:opts, 'stat',        0) && kw is# 'stat')
            return 1
        endif
    endfor
    return 0
endfunction
"▶1 getcid
function s:F.getcid(template, opts)
    let r=''
    for o in ['patch', 'stat', 'showfiles', 'showrenames', 'showcopies']
        let r.=get(a:opts, o, 0)
    endfor
    let r.=has_key(a:opts, 'files')
    let r.=string(a:template)[2:-3]
    return r
endfunction
"▶1 strappend :: func, String → + func
let s:setlstrstr='let lstr=remove(text, -1)'
let s:addexpr='((eval(submatch(1))!=0)?'.
            \           '(printf("%+i", eval(submatch(1)))):'.
            \           '(""))'
function s:F.strappend(func, s, nl)
    let func=a:func
    if a:nl
        let i=len(func)
        while i
            let i-=1
            if func[i] is# 'let text+=[""]'
                call remove(func, i)
                break
            endif
        endwhile
        let func+=['let text+=['.a:s.']']
    elseif func[-1][:13] is# 'let text[-1].='
        let func[-1].='.'.a:s
    elseif func[-1][:10] is# 'let text+=['
        let func[-1]=func[-1][:-2].'.'.a:s.']'
    else
        let i=len(func)
        let spsets=[]
        while i
            let i-=1
            if func[i] is# s:setlstrstr || func[i][:1] is# 'if'
                break
            elseif func[i][:11] is# 'let special.'
                let spsets+=[i-1]
            elseif func[i] =~# '\V\^let text+=[''\v%([^'']|\''\'')*\V'']'
                let str=remove(func, i)[11:-2]
                let lstr=len(eval(str))
                for i in spsets
                    let func[i]=substitute(substitute(substitute(substitute(
                                \func[i],
                                \'\Vlen(text[-1])', lstr,  'g'),
                                \'\v\ (\d+%([+\-]\d+)+)',
                                \       '\='.tr(s:addexpr, '+', '1'),
                                \                          'g'),
                                \'\Vlen(text)',     '&+1', 'g'),
                                \'\Vlen(text)\v(%([+\-]\d+)+)',
                                \       '\="len(text)".'.s:addexpr,
                                \                          'g')
                endfor
                let func+=['let text+=['.str.'.'.a:s.']']
                return
            endif
        endwhile
        let func+=['let text[-1].='.a:s]
    endif
endfunction
"▶1 compile :: template, opts → Fref
let s:add={}
"▶2 add.ke2 : Add complex multiline statement
function s:add.ke2(addedif, expr, kw, arg, func, nl)
    let addedif2=0
    let func=a:func
    let func+=[s:setlstrstr]
    "▶3 Add missing if’s
    if !a:addedif
        if a:kw is# 'stat'
            let addedif2=1
            let func+=['if exists("diff")']
        elseif a:kw is# 'files' || a:kw is# 'changes'
            let addedif2=1
            let func+=['if !empty(a:cs.'.a:kw.')']
        elseif a:kw is# 'renames' || a:kw is# 'copies'
            let addedif2=1
            let func+=['if !empty(filter(values(a:cs.'.a:kw.'), '.
                        \               '"v:val isnot 0"))']
        endif
    endif
    "▲3
    let expr=substitute(a:expr, '@<@', 'lstr', 'g')
    let func+=['let [ntext, sp]='.expr]+
                \   (has_key(a:arg, 'flbeg')?
                \       ['let ntext[0]='.string(a:arg.flbeg).'.ntext[0]']:
                \       [])+[
                \'let mapexpr="[v:val[0]+".len(text)."]+v:val[1:]"',
                \'call map(sp, "v:key[-2:] is? ''_r'' ? map(v:val, mapexpr) '.
                \                                    ': ".mapexpr)',
                \'let text+=ntext',
                \'call extend(special, sp)']
    if addedif2
        let func+=['endif']
    endif
endfunction
"▶2 add.ke1 : Add simple multiline statements
function s:add.ke1(addedif, expr, kw, arg, func, nl)
    let addedif2=0
    let func=a:func
    let func+=[s:setlstrstr]
    "▶3 Add missing if’s
    if !a:addedif && a:kw is# 'patch'
        let addedif2=1
        let func+=['if exists("diff")']
    endif
    "▲3
    let func+=['let ntext=copy('.a:expr.')',
                \'call map(ntext, "lstr.v:val")']+
                \   (has_key(a:arg, 'flbeg')?
                \       ['let ntext[0]='.string(a:arg.flbeg).
                \                                  '.ntext[0]']:
                \       [])+[
                \'let special.'.a:kw.'_R=[[len(text), 0], '.
                \                '[len(text)+len(ntext)-1, 0]]',
                \'let text+=ntext']
    if addedif2
        let func+=['endif']
    endif
endfunction
"▶2 add.ke0 : Add single-line statement
function s:add.ke0(addedif, expr, kw, arg, func, nl)
    let func=a:func
    let add2if=0
    if a:kw is# 'branch' && a:arg.0 isnot# 'keep' && !a:addedif
        let add2if=1
        let func+=['if a:cs.branch isnot# "default"']
    elseif a:kw is# 'phase' && a:arg.0 isnot# 'keep' && !a:addedif
        let add2if=1
        let func+=['if a:cs.phase isnot# "public"']
    endif
    let func+=['let estr='.a:expr]
    "▶3 Determine condition on which suffix or prefix will be added
    if index(s:kwpempt, a:kw)!=-1
        let condition='!empty(estr)'
    elseif a:kw is# 'branch'
        let condition='estr isnot# "default"'
    elseif a:kw is# 'phase'
        let condition='estr isnot# "public"'
    elseif a:kw is# 'rev'
        let condition=0
    endif
    "▶3 Add suffix or prefix
    if exists('condition')
        let addif=(condition isnot 0 && !a:addedif && !add2if) &&
                    \(has_key(a:arg, 'pref') ||
                    \ has_key(a:arg, 'suf'))
        if addif
            let func+=['if '.condition]
        endif
        "▶4 Add prefix
        if has_key(a:arg, 'pref')
            if addif
                let func+=['let estr='.string(a:arg.pref).'.estr']
            else
                let func[-1]=substitute(func[-1], '=\@<=',
                            \           escape(string(a:arg.pref),
                            \                  '\~&').'.', '')
            endif
        endif
        "▶4 Add suffix
        if has_key(a:arg, 'suf')
            if has_key(a:arg, 'pref') || !addif
                let func[-1].='.'.string(a:arg.suf)
            else
                let func+=['let estr.='.string(a:arg.suf)]
            endif
        endif
        "▲4
        if addif
            let func+=['endif']
        endif
    endif
    "▲3
    if a:nl
        let  lexpr='len(text)'
        let llexpr='0'
    else
        let  lexpr='len(text)-1'
        let llexpr='len(text[-1])'
    endif
    let func+=['let special.'.a:kw.'_r='.
                \  '[['.lexpr.', '.llexpr.'], '.
                \   '['.lexpr.', '.llexpr.'-1+len(estr)]]',]
    call s:F.strappend(func, 'estr', a:nl)
    if add2if
        let func+=['endif']
    endif
endfunction
"▲2
let s:compilecache={}
function s:F.compile(template, opts, repo)
    "▶2 Cache
    let cid=s:F.getcid(a:template, a:opts)
    if has_key(s:compilecache, cid)
        return s:compilecache[cid]
    endif
    "▶2 Define variables
    let func=['function d.template(cs, opts, repo, width)',
                \'let r={"text": [], "special": {}}',
                \'let text=r.text',
                \'let special=r.special',]
    let hasfiles=has_key(a:opts, 'files')
    if hasfiles
        let func+=['let files=a:opts.csfiles[a:cs.hex]']
    endif
    let hasrevisions=get(a:repo, 'hasrevisions', 1)
    let hasphases=get(a:repo, 'hasphases', 0)
    if get(a:opts, 'patch', 0) || get(a:opts, 'stat', 0)
        let filesarg=((hasfiles && !has_key(a:opts.ignorefiles, 'patch'))?
                    \   ('files'):
                    \   ('[]'))
        let func+=['if !empty(a:cs.parents)',
                    \'let diff=a:repo.functions.diff(a:repo, '.
                    \                               'a:cs.hex, '.
                    \                               'a:cs.parents[0], '.
                    \                                filesarg.', '.
                    \                               'a:opts)',
                    \'endif']
    endif
    let reqs={}
    "▲2
    for [lit; meta] in a:template
        if s:F.skip(meta, a:opts)
            continue
        endif
        let addedif=0
        let lmeta=len(meta)
        if lmeta
            let kw=meta[0][0]
            let lkw=meta[-1][0]
        endif
        "▶2 Skip line under certain conditions
        if !lmeta
        elseif lmeta==1 && !s:kwexpr[meta[0][0]][0]
            if index(s:kwpempt, kw)!=-1
                let addedif=1
                let func+=['if !empty(a:cs.'.kw.')']
            elseif kw is# 'branch'
                let addedif=1
                let func+=['if a:cs.branch isnot# "default"']
            elseif kw is# 'phase'
                if !hasphases
                    continue
                else
                    let addedif=1
                    let func+=['if a:cs.phase isnot# "public"']
                endif
            elseif kw is# 'rev' && !hasrevisions
                continue
            endif
            let func+=['let special.'.meta[0][0].'_l=[len(text), 0]']
        elseif lkw is# 'patch' || lkw is# 'stat'
            let addedif=1
            let func+=['if exists("diff")']
        elseif index(s:kwpemptml, lkw)!=-1
            let addedif=1
            let func+=['if !empty(a:cs.'.substitute(lkw, '_$', '', '').')']
        elseif lkw is# 'renames' || lkw is# 'copies'
            let addedif=1
            let func+=['if !empty(filter(values(a:cs.'.lkw.'), '.
                        \               '"v:val isnot 0"))']
        endif
        "▲2
        let func+=['let text+=[""]']
        let i=-1
        let nl=1
        for str in lit
            let i+=1
            if !empty(str)
                call s:F.strappend(func, string(str), nl)
                let nl=0
            endif
            if lmeta>i
                "▶2 Define variables
                let [kw, arg]=meta[i]
                let ke=s:kwexpr[kw]
                "▶2 Get expression
                if has_key(arg, 'expr')
                    let expr=arg.expr
                else
                    let expr=ke[1]
                endif
                "▶3 Determine what should be used as {word} argument
                if has_key(s:kwmarg, kw)
                    let marg=s:kwmarg[kw]
                elseif hasfiles && (kw is# 'files' || kw is# 'changes') &&
                            \!has_key(a:opts.ignorefiles, 'files')
                    let marg='files'
                elseif hasfiles && (kw is# 'renames' || kw is# 'copies') &&
                            \!has_key(a:opts.ignorefiles, kw)
                    let marg='filter(copy(a:cs.'.kw.'), '.
                                \   '"index(files, v:val)!=-1")'
                else
                    let marg='a:cs.'.substitute(kw, '_$', '', '')
                endif
                "▲3
                let expr=substitute(substitute(substitute(substitute(
                            \substitute(expr,
                            \'\V@@@', marg,      'g'),
                            \'\V@.@', 'a:cs',    'g'),
                            \'\V@:@', 'a:repo',  'g'),
                            \'\V@o@', 'a:opts',  'g'),
                            \'\V@-@', 'a:width', 'g')
                "▶2 Process positional parameters
                for j in range(len(ke)-2)
                    let expr=substitute(expr, '@'.j.'@',
                                \       escape(string(arg[j]), '&~\'), 'g')
                endfor
                "▶2 Skip meta if required
                if kw is# 'rev' && !hasrevisions && arg.0 isnot# 'keep'
                    continue
                elseif kw is# 'phase' && !hasphases
                    continue
                endif
                "▶2 Add requirements information
                if has_key(s:kwreqs, kw)
                    call extend(reqs, s:kwreqs[kw])
                endif
                "▲2
                call s:add['ke'.ke[0]](addedif, expr, kw, arg, func, nl)
                let nl=0
            endif
        endfor
        if addedif
            let func+=['endif']
        endif
    endfor
    let func+=['return r',
                \'endfunction']
    let d={}
    execute join(s:F.beatycode(func), "\n")
    let r=[reqs, d.template]
    let s:compilecache[cid]=r
    return r
endfunction
"▶1 addgroup
function s:F.addgroup(r, nlgroups, group)
    let i=0
    for [line, lnr] in filter(map(copy(a:r), '[v:val, v:key]'),
                \             'stridx(",=", v:val[0][-1:])!=-1')
        let a:r[lnr].=a:group
        let i+=1
    endfor
    if !i
        call add(a:nlgroups, a:group)
    endif
endfunction
"▶1 getkwreg
function s:F.getkwreg(repo, kw, nextlit)
    if has_key(s:kwreg, a:kw)
        return s:kwreg[a:kw]
    elseif a:kw is# 'rev'
        return get(a:repo, 'revreg', '\v\d+')
    elseif a:kw is# 'parents' || a:kw is# 'children'
        let reg=get(a:repo, 'hexreg', '\x{12,}')
        return '\v'.reg.'(\ '.reg.')*'
    " XXX 0 is empty
    elseif !empty(a:nextlit)
        return '\V\%(\%('.escape(a:nextlit, '\/').'\)\@!\.\)\*'
    else
        return '.*'
    endif
endfunction
"▶1 syntax :: template, opts → [VimCommand] + :syn
"▶2 Some globals
let s:syncache={}
let s:noargtimereg='\v\d\d \S+ \d{4,} \d\d:\d\d'
let s:ukntkws=['c', 'x', 'X', '+']
let s:timekwregs={
            \'a': '\S\{1,3}',
            \'A': '\S\+',
            \'b': '\S\{1,3}',
            \'B': '\S\+',
            \'C': '\d\d',
            \'d': '\d\d',
            \'D': '\d\d\/\d\d\/\d\d',
            \'e': '\[1-3 ]\d',
            \'F': '\d\{4,}-\d\d-\d\d',
            \'G': '\d\{4,}',
            \'g': '\d\d',
            \'h': '\S\{1,3}',
            \'H': '\d\d',
            \'I': '\d\d',
            \'j': '\d\{3}',
            \'k': '\[12 ]\d',
            \'l': '\[1 ]\d',
            \'m': '\d\d',
            \'M': '\d\d',
            \'n': '\n',
            \'p': '\[AP]M',
            \'P': '\[ap]m',
            \'r': '\d\d:\d\d:\d\d \[AP]M',
            \'R': '\d\d:\d\d',
            \'s': '\d\+',
            \'S': '\d\d',
            \'t': '\t',
            \'T': '\d\d:\d\d:\d\d',
            \'u': '\[1-7]',
            \'U': '\d\d',
            \'V': '\d\d',
            \'w': '\[0-6]',
            \'W': '\d\d',
            \'y': '\d\d',
            \'Y': '\d\{4,}',
            \'z': '\[+\-]\d\{4}',
            \'Z': '\S\{3}',
            \'%': '%',
        \}
"▲2
function s:F.syntax(template, opts, repo)
    "▶2 Cache
    let cid=s:F.getcid(a:template, a:opts)
    if has_key(s:syncache, cid)
        return s:syncache[cid]
    endif
    "▶2 Define variables
    let r=[]
    let topgroups=[]
    let hasrevisions=get(a:repo, 'hasrevisions', 1)
    let hasphases=get(a:repo, 'hasphases', 0)
    "▲2
    let r+=['syn match auLogFirstLineStart =\v^[^ ]*[@o][^ ]* = '.
                \'skipwhite nextgroup=']
    let i=0
    let nlgroups=[]
    for [lit; meta] in a:template
        if s:F.skip(meta, a:opts)
            continue
        endif
        let lmeta=len(meta)
        let llit=len(lit)
        let j=0
        let hasmult=0
        for str in lit
            if !empty(str)
                if lmeta>j
                    let skname='SkipBefore_'.meta[j][0]
                else
                    let skname='Text'.i
                endif
                let skname='auLog'.skname
                call s:F.addgroup(r, nlgroups, skname)
                let r+=['syn match '.skname.' ']
                let r[-1].='/\V'.escape(str, '\/').'/'
                let r[-1].=' contained nextgroup='
            endif
            if lmeta>j
                let [kw, arg]=meta[j]
                if s:kwexpr[kw][0]
                    let hasmult=1
                endif
                if kw is# 'empty' || (kw is# 'rev' && !hasrevisions &&
                            \         arg.0 isnot# 'keep') ||
                            \        (kw is# 'phase' && !hasphases)
                    let r[-1]=substitute(r[-1], '\v\w+$', '', '')
                elseif has_key(arg, 'synreg')
                    call s:F.addgroup(r, nlgroups, 'auLog_'.kw)
                    let r+=['syn match auLog_'.kw.' /'.arg.synreg.'/ '.
                                \'contained nextgroup=']
                elseif kw is# 'hex' || kw is# 'parents_' || kw is# 'children_'
                    if has_key(a:repo, 'hexreg')
                        call s:F.addgroup(r, nlgroups, 'auLog_'.kw)
                        let r+=['syn match auLog_'.kw.' /'.a:repo.hexreg.'/ '.
                                    \'contained nextgroup=']
                    else
                        call s:F.addgroup(r, nlgroups, 'auLogHexStart_'.kw)
                        let r+=['syn match auLogHexStart_'.kw.' /\v\x{12}/'.
                                    \' contained nextgroup=auLogHexEnd_'.kw,
                                \'syn match auLogHexEnd_'.kw.' '.
                                \   '/\v\x+/ contained'.
                                \   (has('conceal')?(' conceal'):('')).
                                \   ' nextgroup=']
                    endif
                elseif kw is# 'patch'
                    call s:F.addgroup(r, nlgroups,
                                \'auLogPatchAdded,auLogPatchRemoved,'.
                                \'auLogPatchFile,auLogPatchNewFile,'.
                                \'auLogPatchOldFile,auLogPatchOther,'.
                                \'auLogPatchNotModified,'.
                                \'auLogPatchChunkHeader')
                    let newr=[   'Added   /\V+\.\*/',
                                \'Removed /\V-\.\*/',
                                \'File    /\vdiff.*/',
                                \'NewFile /\V+++ \.\*/',
                                \'OldFile /\V--- \.\*/',
                                \'NotModified  / \v.*/',
                                \'ChunkHeader /@\v.*/ contains=auLogPatchSect',
                                \'Sect    /\V @@\.\+/ms=s+3',
                                \]
                    call map(newr, '"syn match auLogPatch".v:val.'.
                                \  '" contained skipnl '.
                                \    'nextgroup=auLogNextLineStart"')
                    let r+=newr
                elseif kw is# 'stat'
                    call s:F.addgroup(r, nlgroups,
                                \'auLogStatFiles,auLogStatFileSep')
                    let newr=[   'Files /\v\d+/ nextgroup=auLogStatFilesMsg',
                                \'FilesMsg / files changed, / '.
                                \              'nextgroup=auLogStatIns',
                                \'Ins /\v\d+/ nextgroup=auLogStatInsMsg',
                                \'InsMsg / insertions, / '.
                                \               'nextgroup=auLogStatDel',
                                \'Del /\v\d+/ nextgroup=auLogStatDelMsg',
                                \'DelMsg / deletions/ skipnl '.
                                \           'nextgroup=auLogNextLineStart',
                                \'FileSep /  / nextgroup=auLogStatFile',
                                \'File /\v%(%(\ \|\ )@!.)+/ '.
                                \             'nextgroup=auLogStatTSep',
                                \'TSep /\v\s+\|\s+/ nextgroup=auLogStatTIns',
                                \'TIns /\v\d+/ nextgroup=auLogStatTNumSep',
                                \'TNumSep /\v\s+/ nextgroup=auLogStatTDel',
                                \'TDel /\v\d+/ skipnl '.
                                \           'nextgroup=auLogNextLineStart']
                    call map(newr, '"syn match auLogStat".v:val.'.
                                \  '" contained"')
                    let r+=newr
                elseif kw is# 'hide'
                    let sname='auLog_hide'.i.'_'.j
                    call s:F.addgroup(r, nlgroups, sname)
                    let r+=['hi def link '.sname.' Ignore']
                    let r+=['syn match '.sname.' /\V'.escape(arg[0], '\/').'/ '.
                                \'contained nextgroup=']
                elseif (index(s:kwpempt, kw)!=-1 || kw is# 'branch' ||
                            \                       kw is# 'rev'    ||
                            \                       kw is# 'phase') &&
                            \(has_key(arg, 'pref') || has_key(arg, 'suf'))
                    " Case kw=='rev' with !repo.hasrevisions is caught in the 
                    " first branch
                    let trail=((kw is# 'rev' || index(s:kwpempt, kw)==-1)?
                                    \   (''):
                                    \   (','))
                    if has_key(arg, 'pref')
                        call s:F.addgroup(r,nlgroups,'auLog_'.kw.'_pref'.
                                    \          trail)
                        let r+=['syn match auLog_'.kw.'_pref '.
                                    \'/\V'.escape(arg.pref, '\/').'/ '.
                                    \'contained nextgroup=auLog_'.kw]
                    else
                        call s:F.addgroup(r, nlgroups, 'auLog_'.kw.trail)
                    endif
                    let nextlit=get(arg, 'suf', get(lit, j+1, 0))
                    let r+=['syn match auLog_'.kw.' /'.
                                \s:F.getkwreg(a:repo, kw, nextlit).'/ '.
                                \'contained nextgroup=']
                    if has_key(arg, 'suf')
                        let r[-1].='auLog_'.kw.'_suf'
                        let r+=['syn match auLog_'.kw.'_suf '.
                                    \'/\V'.escape(arg.suf, '\/').'/ '.
                                    \'contained nextgroup=']
                    endif
                elseif lmeta==j+1 && llit<=j+1
                    call s:F.addgroup(r, nlgroups, 'auLog_'.kw)
                    let r+=['syn match auLog_'.kw.' /\v.*/ '.
                                \'contained nextgroup=']
                elseif kw is# 'time'
                    call s:F.addgroup(r, nlgroups, 'auLog_'.kw)
                    if has_key(arg, 0)
                        if j<=llit && !empty(lit[j+1])
                            let creg='\%(\%('.escape(lit[j+1], '\/').'\)\@!'.
                                        \'\.\)\*'
                        else
                            let creg='\.\*'
                        endif
                        let reg='\V'.substitute(escape(arg.0, '\/'), '\v\%(.)',
                                    \'\=index(s:ukntkws, submatch(1))==-1 ?'.
                                    \   'get(s:timekwregs, submatch(1), '.
                                    \       'submatch(0)) :'.
                                    \   'creg', 'g')
                    else
                        let reg=s:noargtimereg
                    endif
                    let r+=['syn match auLog_time '.
                                \'/'.reg.'/ '.
                                \'contained nextgroup=']
                else
                    call s:F.addgroup(r, nlgroups, 'auLog_'.kw)
                    let r+=['syn match auLog_'.kw.' /'.
                                \    s:F.getkwreg(a:repo, kw, get(lit, j+1, 0)).
                                \'/ contained nextgroup=']
                endif
            endif
            let j+=1
        endfor
        call s:F.addgroup(r, nlgroups, 'auLogNextLineStart')
        let r[-1].=' skipnl'
        let i+=1
    endfor
    if !empty(nlgroups)
        let r+=['syn match auLogNextLineStart @\v^[^ ]+ @ skipwhite '.
                    \' nextgroup='.join(nlgroups, ',')]
    endif
    call add(r, remove(r, 0))
    if len(r)==1
        return []
    endif
    let s:syncache[cid]=r
    return r
endfunction
"▶1 gettemplatelist :: bvar → + bvar
function s:F.gettemplatelist(bvar)
    if has_key(a:bvar, 'templatelist')
        return
    endif
    if has_key(a:bvar.opts, 'template')
        let template=eval(a:bvar.opts.template)
    elseif has_key(a:bvar.opts, 'style')
        let template=s:templates[a:bvar.opts.style]
    else
        let template=s:templates.default
    endif
    let a:bvar.templatelist=s:F.parse(template)
endfunction
"▶1 post resource
call s:_f.postresource('template', {'syntax': s:F.syntax,
            \                      'compile': s:F.compile,
            \              'gettemplatelist': s:F.gettemplatelist,
            \                        'tlist': keys(s:templates)})
"▶1
call frawor#Lockvar(s:, '_r,_pluginloaded,compilecache,parsecache,syncache')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
