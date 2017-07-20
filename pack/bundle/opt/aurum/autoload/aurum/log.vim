"▶1
scriptencoding utf-8
execute frawor#Setup('1.1', {'@%aurum/cmdutils': '4.3',
            \           '@%aurum/log/templates': '0.0',
            \               '@%aurum/lineutils': '0.0',
            \                 '@%aurum/bufvars': '0.0',
            \                    '@%aurum/edit': '1.1',
            \                     '@/functions': '0.1',
            \                           '@/fwc': '0.0',
            \                       '@/options': '0.0',
            \                         '@/table': '0.1',})
let s:F.glog={}
let s:F.graph={}
let s:ignfiles=['patch', 'renames', 'copies', 'files', 'diff', 'open']
let s:_options={
            \'ignorefiles':    {'default': [],'checker': 'list in ignfiles'},
            \'closelogwindow': {'default': 1,  'filter': 'bool'               },
            \'procinput':      {'default': 1, 'checker': 'range 0 2'          },
            \'loglimit':       {'default': 0, 'checker': 'range 0 inf'        },
            \'autoaddlog':     {'default': 1,  'filter': 'bool'               },
            \'showprogress':   {'default': 0,  'filter': 'bool'               },
        \}
let s:_messages={
            \'nocontents': 'Log is empty',
            \      'ebuf': 'Switched to another buffer: exiting',
            \   'tnmatch': 'Completion template list and '.
            \              'actual template list do not match',
        \}
" iterfuncs :: {fname: { "start": startfunc, "next": nextfunc }}
" startfunc (always) :: repo, opts, * → d
let s:iterfuncs={}
"▶1 addcols
function s:F.addcols(special, cnum)
    let mapexpr='[v:val[0], v:val[1]+'.a:cnum.']+v:val[2:]'
    call map(a:special, 'v:key[-2:] is? "_r" ? map(v:val, mapexpr) : '.mapexpr)
endfunction
"▶1 gettext :: skip, cs, opts, repo, width → Text
let s:skiptext={'skip': 1, 'text': [], 'special': {}}
function s:F.gettext(skip, ...)
    if a:skip
        return deepcopy(s:skiptext)
    else
        return call(a:2.templatefunc, a:000, {})
    endif
endfunction
"▶1 graph
"▶2 graph.update_state :: graph, gstate → + graph
function s:F.graph.update_state(s)
    let self.prev_state=self.state
    let self.state=a:s
endfunction
"▶2 graph.ensure_capacity :: graph, num_columns → + graph
function s:F.graph.ensure_capacity(num_columns)
    let mdiff=(a:num_columns*2)-len(self.mapping)
    if mdiff>0
        let plist=repeat([-1], mdiff)
        let self.mapping+=plist
        let self.new_mapping+=plist
    endif
endfunction
"▶2 graph.insert_into_new_columns :: graph, hex, mapindex → mapindex + graph
function s:F.graph.insert_into_new_columns(hex, mapindex)
    let i=0
    for hex in self.new_columns
        if hex is# a:hex
            let self.mapping[a:mapindex]=i
            return a:mapindex+2
        endif
        let i+=1
    endfor
    let self.mapping[a:mapindex]=len(self.new_columns)
    let self.new_columns+=[a:hex]
    return a:mapindex+2
endfunction
"▶2 graph.update_columns :: graph → + graph
function s:F.graph.update_columns()
    let self.columns=self.new_columns
    let self.new_columns=[]
    let max_new_columns=len(self.columns)+self.num_parents
    call self.ensure_capacity(max_new_columns)
    let self.mapping_size=2*max_new_columns
    if !empty(self.mapping)
        call remove(self.mapping, 0, self.mapping_size-1)
    endif
    call extend(self.mapping, repeat([-1], self.mapping_size), 0)
    let seen=0
    let midx=0
    let is_cs_in_columns=1
    let num_columns=len(self.columns)
    for i in range(num_columns+1)
        if i==num_columns
            if seen
                break
            endif
            let is_cs_in_columns=0
            let ccshex=self.cs.hex
        else
            let ccshex=self.columns[i]
        endif
        if ccshex is# self.cs.hex
            let oldmidx=midx
            let seen=1
            let self.commit_index=i
            for parent in self.interesting_parents
                let midx=self.insert_into_new_columns(parent, midx)
            endfor
            if midx==oldmidx
                let midx+=2
            endif
        else
            let midx=self.insert_into_new_columns(ccshex, midx)
        endif
    endfor
    while self.mapping_size>1 && self.mapping[self.mapping_size-1]==-1
        let self.mapping_size-=1
    endwhile
    let self.width=(len(self.columns)+self.num_parents+(self.num_parents<1)
                \  -(is_cs_in_columns))*2
endfunction
"▶2 graph.update :: graph, cs → + graph
function s:F.graph.update(cs)
    let self.cs=a:cs
    let self.interesting_parents=copy(a:cs.parents)
    let self.num_parents=len(self.interesting_parents)
    let self.prev_commit_index=self.commit_index
    call self.update_columns()
    let self.expansion_row=0
    if self.state isnot# 'padding'
        let self.state='skip'
    elseif self.num_parents>2 &&
                \self.commit_index<(len(self.columns)-1)
        let self.state='precommit'
    else
        let self.state='commit'
    endif
endfunction
"▶2 graph.is_mapping_correct :: graph → Bool
function s:F.graph.is_mapping_correct()
    return empty(filter(self.mapping[:(self.mapping_size-1)],
                \       '!(v:val==-1 || v:val==v:key/2)'))
endfunction
"▶2 graph.pad_horizontally :: graph, chars_written → String
" XXX Replace somehow?
function s:F.graph.pad_horizontally(chars_written)
    if a:chars_written>=self.width
        return ''
    endif
    return repeat(' ', self.width-a:chars_written)
endfunction
"▶2 graph.output_padding_line :: graph → String
function s:F.graph.output_padding_line()
    let lnc=len(self.new_columns)
    return repeat('| ', lnc).self.pad_horizontally(lnc*2)
endfunction
"▶2 graph.output_skip_line :: graph → String
function s:F.graph.output_skip_line()
    call self.update_state(((self.num_parents>2 &&
                \            self.commit_index<(len(self.columns)-1))?
                \               ('precommit'):
                \               ('commit')))
    return '...'.self.pad_horizontally(3)
