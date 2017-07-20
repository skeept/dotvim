let s:vexpr='((exists("@@@"))?(string(@@@)):("undef"))'
let s:wexpr = '["pl: ".'.substitute(s:vexpr, '@@@', 's:_pluginloaded', 'g')
            \.'," l: ".'.substitute(s:vexpr, '@@@', 's:_loading',      'g').']'
if exists('s:_pluginloaded')
    call WriteFile(['Second run: ']+eval(s:wexpr))
else
    call WriteFile(['Before registration: ']+eval(s:wexpr))
endif
execute frawor#Setup('0.0', {})
call WriteFile(['After registration: ']+eval(s:wexpr))
