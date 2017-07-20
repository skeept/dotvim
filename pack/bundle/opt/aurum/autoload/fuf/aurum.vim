"▶1 
execute frawor#Setup('0.0', {})
let s:_messages={
            \'invcall': 'Invalid call. You must call '.
            \           'fuf#aurum#setAuVars() first',
        \}
"▶1 Global functions
function fuf#aurum#createHandler(base)
    if !exists('s:vars')
        call s:_f.throw('invcall')
    endif
    let handler=copy(s:handler)
    let handler._aurum=s:vars
    unlet s:vars
    return a:base.concretize(handler)
endfunction
let s:_functions+=['fuf#aurum#createHandler']
function fuf#aurum#getSwitchOrder()
    return -1
endfunction
let s:_functions+=['fuf#aurum#getSwitchOrder']
function fuf#aurum#getEditableDataNames()
    return []
endfunction
let s:_functions+=['fuf#aurum#getEditableDataNames']
function fuf#aurum#renewCache()
endfunction
let s:_functions+=['fuf#aurum#renewCache']
function fuf#aurum#requiresOnCommandPre()
    return 0
endfunction
let s:_functions+=['fuf#aurum#requiresOnCommandPre']
function fuf#aurum#onInit()
endfunction
let s:_functions+=['fuf#aurum#onInit']
function fuf#aurum#setAuVars(vars)
    let s:vars=a:vars
endfunction
let s:_functions+=['fuf#aurum#setAuVars']
"▶1 s:handler
let s:handler={}
function s:handler.getModeName()
    return 'changeset files'
endfunction
function s:handler.getPrompt()
    return fuf#formatPrompt('>Changeset file[]>', self.partialMatching, '')
endfunction
function s:handler.getPreviewHeight()
    return g:fuf_previewHeight
endfunction
function s:handler.isOpenable(enteredPattern)
    return 1
endfunction
function s:handler.makePatternSet(patternBase)
    return fuf#makePatternSet(a:patternBase, 's:interpretPrimaryPatternForPath',
                \             self.partialMatching)
endfunction
function s:handler.makePreviewLines(word, count)
    let lines=call(self._aurum.pvargs[0], [a:word]+self._aurum.pvargs[1:], {})
    return fuf#makePreviewLinesAround(lines, [], a:count,
                \                     self.getPreviewHeight())
endfunction
function s:handler.getCompleteItems(patternPrimary)
    return self.items
endfunction
function s:handler.onOpen(word, mode)
    return call(self._aurum.cbargs[0], [a:word]+self._aurum.cbargs[1:], {})
endfunction
function s:handler.onModeEnterPre()
endfunction
function s:handler.onModeEnterPost()
    let self.items=map(copy(self._aurum.files),
                \      'extend(fuf#makePathItem(v:val, "", 0), '.
                \              '{"index": v:key+1})')
    let self.items=fuf#mapToSetAbbrWithSnippedWordAsPath(self.items)
endfunction
function s:handler.onModeLeavePost(opened)
endfunction
"▶1 
call frawor#Lockvar(s:, '')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