endfunction
"▶2 graph.output_pre_commit_line :: graph → String
function s:F.graph.output_pre_commit_line()
    let num_expansion_rows=(self.num_parents-2)*2
    let seen=0
    let r=''
    let i=-1
    for hex in self.columns
        let i+=1
        if hex is# self.cs.hex
            let seen=1
            let r.='|'.repeat(' ', self.expansion_row)
        elseif seen && self.expansion_row==0
            let r.='|\'[self.prev_state is# 'postmerge' &&
                        \self.prev_commit_index<i]
        elseif seen && self.expansion_row>0
            let r.='\'
        else
            let r.='|'
        endif
        let r.=' '
    endfor
    let r.=self.pad_horizontally(len(r))
    let self.expansion_row+=1
    if self.expansion_row>num_expansion_rows
        call self.update_state('commit')
    endif
    return r
endfunction
"▶2 graph.output_commit_char :: graph → String
function s:F.graph.output_commit_char()
    if has_key(self.skipchangesets, self.cs.hex)
        return '*'
    endif
    return '@o'[index(self.workcss, self.cs.hex)==-1]
endfunction
"▶2 graph.draw_octopus_merge :: graph → String
function s:F.graph.draw_octopus_merge()
    let r=''
    for i in range(((self.num_parents-2)*2)-1)
        let r.='-'
    endfor
    let r.='.'
    return r
endfunction
"▶2 graph.output_commit_line :: graph → String
function s:F.graph.output_commit_line()
    let seen=0
    let r=''
    let lcolumns=len(self.columns)
    for i in range(lcolumns+1)
        if i==lcolumns
            if seen
                break
            endif
            let ccshex=self.cs.hex
        else
            let ccshex=self.columns[i]
        endif
        if ccshex is# self.cs.hex
            let seen=1
            let r.=self.output_commit_char()
            if self.num_parents>2
                let r.=self.draw_octopus_merge()
            endif
        elseif seen && self.num_parents>2
            let r.='\'
        elseif seen && self.num_parents==2
            let r.='|\'[self.prev_state is# 'postmerge' &&
                        \self.prev_commit_index<i]
        else
            let r.='|'
        endif
        let r.=' '
    endfor
    let r.=self.pad_horizontally(len(r))
    call self.update_state(((self.num_parents>1)?
                \             ('postmerge'):
                \          ((self.is_mapping_correct())?
                \             ('padding')
                \          :
                \             ('collapsing'))))
    return r
endfunction
"▶2 graph.output_post_merge_line :: graph → String
function s:F.graph.output_post_merge_line()
    let seen=0
    let r=''
    let lcolumns=len(self.columns)
    for i in range(lcolumns+1)
        if i==lcolumns
            if seen
                break
            endif
            let ccshex=self.cs.hex
        else
            let ccshex=self.columns[i]
        endif
        if ccshex is# self.cs.hex
            let seen=1
            let r.='|'.repeat('\ ', self.num_parents-1)
        else
            let r.='|\'[seen].' '
        endif
    endfor
    let r.=self.pad_horizontally(len(r))
    call self.update_state(((self.is_mapping_correct())?
                \               ('padding'):
                \               ('collapsing')))
    return r
endfunction
"▶2 graph.output_collapsing_line :: graph → String
function s:F.graph.output_collapsing_line()
    let used_horizontal=0
    let horizontal_edge=-1
    let horizontal_edge_target=-1
    let self.new_mapping=repeat([-1], self.mapping_size)
    for [i, target] in map(self.mapping[:(self.mapping_size-1)],
                \          '[v:key, v:val]')
        if target==-1
            continue
        elseif i==target*2
            let self.new_mapping[i]=target
        elseif self.new_mapping[i-1]==-1
            let self.new_mapping[i-1]=target
            if horizontal_edge==-1
                let horizontal_edge=i
                let horizontal_edge_target=target
                let j=(target*2)+3
                while j<i-2
                    let self.new_mapping[j]=target
                    let j+=2
                endwhile
            endif
        elseif self.new_mapping[i-1]==target
        else
            let self.new_mapping[i-2]=target
            if horizontal_edge==-1
                let horizontal_edge=1
            endif
        endif
    endfor
    if self.mapping[self.mapping_size-1]==-1
        let self.mapping_size-=1
    endif
    let r=''
    for [i, target] in map(self.new_mapping[:(self.mapping_size-1)],
                \          '[v:key, v:val]')
        if target==-1
            let r.=' '
        elseif target*2==i
            let r.='|'
        elseif target==horizontal_edge_target && i!=horizontal_edge-1
            if i!=(target*2)+3
                let self.new_mapping[i]=-1
            endif
            let used_horizontal=1
            let r.='_'
        else
            if used_horizontal && i<horizontal_edge
                let self.new_mapping[i]=-1
            endif
            let r.='/'
        endif
    endfor
    let r.=self.pad_horizontally(len(r))
    let [self.mapping, self.new_mapping]=
                \[self.new_mapping, self.mapping]
    if self.is_mapping_correct()
        call self.update_state('padding')
    endif
    return r
endfunction
"▶2 graph.next_line :: graph → String
let s:gstatesfmap={
            \'padding':    s:F.graph.output_padding_line,
            \'skip':       s:F.graph.output_skip_line,
            \'precommit':  s:F.graph.output_pre_commit_line,
            \'commit':     s:F.graph.output_commit_line,
            \'postmerge':  s:F.graph.output_post_merge_line,
            \'collapsing': s:F.graph.output_collapsing_line,
        \}
function s:F.graph.next_line()
    return call(s:gstatesfmap[self.state], [], self)
endfunction
"▶2 graph.padding_line :: graph → String
function s:F.graph.padding_line()
    if self.state isnot# 'commit'
        return self.next_line()
    endif
    if self.num_parents<3
        let r.=repeat('| ', len(self.columns))
    else
        let r.=join(map(copy(self.columns),
                    \   '"|".((v:val is# "'.self.cs.hex.'")?'.
                    \           'repeat(" ", (self.num_parents-2)*2):'.
                    \           '" ")'), '')
    endif
    let r.=self.pad_horizontally(len(r))
    let self.prev_state='padding'
    return r
