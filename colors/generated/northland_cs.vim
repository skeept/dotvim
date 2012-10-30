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
    CSAHi Normal term=NONE cterm=NONE ctermbg=17 ctermfg=231 gui=NONE guibg=#001020 guifg=White
    CSAHi Underlined term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Error term=reverse cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=Yellow guifg=Black
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#999999
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=DarkRed
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=31 gui=bold guibg=bg guifg=#035587
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=DarkRed guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=DarkRed guifg=White
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi ModeMsg term=bold cterm=bold ctermbg=124 ctermfg=231 gui=bold guibg=DarkRed guifg=White
    CSAHi LineNr term=underline cterm=bold ctermbg=16 ctermfg=103 gui=bold guibg=Black guifg=#507080
    CSAHi fortranType term=NONE cterm=NONE ctermbg=bg ctermfg=34 gui=NONE guibg=bg guifg=#0F8200
    CSAHi fortranLabelNumber term=NONE cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=DarkRed
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=124 ctermfg=16 gui=NONE guibg=DarkRed guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=103 gui=NONE guibg=Black guifg=#507080
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=24 ctermfg=fg gui=NONE guibg=#003853 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=Black guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=16 ctermfg=103 gui=NONE guibg=Black guifg=#507080
    CSAHi TabLineSel term=bold cterm=bold ctermbg=103 ctermfg=16 gui=bold guibg=#507080 guifg=Black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=Black guifg=White
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=24 ctermfg=fg gui=NONE guibg=#003853 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=24 ctermfg=fg gui=NONE guibg=#003853 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=152 ctermfg=231 gui=NONE guibg=PaleTurquoise3 guifg=White
    CSAHi fortranUnitHeader term=NONE cterm=bold ctermbg=bg ctermfg=135 gui=bold guibg=bg guifg=Purple
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=28 ctermfg=231 gui=NONE guibg=DarkGreen guifg=White
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=124 ctermfg=16 gui=NONE guibg=DarkRed guifg=Black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=DarkGray guifg=Black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=DarkGray guifg=Black
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=103 gui=bold guibg=bg guifg=#507080
    CSAHi Visual term=reverse cterm=NONE ctermbg=124 ctermfg=fg gui=NONE guibg=DarkRed guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=124 ctermfg=fg gui=underline guibg=DarkRed guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=103 gui=NONE guibg=Black guifg=#507080
    CSAHi Folded term=NONE cterm=bold ctermbg=16 ctermfg=28 gui=bold guibg=Black guifg=DarkGreen
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=17 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=bg ctermfg=124 gui=bold guibg=bg guifg=DarkRed
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=248 gui=italic guibg=bg guifg=DarkGray
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#035587
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=160 gui=bold,italic guibg=bg guifg=#BC0007
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=172 gui=bold guibg=bg guifg=#BF6F00
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=137 gui=bold,italic guibg=bg guifg=#AD6141
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=34 gui=NONE guibg=bg guifg=#0F8200
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=103 gui=NONE guibg=Black guifg=#507080
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=152 ctermfg=231 gui=NONE guibg=PaleTurquoise3 guifg=White
    CSAHi DiffChange term=bold cterm=NONE ctermbg=248 ctermfg=231 gui=NONE guibg=DarkGray guifg=White
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=DarkRed guifg=White
    CSAHi DiffText term=reverse cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi SignColumn term=NONE cterm=bold ctermbg=16 ctermfg=124 gui=bold guibg=Black guifg=DarkRed
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=231 gui=undercurl guibg=bg guifg=fg guisp=White
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=214 gui=undercurl guibg=bg guifg=fg guisp=Orange
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=214 gui=undercurl guibg=bg guifg=fg guisp=Orange
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=17 ctermfg=255 gui=NONE guibg=#001020 guifg=White
    CSAHi Underlined term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Error term=reverse cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=Yellow guifg=Black
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=246 gui=NONE guibg=bg guifg=#999999
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=DarkRed
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=31 gui=bold guibg=bg guifg=#035587
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=124 ctermfg=255 gui=NONE guibg=DarkRed guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=124 ctermfg=255 gui=NONE guibg=DarkRed guifg=White
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi ModeMsg term=bold cterm=bold ctermbg=124 ctermfg=255 gui=bold guibg=DarkRed guifg=White
    CSAHi LineNr term=underline cterm=bold ctermbg=16 ctermfg=109 gui=bold guibg=Black guifg=#507080
    CSAHi fortranType term=NONE cterm=NONE ctermbg=bg ctermfg=34 gui=NONE guibg=bg guifg=#0F8200
    CSAHi fortranLabelNumber term=NONE cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=DarkRed
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=124 ctermfg=16 gui=NONE guibg=DarkRed guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=109 gui=NONE guibg=Black guifg=#507080
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=24 ctermfg=fg gui=NONE guibg=#003853 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=Black guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=16 ctermfg=109 gui=NONE guibg=Black guifg=#507080
    CSAHi TabLineSel term=bold cterm=bold ctermbg=109 ctermfg=16 gui=bold guibg=#507080 guifg=Black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=Black guifg=White
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=24 ctermfg=fg gui=NONE guibg=#003853 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=24 ctermfg=fg gui=NONE guibg=#003853 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=195 ctermfg=255 gui=NONE guibg=PaleTurquoise3 guifg=White
    CSAHi fortranUnitHeader term=NONE cterm=bold ctermbg=bg ctermfg=171 gui=bold guibg=bg guifg=Purple
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=28 ctermfg=255 gui=NONE guibg=DarkGreen guifg=White
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=124 ctermfg=16 gui=NONE guibg=DarkRed guifg=Black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=DarkGray guifg=Black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=DarkGray guifg=Black
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=109 gui=bold guibg=bg guifg=#507080
    CSAHi Visual term=reverse cterm=NONE ctermbg=124 ctermfg=fg gui=NONE guibg=DarkRed guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=124 ctermfg=fg gui=underline guibg=DarkRed guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=109 gui=NONE guibg=Black guifg=#507080
    CSAHi Folded term=NONE cterm=bold ctermbg=16 ctermfg=28 gui=bold guibg=Black guifg=DarkGreen
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=17 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=bg ctermfg=124 gui=bold guibg=bg guifg=DarkRed
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=248 gui=italic guibg=bg guifg=DarkGray
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#035587
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=160 gui=bold,italic guibg=bg guifg=#BC0007
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=178 gui=bold guibg=bg guifg=#BF6F00
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=174 gui=bold,italic guibg=bg guifg=#AD6141
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=34 gui=NONE guibg=bg guifg=#0F8200
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=109 gui=NONE guibg=Black guifg=#507080
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=195 ctermfg=255 gui=NONE guibg=PaleTurquoise3 guifg=White
    CSAHi DiffChange term=bold cterm=NONE ctermbg=248 ctermfg=255 gui=NONE guibg=DarkGray guifg=White
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=124 ctermfg=255 gui=NONE guibg=DarkRed guifg=White
    CSAHi DiffText term=reverse cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=White
    CSAHi SignColumn term=NONE cterm=bold ctermbg=16 ctermfg=124 gui=bold guibg=Black guifg=DarkRed
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=255 gui=undercurl guibg=bg guifg=fg guisp=White
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=220 gui=undercurl guibg=bg guifg=fg guisp=Orange
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=220 gui=undercurl guibg=bg guifg=fg guisp=Orange
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#001020 guifg=White
    CSAHi Underlined term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Error term=reverse cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=Yellow guifg=Black
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=246 gui=NONE guibg=bg guifg=#999999
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=88 gui=NONE guibg=bg guifg=DarkRed
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=24 gui=bold guibg=bg guifg=#035587
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=DarkRed guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=DarkRed guifg=White
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi ModeMsg term=bold cterm=bold ctermbg=88 ctermfg=231 gui=bold guibg=DarkRed guifg=White
    CSAHi LineNr term=underline cterm=bold ctermbg=16 ctermfg=60 gui=bold guibg=Black guifg=#507080
    CSAHi fortranType term=NONE cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#0F8200
    CSAHi fortranLabelNumber term=NONE cterm=NONE ctermbg=bg ctermfg=88 gui=NONE guibg=bg guifg=DarkRed
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=88 ctermfg=16 gui=NONE guibg=DarkRed guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=60 gui=NONE guibg=Black guifg=#507080
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#003853 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=Black guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=16 ctermfg=60 gui=NONE guibg=Black guifg=#507080
    CSAHi TabLineSel term=bold cterm=bold ctermbg=60 ctermfg=16 gui=bold guibg=#507080 guifg=Black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=Black guifg=White
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#003853 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#003853 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=116 ctermfg=231 gui=NONE guibg=PaleTurquoise3 guifg=White
    CSAHi fortranUnitHeader term=NONE cterm=bold ctermbg=bg ctermfg=129 gui=bold guibg=bg guifg=Purple
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=231 gui=NONE guibg=DarkGreen guifg=White
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=88 ctermfg=16 gui=NONE guibg=DarkRed guifg=Black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=DarkGray guifg=Black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=DarkGray guifg=Black
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=60 gui=bold guibg=bg guifg=#507080
    CSAHi Visual term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=DarkRed guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=88 ctermfg=fg gui=underline guibg=DarkRed guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=60 gui=NONE guibg=Black guifg=#507080
    CSAHi Folded term=NONE cterm=bold ctermbg=16 ctermfg=22 gui=bold guibg=Black guifg=DarkGreen
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=bg ctermfg=88 gui=bold guibg=bg guifg=DarkRed
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=248 gui=italic guibg=bg guifg=DarkGray
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=24 gui=NONE guibg=bg guifg=#035587
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=124 gui=bold,italic guibg=bg guifg=#BC0007
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=130 gui=bold guibg=bg guifg=#BF6F00
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=131 gui=bold,italic guibg=bg guifg=#AD6141
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#0F8200
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=60 gui=NONE guibg=Black guifg=#507080
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=116 ctermfg=231 gui=NONE guibg=PaleTurquoise3 guifg=White
    CSAHi DiffChange term=bold cterm=NONE ctermbg=248 ctermfg=231 gui=NONE guibg=DarkGray guifg=White
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=DarkRed guifg=White
    CSAHi DiffText term=reverse cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi SignColumn term=NONE cterm=bold ctermbg=16 ctermfg=88 gui=bold guibg=Black guifg=DarkRed
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=231 gui=undercurl guibg=bg guifg=fg guisp=White
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=214 gui=undercurl guibg=bg guifg=fg guisp=Orange
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=214 gui=undercurl guibg=bg guifg=fg guisp=Orange
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#001020 guifg=White
    CSAHi Underlined term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Error term=reverse cterm=bold ctermbg=76 ctermfg=16 gui=bold guibg=Yellow guifg=Black
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#999999
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=DarkRed
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#035587
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=Yellow
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=DarkRed guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=DarkRed guifg=White
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=Yellow
    CSAHi ModeMsg term=bold cterm=bold ctermbg=32 ctermfg=79 gui=bold guibg=DarkRed guifg=White
    CSAHi LineNr term=underline cterm=bold ctermbg=16 ctermfg=37 gui=bold guibg=Black guifg=#507080
    CSAHi fortranType term=NONE cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=#0F8200
    CSAHi fortranLabelNumber term=NONE cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=DarkRed
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=32 ctermfg=16 gui=NONE guibg=DarkRed guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=Black guifg=#507080
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#003853 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=Black guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=Black guifg=#507080
    CSAHi TabLineSel term=bold cterm=bold ctermbg=37 ctermfg=16 gui=bold guibg=#507080 guifg=Black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=Black guifg=White
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#003853 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#003853 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=42 ctermfg=79 gui=NONE guibg=PaleTurquoise3 guifg=White
    CSAHi fortranUnitHeader term=NONE cterm=bold ctermbg=bg ctermfg=35 gui=bold guibg=bg guifg=Purple
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=20 ctermfg=79 gui=NONE guibg=DarkGreen guifg=White
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=Yellow
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=32 ctermfg=16 gui=NONE guibg=DarkRed guifg=Black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=84 ctermfg=16 gui=NONE guibg=DarkGray guifg=Black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=84 ctermfg=16 gui=NONE guibg=DarkGray guifg=Black
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=37 gui=bold guibg=bg guifg=#507080
    CSAHi Visual term=reverse cterm=NONE ctermbg=32 ctermfg=fg gui=NONE guibg=DarkRed guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=32 ctermfg=fg gui=underline guibg=DarkRed guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=Yellow
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=Black guifg=#507080
    CSAHi Folded term=NONE cterm=bold ctermbg=16 ctermfg=20 gui=bold guibg=Black guifg=DarkGreen
    CSAHi lCursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=bg ctermfg=32 gui=bold guibg=bg guifg=DarkRed
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=84 gui=italic guibg=bg guifg=DarkGray
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#035587
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=48 gui=bold,italic guibg=bg guifg=#BC0007
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=52 gui=bold guibg=bg guifg=#BF6F00
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=52 gui=bold,italic guibg=bg guifg=#AD6141
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=#0F8200
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=Black guifg=#507080
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=42 ctermfg=79 gui=NONE guibg=PaleTurquoise3 guifg=White
    CSAHi DiffChange term=bold cterm=NONE ctermbg=84 ctermfg=79 gui=NONE guibg=DarkGray guifg=White
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=DarkRed guifg=White
    CSAHi DiffText term=reverse cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=White
    CSAHi SignColumn term=NONE cterm=bold ctermbg=16 ctermfg=32 gui=bold guibg=Black guifg=DarkRed
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=79 gui=undercurl guibg=bg guifg=fg guisp=White
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=68 gui=undercurl guibg=bg guifg=fg guisp=Orange
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=68 gui=undercurl guibg=bg guifg=fg guisp=Orange
endif

if 1
    delcommand CSAHi
endif
