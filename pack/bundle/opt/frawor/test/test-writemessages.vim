redir => s:var
messages
redir END
let s:messages=split(s:var, "\n")[1:]
if !empty(s:messages) && s:messages!=#[s:exception]
    call map(s:messages, 'PurgeFrawor(v:val)')
    call WriteFile(['>>> '.s:testprefix.'messages']+s:messages+['<<< messages'])
endif
unlet s:messages s:var s:exception s:testprefix