endfunction
"▶2 graph.show_commit :: graph → [String]
function s:F.graph.show_commit()
    let r=[]
    while 1
        try
            if self.state is# 'commit'
                break
            endif
        finally
            " XXX We need at least one iteration. :finally makes sure it will be 
            " done
            let r+=[self.next_line()]
        endtry
    endwhile
    return r
endfunction
"▶2 graph.show_remainder :: graph → [String]
function s:F.graph.show_remainder()
    let r=[]
    while self.state isnot# 'padding'
        let r+=[self.next_line()]
    endwhile
    return r
endfunction
"▶2 graph.graph_init :: repo, [cs] → graph
let s:defgraph={
            \'cs':                0,
            \'num_parents':       0,
            \'expansion_row':     0,
            \'state':             'padding',
            \'prev_state':        'padding',
            \'commit_index':      0,
            \'prev_commit_index': 0,
            \'columns':           [],
            \'new_columns':       [],
            \'mapping':           [],
            \'new_mapping':       [],
            \'mapping_size':      0,
            \'skipchangesets':    {},
        \}
function s:F.graph.graph_init(showparents, opts, repo)
    let graph=deepcopy(s:defgraph)
    let graph.opts=a:opts
    let graph.repo=a:repo
    let graph.workcss=a:showparents
    let graph.skipchangesets=a:opts.skipchangesets
    call extend(graph, s:F.graph)
    return graph
endfunction
"▶2 graph.show_log :: cs, skip::Bool → Text
function s:F.graph.show_log(cs, skip)
    let lines=((self.cs is 0)?([]):(self.show_remainder()))
    call self.update(a:cs)
    let lines+=self.show_commit()
    if a:skip && len(lines)==1 && lines[0]!~#'[^|* ]'
        return deepcopy(s:skiptext)
    endif
    let collen=len(lines[-1])
    let text=s:F.gettext(a:skip, a:cs, self.opts, self.repo, collen)
    let text.block_r=[[0, collen],
                \     [len(text.text)-1,
                \      collen+max(map(copy(text.text), 'len(v:val)'))]]
    call s:F.addcols(text.special, collen)
    let lines[-1]=lines[-1][:-2].' '.get(text.text, 0, '')
    let cchar=self.output_commit_char()
    let bidx=stridx(lines[-1], cchar)
    if bidx!=-1
        let text.special.bullet=[0, bidx, cchar]
    endif
    for line in text.text[1:]
        let lines+=[self.next_line()[:-2].' '.line]
    endfor
    let text.text=lines
    return text
