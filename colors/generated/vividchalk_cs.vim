" This scheme was created by CSApproxSnapshot
" on Thu, 27 May 2010

hi clear
if exists("syntax_on")
    syntax reset
endif

if v:version < 700
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" substitute(substitute(<q-args>, "undercurl", "underline", "g"), "guisp\\S\\+", "", "g")
else
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" <q-args>
endif

if 0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_konsole") && g:CSApprox_konsole) || &term =~? "^konsole"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=Black guifg=#EEEEEE
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=104 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=118 gui=NONE guibg=bg guifg=#66FF00
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#404040
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=238 gui=bold guibg=bg guifg=#404040
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=fg gui=NONE guibg=Red guifg=fg
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=Black guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=240 ctermfg=fg gui=NONE guibg=#555555 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=34 gui=bold guibg=bg guifg=#00AA00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=195 gui=NONE guibg=#222222 guifg=#DDEEFF
    CSAHi rubyMethod term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#DDE93D
    CSAHi Pmenu term=NONE cterm=bold ctermbg=19 ctermfg=231 gui=bold guibg=#000099 guifg=White
    CSAHi PmenuSel term=NONE cterm=bold ctermbg=105 ctermfg=231 gui=bold guibg=#5555ff guifg=White
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=231 gui=reverse guibg=White guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=59 ctermfg=250 gui=underline guibg=#333333 guifg=#bbbbbb
    CSAHi TabLineSel term=bold cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=Black guifg=White
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=244 ctermfg=250 gui=underline guibg=#808080 guifg=#bbbbbb
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#333333 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#333333 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#aabbee guifg=Black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=248 ctermfg=238 gui=NONE guibg=#aaaaaa guifg=#444444
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#555577 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=#ffff00 guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=18 ctermfg=153 gui=NONE guibg=#110077 guifg=#aaddee
    CSAHi Regexp term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#44B4CC
    CSAHi railsUserClass term=NONE cterm=NONE ctermbg=bg ctermfg=248 gui=italic guibg=bg guifg=#AAAAAA
    CSAHi railsUserMethod term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=italic guibg=bg guifg=#AACCFF
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=134 gui=italic guibg=bg guifg=#9933CC
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#339999
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=70 gui=NONE guibg=bg guifg=#33AA00
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=#FFCC00
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#FF6600
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#AAFFFF
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=#AAAA77
    CSAHi rubyNumber term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#CCFF33
    CSAHi rubyString term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=Black guifg=#EEEEEE
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=105 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=118 gui=NONE guibg=bg guifg=#66FF00
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#404040
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=238 gui=bold guibg=bg guifg=#404040
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=fg gui=NONE guibg=Red guifg=fg
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=Black guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#555555 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=40 gui=bold guibg=bg guifg=#00AA00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=231 gui=NONE guibg=#222222 guifg=#DDEEFF
    CSAHi rubyMethod term=NONE cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#DDE93D
    CSAHi Pmenu term=NONE cterm=bold ctermbg=20 ctermfg=255 gui=bold guibg=#000099 guifg=White
    CSAHi PmenuSel term=NONE cterm=bold ctermbg=105 ctermfg=255 gui=bold guibg=#5555ff guifg=White
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=255 gui=reverse guibg=White guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=236 ctermfg=250 gui=underline guibg=#333333 guifg=#bbbbbb
    CSAHi TabLineSel term=bold cterm=bold ctermbg=16 ctermfg=255 gui=bold guibg=Black guifg=White
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=244 ctermfg=250 gui=underline guibg=#808080 guifg=#bbbbbb
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#333333 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#333333 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=189 ctermfg=16 gui=bold guibg=#aabbee guifg=Black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=238 gui=NONE guibg=#aaaaaa guifg=#444444
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=103 ctermfg=fg gui=NONE guibg=#555577 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=#ffff00 guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=19 ctermfg=195 gui=NONE guibg=#110077 guifg=#aaddee
    CSAHi Regexp term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#44B4CC
    CSAHi railsUserClass term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=italic guibg=bg guifg=#AAAAAA
    CSAHi railsUserMethod term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=italic guibg=bg guifg=#AACCFF
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=171 gui=italic guibg=bg guifg=#9933CC
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#339999
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#33AA00
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#FFCC00
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#FF6600
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#AAFFFF
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#AAAA77
    CSAHi rubyNumber term=NONE cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#CCFF33
    CSAHi rubyString term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=231 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=Black guifg=#EEEEEE
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=62 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=82 gui=NONE guibg=bg guifg=#66FF00
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#404040
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=238 gui=bold guibg=bg guifg=#404040
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=fg gui=NONE guibg=Red guifg=fg
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=Black guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=240 ctermfg=fg gui=NONE guibg=#555555 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=34 gui=bold guibg=bg guifg=#00AA00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=195 gui=NONE guibg=#222222 guifg=#DDEEFF
    CSAHi rubyMethod term=NONE cterm=NONE ctermbg=bg ctermfg=185 gui=NONE guibg=bg guifg=#DDE93D
    CSAHi Pmenu term=NONE cterm=bold ctermbg=18 ctermfg=231 gui=bold guibg=#000099 guifg=White
    CSAHi PmenuSel term=NONE cterm=bold ctermbg=63 ctermfg=231 gui=bold guibg=#5555ff guifg=White
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=231 gui=reverse guibg=White guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=236 ctermfg=250 gui=underline guibg=#333333 guifg=#bbbbbb
    CSAHi TabLineSel term=bold cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=Black guifg=White
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=244 ctermfg=250 gui=underline guibg=#808080 guifg=#bbbbbb
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#333333 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#333333 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=147 ctermfg=16 gui=bold guibg=#aabbee guifg=Black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=248 ctermfg=238 gui=NONE guibg=#aaaaaa guifg=#444444
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#555577 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=#ffff00 guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=18 ctermfg=153 gui=NONE guibg=#110077 guifg=#aaddee
    CSAHi Regexp term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#44B4CC
    CSAHi railsUserClass term=NONE cterm=NONE ctermbg=bg ctermfg=248 gui=italic guibg=bg guifg=#AAAAAA
    CSAHi railsUserMethod term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=italic guibg=bg guifg=#AACCFF
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=98 gui=italic guibg=bg guifg=#9933CC
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=#339999
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=70 gui=NONE guibg=bg guifg=#33AA00
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=#FFCC00
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=202 gui=NONE guibg=bg guifg=#FF6600
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#AAFFFF
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=#AAAA77
    CSAHi rubyNumber term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#CCFF33
    CSAHi rubyString term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=152 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=195 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=Black guifg=#EEEEEE
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=19 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=44 gui=NONE guibg=bg guifg=#66FF00
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#404040
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=80 gui=bold guibg=bg guifg=#404040
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=fg gui=NONE guibg=Red guifg=fg
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=Black guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=81 ctermfg=fg gui=NONE guibg=#555555 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=#00AA00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=80 ctermfg=63 gui=NONE guibg=#222222 guifg=#DDEEFF
    CSAHi rubyMethod term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#DDE93D
    CSAHi Pmenu term=NONE cterm=bold ctermbg=17 ctermfg=79 gui=bold guibg=#000099 guifg=White
    CSAHi PmenuSel term=NONE cterm=bold ctermbg=39 ctermfg=79 gui=bold guibg=#5555ff guifg=White
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=87 ctermfg=79 gui=reverse guibg=White guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=80 ctermfg=85 gui=underline guibg=#333333 guifg=#bbbbbb
    CSAHi TabLineSel term=bold cterm=bold ctermbg=16 ctermfg=79 gui=bold guibg=Black guifg=White
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=83 ctermfg=85 gui=underline guibg=#808080 guifg=#bbbbbb
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#333333 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#333333 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=43 ctermfg=16 gui=bold guibg=#aabbee guifg=Black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=84 ctermfg=80 gui=NONE guibg=#aaaaaa guifg=#444444
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=87 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#555577 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=76 ctermfg=16 gui=bold guibg=#ffff00 guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=17 ctermfg=43 gui=NONE guibg=#110077 guifg=#aaddee
    CSAHi Regexp term=NONE cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#44B4CC
    CSAHi railsUserClass term=NONE cterm=NONE ctermbg=bg ctermfg=84 gui=italic guibg=bg guifg=#AAAAAA
    CSAHi railsUserMethod term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=italic guibg=bg guifg=#AACCFF
    CSAHi lCursor term=NONE cterm=NONE ctermbg=87 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=34 gui=italic guibg=bg guifg=#9933CC
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#339999
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=#33AA00
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#FFCC00
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#FF6600
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=47 gui=NONE guibg=bg guifg=#AAFFFF
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#AAAA77
    CSAHi rubyNumber term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#CCFF33
    CSAHi rubyString term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=63 ctermfg=19 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=64 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
