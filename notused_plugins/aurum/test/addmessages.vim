redir => s:messages
messages
redir END
let s:meslines=split(s:messages, "\n")[1:]
if !empty(s:meslines)
    call WriteFile(['>>> Messages:']+
                \  s:meslines+
                \  ['<<< Messages^'])
endif
