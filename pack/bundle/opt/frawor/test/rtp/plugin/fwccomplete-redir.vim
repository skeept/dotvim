execute frawor#Setup('0.0', {'@/fwc': '0.0',
            \                '@/os':  '0.0'})
let os=s:_r.os
let i=1
let j=1
let sections=[]
let prevsections=[]
let toexecute=''
let args=[]
let FWC=''
let FWCtype=''
function ToList(line)
    if a:line[0] is# '='
        return eval(a:line[1:])
    else
        if a:line[-1:] is# '+'
            return split(a:line[:-2])+['']
        else
            return split(a:line)
        endif
    endif
endfunction
for line in readfile('fwccompletetests-withredir.dat')
    let line=substitute(line, '^\s*', '', '')
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
        let toexecute=''
        continue
    elseif line[0] is# '\'
        let toexecute.="\n".line[1:]
        continue
    elseif line[0] is# '@'
        let args=[ToList(line[1:])]
        continue
    elseif line[0] is# '`'
        let FWC=line[1:]
        continue
    elseif line[0] is# '+'
        let FWC.=line[1:]
        continue
    elseif line[0] is# '!'
        let FWCtype=line[1:]
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
    let compargs=[FWC, FWCtype]
    let result=ToList(line)
    if !empty($DEBUGTEST)
        debug let ChFunc=call(s:_f.fwc.compile, compargs, {})[0]
        debug let realres=call(ChFunc, copy(args), {})
    else
        let ChFunc=call(s:_f.fwc.compile, compargs, {})[0]
        let realres=call(ChFunc, copy(args), {})
    endif
    if type(realres)!=type(result) || realres!=result
        echom '[[[ Test #'.i.'('.j.') '.
                    \'in section <'.join(sections, '/').'> failed:'
        echom 'expected '.string(result).','
        echom 'but got  '.string(realres)
        echom 'Checked arguments: '.string(args)
        echom 'FWC string: '.compargs[0]
        echom 'Check type: '.compargs[1]
        function g:.ChFunc
        echom ']]]'
        break
    endif
    let i+=1
    let j+=1
    unlet realres result
endfor
" vim: fmr=▶,▲
