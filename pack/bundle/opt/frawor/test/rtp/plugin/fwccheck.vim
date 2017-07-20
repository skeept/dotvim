execute frawor#Setup('0.0', {'@/fwc': '0.0',
            \                '@/os':  '0.0'})
let os=s:_r.os
let i=1
let j=1
let sections=[]
let prevsections=[]
let toexecute=""
for line in readfile('fwctests.dat')
    if empty(line)
        continue
    elseif line[0] is# '#'
        if char2nr(line[1:])==0x25b6
            let level=+line[4:]
            if level<=len(sections)
                call remove(sections, level-1, -1)
            endif
            call add(sections, line[4+len(level)+1:])
            let i=1
        endif
        continue
    elseif line[0] is# ':'
        execute toexecute."\n".line[1:]
        let toexecute=""
        continue
    elseif line[0] is# '\'
        let toexecute.="\n".line[1:]
        continue
    elseif       (!empty($DEBUGTEST) && j!=$DEBUGTEST) ||
                \(!empty($STARTFROM) && j<$STARTFROM)
        let i+=1
        let j+=1
        continue
    endif
    if prevsections!=#sections
        let prevsections=copy(sections)
        echom '::: Section <'.join(sections, '/').'>'
    endif
    let [compargs, arg, result]=eval('['.line.']')
    let savedarg=deepcopy(arg)
    if !empty($DEBUGTEST)
        debug let ChFunc=call(s:_f.fwc.compile, compargs, {})[0]
        debug let realres=call(ChFunc, [arg], {})
    else
        let ChFunc=call(s:_f.fwc.compile, compargs, {})[0]
        let realres=call(ChFunc, [arg], {})
    endif
    if type(realres)!=type(result) || realres!=result
        echom '[[[ Test #'.i.'('.j.') '.
                    \'in section <'.join(sections, '/').'> failed:'
        echom 'expected '.string(result).','
        echom 'but got  '.string(realres)
        echom 'Checked arguments: '.string(savedarg)
        echom 'FWC string: '.compargs[0]
        echom 'Check type: '.compargs[1]
        function g:.ChFunc
        echom ']]]'
        break
    endif
    let i+=1
    let j+=1
    unlet realres result arg savedarg
endfor
" vim: fmr=▶,▲