endfunction
"▶1 glog
"▶2 glog.utf
function s:F.glog.utf(state, type, seen, char, skip, cs, opts, repo)
    let idx=index(a:seen, a:cs.hex)
    if idx==-1
        let idx=len(a:seen)
        call add(a:seen, a:cs.hex)
    endif
    let knownparents=[]
    let newparents=[]
    call map(copy(a:cs.parents), 'add(((index(a:seen, v:val)==-1)?'.
                    \                  '(newparents):'.
                    \                  '(knownparents)), '.
                    \                'v:val)')
    let ncols=len(a:seen)
    call remove(a:seen, idx)
    call extend(a:seen, newparents, idx)
    let edges=map(knownparents, '['.idx.', index(a:seen, v:val)]')
    if !empty(newparents)
        let edges+=[[idx, idx]]+((len(newparents)>1)?
                    \                       ([[idx, idx+1]]):
                    \                       ([]))
    endif
    let coldiff=len(a:seen)-ncols
    let text=s:F.gettext(a:skip, a:cs, a:opts, a:repo, ncols)
    let add_padding_line=0
    let lnum = (has_key(text, 'text') ? len(text.text) : 0)
    if coldiff==-1
        call map(edges, '((v:val[1]>v:val[0])?([v:val[0],v:val[1]+1]):(v:val))')
        if lnum>2
            let add_padding_line=!empty(filter(copy(edges),
                        \                      '(v:val[0]+1)<v:val[1]'))
        endif
    endif
    let shift_interline=repeat(['|', ' '], idx)
    let nodeline=shift_interline+[a:char, ' ']+
                \((lnum<=2 && !add_padding_line && coldiff &&
                \  coldiff==a:state[0])?
                \    ((coldiff==-1)?
                \       (repeat(['|', ' '], max([idx+1, a:state[1]])-idx-1)+
                \        repeat(['/', ' '], ncols-max([idx+1, a:state[1]]))):
                \       (repeat(['\', ' '], (ncols-idx-1)))):
                \    (repeat(['|', ' '], (ncols-idx-1))))
    let n_spaces=(1+((coldiff==-1)?(0):(1+(coldiff!=0))))
    let shift_interline+=repeat([' '],                    n_spaces)+
                \        repeat(['/|\'[n_spaces-1], ' '], ncols-idx-1)
    for [start, end] in edges
        if start==end+1
            let shift_interline[2*end   + 1]='/'
        elseif start==end-1
            let shift_interline[2*start + 1]='\'
        elseif start==end
            let shift_interline[2*start    ]='|'
        else
            let nodeline[2*end]='+'
            if start>end
                let [start, end]=[end, start]
            endif
            for i in filter(range(2*start+1, 2*end-1),
                        \   'nodeline[v:val] isnot# "+"')
                let nodeline[i]='-'
            endfor
        endif
    endfor
    let joined_nl=join(nodeline, '')
    let joined_sil=join(shift_interline, '')
    if has_key(text, 'skip')
        let text.text=[]
        if joined_nl!~#'\v^[*| ]+$'
            let text.text+=[joined_nl]
        endif
        if joined_sil!~#'\v^[| ]+$' &&
                    \joined_sil isnot# tr(joined_nl, a:char, '|')
            let text.text+=[joined_sil]
        endif
        return text
    endif
    let lines=[joined_nl]
    if add_padding_line
        let lines+=[repeat('| ', idx).
                    \   ((index(edges, [idx, idx-1])==-1 &&
                    \     index(edges, [idx, idx])==-1)?(' '):('|')).
                    \   ' '.repeat('| ', ncols-idx-1)]
    endif
    let lines+=[joined_sil]
    let ltdiff=lnum-len(lines)
    if ltdiff>0
        let lines+=repeat([repeat('| ', ncols+coldiff)], ltdiff)
    else
        call extend(text.text, repeat([''], -ltdiff))
    endif
    let a:state[0]=coldiff
    let a:state[1]=idx
    call map(lines, 'printf("%-*s ",'.(2*max([ncols, ncols+coldiff])).',v:val)')
    let curspecial=text.special
    let shiftlen=len(lines[0])
    call s:F.addcols(text.special, shiftlen)
    let text.block_r=[[0, shiftlen],
                \     [len(text.text)-1,
                \      max(map(copy(lines), 'len(v:val)'))]]
    let curspecial.bullet=[0, stridx(lines[0], a:char), a:char]
    call map(text.text, 'lines[v:key].v:val')
    return text
endfunction
"▶1 iterfuncs.csshow
let s:iterfuncs.csshow={}
"▶2 iterfuncs.csshow.setup :: procinput → d
function s:iterfuncs.csshow.setup(procinput)
    return {     'input': '',
           \ 'skipuntil': 0,
           \       'buf': bufnr('%'),
           \'lastw0line': -1,
           \ 'didredraw': 0,
           \ 'procinput': a:procinput,
           \ 'allowskip': 0,}
endfunction
"▶2 iterfuncs.csshow.next
function s:iterfuncs.csshow.next(d)
    if !a:d.didredraw
        let haschar=getchar(1)
        if haschar || (line('$')>=line('w0')+winheight(0))
            redraw
            let a:d.didredraw=!haschar
            let a:d.lastw0line=line('w0')
        endif
    endif
    if !a:d.procinput
        return
    endif
    while getchar(1)
        let char=getchar()
        if type(char)==type(0)
            let char=nr2char(char)
        endif
        let a:d.input.=char
        let skipped=0
        if a:d.skipuntil isnot 0
            if eval(a:d.skipuntil)
                let a:d.skipuntil=0
                let skipped=1
            endif
        endif
        if (skipped && !a:d.allowskip) || a:d.skipuntil isnot 0
        elseif stridx("gzy'`m[]@qZ\<C-w>tTfF", char)!=-1
            let a:d.skipuntil='len(a:d.input)>='.(len(a:d.input)+1)
            let a:d.allowskip=0
        elseif char is# '"'
            let a:d.skipuntil='len(a:d.input)>='.(len(a:d.input)+2)
            let a:d.allowskip=1
        elseif stridx('123456789', char)!=-1
            let a:d.skipuntil='a:d.input['.len(a:d.input).':]=~#"\\D"'
            let a:d.allowskip=1
        elseif stridx('/?:!', char)!=-1
            let a:d.skipuntil=
                        \'match(a:d.input, "[\n\r\e]", '.len(a:d.input).')!=-1'
            let a:d.allowskip=0
        elseif !empty(mapcheck(char, 'n'))
            let a:d.skipuntil='!empty(maparg(a:d.input, "n")) || '.
                        \     'empty(mapcheck(a:d.input))'.
                        \     ((has('float') && has('reltime') && &timeout)?
                        \           (' || str2float(reltimestr('.
                        \               'reltime('.string(reltime()).')))*1000'.
                        \                                      '>'.&timeoutlen):
                        \           (''))
            let a:d.allowskip=0
        endif
    endwhile
    if !empty(a:d.input) && (a:d.skipuntil is 0 || eval(a:d.skipuntil))
        let a:d.skipuntil=0
        execute 'normal' a:d.input
        let a:d.input=''
        if bufnr('%')==a:d.buf
            let lw0=line('w0')
            redraw!
            redrawstatus
            if lw0!=a:d.lastw0line
                let a:d.didredraw=(line('$')>=lw0+winheight(0))
                let a:d.lastw0line=lw0
            endif
        else
            if bufexists(a:d.buf)
                execute 'silent bwipeout!' a:d.buf
            endif
            call s:_f.throw('ebuf')
        endif
    endif
endfunction
"▶2 iterfuncs.csshow.finish
function s:iterfuncs.csshow.finish(d)
    if !empty(a:d.input)
        return feedkeys(a:d.input)
    endif
endfunction
"▶1 iterfuncs: loggers
"▶2 iterfuncs.git
let s:iterfuncs.git={}
function s:iterfuncs.git.start(repo, opts, ...)
    let graph=s:F.graph.graph_init(get(a:000, 0, []), a:opts, a:repo)
    return {'graph': graph, 'opts': a:opts, 'repo': a:repo}
endfunction
function s:iterfuncs.git.proccs(d, cs)
    let skip=has_key(a:d.opts.skipchangesets, a:cs.hex)
    let text=a:d.graph.show_log(a:cs, skip)
    if skip
        return [text.text, 0, 0]
    else
        return [text.text, text.block_r, text.special]
    endif
endfunction
"▶2 iterfuncs.hg
let s:iterfuncs.hg={}
function s:iterfuncs.hg.start(repo, opts, ...)
    return {'seen': [], 'state': [0, 0], 'opts': a:opts,
                \'showparents': get(a:000, 0, []), 'repo': a:repo}
endfunction
function s:iterfuncs.hg.proccs(d, cs)
    let skip=has_key(a:d.opts.skipchangesets, a:cs.hex)
    if skip
        let char='*'
    else
        let char=((index(a:d.showparents, a:cs.hex)==-1)?('o'):('@'))
    endif
    let text=s:F.glog.utf(a:d.state, 'C', a:d.seen, char,
                \         skip, a:cs, a:d.opts, a:d.repo)
    if !has_key(text, 'text') || empty(text.text)
        return [[], 0, 0]
    endif
    if !skip
        return [text.text, text.block_r, text.special]
    else
        return [text.text, 0, 0]
    endif
endfunction
"▶2 iterfuncs.simple
let s:iterfuncs.simple={}
function s:iterfuncs.simple.start(repo, opts, ...)
    return {'opts': a:opts, 'repo': a:repo, 'showparents': get(a:000, 0, [])}
endfunction
function s:iterfuncs.simple.proccs(d, cs)
    if has_key(a:d.opts.skipchangesets, a:cs.hex)
        return [[], 0, 0]
    endif
    let text=a:d.opts.templatefunc(a:cs, a:d.opts, a:d.repo, 2)
    let text.block_r=[[0, 0],
                \     [len(text.text)-1,
                \      max(map(copy(text.text), 'len(v:val)'))]]
    let char='@o'[(index(a:d.showparents, a:cs.hex)==-1)]
    call map(text.text, '(v:key ? "|" : char)." ".v:val')
    call s:F.addcols(text.special, 2)
    let text.special.bullet=[0, 0, char]
    return [text.text, text.block_r, text.special]
endfunction
"▶1 iterfuncs.check
" startfunc (here)  :: repo, opts → d
let s:fcheckpropslist=['renames', 'copies', 'changes', 'files']
let s:iterfuncs.check={}
"▶2 getcheckcid :: opts → cid
function s:F.getcheckcid(opts)
    let r    =   get(a:opts, 'merges', 2).
                \get(a:opts, 'date', '').'D'
    for o in ['branch', 'search', 'user']
        let r.=has_key(a:opts, o) ? string(a:opts[o]) : '-'
    endfor
    let r.=has_key(a:opts, 'files') ? '+' : '-'
    return r
endfunction
"▶2 iterfuncs.check.generate
"▶3 addcentury
function s:F.addcentury(year)
    if a:year=~#'\v^\d\d?$'
        let year=str2nr(a:year)
        let curyear=str2nr(strftime('%y'))
        let century=str2nr(strftime('%Y')[:-3])
        if year<=curyear
            let r=((century*100)+year)
        else
            let r=(((century-1)*100)+year)
        endif
        return string(r)
    endif
    return a:year
endfunction
"▶3 redate
function s:F.redate(datespec)
    let date=map(split(a:datespec, '\v[^0-9*.]+'),
                \'v:val=~#"\\d" ? string(str2nr(v:val)) : '.
                \'v:val is# "." ? ''str2nr(strftime("%".s:datechars[v:key]))'''.
                \              ': -1')
    let date[0]=s:F.addcentury(date[0])
    return date
endfunction
"▲3
let s:checkcache={}
let s:keytoexpr={
            \'branch': '"a:cs.branch isnot# ".string(v:val)',
            \'merges': '(v:val)?("len(a:cs.parents)<=1"):'.
            \                  '("len(a:cs.parents)>1")',
            \'search': '"a:cs.description!~#".string(v:val)',
            \  'user':        '"a:cs.user!~#".string(v:val)',
        \}
let s:datechars='YmdHM'
function s:iterfuncs.check.generate(repo, opts)
    let cid=s:F.getcheckcid(a:opts)
    let r={}
    if has_key(a:opts, 'files')
        let r.csfiles={}
        let r.tocheck={}
        let r.repo=a:repo
        let r.filepats=a:opts.filepats
        let a:opts.csfiles=r.csfiles
    endif
    if has_key(s:checkcache, cid)
        let r.check=s:checkcache[cid]
        if r.check is 0
            return 0
        endif
        return r
    endif
    let function=[]
    let precond=join(values(map(filter(copy(a:opts),
                \                      'has_key(s:keytoexpr, v:key)'),
                \               'eval(s:keytoexpr[v:key])')), '||')
    if !empty(precond)
        let function+=['    if '.precond, '        return 0', '    endif']
    endif
    "▶3 Date filtering
    if has_key(a:opts, 'date')
        let idx=match(a:opts.date, '\V<=\?>')
        let function+=['    let time=a:cs.time']
        "▶4 One border
        if idx==-1
            let selector=(stridx('<>', a:opts.date[0])==-1)?(''):
                      \                                     (a:opts.date[0])
            let acceptexact=(empty(selector) || a:opts.date[1] is# '=')
            let date=s:F.redate(a:opts.date[empty(selector)?(0):
                        \                     (len(selector)+acceptexact):])
            if empty(selector)
                let selector='!='
            endif
            let j=0
            if !acceptexact
                let function+=['    let matched=0']
            endif
            let function+=[
                        \'    for [spec, sel] in ['.join(
                        \     map(filter(map(copy(date),
                        \                    '["%".s:datechars[v:key], v:val]'),
                        \                'v:val[1] isnot# -1'),
                        \         '"[''".v:val[0]."'', ".v:val[1]."]"'), ', ').
                        \                       ']',
                        \'        let actnum=str2nr(strftime(spec, time))',
                        \'        if actnum'.selector.'sel',
                        \]
            if !acceptexact
                let function+=['            let matched=1']
            endif
            if selector isnot# '!='
                let function+=['            break',
                            \  '        else']
                if acceptexact
                    let function[-1].='if actnum!=sel'
                endif
            endif
            let function+=['            return 0',
                        \  '        endif']
            let function+=['    endfor']
            if !acceptexact
                let function+=['    if !matched',
                            \  '        return 0',
                            \  '    endif']
            endif
        "▶4 Range
        else
            let date1=s:F.redate(a:opts.date[:(idx-1)])
            let acceptexact=(a:opts.date[idx+1] is# '=')
            let date2=s:F.redate(a:opts.date[(idx+2+acceptexact):])
            let selnum=max([len(date1), len(date2)])
            let selector='<'.((acceptexact)?('='):(''))
            let j=0
            if !acceptexact
                let function+=['    let matched=0']
            endif
            let function+=[
                        \'    for [spec, sel1, sel2] in ['.join(
                        \     map(filter(map(range(selnum),
                        \                    '["%".s:datechars[v:val], '.
                        \                     'get(date1, v:val, -1), '.
                        \                     'get(date2, v:val, -1)]'),
                        \                'v:val[1] isnot# -1 || '.
                        \                'v:val[2] isnot# -1'),
                        \         '"[''".v:val[0]."'', ".'.
                        \           'join(v:val[1:], ", ")."]"'), ', ').']',
                        \
                        \'        let actnum=str2nr(strftime(spec, time))',
                        \'        if ((sel1 is# -1 ? '.
                        \                '1 : '.
                        \                'sel1<actnum) && '.
                        \            '(sel2 is# -1 ? '.
                        \                '1 : '.
                        \                'actnum<sel2))',
                        \'            break',]
            if acceptexact
                let function+=['        elseif !((sel1 is# -1 ? '.
                            \                       '1 : '.
                            \                       'sel1==actnum) || '.
                            \                   '(sel2 is# -1 ? '.
                            \                       '1 : '.
                            \                       'actnum==sel2))']
            else
                let function+=['        else']
            endif
            let function+=['            return 0',
                        \  '        endif',
                        \  '    endfor']
        endif
    endif
    "▶3 File filtering
    if has_key(a:opts, 'files')
        " XXX Keep “changes” last
        let function+=map(['copies', 'renames', 'changes'],
                    \'"    let ".v:val."=self.repo.functions.getcsprop('.
                    \                        'self.repo, a:cs, ''".v:val."'')"')
        let function[-1].='[:]'
        let function+=map(['cs', 'tc'], '"    let ".v:val."files=[]"')
        let function+=['    let self.csfiles[a:cs.hex]=csfiles']
        let function+=['    if has_key(self.tocheck,a:cs.hex)',
                    \  '        let tc=remove(self.tocheck, a:cs.hex)',
                    \  '        call filter(changes, '.
                    \                      '"(index(tc, v:val)==-1)?'.
                    \                         '(1):'.
                    \                         '([0, add(csfiles, v:val)][0])")',
                    \  '        if !empty(tc)',
                    \ '            let allfiles=self.repo.functions.getcsprop('.
                    \                            'self.repo, a:cs, "allfiles")',
                    \  '            let tcfiles+=filter(copy(allfiles), '.
                    \                                  '"index(tc,v:val)!=-1")',
                    \  '        endif',
                    \  '    endif',
                    \  '    for pattern in self.filepats',
                    \  '        let newchanges=[]',
                    \  '        call map(copy(changes), '.
                    \                   '"add(((v:val=~#".string(pattern).")?'.
                    \                              '(csfiles):'.
                    \                              '(newchanges)), v:val)")',
                    \  '        if empty(newchanges)',
                    \  '            break',
                    \  '        endif',
                    \  '        let changes=newchanges',
                    \  '    endfor',
                    \  '    for file in csfiles',
                    \  '        let tcfiles+=map(filter(["renames","copies"], '.
                    \                             '"has_key({v:val}, file) && '.
                    \                              '{v:val}[file] isnot 0"), '.
                    \                            '"{v:val}[file]")',
                    \  '    endfor',
                    \  '    if !empty(tcfiles)',
                    \  '        call map(copy(a:cs.parents), '.
                    \                   '"extend(self.tocheck, '.
                    \                           '{v:val : get(self.tocheck, '.
                    \                                        'v:val, [])+'.
                    \                                    'tcfiles})")',
                    \  '    endif',
                    \  '    if empty(csfiles)',
                    \  '        return 0',
                    \  '    endif',
                    \]
    endif
    "▲3
    if empty(function)
        let s:checkcache[cid]=0
        return 0
    endif
    call insert(function, 'function r.check(cs)')
    let function+=['    return 1', 'endfunction']
    execute join(function, "\n")
    let s:checkcache[cid]=r.check
    return r
endfunction
"▶1 iterfuncs.glog
let s:iterfuncs.glog={}
let s:glogcache={}
"▶2 iterfuncs.glog.generate
function s:iterfuncs.glog.generate(repo, opts, bvar, read)
    let r={}
    "▶3 Get grapher
    if get(a:repo, 'has_octopus_merges', 1)
        let r.literfuncs=s:iterfuncs.git
    elseif get(a:repo, 'has_merges', 1)
        let r.literfuncs=s:iterfuncs.hg
    else
        let r.literfuncs=s:iterfuncs.simple
    endif
    "▶3 Initialize variables
    let r.csbuf=[]
    let reqprops=keys(a:opts.reqs)
    call filter(reqprops, 'index(a:repo.initprops, v:val)==-1')
    if !empty(reqprops)
        let r.repo=a:repo
    endif
    let a:opts.skipchangesets={}
    let skipchangesets=a:opts.skipchangesets
    let firstcs=1
    let r.lastline=0
    if a:read
        let r.lines=[]
    endif
    "▶3 Initialize variables not required for reading
    if !a:read
        let r.specials={}
        let r.rectangles=[]
        let r.csstarts={}
        let a:bvar.rectangles=r.rectangles
        let a:bvar.specials=r.specials
        let a:bvar.csstarts=r.csstarts
        let r.sd=s:iterfuncs.csshow.setup(a:bvar.procinput)
    endif
    "▶3 Initialize iterator functions
    let r.ld=r.literfuncs.start(a:repo, a:opts,
                \               [a:repo.functions.getworkhex(a:repo)])
    let csiterfuncsname=((has_key(a:opts, 'revision'))?
                \          ('ancestors'):
                \       ((has_key(a:opts, 'revrange'))?
                \          ('revrange')
                \       :
                \          ('changesets')))
    let r.csd=a:repo.iterfuncs[csiterfuncsname](a:repo, a:opts)
    let r.checkd=s:iterfuncs.check.generate(a:repo, a:opts)
    let hascheck=(r.checkd isnot 0)
    if !hascheck
        unlet r.checkd
    endif
    let r.opts=a:opts
    "▶3 Initialize variables used for progress bar
    let hasprogress=(   (   has_key(r.csd, 'csnum')
                \        || a:opts.limit)
                \    && (has_key(a:opts, 'progress')
                \           ? a:opts.progress
                \           : s:_f.getoption('showprogress')))
    if hasprogress
        let r.prevprogress=0
        let r.prevbarwidth=-1
        let r.csprocessed=0
        let r.csnum=get(r.csd, 'csnum', a:opts.limit)
        let r.oldstatusline=&l:statusline
        let b:aurum_log_progress=0
        let b:aurum_log_barwidth=0
        let b:aurum_log_reservedwidth=35
    endif
    "▶3 Try to use cache
    let cid=hascheck.hasprogress.a:read.(join(reqprops, ';'))
    if has_key(s:glogcache, cid)
        let [r.next, r.ffnext]=s:glogcache[cid]
        return r
    endif
    "▲3
    let fflines=[]
    let function=['function r.next()',
                \ '    let cs=self.csd.next()',
                \ '    if cs is 0 | return -1 | endif',]
    if hascheck
        let function+=['    let skip=!self.checkd.check(cs)',
                    \  '    if skip',
                    \  '        let self.opts.skipchangesets[cs.hex]=cs',
                    \  '        return 0',
                    \  '    else',]
        let fflines+=[len(function)-2]
    endif
    if empty(reqprops)
        if hascheck
            let fflines+=[len(function)-1]
        endif
    else
        let function+=['        call map('.string(reqprops).', '.
                \                       '"self.repo.functions.getcsprop('.
                \                                 'self.repo, cs, v:val)")']
    endif
    let fflines+=[len(function)]
    let function+=['        let self.next=self.ffnext']
    if hascheck
        let function+=['    endif',
                    \  '    let self.csbuf+=[cs]',
                    \  '    if skip | return 0 | endif',
                    \  '    for cs in self.csbuf',]
    endif
    let function+=['        let [lines, rectangle, special]='.
                \                     'self.literfuncs.proccs(self.ld, cs)']
    if a:read
        let function+=['        let self.lines+=lines']
    else
        let function+=['        if rectangle isnot 0',
                    \  '            let rectangle[0][0]=self.lastline',
                    \  '            let self.lastline+=len(lines)',
                    \  '            let rectangle[1][0]=self.lastline-1',
                    \  '            let rectangle+=[cs.hex]',
                    \  '            let self.rectangles+=[rectangle]',
                    \  '            let self.csstarts[cs.hex]=rectangle[0][0]',
                    \  '            if special isnot 0',
                    \  '                let self.specials[cs.hex]=special',
                    \  '            endif',
                    \  '        endif']
        let fflines+=[len(function), len(function)+2]
        let function+=['        if 1 | call setline(1, lines) | else',
                    \  '        call append("$", lines)',
                    \  '        endif',
                    \  '        call s:iterfuncs.csshow.next(self.sd)']
    endif
    if hasprogress
        let plprogress=(!!g:Powerline_loaded)
        let pgmul=(plprogress ? 100 : 1000)
        let reservedwidth=(plprogress ? b:aurum_log_reservedwidth : 9)
        let function+=['        let self.csprocessed+=1',
                    \  '        let progress=self.csprocessed*'.pgmul.'/'.
                    \                       'self.csnum',
                    \  '        let barwidth=self.csprocessed*'.
                    \                       '(winwidth(0)-'.reservedwidth.')/'.
                    \                       'self.csnum',
                    \  '        if progress!=self.prevprogress || '.
                    \             'barwidth!=self.prevbarwidth',]
        if plprogress
            let function+=[
                    \  '            let b:aurum_log_progress=progress',
                    \  '            let b:aurum_log_barwidth=barwidth',
                    \]
        else
            let function+=[
                    \  '            let &l:stl=printf("[%-*s] %3d.%s%%%%", '.
                    \                                'winwidth(0)-'.
                    \                                        reservedwidth.', '.
                    \                                'substitute('.
                    \                                  'repeat("=", barwidth),'.
                    \                                  '".$", ">", ""),'.
                    \                                'progress/10, '.
                    \                                'progress[-1:])',
                    \]
        endif
        let function+=['            let self.prevprogress=progress',
                    \  '            let self.prevbarwidth=barwidth',
                    \  '            redrawstatus',
                    \  '        endif']
    endif
    if hascheck
        let function+=['        unlet lines rectangle special',
                    \  '    endfor',
                    \  '    call remove(self.csbuf, 0, -1)']
    endif
    let function+=['    return 1', 'endfunction']
    let fffunction=copy(function)
    let fffunction[0]=substitute(fffunction[0], 'next', 'ffnext', '')
    call map(reverse(fflines), 'remove(fffunction, v:val)') | unlet fflines
    execute join(function, "\n")
    execute join(fffunction, "\n")
    let s:glogcache[cid]=[r.next, r.ffnext]
    return r
endfunction
"▶2 iterfuncs.glog.iterate
function s:iterfuncs.glog.iterate(...)
    let limit=a:2.limit
    let haslimit=(!!limit)
    let gd=call(s:iterfuncs.glog.generate, a:000, {})
    let r=0
    while r!=-1 && (!haslimit || limit)
        let r=gd.next()
        let limit-=r
    endwhile
    if has_key(gd, 'sd')
        call s:iterfuncs.csshow.finish(gd.sd)
    endif
    if has_key(gd, 'oldstatusline')
        let &l:stl=gd.oldstatusline
        redrawstatus
    endif
    unlet! b:aurum_log_progress b:aurum_log_barwidth b:aurum_log_width
    unlet! b:aurum_log_reservedwidth
    let bvar=a:3
    if get(bvar, 'autoaddlog', 0) && r!=-1
        let bvar.gd=gd
    endif
    return get(gd, 'lines', [])
endfunction
"▶1 addlog :: self (bvar) → + buffer
" Adds at least two screens with log messages. Returns 1 if more messages can be 
" added
function s:F.addlog()
    let bvar=self
    if !has_key(bvar, 'gd')
        return 0
    endif
    " XXX Due to procinput screen size may be changed during iteration, as well 
    " as last displayed line
    let r=0
    let gd=remove(bvar, 'gd')
    setlocal   modifiable noreadonly
    while r!=-1 && (line('$')<line('w0')+winheight(0)*2)
        let r=gd.next()
    endwhile
    setlocal nomodifiable   readonly
    if has_key(gd, 'sd')
        call s:iterfuncs.csshow.finish(gd.sd)
    endif
    if r==-1
        return 0
    else
        let bvar.gd=gd
        return 1
    endif
endfunction
"▶1 getblock :: bvar + cursor, bvar → block
"▶2 bisect :: [a], function + self → a
function s:F.bisect(list, function)
    let llist=len(a:list)
    let lborder=0
    let rborder=llist-1
    let lres=call(a:function, [a:list[lborder]], self)
    if lres<=0
        return a:list[lborder]
    endif
    let rres=call(a:function, [a:list[rborder]], self)
    if rres>=0
        return a:list[rborder]
    endif
    let totest='r'
    let cur=(((rborder+1)/2)-1)
    while lborder!=rborder
        let res=call(a:function, [a:list[cur]], self)
        if res==0
            return a:list[cur]
        else
            let shift=((rborder-lborder)/2)
            if shift==0
                let shift=1
            endif
            let {(res>0)?('l'):('r')}border=cur
            let cur=lborder+shift
        endif
    endwhile
    return a:list[lborder]
endfunction
"▶2 checkinblock :: block → -1|0|1
function s:F.checkinblock(block)
    let curline=line('.')-1
    return       ((curline<a:block[0][0])?(-1):
                \((curline>a:block[1][0])?( 1):
                \                         ( 0)))
endfunction
"▲2
function s:F.getblock(bvar)
    if empty(a:bvar.rectangles)
        call s:_f.throw('nocontents')
    endif
    return s:F.bisect(a:bvar.rectangles, s:F.checkinblock)
endfunction
"▶1 setup
function s:F.setup(read, repo, opts, ...)
    let opts=a:opts
    let bvar=get(a:000, 0, {'opts': opts})
    let bvar.getblock=s:F.getblock
    let bvar.addlog=s:F.addlog
    "▶2 Add “limit”
    if !has_key(bvar.opts, 'limit')
        let bvar.opts.limit=s:_f.getoption('loglimit')
    endif
    "▶2 Add “ignorefiles”
    let ignorefiles=(has_key(opts, 'ignfiles')?
                \               (opts.ignfiles):
                \               (s:_f.getoption('ignorefiles')))
    let opts.ignorefiles={}
    call map(copy(ignorefiles), 'extend(opts.ignorefiles, {v:val : 1})')
    unlet ignorefiles
    "▶2 Get template
    call s:_r.template.gettemplatelist(bvar)
    let [opts.reqs, opts.templatefunc]=s:_r.template.compile(bvar.templatelist,
                \                                            opts, a:repo)
    "▲2
    if !a:read
        let buf=bufnr('%')
        let bvar.procinput=(has_key(a:opts, 'procinput')?
                    \           (2*a:opts.procinput):
                    \           s:_f.getoption('procinput'))
        if bvar.procinput==1 && getchar(1)
            let bvar.procinput=0
        endif
        let bvar.autoaddlog=(has_key(a:opts, 'autoaddlog')?
                    \           a:opts.autoaddlog :
                    \           s:_f.getoption('autoaddlog')) && a:opts.limit
    endif
    let bvar.cw=s:_f.getoption('closelogwindow')
    let text=s:iterfuncs.glog.iterate(a:repo, opts, bvar, a:read)
    if a:read
        call s:_r.lineutils.setlines(text, a:read)
    elseif bufnr('%')==buf
        if bvar.autoaddlog
            augroup AuLog
                autocmd! CursorMoved <buffer>
                            \ : if line('w$')>=line('$')-winheight(0)*2
                            \ |     call s:_r.bufvars[bufnr('%')].addlog()
                            \ | endif
            augroup END
        endif
        setlocal readonly nomodifiable
    endif
    return bvar
endfunction
let s:_augroups+=['AuLog']
"▶1 branchlist
function s:F.branchlist()
    let repo=aurum#repository()
    return repo.functions.getrepoprop(repo, 'brancheslist')
endfunction
"▶1 AuLog
let s:datereg='%(\d\d%(\d\d)?|[*.])'.
            \ '%(\-%(\d\d?|[*.])'.
            \ '%(\-%(\d\d?|[*.])'.
            \ '%([ _]%(\d\d?|[*.])'.
            \ '%(\:%(\d\d?|[*.]))?)?)?)?'
let s:_aufunctions.cmd={'@FWC': ['-onlystrings '.
            \'['.s:_r.cmdutils.comp.repo.']'.
            \'{ *  ?files    '.s:_r.cmdutils.comp.file.
            \'  *  ?ignfiles in ignfiles ~start'.
            \'     ?date     match /\v[<>]?\=?'.s:datereg.'|'.
            \                       s:datereg.'\<\=?\>'.s:datereg.'/'.
            \'     ?search   isreg'.
            \'     ?user     isreg'.
            \'     ?branch   type ""'.
            \' ! +1?limit    range 1 inf'.
            \'     ?revision '.s:_r.cmdutils.comp.rev.
            \'   +2?revrange '.join(repeat([s:_r.cmdutils.comp.rev], 2)).
            \'     ?style    in _r.template.tlist'.
            \'     ?template idof variable'.
            \' !   ?merges'.
            \' !   ?patch'.
            \' !   ?stat'.
            \' !   ?showfiles'.
            \' !   ?showrenames'.
            \' !   ?showcopies'.
            \' !   ?procinput'.
            \' !   ?autoaddlog'.
            \' !   ?progress'.
            \s:_r.cmdutils.comp.diffopts.
            \'    ?cmd      '.s:_r.cmdutils.comp.cmd.
            \'}', 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \[['\vbranch\s+\Vtype ""', 'branch in *F.branchlist', '']],
            \s:_f.fwc.compile)
function s:_aufunctions.cmd.function(repopath, opts)
    let opts=copy(a:opts)
    if has_key(opts, 'files')
        if opts.files[0] is# ':'
            let curfile=s:_r.cmdutils.getrrf(opts, 'nocurf', 'getfile')[3]
            if curfile is 0
                call remove(opts.files, 0)
            else
                let opts.files[0]=s:_r.cmdutils.globescape(curfile)
            endif
        endif
        if a:repopath is# ':'
            let repo=s:_r.cmdutils.checkedgetrepo(opts.files[0])
        else
            let repo=s:_r.cmdutils.checkedgetrepo(a:repopath)
        endif
        call map(opts.files, 'repo.functions.reltorepo(repo, v:val)')
    else
        let repo=s:_r.cmdutils.checkedgetrepo(a:repopath)
    endif
    if has_key(opts, 'cmd')
        let cmd=remove(opts, 'cmd')
    else
        let cmd='silent new'
    endif
    call s:_r.run(cmd, 'log', repo, opts)
    if !has_key(opts, 'cmd')
        setlocal bufhidden=wipe
    endif
endfunction
"▶1 aurum://log
call s:_f.newcommand({
            \'function': s:F.setup,
            \ 'options': {'list': ['files', 'revrange', 'ignfiles'],
            \             'bool': ['merges', 'patch', 'stat', 'showfiles',
            \                      'showrenames', 'showcopies', 'procinput',
            \                      'autoaddlog'],
            \              'num': ['limit']+s:_r.cmdutils.diffopts,
            \              'str': ['date', 'search', 'user', 'branch',
            \                      'revision', 'style', 'template',
            \                      'crrestrict'],
            \             'pats': ['files'],
            \            },
            \'filetype': 'aurumlog',
            \'requiresbvar': 1,
            \})
"▶1
call frawor#Lockvar(s:, '_r,checkcache,glogcache')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
