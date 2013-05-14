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
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=231 gui=NONE guibg=Gray8 guifg=GhostWhite
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=Gray75
    CSAHi Error term=reverse cterm=NONE ctermbg=169 ctermfg=229 gui=NONE guibg=VioletRed guifg=Khaki
    CSAHi Todo term=NONE cterm=NONE ctermbg=19 ctermfg=226 gui=NONE guibg=NavyBlue guifg=Yellow
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=SteelBlue1
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=Turquoise
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=44 gui=bold guibg=bg guifg=DarkTurquoise
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=Turquoise
    CSAHi Function term=NONE cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=DeepSkyBlue
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=128 gui=NONE guibg=bg guifg=DarkViolet
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=134 gui=NONE guibg=bg guifg=DarkOrchid
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=104 gui=NONE guibg=bg guifg=SlateBlue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=18 gui=bold guibg=bg guifg=MidnightBlue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=73 gui=bold guibg=bg guifg=LightSeaGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=131 ctermfg=226 gui=NONE guibg=Firebrick guifg=Yellow
    CSAHi IncSearch term=reverse cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=Red
    CSAHi Search term=reverse cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=Red guifg=MintCream
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=49 gui=bold guibg=bg guifg=MediumSpringGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=31 ctermfg=118 gui=bold guibg=DeepSkyBlue4 guifg=LawnGreen
    CSAHi LineNr term=underline cterm=underline ctermbg=234 ctermfg=152 gui=underline guibg=Gray10 guifg=LightSkyBlue3
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=196 ctermfg=16 gui=NONE guibg=Red guifg=Black
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=134 gui=NONE guibg=bg guifg=BlueViolet
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=233 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=233 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=bold ctermbg=16 ctermfg=fg gui=bold guibg=Black guifg=fg
    CSAHi CursorLine term=underline cterm=bold ctermbg=16 ctermfg=fg gui=bold guibg=Black guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=Green guifg=Black
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=peru
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=121 gui=NONE guibg=bg guifg=SeaGreen1
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=SpringGreen
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=49 gui=NONE guibg=bg guifg=MediumSpringGreen
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green2
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=48 gui=bold guibg=bg guifg=SpringGreen
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=48 gui=bold guibg=bg guifg=SpringGreen2
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=135 gui=NONE guibg=bg guifg=Purple2
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=green
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=61 ctermfg=231 gui=bold guibg=RoyalBlue4 guifg=White
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=102 ctermfg=224 gui=bold guibg=DimGray guifg=Bisque
    CSAHi VertSplit term=reverse cterm=bold ctermbg=102 ctermfg=224 gui=bold guibg=DimGray guifg=Bisque
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=75 gui=bold guibg=bg guifg=DodgerBlue
    CSAHi Visual term=reverse cterm=NONE ctermbg=61 ctermfg=226 gui=reverse guibg=Yellow guifg=SlateBlue4
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=Gold
    CSAHi WildMenu term=NONE cterm=bold ctermbg=118 ctermfg=16 gui=bold guibg=Chartreuse guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=31 ctermfg=195 gui=NONE guibg=DodgerBlue4 guifg=LightCyan
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=233 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=37 ctermfg=220 gui=bold guibg=DarkCyan guifg=Gold
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=109 gui=NONE guibg=bg guifg=LightSlateGray
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=CornflowerBlue
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=BurlyWood
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=DeepSkyBlue
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=48 gui=bold guibg=bg guifg=SpringGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=135 gui=NONE guibg=bg guifg=Purple
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=RoyalBlue
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=RoyalBlue2
    CSAHi Structure term=NONE cterm=bold ctermbg=bg ctermfg=32 gui=bold guibg=bg guifg=DodgerBlue3
    CSAHi Typedef term=NONE cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=RoyalBlue1
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=Moccasin
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=Tan
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=Wheat3
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=235 ctermfg=75 gui=bold guibg=Gray16 guifg=DodgerBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=37 ctermfg=231 gui=NONE guibg=Turquoise4 guifg=White
    CSAHi DiffChange term=bold cterm=NONE ctermbg=71 ctermfg=231 gui=NONE guibg=ForestGreen guifg=White
    CSAHi DiffDelete term=bold cterm=bold ctermbg=103 ctermfg=132 gui=bold guibg=SlateGray4 guifg=HotPink4
    CSAHi DiffText term=reverse cterm=bold ctermbg=19 ctermfg=209 gui=bold guibg=DarkBlue guifg=Tomato
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=Gray8 guifg=GhostWhite
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=Gray75
    CSAHi Error term=reverse cterm=NONE ctermbg=205 ctermfg=229 gui=NONE guibg=VioletRed guifg=Khaki
    CSAHi Todo term=NONE cterm=NONE ctermbg=19 ctermfg=226 gui=NONE guibg=NavyBlue guifg=Yellow
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=SteelBlue1
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=Turquoise
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=DarkTurquoise
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=Turquoise
    CSAHi Function term=NONE cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=DeepSkyBlue
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=129 gui=NONE guibg=bg guifg=DarkViolet
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=171 gui=NONE guibg=bg guifg=DarkOrchid
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=105 gui=NONE guibg=bg guifg=SlateBlue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=61 gui=bold guibg=bg guifg=MidnightBlue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=80 gui=bold guibg=bg guifg=LightSeaGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=167 ctermfg=226 gui=NONE guibg=Firebrick guifg=Yellow
    CSAHi IncSearch term=reverse cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=Red
    CSAHi Search term=reverse cterm=bold ctermbg=196 ctermfg=255 gui=bold guibg=Red guifg=MintCream
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=50 gui=bold guibg=bg guifg=MediumSpringGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=31 ctermfg=154 gui=bold guibg=DeepSkyBlue4 guifg=LawnGreen
    CSAHi LineNr term=underline cterm=underline ctermbg=234 ctermfg=153 gui=underline guibg=Gray10 guifg=LightSkyBlue3
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=196 ctermfg=16 gui=NONE guibg=Red guifg=Black
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=135 gui=NONE guibg=bg guifg=BlueViolet
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=233 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=233 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=bold ctermbg=16 ctermfg=fg gui=bold guibg=Black guifg=fg
    CSAHi CursorLine term=underline cterm=bold ctermbg=16 ctermfg=fg gui=bold guibg=Black guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=Green guifg=Black
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=peru
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=SeaGreen1
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=49 gui=NONE guibg=bg guifg=SpringGreen
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=50 gui=NONE guibg=bg guifg=MediumSpringGreen
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green2
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=49 gui=bold guibg=bg guifg=SpringGreen
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=49 gui=bold guibg=bg guifg=SpringGreen2
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=135 gui=NONE guibg=bg guifg=Purple2
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=green
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=67 ctermfg=255 gui=bold guibg=RoyalBlue4 guifg=White
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=242 ctermfg=231 gui=bold guibg=DimGray guifg=Bisque
    CSAHi VertSplit term=reverse cterm=bold ctermbg=242 ctermfg=231 gui=bold guibg=DimGray guifg=Bisque
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=75 gui=bold guibg=bg guifg=DodgerBlue
    CSAHi Visual term=reverse cterm=NONE ctermbg=97 ctermfg=226 gui=reverse guibg=Yellow guifg=SlateBlue4
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Gold
    CSAHi WildMenu term=NONE cterm=bold ctermbg=154 ctermfg=16 gui=bold guibg=Chartreuse guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=31 ctermfg=231 gui=NONE guibg=DodgerBlue4 guifg=LightCyan
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=233 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=37 ctermfg=226 gui=bold guibg=DarkCyan guifg=Gold
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=LightSlateGray
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=CornflowerBlue
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=BurlyWood
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=DeepSkyBlue
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=49 gui=bold guibg=bg guifg=SpringGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=171 gui=NONE guibg=bg guifg=Purple
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=105 gui=bold guibg=bg guifg=RoyalBlue
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=RoyalBlue2
    CSAHi Structure term=NONE cterm=bold ctermbg=bg ctermfg=75 gui=bold guibg=bg guifg=DodgerBlue3
    CSAHi Typedef term=NONE cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=RoyalBlue1
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=Moccasin
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=Tan
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=Wheat3
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=59 ctermfg=75 gui=bold guibg=Gray16 guifg=DodgerBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=37 ctermfg=255 gui=NONE guibg=Turquoise4 guifg=White
    CSAHi DiffChange term=bold cterm=NONE ctermbg=71 ctermfg=255 gui=NONE guibg=ForestGreen guifg=White
    CSAHi DiffDelete term=bold cterm=bold ctermbg=145 ctermfg=132 gui=bold guibg=SlateGray4 guifg=HotPink4
    CSAHi DiffText term=reverse cterm=bold ctermbg=19 ctermfg=210 gui=bold guibg=DarkBlue guifg=Tomato
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=231 gui=NONE guibg=Gray8 guifg=GhostWhite
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=Gray75
    CSAHi Error term=reverse cterm=NONE ctermbg=162 ctermfg=222 gui=NONE guibg=VioletRed guifg=Khaki
    CSAHi Todo term=NONE cterm=NONE ctermbg=18 ctermfg=226 gui=NONE guibg=NavyBlue guifg=Yellow
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=SteelBlue1
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=Turquoise
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=44 gui=bold guibg=bg guifg=DarkTurquoise
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=Turquoise
    CSAHi Function term=NONE cterm=bold ctermbg=bg ctermfg=39 gui=bold guibg=bg guifg=DeepSkyBlue
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=92 gui=NONE guibg=bg guifg=DarkViolet
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=98 gui=NONE guibg=bg guifg=DarkOrchid
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=62 gui=NONE guibg=bg guifg=SlateBlue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=17 gui=bold guibg=bg guifg=MidnightBlue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=37 gui=bold guibg=bg guifg=LightSeaGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=226 gui=NONE guibg=Firebrick guifg=Yellow
    CSAHi IncSearch term=reverse cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=Red
    CSAHi Search term=reverse cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=Red guifg=MintCream
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=48 gui=bold guibg=bg guifg=MediumSpringGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=24 ctermfg=118 gui=bold guibg=DeepSkyBlue4 guifg=LawnGreen
    CSAHi LineNr term=underline cterm=underline ctermbg=234 ctermfg=110 gui=underline guibg=Gray10 guifg=LightSkyBlue3
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=196 ctermfg=16 gui=NONE guibg=Red guifg=Black
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=92 gui=NONE guibg=bg guifg=BlueViolet
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=233 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=233 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=bold ctermbg=16 ctermfg=fg gui=bold guibg=Black guifg=fg
    CSAHi CursorLine term=underline cterm=bold ctermbg=16 ctermfg=fg gui=bold guibg=Black guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=Green guifg=Black
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=peru
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=SeaGreen1
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=SpringGreen
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=MediumSpringGreen
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green2
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=48 gui=bold guibg=bg guifg=SpringGreen
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=48 gui=bold guibg=bg guifg=SpringGreen2
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=93 gui=NONE guibg=bg guifg=Purple2
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=green
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=24 ctermfg=231 gui=bold guibg=RoyalBlue4 guifg=White
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=242 ctermfg=224 gui=bold guibg=DimGray guifg=Bisque
    CSAHi VertSplit term=reverse cterm=bold ctermbg=242 ctermfg=224 gui=bold guibg=DimGray guifg=Bisque
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=33 gui=bold guibg=bg guifg=DodgerBlue
    CSAHi Visual term=reverse cterm=NONE ctermbg=60 ctermfg=226 gui=reverse guibg=Yellow guifg=SlateBlue4
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=Gold
    CSAHi WildMenu term=NONE cterm=bold ctermbg=118 ctermfg=16 gui=bold guibg=Chartreuse guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=24 ctermfg=195 gui=NONE guibg=DodgerBlue4 guifg=LightCyan
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=233 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=30 ctermfg=220 gui=bold guibg=DarkCyan guifg=Gold
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=LightSlateGray
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=CornflowerBlue
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=BurlyWood
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=DeepSkyBlue
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=48 gui=bold guibg=bg guifg=SpringGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=129 gui=NONE guibg=bg guifg=Purple
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=62 gui=bold guibg=bg guifg=RoyalBlue
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=63 gui=bold guibg=bg guifg=RoyalBlue2
    CSAHi Structure term=NONE cterm=bold ctermbg=bg ctermfg=32 gui=bold guibg=bg guifg=DodgerBlue3
    CSAHi Typedef term=NONE cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=RoyalBlue1
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=Moccasin
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=Tan
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=Wheat3
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=235 ctermfg=33 gui=bold guibg=Gray16 guifg=DodgerBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=30 ctermfg=231 gui=NONE guibg=Turquoise4 guifg=White
    CSAHi DiffChange term=bold cterm=NONE ctermbg=28 ctermfg=231 gui=NONE guibg=ForestGreen guifg=White
    CSAHi DiffDelete term=bold cterm=bold ctermbg=66 ctermfg=95 gui=bold guibg=SlateGray4 guifg=HotPink4
    CSAHi DiffText term=reverse cterm=bold ctermbg=18 ctermfg=203 gui=bold guibg=DarkBlue guifg=Tomato
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=Gray8 guifg=GhostWhite
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=Gray75
    CSAHi Error term=reverse cterm=NONE ctermbg=49 ctermfg=73 gui=NONE guibg=VioletRed guifg=Khaki
    CSAHi Todo term=NONE cterm=NONE ctermbg=17 ctermfg=76 gui=NONE guibg=NavyBlue guifg=Yellow
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=SteelBlue1
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=Turquoise
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=26 gui=bold guibg=bg guifg=DarkTurquoise
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=Turquoise
    CSAHi Function term=NONE cterm=bold ctermbg=bg ctermfg=27 gui=bold guibg=bg guifg=DeepSkyBlue
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=34 gui=NONE guibg=bg guifg=DarkViolet
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=34 gui=NONE guibg=bg guifg=DarkOrchid
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=SlateBlue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=17 gui=bold guibg=bg guifg=MidnightBlue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=25 gui=bold guibg=bg guifg=LightSeaGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=48 ctermfg=76 gui=NONE guibg=Firebrick guifg=Yellow
    CSAHi IncSearch term=reverse cterm=bold ctermbg=bg ctermfg=64 gui=bold guibg=bg guifg=Red
    CSAHi Search term=reverse cterm=bold ctermbg=64 ctermfg=79 gui=bold guibg=Red guifg=MintCream
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=MediumSpringGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=21 ctermfg=44 gui=bold guibg=DeepSkyBlue4 guifg=LawnGreen
    CSAHi LineNr term=underline cterm=underline ctermbg=80 ctermfg=42 gui=underline guibg=Gray10 guifg=LightSkyBlue3
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=64 ctermfg=16 gui=NONE guibg=Red guifg=Black
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=34 gui=NONE guibg=bg guifg=BlueViolet
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=bold ctermbg=16 ctermfg=fg gui=bold guibg=Black guifg=fg
    CSAHi CursorLine term=underline cterm=bold ctermbg=16 ctermfg=fg gui=bold guibg=Black guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=Green guifg=Black
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=peru
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=SeaGreen1
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=SpringGreen
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=MediumSpringGreen
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=Green2
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SpringGreen
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SpringGreen2
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=35 gui=NONE guibg=bg guifg=Purple2
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=green
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=17 ctermfg=79 gui=bold guibg=RoyalBlue4 guifg=White
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=82 ctermfg=74 gui=bold guibg=DimGray guifg=Bisque
    CSAHi VertSplit term=reverse cterm=bold ctermbg=82 ctermfg=74 gui=bold guibg=DimGray guifg=Bisque
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=DodgerBlue
    CSAHi Visual term=reverse cterm=NONE ctermbg=33 ctermfg=76 gui=reverse guibg=Yellow guifg=SlateBlue4
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=Gold
    CSAHi WildMenu term=NONE cterm=bold ctermbg=44 ctermfg=16 gui=bold guibg=Chartreuse guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=21 ctermfg=63 gui=NONE guibg=DodgerBlue4 guifg=LightCyan
    CSAHi lCursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=21 ctermfg=72 gui=bold guibg=DarkCyan guifg=Gold
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=LightSlateGray
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=CornflowerBlue
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=BurlyWood
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=27 gui=NONE guibg=bg guifg=DeepSkyBlue
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SpringGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=35 gui=NONE guibg=bg guifg=Purple
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=RoyalBlue
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=RoyalBlue2
    CSAHi Structure term=NONE cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=DodgerBlue3
    CSAHi Typedef term=NONE cterm=bold ctermbg=bg ctermfg=39 gui=bold guibg=bg guifg=RoyalBlue1
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=Moccasin
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=Tan
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=Wheat3
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=80 ctermfg=23 gui=bold guibg=Gray16 guifg=DodgerBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=Turquoise4 guifg=White
    CSAHi DiffChange term=bold cterm=NONE ctermbg=20 ctermfg=79 gui=NONE guibg=ForestGreen guifg=White
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=33 gui=bold guibg=SlateGray4 guifg=HotPink4
    CSAHi DiffText term=reverse cterm=bold ctermbg=17 ctermfg=69 gui=bold guibg=DarkBlue guifg=Tomato
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
