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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi jinjaSpecial term=NONE cterm=NONE ctermbg=230 ctermfg=39 gui=NONE guibg=#fbf4c7 guifg=#008ffd
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=104 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=#d40000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=194 ctermfg=160 gui=bold guibg=#dbf3cd guifg=#e50808
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#0086d2
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#0086f7
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff0086
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=189 ctermfg=74 gui=bold guibg=#b7dce8 guifg=#438ec3
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=109 ctermfg=229 gui=reverse guibg=#f0e68c guifg=#708090
    CSAHi Search term=reverse cterm=NONE ctermbg=214 ctermfg=124 gui=NONE guibg=#ffae00 guifg=#800000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=74 ctermfg=255 gui=bold guibg=#438ec3 guifg=#eeeeee
    CSAHi jinjaComment term=NONE cterm=NONE ctermbg=22 ctermfg=34 gui=italic guibg=#002300 guifg=#008800
    CSAHi jinjaFilter term=NONE cterm=NONE ctermbg=230 ctermfg=199 gui=NONE guibg=#fbf4c7 guifg=#ff0086
    CSAHi pythonBuiltinObj term=NONE cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=#2b6ba2
    CSAHi pythonBuiltinFunc term=NONE cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=#2b6ba2
    CSAHi pythonException term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ee0000
    CSAHi pythonExClass term=NONE cterm=NONE ctermbg=bg ctermfg=114 gui=NONE guibg=bg guifg=#66cd66
    CSAHi pythonDocTest term=NONE cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#2f5f49
    CSAHi pythonDocTest2 term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#3b916a
    CSAHi pythonFunction term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ee0000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=167 ctermfg=231 gui=NONE guibg=#cb2f27 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=189 ctermfg=fg gui=NONE guibg=#c0d9eb guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi pythonRun term=NONE cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff0086
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff0086
    CSAHi pythonCoding term=NONE cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff0086
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=78 ctermfg=231 gui=bold guibg=#43c464 guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=151 ctermfg=108 gui=reverse guibg=#51b069 guifg=#9bd4a9
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=73 ctermfg=73 gui=reverse guibg=#3687a2 guifg=#3687a2
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=189 ctermfg=67 gui=NONE guibg=#c3daea guifg=#3c78a2
    CSAHi jinjaRaw term=NONE cterm=NONE ctermbg=230 ctermfg=248 gui=NONE guibg=#fbf4c7 guifg=#aaaaaa
    CSAHi jinjaOperator term=NONE cterm=NONE ctermbg=230 ctermfg=231 gui=NONE guibg=#fbf4c7 guifg=#ffffff
    CSAHi jinjaVariable term=NONE cterm=NONE ctermbg=230 ctermfg=149 gui=NONE guibg=#fbf4c7 guifg=#92cd35
    CSAHi jinjaAttribute term=NONE cterm=NONE ctermbg=230 ctermfg=172 gui=NONE guibg=#fbf4c7 guifg=#dd7700
    CSAHi htmlSpecialTagName term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#4aa04a
    CSAHi htmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#4aa04a
    CSAHi htmlTagN term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#4aa04a
    CSAHi jinjaTagBlock term=NONE cterm=bold ctermbg=230 ctermfg=196 gui=bold guibg=#fbf4c7 guifg=#ff0007
    CSAHi jinjaVarBlock term=NONE cterm=NONE ctermbg=230 ctermfg=196 gui=NONE guibg=#fbf4c7 guifg=#ff0007
    CSAHi jinjaString term=NONE cterm=NONE ctermbg=230 ctermfg=38 gui=NONE guibg=#fbf4c7 guifg=#0086d2
    CSAHi jinjaNumber term=NONE cterm=bold ctermbg=230 ctermfg=161 gui=bold guibg=#fbf4c7 guifg=#bf0945
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=#22a21f
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#0086d2
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=#fd8900
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff0086
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=208 gui=bold guibg=bg guifg=#fb660a
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0007
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=102 gui=bold guibg=bg guifg=#70796b
    CSAHi jinjaStatement term=NONE cterm=bold ctermbg=230 ctermfg=208 gui=bold guibg=#fbf4c7 guifg=#fb660a
    CSAHi pythonClass term=NONE cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff0086
    CSAHi htmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#00bdec
    CSAHi htmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#00bdec
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=153 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=195 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi jinjaSpecial term=NONE cterm=NONE ctermbg=231 ctermfg=39 gui=NONE guibg=#fbf4c7 guifg=#008ffd
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=105 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#d40000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=231 ctermfg=196 gui=bold guibg=#dbf3cd guifg=#e50808
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#0086d2
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#0086f7
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff0086
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=195 ctermfg=111 gui=bold guibg=#b7dce8 guifg=#438ec3
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=145 ctermfg=229 gui=reverse guibg=#f0e68c guifg=#708090
    CSAHi Search term=reverse cterm=NONE ctermbg=220 ctermfg=124 gui=NONE guibg=#ffae00 guifg=#800000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=111 ctermfg=255 gui=bold guibg=#438ec3 guifg=#eeeeee
    CSAHi jinjaComment term=NONE cterm=NONE ctermbg=22 ctermfg=34 gui=italic guibg=#002300 guifg=#008800
    CSAHi jinjaFilter term=NONE cterm=NONE ctermbg=231 ctermfg=199 gui=NONE guibg=#fbf4c7 guifg=#ff0086
    CSAHi pythonBuiltinObj term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#2b6ba2
    CSAHi pythonBuiltinFunc term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#2b6ba2
    CSAHi pythonException term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ee0000
    CSAHi pythonExClass term=NONE cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=#66cd66
    CSAHi pythonDocTest term=NONE cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=#2f5f49
    CSAHi pythonDocTest2 term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#3b916a
    CSAHi pythonFunction term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ee0000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=203 ctermfg=255 gui=NONE guibg=#cb2f27 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#c0d9eb guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=fg guifg=bg
    CSAHi pythonRun term=NONE cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff0086
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff0086
    CSAHi pythonCoding term=NONE cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff0086
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=120 ctermfg=255 gui=bold guibg=#43c464 guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=194 ctermfg=114 gui=reverse guibg=#51b069 guifg=#9bd4a9
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=74 ctermfg=74 gui=reverse guibg=#3687a2 guifg=#3687a2
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi Visual term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=74 gui=NONE guibg=#c3daea guifg=#3c78a2
    CSAHi jinjaRaw term=NONE cterm=NONE ctermbg=231 ctermfg=188 gui=NONE guibg=#fbf4c7 guifg=#aaaaaa
    CSAHi jinjaOperator term=NONE cterm=NONE ctermbg=231 ctermfg=255 gui=NONE guibg=#fbf4c7 guifg=#ffffff
    CSAHi jinjaVariable term=NONE cterm=NONE ctermbg=231 ctermfg=155 gui=NONE guibg=#fbf4c7 guifg=#92cd35
    CSAHi jinjaAttribute term=NONE cterm=NONE ctermbg=231 ctermfg=214 gui=NONE guibg=#fbf4c7 guifg=#dd7700
    CSAHi htmlSpecialTagName term=NONE cterm=NONE ctermbg=bg ctermfg=114 gui=NONE guibg=bg guifg=#4aa04a
    CSAHi htmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=114 gui=NONE guibg=bg guifg=#4aa04a
    CSAHi htmlTagN term=NONE cterm=NONE ctermbg=bg ctermfg=114 gui=NONE guibg=bg guifg=#4aa04a
    CSAHi jinjaTagBlock term=NONE cterm=bold ctermbg=231 ctermfg=196 gui=bold guibg=#fbf4c7 guifg=#ff0007
    CSAHi jinjaVarBlock term=NONE cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=#fbf4c7 guifg=#ff0007
    CSAHi jinjaString term=NONE cterm=NONE ctermbg=231 ctermfg=39 gui=NONE guibg=#fbf4c7 guifg=#0086d2
    CSAHi jinjaNumber term=NONE cterm=bold ctermbg=231 ctermfg=162 gui=bold guibg=#fbf4c7 guifg=#bf0945
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=#22a21f
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#0086d2
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=#fd8900
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff0086
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=208 gui=bold guibg=bg guifg=#fb660a
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0007
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=145 gui=bold guibg=bg guifg=#70796b
    CSAHi jinjaStatement term=NONE cterm=bold ctermbg=231 ctermfg=208 gui=bold guibg=#fbf4c7 guifg=#fb660a
    CSAHi pythonClass term=NONE cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff0086
    CSAHi htmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#00bdec
    CSAHi htmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#00bdec
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi jinjaSpecial term=NONE cterm=NONE ctermbg=230 ctermfg=33 gui=NONE guibg=#fbf4c7 guifg=#008ffd
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=62 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=#d40000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=194 ctermfg=160 gui=bold guibg=#dbf3cd guifg=#e50808
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#0086d2
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#0086f7
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=198 gui=NONE guibg=bg guifg=#ff0086
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=152 ctermfg=67 gui=bold guibg=#b7dce8 guifg=#438ec3
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=66 ctermfg=222 gui=reverse guibg=#f0e68c guifg=#708090
    CSAHi Search term=reverse cterm=NONE ctermbg=214 ctermfg=88 gui=NONE guibg=#ffae00 guifg=#800000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=67 ctermfg=255 gui=bold guibg=#438ec3 guifg=#eeeeee
    CSAHi jinjaComment term=NONE cterm=NONE ctermbg=16 ctermfg=28 gui=italic guibg=#002300 guifg=#008800
    CSAHi jinjaFilter term=NONE cterm=NONE ctermbg=230 ctermfg=198 gui=NONE guibg=#fbf4c7 guifg=#ff0086
    CSAHi pythonBuiltinObj term=NONE cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=#2b6ba2
    CSAHi pythonBuiltinFunc term=NONE cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=#2b6ba2
    CSAHi pythonException term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ee0000
    CSAHi pythonExClass term=NONE cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#66cd66
    CSAHi pythonDocTest term=NONE cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#2f5f49
    CSAHi pythonDocTest2 term=NONE cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#3b916a
    CSAHi pythonFunction term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ee0000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=#cb2f27 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=152 ctermfg=fg gui=NONE guibg=#c0d9eb guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi pythonRun term=NONE cterm=NONE ctermbg=bg ctermfg=198 gui=NONE guibg=bg guifg=#ff0086
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=198 gui=NONE guibg=bg guifg=#ff0086
    CSAHi pythonCoding term=NONE cterm=NONE ctermbg=bg ctermfg=198 gui=NONE guibg=bg guifg=#ff0086
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=77 ctermfg=231 gui=bold guibg=#43c464 guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=115 ctermfg=71 gui=reverse guibg=#51b069 guifg=#9bd4a9
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=67 ctermfg=67 gui=reverse guibg=#3687a2 guifg=#3687a2
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=152 ctermfg=67 gui=NONE guibg=#c3daea guifg=#3c78a2
    CSAHi jinjaRaw term=NONE cterm=NONE ctermbg=230 ctermfg=248 gui=NONE guibg=#fbf4c7 guifg=#aaaaaa
    CSAHi jinjaOperator term=NONE cterm=NONE ctermbg=230 ctermfg=231 gui=NONE guibg=#fbf4c7 guifg=#ffffff
    CSAHi jinjaVariable term=NONE cterm=NONE ctermbg=230 ctermfg=113 gui=NONE guibg=#fbf4c7 guifg=#92cd35
    CSAHi jinjaAttribute term=NONE cterm=NONE ctermbg=230 ctermfg=172 gui=NONE guibg=#fbf4c7 guifg=#dd7700
    CSAHi htmlSpecialTagName term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#4aa04a
    CSAHi htmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#4aa04a
    CSAHi htmlTagN term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#4aa04a
    CSAHi jinjaTagBlock term=NONE cterm=bold ctermbg=230 ctermfg=196 gui=bold guibg=#fbf4c7 guifg=#ff0007
    CSAHi jinjaVarBlock term=NONE cterm=NONE ctermbg=230 ctermfg=196 gui=NONE guibg=#fbf4c7 guifg=#ff0007
    CSAHi jinjaString term=NONE cterm=NONE ctermbg=230 ctermfg=32 gui=NONE guibg=#fbf4c7 guifg=#0086d2
    CSAHi jinjaNumber term=NONE cterm=bold ctermbg=230 ctermfg=125 gui=bold guibg=#fbf4c7 guifg=#bf0945
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=bold ctermbg=bg ctermfg=34 gui=bold guibg=bg guifg=#22a21f
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#0086d2
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#fd8900
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=198 gui=NONE guibg=bg guifg=#ff0086
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=202 gui=bold guibg=bg guifg=#fb660a
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0007
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=65 gui=bold guibg=bg guifg=#70796b
    CSAHi jinjaStatement term=NONE cterm=bold ctermbg=230 ctermfg=202 gui=bold guibg=#fbf4c7 guifg=#fb660a
    CSAHi pythonClass term=NONE cterm=NONE ctermbg=bg ctermfg=198 gui=NONE guibg=bg guifg=#ff0086
    CSAHi htmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#00bdec
    CSAHi htmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#00bdec
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi jinjaSpecial term=NONE cterm=NONE ctermbg=78 ctermfg=23 gui=NONE guibg=#fbf4c7 guifg=#008ffd
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=48 ctermfg=79 gui=NONE guibg=#d40000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=62 ctermfg=48 gui=bold guibg=#dbf3cd guifg=#e50808
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#0086d2
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#0086f7
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#ff0086
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=59 ctermfg=22 gui=bold guibg=#b7dce8 guifg=#438ec3
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=37 ctermfg=73 gui=reverse guibg=#f0e68c guifg=#708090
    CSAHi Search term=reverse cterm=NONE ctermbg=72 ctermfg=32 gui=NONE guibg=#ffae00 guifg=#800000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=22 ctermfg=87 gui=bold guibg=#438ec3 guifg=#eeeeee
    CSAHi jinjaComment term=NONE cterm=NONE ctermbg=16 ctermfg=20 gui=italic guibg=#002300 guifg=#008800
    CSAHi jinjaFilter term=NONE cterm=NONE ctermbg=78 ctermfg=65 gui=NONE guibg=#fbf4c7 guifg=#ff0086
    CSAHi pythonBuiltinObj term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#2b6ba2
    CSAHi pythonBuiltinFunc term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#2b6ba2
    CSAHi pythonException term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ee0000
    CSAHi pythonExClass term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#66cd66
    CSAHi pythonDocTest term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#2f5f49
    CSAHi pythonDocTest2 term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#3b916a
    CSAHi pythonFunction term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ee0000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=48 ctermfg=79 gui=NONE guibg=#cb2f27 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#c0d9eb guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=fg guifg=bg
    CSAHi pythonRun term=NONE cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#ff0086
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#ff0086
    CSAHi pythonCoding term=NONE cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#ff0086
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=25 ctermfg=79 gui=bold guibg=#43c464 guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=41 ctermfg=41 gui=reverse guibg=#51b069 guifg=#9bd4a9
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=21 ctermfg=21 gui=reverse guibg=#3687a2 guifg=#3687a2
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi Visual term=reverse cterm=NONE ctermbg=86 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=21 gui=NONE guibg=#c3daea guifg=#3c78a2
    CSAHi jinjaRaw term=NONE cterm=NONE ctermbg=78 ctermfg=84 gui=NONE guibg=#fbf4c7 guifg=#aaaaaa
    CSAHi jinjaOperator term=NONE cterm=NONE ctermbg=78 ctermfg=79 gui=NONE guibg=#fbf4c7 guifg=#ffffff
    CSAHi jinjaVariable term=NONE cterm=NONE ctermbg=78 ctermfg=40 gui=NONE guibg=#fbf4c7 guifg=#92cd35
    CSAHi jinjaAttribute term=NONE cterm=NONE ctermbg=78 ctermfg=52 gui=NONE guibg=#fbf4c7 guifg=#dd7700
    CSAHi htmlSpecialTagName term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#4aa04a
    CSAHi htmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#4aa04a
    CSAHi htmlTagN term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#4aa04a
    CSAHi jinjaTagBlock term=NONE cterm=bold ctermbg=78 ctermfg=64 gui=bold guibg=#fbf4c7 guifg=#ff0007
    CSAHi jinjaVarBlock term=NONE cterm=NONE ctermbg=78 ctermfg=64 gui=NONE guibg=#fbf4c7 guifg=#ff0007
    CSAHi jinjaString term=NONE cterm=NONE ctermbg=78 ctermfg=22 gui=NONE guibg=#fbf4c7 guifg=#0086d2
    CSAHi jinjaNumber term=NONE cterm=bold ctermbg=78 ctermfg=48 gui=bold guibg=#fbf4c7 guifg=#bf0945
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=#22a21f
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#0086d2
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#fd8900
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#ff0086
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=#fb660a
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ff0007
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=82 gui=bold guibg=bg guifg=#70796b
    CSAHi jinjaStatement term=NONE cterm=bold ctermbg=78 ctermfg=68 gui=bold guibg=#fbf4c7 guifg=#fb660a
    CSAHi pythonClass term=NONE cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#ff0086
    CSAHi htmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=27 gui=NONE guibg=bg guifg=#00bdec
    CSAHi htmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=27 gui=NONE guibg=bg guifg=#00bdec
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
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
