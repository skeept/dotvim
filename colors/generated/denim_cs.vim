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
    CSAHi Normal term=NONE cterm=NONE ctermbg=17 ctermfg=231 gui=NONE guibg=#000038 guifg=#FFFFFF
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#0066AA
    CSAHi Error term=reverse cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=#FFFFFF guifg=#FF0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=231 ctermfg=145 gui=NONE guibg=#FFFFFF guifg=#999999
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#CCCC99
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#33FFFF
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=17 ctermfg=226 gui=NONE guibg=#000038 guifg=#FFFF00
    CSAHi NonText term=bold cterm=bold ctermbg=17 ctermfg=231 gui=bold guibg=#00003D guifg=#FFFFFF
    CSAHi Directory term=bold cterm=NONE ctermbg=110 ctermfg=81 gui=NONE guibg=#6699CC guifg=#33CCFF
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#FF0000 guifg=#FFFFFF
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=226 ctermfg=17 gui=reverse guibg=#000038 guifg=#FFFF00
    CSAHi Search term=reverse cterm=NONE ctermbg=110 ctermfg=130 gui=NONE guibg=#6699CC guifg=#993300
    CSAHi MoreMsg term=bold cterm=bold ctermbg=17 ctermfg=231 gui=bold guibg=#000038 guifg=#FFFFFF
    CSAHi ModeMsg term=bold cterm=bold ctermbg=17 ctermfg=231 gui=bold guibg=#000038 guifg=#FFFFFF
    CSAHi LineNr term=underline cterm=NONE ctermbg=17 ctermfg=231 gui=NONE guibg=#000038 guifg=#FFFFEE
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=152 ctermfg=110 gui=NONE guibg=#99CCCC guifg=#6699CC
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=17 gui=NONE guibg=#FFFFFF guifg=#000038
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=#CC3300
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#FFFFCC
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#FFFFCC
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#FFFF00
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#FFFF00
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#FFFFAA
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi Question term=NONE cterm=bold ctermbg=21 ctermfg=231 gui=bold guibg=#0000EE guifg=#FFFFFF
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=231 ctermfg=17 gui=reverse,bold guibg=#000038 guifg=#FFFFFF
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=17 gui=reverse guibg=#000038 guifg=#CCCCCC
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=231 ctermfg=17 gui=reverse guibg=#000038 guifg=#FFFFFF
    CSAHi Title term=bold cterm=bold ctermbg=214 ctermfg=231 gui=bold guibg=#FF9900 guifg=#FFFFFF
    CSAHi Visual term=reverse cterm=NONE ctermbg=111 ctermfg=24 gui=NONE guibg=#6699FF guifg=#003366
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=#FFFFFF guifg=#FF0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=145 ctermfg=17 gui=NONE guibg=#999999 guifg=#000038
    CSAHi Folded term=NONE cterm=NONE ctermbg=24 ctermfg=145 gui=NONE guibg=#003366 guifg=#999999
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=17 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#999999
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00FF00
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#33FFFF
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=230 gui=bold guibg=bg guifg=#FFFFCC
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=85 gui=bold guibg=bg guifg=#33FF99
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#CCCCFF
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00FF00
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#CCCCFF
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#FFFFCC
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=110 ctermfg=21 gui=NONE guibg=#6699CC guifg=#0000EE
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=17 ctermfg=230 gui=NONE guibg=#000038 guifg=#FFFFCC
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=214 gui=NONE guibg=#000038 guifg=#FF9900
    CSAHi DiffDelete term=bold cterm=bold ctermbg=17 ctermfg=145 gui=bold guibg=#000038 guifg=#999999
    CSAHi DiffText term=reverse cterm=bold ctermbg=17 ctermfg=231 gui=bold guibg=#000038 guifg=#FFFFFF
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=17 ctermfg=255 gui=NONE guibg=#000038 guifg=#FFFFFF
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#0066AA
    CSAHi Error term=reverse cterm=NONE ctermbg=255 ctermfg=196 gui=NONE guibg=#FFFFFF guifg=#FF0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#FFFFFF guifg=#999999
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#CCCC99
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#33FFFF
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=17 ctermfg=226 gui=NONE guibg=#000038 guifg=#FFFF00
    CSAHi NonText term=bold cterm=bold ctermbg=17 ctermfg=255 gui=bold guibg=#00003D guifg=#FFFFFF
    CSAHi Directory term=bold cterm=NONE ctermbg=117 ctermfg=87 gui=NONE guibg=#6699CC guifg=#33CCFF
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#FF0000 guifg=#FFFFFF
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=226 ctermfg=17 gui=reverse guibg=#000038 guifg=#FFFF00
    CSAHi Search term=reverse cterm=NONE ctermbg=117 ctermfg=166 gui=NONE guibg=#6699CC guifg=#993300
    CSAHi MoreMsg term=bold cterm=bold ctermbg=17 ctermfg=255 gui=bold guibg=#000038 guifg=#FFFFFF
    CSAHi ModeMsg term=bold cterm=bold ctermbg=17 ctermfg=255 gui=bold guibg=#000038 guifg=#FFFFFF
    CSAHi LineNr term=underline cterm=NONE ctermbg=17 ctermfg=255 gui=NONE guibg=#000038 guifg=#FFFFEE
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=195 ctermfg=117 gui=NONE guibg=#99CCCC guifg=#6699CC
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=255 ctermfg=17 gui=NONE guibg=#FFFFFF guifg=#000038
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=202 gui=NONE guibg=bg guifg=#CC3300
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#FFFFCC
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#FFFFCC
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#FFFF00
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#FFFF00
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#FFFFAA
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi Question term=NONE cterm=bold ctermbg=21 ctermfg=255 gui=bold guibg=#0000EE guifg=#FFFFFF
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=255 ctermfg=17 gui=reverse,bold guibg=#000038 guifg=#FFFFFF
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=252 ctermfg=17 gui=reverse guibg=#000038 guifg=#CCCCCC
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=255 ctermfg=17 gui=reverse guibg=#000038 guifg=#FFFFFF
    CSAHi Title term=bold cterm=bold ctermbg=220 ctermfg=255 gui=bold guibg=#FF9900 guifg=#FFFFFF
    CSAHi Visual term=reverse cterm=NONE ctermbg=117 ctermfg=24 gui=NONE guibg=#6699FF guifg=#003366
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=255 ctermfg=196 gui=NONE guibg=#FFFFFF guifg=#FF0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=246 ctermfg=17 gui=NONE guibg=#999999 guifg=#000038
    CSAHi Folded term=NONE cterm=NONE ctermbg=24 ctermfg=246 gui=NONE guibg=#003366 guifg=#999999
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=17 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=246 gui=NONE guibg=bg guifg=#999999
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00FF00
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#33FFFF
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#FFFFCC
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=86 gui=bold guibg=bg guifg=#33FF99
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#CCCCFF
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00FF00
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#CCCCFF
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#FFFFCC
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=117 ctermfg=21 gui=NONE guibg=#6699CC guifg=#0000EE
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=17 ctermfg=231 gui=NONE guibg=#000038 guifg=#FFFFCC
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=220 gui=NONE guibg=#000038 guifg=#FF9900
    CSAHi DiffDelete term=bold cterm=bold ctermbg=17 ctermfg=246 gui=bold guibg=#000038 guifg=#999999
    CSAHi DiffText term=reverse cterm=bold ctermbg=17 ctermfg=255 gui=bold guibg=#000038 guifg=#FFFFFF
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=17 ctermfg=231 gui=NONE guibg=#000038 guifg=#FFFFFF
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=#0066AA
    CSAHi Error term=reverse cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=#FFFFFF guifg=#FF0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=231 ctermfg=246 gui=NONE guibg=#FFFFFF guifg=#999999
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#CCCC99
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#33FFFF
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=17 ctermfg=226 gui=NONE guibg=#000038 guifg=#FFFF00
    CSAHi NonText term=bold cterm=bold ctermbg=17 ctermfg=231 gui=bold guibg=#00003D guifg=#FFFFFF
    CSAHi Directory term=bold cterm=NONE ctermbg=68 ctermfg=81 gui=NONE guibg=#6699CC guifg=#33CCFF
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#FF0000 guifg=#FFFFFF
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=226 ctermfg=17 gui=reverse guibg=#000038 guifg=#FFFF00
    CSAHi Search term=reverse cterm=NONE ctermbg=68 ctermfg=94 gui=NONE guibg=#6699CC guifg=#993300
    CSAHi MoreMsg term=bold cterm=bold ctermbg=17 ctermfg=231 gui=bold guibg=#000038 guifg=#FFFFFF
    CSAHi ModeMsg term=bold cterm=bold ctermbg=17 ctermfg=231 gui=bold guibg=#000038 guifg=#FFFFFF
    CSAHi LineNr term=underline cterm=NONE ctermbg=17 ctermfg=231 gui=NONE guibg=#000038 guifg=#FFFFEE
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=116 ctermfg=68 gui=NONE guibg=#99CCCC guifg=#6699CC
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=17 gui=NONE guibg=#FFFFFF guifg=#000038
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=#CC3300
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#FFFFCC
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#FFFFCC
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#FFFF00
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#FFFF00
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#FFFFAA
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi Question term=NONE cterm=bold ctermbg=21 ctermfg=231 gui=bold guibg=#0000EE guifg=#FFFFFF
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=231 ctermfg=17 gui=reverse,bold guibg=#000038 guifg=#FFFFFF
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=252 ctermfg=17 gui=reverse guibg=#000038 guifg=#CCCCCC
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=231 ctermfg=17 gui=reverse guibg=#000038 guifg=#FFFFFF
    CSAHi Title term=bold cterm=bold ctermbg=208 ctermfg=231 gui=bold guibg=#FF9900 guifg=#FFFFFF
    CSAHi Visual term=reverse cterm=NONE ctermbg=69 ctermfg=23 gui=NONE guibg=#6699FF guifg=#003366
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=#FFFFFF guifg=#FF0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=246 ctermfg=17 gui=NONE guibg=#999999 guifg=#000038
    CSAHi Folded term=NONE cterm=NONE ctermbg=23 ctermfg=246 gui=NONE guibg=#003366 guifg=#999999
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=17 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=246 gui=NONE guibg=bg guifg=#999999
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00FF00
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#33FFFF
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=230 gui=bold guibg=bg guifg=#FFFFCC
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=84 gui=bold guibg=bg guifg=#33FF99
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#CCCCFF
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00FF00
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#CCCCFF
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#FFFFCC
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=68 ctermfg=21 gui=NONE guibg=#6699CC guifg=#0000EE
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=17 ctermfg=230 gui=NONE guibg=#000038 guifg=#FFFFCC
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=208 gui=NONE guibg=#000038 guifg=#FF9900
    CSAHi DiffDelete term=bold cterm=bold ctermbg=17 ctermfg=246 gui=bold guibg=#000038 guifg=#999999
    CSAHi DiffText term=reverse cterm=bold ctermbg=17 ctermfg=231 gui=bold guibg=#000038 guifg=#FFFFFF
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000038 guifg=#FFFFFF
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#0066AA
    CSAHi Error term=reverse cterm=NONE ctermbg=79 ctermfg=64 gui=NONE guibg=#FFFFFF guifg=#FF0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=79 ctermfg=84 gui=NONE guibg=#FFFFFF guifg=#999999
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#CCCC99
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#33FFFF
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=76 gui=NONE guibg=#000038 guifg=#FFFF00
    CSAHi NonText term=bold cterm=bold ctermbg=16 ctermfg=79 gui=bold guibg=#00003D guifg=#FFFFFF
    CSAHi Directory term=bold cterm=NONE ctermbg=38 ctermfg=27 gui=NONE guibg=#6699CC guifg=#33CCFF
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#FF0000 guifg=#FFFFFF
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=76 ctermfg=16 gui=reverse guibg=#000038 guifg=#FFFF00
    CSAHi Search term=reverse cterm=NONE ctermbg=38 ctermfg=32 gui=NONE guibg=#6699CC guifg=#993300
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=79 gui=bold guibg=#000038 guifg=#FFFFFF
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=79 gui=bold guibg=#000038 guifg=#FFFFFF
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000038 guifg=#FFFFEE
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=42 ctermfg=38 gui=NONE guibg=#99CCCC guifg=#6699CC
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000038
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=#CC3300
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=#FFFFCC
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=#FFFFCC
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#FFFF00
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#FFFF00
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#FFFFAA
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi Question term=NONE cterm=bold ctermbg=19 ctermfg=79 gui=bold guibg=#0000EE guifg=#FFFFFF
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=79 ctermfg=16 gui=reverse,bold guibg=#000038 guifg=#FFFFFF
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=58 ctermfg=16 gui=reverse guibg=#000038 guifg=#CCCCCC
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=#000038 guifg=#FFFFFF
    CSAHi Title term=bold cterm=bold ctermbg=68 ctermfg=79 gui=bold guibg=#FF9900 guifg=#FFFFFF
    CSAHi Visual term=reverse cterm=NONE ctermbg=39 ctermfg=17 gui=NONE guibg=#6699FF guifg=#003366
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=79 ctermfg=64 gui=NONE guibg=#FFFFFF guifg=#FF0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=84 ctermfg=16 gui=NONE guibg=#999999 guifg=#000038
    CSAHi Folded term=NONE cterm=NONE ctermbg=17 ctermfg=84 gui=NONE guibg=#003366 guifg=#999999
    CSAHi lCursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#999999
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#33FF33
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#00FF00
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#33FFFF
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=78 gui=bold guibg=bg guifg=#FFFFCC
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#66CCFF
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=#33FF99
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#33FF99
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#CCCCFF
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#00FF00
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#CCCCFF
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=#FFFFCC
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=38 ctermfg=19 gui=NONE guibg=#6699CC guifg=#0000EE
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=78 gui=NONE guibg=#000038 guifg=#FFFFCC
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=68 gui=NONE guibg=#000038 guifg=#FF9900
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=84 gui=bold guibg=#000038 guifg=#999999
    CSAHi DiffText term=reverse cterm=bold ctermbg=16 ctermfg=79 gui=bold guibg=#000038 guifg=#FFFFFF
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
