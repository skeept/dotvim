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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#F9F5F9 guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=104 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi Number term=underline cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#00C226
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=231 ctermfg=57 gui=bold guibg=#EFEFF7 guifg=#4000ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#0000ff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=#EB1513
    CSAHi IncSearch term=reverse cterm=underline ctermbg=222 ctermfg=16 gui=underline guibg=#FFE568 guifg=Black
    CSAHi Search term=reverse cterm=NONE ctermbg=222 ctermfg=16 gui=NONE guibg=#FFE568 guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=seagreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=33 gui=bold guibg=bg guifg=#0070ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#8080a0
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=orange guifg=black
    CSAHi Statemengreen term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=111 ctermfg=231 gui=bold guibg=#56A0EE guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=111 ctermfg=231 gui=NONE guibg=#56A0EE guifg=#E9E9F4
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=#1014AD
    CSAHi Visual term=reverse cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#BDDFFF guifg=Black
    CSAHi VisualNOS term=reverse cterm=underline ctermbg=189 ctermfg=16 gui=underline guibg=#BDDFFF guifg=Black
    CSAHi WildMenu term=NONE cterm=underline ctermbg=231 ctermfg=111 gui=underline guibg=#E9E9F4 guifg=#56A0EE
    CSAHi Folded term=NONE cterm=NONE ctermbg=194 ctermfg=16 gui=NONE guibg=#B5EEB5 guifg=black
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=#3F6B5B
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#B91F49
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red2
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#F06F00
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#1071CE
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Tag term=bold cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=DarkGreen
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=129 ctermfg=231 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi DiffChange term=bold cterm=NONE ctermbg=194 ctermfg=28 gui=NONE guibg=#d0ffd0 guifg=#006800
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=195 ctermfg=63 gui=NONE guibg=#c8f2ea guifg=#2020ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=230 ctermfg=202 gui=NONE guibg=#ffeae0 guifg=#f83010
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#F9F5F9 guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=105 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi Number term=underline cterm=NONE ctermbg=bg ctermfg=47 gui=NONE guibg=bg guifg=#00C226
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=93 gui=bold guibg=#EFEFF7 guifg=#4000ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#0000ff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=#EB1513
    CSAHi IncSearch term=reverse cterm=underline ctermbg=228 ctermfg=16 gui=underline guibg=#FFE568 guifg=Black
    CSAHi Search term=reverse cterm=NONE ctermbg=228 ctermfg=16 gui=NONE guibg=#FFE568 guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=seagreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=39 gui=bold guibg=bg guifg=#0070ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=#8080a0
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=orange guifg=black
    CSAHi Statemengreen term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=117 ctermfg=255 gui=bold guibg=#56A0EE guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=117 ctermfg=231 gui=NONE guibg=#56A0EE guifg=#E9E9F4
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=#1014AD
    CSAHi Visual term=reverse cterm=NONE ctermbg=195 ctermfg=16 gui=NONE guibg=#BDDFFF guifg=Black
    CSAHi VisualNOS term=reverse cterm=underline ctermbg=195 ctermfg=16 gui=underline guibg=#BDDFFF guifg=Black
    CSAHi WildMenu term=NONE cterm=underline ctermbg=231 ctermfg=117 gui=underline guibg=#E9E9F4 guifg=#56A0EE
    CSAHi Folded term=NONE cterm=NONE ctermbg=194 ctermfg=16 gui=NONE guibg=#B5EEB5 guifg=black
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#3F6B5B
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=168 gui=NONE guibg=bg guifg=#B91F49
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red2
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=#F06F00
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#1071CE
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Tag term=bold cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=DarkGreen
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=129 ctermfg=255 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi DiffChange term=bold cterm=NONE ctermbg=231 ctermfg=28 gui=NONE guibg=#d0ffd0 guifg=#006800
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=231 ctermfg=63 gui=NONE guibg=#c8f2ea guifg=#2020ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=231 ctermfg=202 gui=NONE guibg=#ffeae0 guifg=#f83010
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#F9F5F9 guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=62 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi Number term=underline cterm=NONE ctermbg=bg ctermfg=34 gui=NONE guibg=bg guifg=#00C226
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=231 ctermfg=57 gui=bold guibg=#EFEFF7 guifg=#4000ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#0000ff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=160 gui=bold guibg=bg guifg=#EB1513
    CSAHi IncSearch term=reverse cterm=underline ctermbg=221 ctermfg=16 gui=underline guibg=#FFE568 guifg=Black
    CSAHi Search term=reverse cterm=NONE ctermbg=221 ctermfg=16 gui=NONE guibg=#FFE568 guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=seagreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=27 gui=bold guibg=bg guifg=#0070ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=103 gui=NONE guibg=bg guifg=#8080a0
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=orange guifg=black
    CSAHi Statemengreen term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=75 ctermfg=231 gui=bold guibg=#56A0EE guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=75 ctermfg=189 gui=NONE guibg=#56A0EE guifg=#E9E9F4
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=#1014AD
    CSAHi Visual term=reverse cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#BDDFFF guifg=Black
    CSAHi VisualNOS term=reverse cterm=underline ctermbg=153 ctermfg=16 gui=underline guibg=#BDDFFF guifg=Black
    CSAHi WildMenu term=NONE cterm=underline ctermbg=189 ctermfg=75 gui=underline guibg=#E9E9F4 guifg=#56A0EE
    CSAHi Folded term=NONE cterm=NONE ctermbg=157 ctermfg=16 gui=NONE guibg=#B5EEB5 guifg=black
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#3F6B5B
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=125 gui=NONE guibg=bg guifg=#B91F49
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red2
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=202 gui=NONE guibg=bg guifg=#F06F00
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#1071CE
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Tag term=bold cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=DarkGreen
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi DiffChange term=bold cterm=NONE ctermbg=194 ctermfg=22 gui=NONE guibg=#d0ffd0 guifg=#006800
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=194 ctermfg=21 gui=NONE guibg=#c8f2ea guifg=#2020ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=224 ctermfg=202 gui=NONE guibg=#ffeae0 guifg=#f83010
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#F9F5F9 guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=19 gui=NONE guibg=Yellow guifg=Blue
    CSAHi Number term=underline cterm=NONE ctermbg=bg ctermfg=24 gui=NONE guibg=bg guifg=#00C226
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=79 ctermfg=19 gui=bold guibg=#EFEFF7 guifg=#4000ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=#0000ff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=64 gui=bold guibg=bg guifg=#EB1513
    CSAHi IncSearch term=reverse cterm=underline ctermbg=73 ctermfg=16 gui=underline guibg=#FFE568 guifg=Black
    CSAHi Search term=reverse cterm=NONE ctermbg=73 ctermfg=16 gui=NONE guibg=#FFE568 guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=seagreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#0070ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#8080a0
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=19 gui=underline guibg=bg guifg=#0000ff
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=68 ctermfg=16 gui=NONE guibg=orange guifg=black
    CSAHi Statemengreen term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=39 ctermfg=79 gui=bold guibg=#56A0EE guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=39 ctermfg=79 gui=NONE guibg=#56A0EE guifg=#E9E9F4
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=18 gui=bold guibg=bg guifg=#1014AD
    CSAHi Visual term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=NONE guibg=#BDDFFF guifg=Black
    CSAHi VisualNOS term=reverse cterm=underline ctermbg=59 ctermfg=16 gui=underline guibg=#BDDFFF guifg=Black
    CSAHi WildMenu term=NONE cterm=underline ctermbg=79 ctermfg=39 gui=underline guibg=#E9E9F4 guifg=#56A0EE
    CSAHi Folded term=NONE cterm=NONE ctermbg=62 ctermfg=16 gui=NONE guibg=#B5EEB5 guifg=black
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#3F6B5B
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=49 gui=NONE guibg=bg guifg=#B91F49
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=red2
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#F06F00
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#1071CE
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Tag term=bold cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=DarkGreen
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi DiffChange term=bold cterm=NONE ctermbg=62 ctermfg=20 gui=NONE guibg=#d0ffd0 guifg=#006800
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=63 ctermfg=19 gui=NONE guibg=#c8f2ea guifg=#2020ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=78 ctermfg=64 gui=NONE guibg=#ffeae0 guifg=#f83010
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
