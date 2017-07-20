"▶1
scriptencoding utf-8
execute frawor#Setup('0.0', {'@/resources': '0.0',})
let s:xml={}
"▶1 messages
let s:_messages={
            \ 'allblanks': 'No non-blank characters found',
            \'tstartnfnd': 'Expected tag start (“<tagname”), but got “%s”',
            \  'tendnfnd': 'Expected tag end (“>”), but got “%s”',
            \  'ctagnfnd': 'Expected “%s”, but got “%s”',
            \     'ctend': 'Expected “%s”, but got nothing',
            \     'ttend': 'Expected tag end, but got nothing',
        \}
"▶1 new :: [String] → xml
function s:F.new(lines)
    let xml=deepcopy(s:xml)
    let xml.lines=copy(a:lines)
    let xml.tags=[]
    return xml
endfunction
"▶1 skipws :: &
function s:xml.skipws()
    try
        while self.lines[0]!~#'\S'
            call remove(self.lines, 0)
        endwhile
        let self.lines[0]=substitute(self.lines[0], '\v^\s+', '', '')
    catch /\m^Vim(\l*):E684:/
        call s:_f.throw('allblanks')
    endtry
endfunction
"▶1 decodeentities :: String → String
let s:entities={
            \  'lt': '<',
            \  'gt': '>',
            \ 'amp': '&',
            \'quot': '"',
        \}
function s:F.decodeentities(s)
    return substitute(a:s, '\v\&([lg]t|amp)\;', '\=s:entities[submatch(1)]','g')
endfunction
"▶1 skip :: &(len)
function s:xml.skip(len)
    let self.lines[0]=self.lines[0][(a:len):]
    return self.skipws()
endfunction
"▶1 parsetag :: & → (tagname, attributes)
" Assumes that tag names have only alphabetic characters
function s:xml.parsetag()
    call self.skipws()
    let m=matchlist(self.lines[0], '\v\<(\a+)')[:1]
    if empty(m)
        call s:_f.throw('tstartnfnd', self.lines[0])
    endif
    let [match, tagname]=m
    let self.tags+=[tagname]
    call self.skip(len(match))
    let attributes={}
    while 1
        let m=matchlist(self.lines[0], '\v^([a-zA-Z0-9_\-]+)\=\"(.{-})\"')[:2]
        if empty(m)
            break
        endif
        let [match, attrname, attrval]=m
        call self.skip(len(match))
        let attributes[attrname]=s:F.decodeentities(attrval)
    endwhile
    if self.lines[0][0] isnot# '>'
        call s:_f.throw('tendnfnd', self.lines[0])
    endif
    let self.lines[0]=self.lines[0][1:]
    return [tagname, attributes]
endfunction
"▶1 checkctag :: & → Bool
function s:xml.checkctag()
    return (!empty(self.lines) && self.lines[0][:1] is# '</')
endfunction
"▶1 skipctag :: &
function s:xml.skipctag()
    let tagname=remove(self.tags, -1)
    let e='</'.tagname.'>'
    let le=len(e)
    try
        if self.lines[0][:(le)] isnot# e
            call s:_f.throw('ctagnfnd', e, self.lines[0])
        endif
        let self.lines[0]=self.lines[0][(le):]
    catch /\m^Vim(\l*):E684:/
        call s:_f.throw('ctend', e)
    endtry
endfunction
"▶1 parsetextintag :: & → text
function s:xml.parsetextintag()
    try
        let text=[]
        while 1
            let idx=stridx(self.lines[0], '<')
            if idx!=-1
                break
            endif
            let text+=remove(self.lines, 0, 0)
        endwhile
        if idx
            let text+=[self.lines[0][:(idx-1)]]
            let self.lines[0]=self.lines[0][(idx):]
        else
            let text+=['']
        endif
        call map(text, 's:F.decodeentities(v:val)')
        call self.skipctag()
        return text
    catch /\m^Vim(\l*):E684:/
        call s:_f.throw('ttend')
    endtry
endfunction
"▶1 post resource
call s:_f.postresource('xml', {'new': s:F.new,
            \       'decodeentities': s:F.decodeentities})
"▶1
call frawor#Lockvar(s:, '_pluginloaded')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
