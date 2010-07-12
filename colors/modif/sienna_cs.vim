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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=Blue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=Yellow guifg=Black
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=ForestGreen
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=ForestGreen
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=ForestGreen
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=61 gui=NONE guibg=bg guifg=RoyalBlue4
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=248 gui=bold guibg=Grey95 guifg=DarkGray
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=Black guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=ForestGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=DarkGray
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=Grey65 guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=244 ctermfg=16 gui=NONE guibg=Grey50 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=Grey75 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=Black guifg=White
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi Label term=NONE cterm=bold,underline ctermbg=bg ctermfg=131 gui=bold,underline guibg=bg guifg=Sienna4
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=ForestGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=Black guifg=White
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=102 ctermfg=231 gui=NONE guibg=DimGray guifg=White
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=102 ctermfg=231 gui=NONE guibg=DimGray guifg=White
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=Black
    CSAHi Visual term=reverse cterm=bold ctermbg=215 ctermfg=16 gui=bold guibg=Sienna1 guifg=Black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=White guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=Wheat1 guifg=Black
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=italic guibg=bg guifg=RoyalBlue3
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=ForestGreen
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=61 gui=NONE guibg=bg guifg=RoyalBlue4
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=131 gui=NONE guibg=bg guifg=Sienna4
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=131 gui=bold guibg=bg guifg=Sienna4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=RoyalBlue3
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=61 gui=bold guibg=bg guifg=RoyalBlue4
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=223 ctermfg=16 gui=NONE guibg=Wheat2 guifg=Black
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=Blue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=Yellow guifg=Black
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=ForestGreen
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=ForestGreen
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=ForestGreen
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=RoyalBlue4
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=248 gui=bold guibg=Grey95 guifg=DarkGray
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=Black guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=ForestGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=DarkGray
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=Grey65 guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=Grey50 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=Grey75 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=Black guifg=White
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi Label term=NONE cterm=bold,underline ctermbg=bg ctermfg=137 gui=bold,underline guibg=bg guifg=Sienna4
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=ForestGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=255 gui=bold guibg=Black guifg=White
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=242 ctermfg=255 gui=NONE guibg=DimGray guifg=White
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=242 ctermfg=255 gui=NONE guibg=DimGray guifg=White
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=Black
    CSAHi Visual term=reverse cterm=bold ctermbg=216 ctermfg=16 gui=bold guibg=Sienna1 guifg=Black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=White guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=Wheat1 guifg=Black
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=69 gui=italic guibg=bg guifg=RoyalBlue3
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=ForestGreen
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=RoyalBlue4
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=137 gui=NONE guibg=bg guifg=Sienna4
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=137 gui=bold guibg=bg guifg=Sienna4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=RoyalBlue3
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=RoyalBlue4
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=Wheat2 guifg=Black
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=Blue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=Yellow guifg=Black
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=ForestGreen
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=ForestGreen
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=ForestGreen
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=24 gui=NONE guibg=bg guifg=RoyalBlue4
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=248 gui=bold guibg=Grey95 guifg=DarkGray
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=Black guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=ForestGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=DarkGray
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=Grey65 guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=244 ctermfg=16 gui=NONE guibg=Grey50 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=Grey75 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=Black guifg=White
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi Label term=NONE cterm=bold,underline ctermbg=bg ctermfg=94 gui=bold,underline guibg=bg guifg=Sienna4
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=ForestGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=Black guifg=White
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=242 ctermfg=231 gui=NONE guibg=DimGray guifg=White
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=242 ctermfg=231 gui=NONE guibg=DimGray guifg=White
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=Black
    CSAHi Visual term=reverse cterm=bold ctermbg=209 ctermfg=16 gui=bold guibg=Sienna1 guifg=Black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=White guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=223 ctermfg=16 gui=NONE guibg=Wheat1 guifg=Black
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=62 gui=italic guibg=bg guifg=RoyalBlue3
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=ForestGreen
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=24 gui=NONE guibg=bg guifg=RoyalBlue4
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=94 gui=NONE guibg=bg guifg=Sienna4
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=94 gui=bold guibg=bg guifg=Sienna4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=62 gui=NONE guibg=bg guifg=RoyalBlue3
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=24 gui=bold guibg=bg guifg=RoyalBlue4
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=223 ctermfg=16 gui=NONE guibg=Wheat2 guifg=Black
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=19 gui=underline guibg=bg guifg=Blue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=76 ctermfg=16 gui=bold guibg=Yellow guifg=Black
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=ForestGreen
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=ForestGreen
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=ForestGreen
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=RoyalBlue4
    CSAHi NonText term=bold cterm=bold ctermbg=87 ctermfg=84 gui=bold guibg=Grey95 guifg=DarkGray
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=Black guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=ForestGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=DarkGray
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=84 ctermfg=16 gui=NONE guibg=Grey65 guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=82 ctermfg=16 gui=NONE guibg=Grey50 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=85 ctermfg=16 gui=NONE guibg=Grey75 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=Black guifg=White
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi Label term=NONE cterm=bold,underline ctermbg=bg ctermfg=36 gui=bold,underline guibg=bg guifg=Sienna4
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=ForestGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=79 gui=bold guibg=Black guifg=White
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=82 ctermfg=79 gui=NONE guibg=DimGray guifg=White
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=82 ctermfg=79 gui=NONE guibg=DimGray guifg=White
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=Black
    CSAHi Visual term=reverse cterm=bold ctermbg=69 ctermfg=16 gui=bold guibg=Sienna1 guifg=Black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=64 gui=bold guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=White guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=78 ctermfg=16 gui=NONE guibg=Wheat1 guifg=Black
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=22 gui=italic guibg=bg guifg=RoyalBlue3
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=ForestGreen
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=RoyalBlue4
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=Sienna4
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=36 gui=bold guibg=bg guifg=Sienna4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=RoyalBlue3
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=17 gui=bold guibg=bg guifg=RoyalBlue4
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=74 ctermfg=16 gui=NONE guibg=Wheat2 guifg=Black
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
