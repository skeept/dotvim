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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=104 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#EFEFEF guifg=#000000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=244 ctermfg=231 gui=NONE guibg=#808080 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=152 ctermfg=16 gui=italic guibg=#B0B8C0 guifg=black
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold,italic guibg=#F0F0F0 guifg=black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=145 ctermfg=231 gui=reverse guibg=bg guifg=#9098A0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#EAEAEA guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=227 ctermfg=fg gui=NONE guibg=#FFFF33 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=reverse guibg=fg guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=231 gui=reverse,bold guibg=bg guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=148 ctermfg=231 gui=bold guibg=#99CC00 guifg=white
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=italic guibg=bg guifg=#000099
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#666666
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#FF0000
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=130 gui=NONE guibg=bg guifg=#993300
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=#FF9900
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=34 gui=NONE guibg=bg guifg=#009900
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=214 gui=bold guibg=bg guifg=#FF9900
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=105 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#EFEFEF guifg=#000000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=244 ctermfg=255 gui=NONE guibg=#808080 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=189 ctermfg=16 gui=italic guibg=#B0B8C0 guifg=black
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold,italic guibg=#F0F0F0 guifg=black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=152 ctermfg=255 gui=reverse guibg=bg guifg=#9098A0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#EAEAEA guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=227 ctermfg=fg gui=NONE guibg=#FFFF33 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=reverse guibg=fg guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=255 gui=reverse,bold guibg=bg guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=190 ctermfg=255 gui=bold guibg=#99CC00 guifg=white
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=20 gui=italic guibg=bg guifg=#000099
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=#666666
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#FF0000
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=#993300
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=#FF9900
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=#009900
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=220 gui=bold guibg=bg guifg=#FF9900
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=62 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#EFEFEF guifg=#000000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=244 ctermfg=231 gui=NONE guibg=#808080 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=145 ctermfg=16 gui=italic guibg=#B0B8C0 guifg=black
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold,italic guibg=#F0F0F0 guifg=black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=103 ctermfg=231 gui=reverse guibg=bg guifg=#9098A0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#EAEAEA guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=227 ctermfg=fg gui=NONE guibg=#FFFF33 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=reverse guibg=fg guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=231 gui=reverse,bold guibg=bg guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=18 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=112 ctermfg=231 gui=bold guibg=#99CC00 guifg=white
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=18 gui=italic guibg=bg guifg=#000099
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=#666666
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#FF0000
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=94 gui=NONE guibg=bg guifg=#993300
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#FF9900
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#009900
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=208 gui=bold guibg=bg guifg=#FF9900
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=19 gui=NONE guibg=Yellow guifg=Blue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=87 ctermfg=16 gui=NONE guibg=#EFEFEF guifg=#000000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=83 ctermfg=79 gui=NONE guibg=#808080 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=85 ctermfg=16 gui=italic guibg=#B0B8C0 guifg=black
    CSAHi TabLineSel term=bold cterm=bold ctermbg=87 ctermfg=16 gui=bold,italic guibg=#F0F0F0 guifg=black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=37 ctermfg=79 gui=reverse guibg=bg guifg=#9098A0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=#EAEAEA guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=76 ctermfg=fg gui=NONE guibg=#FFFF33 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=reverse guibg=fg guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=79 gui=reverse,bold guibg=bg guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=86 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=86 ctermfg=17 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=40 ctermfg=79 gui=bold guibg=#99CC00 guifg=white
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=17 gui=italic guibg=bg guifg=#000099
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#666666
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#FF0000
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#993300
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#FF9900
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=#009900
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=#FF9900
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
