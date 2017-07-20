if !exists('g:testcmd')
    let s:testcmd='call FraworLoad(g:testfile[:-5])'
else
    let s:testcmd=g:testcmd.' '.fnameescape(g:testfile)
endif
let s:testprefix=substitute(g:testfile,
            \'^\Vplugin/'.escape(g:curtest,'\'), '', '')[:-5]
if !empty(s:testprefix)
    let s:testprefix.=': '
endif
let s:exception=""
try
    execute s:testcmd
catch /^Frawor:/
    let s:exception=v:exception
    call WriteFile(s:testprefix.PurgeFrawor(v:exception))
endtry
redir => s:var
messages
redir END
let s:messages=split(s:var, "\n")[1:]
if !empty(s:messages) && s:messages!=#[s:exception]
    call map(s:messages, 'PurgeFrawor(v:val)')
    call WriteFile(['>>> '.s:testprefix.'messages']+s:messages+['<<< messages'])
endif
unlet s:messages s:var s:exception s:testprefix
