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
    CSAHi Normal term=NONE cterm=NONE ctermbg=23 ctermfg=152 gui=NONE guibg=#082926 guifg=LightBlue3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=110 gui=underline guibg=bg guifg=SkyBlue3
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=236 gui=NONE guibg=bg guifg=Gray18
    CSAHi Error term=reverse cterm=NONE ctermbg=132 ctermfg=186 gui=NONE guibg=VioletRed4 guifg=Khaki3
    CSAHi Todo term=NONE cterm=bold ctermbg=bg ctermfg=179 gui=bold guibg=bg guifg=GoldenRod3
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=44 gui=NONE guibg=bg guifg=Turquoise3
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=115 gui=NONE guibg=bg guifg=Aquamarine3
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=138 gui=NONE guibg=bg guifg=RosyBrown4
    CSAHi NonText term=bold cterm=bold ctermbg=23 ctermfg=18 gui=bold guibg=#0C2628 guifg=MidnightBlue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=150 gui=bold guibg=bg guifg=DarkOliveGreen3
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=131 ctermfg=223 gui=NONE guibg=Firebrick guifg=LightGoldenRod
    CSAHi IncSearch term=reverse cterm=bold ctermbg=bg ctermfg=203 gui=bold guibg=bg guifg=Firebrick1
    CSAHi Search term=reverse cterm=NONE ctermbg=152 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=37 gui=bold guibg=bg guifg=DarkCyan
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=191 gui=bold guibg=bg guifg=OliveDrab2
    CSAHi LineNr term=underline cterm=NONE ctermbg=23 ctermfg=151 gui=NONE guibg=#0C2628 guifg=DarkSeaGreen3
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=97 ctermfg=231 gui=NONE guibg=MediumPurple4 guifg=White
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=59 ctermfg=224 gui=NONE guibg=#22364C guifg=Wheat
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=145 ctermfg=187 gui=NONE guibg=SeaShell4 guifg=Tan
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=174 ctermfg=145 gui=reverse guibg=SeaShell4 guifg=IndianRed
    CSAHi TabLine term=underline cterm=underline ctermbg=238 ctermfg=111 gui=underline guibg=Gray26 guifg=CornflowerBlue
    CSAHi TabLineSel term=bold cterm=bold ctermbg=23 ctermfg=68 gui=bold guibg=#082926 guifg=RoyalBlue
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=59 ctermfg=111 gui=underline guibg=Gray20 guifg=CornflowerBlue
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#063C36 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#063C36 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=77 ctermfg=16 gui=NONE guibg=LimeGreen guifg=Black
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=SeaGreen3
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=202 ctermfg=16 gui=NONE guibg=OrangeRed guifg=Black
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=Green
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=61 ctermfg=187 gui=bold guibg=#334680 guifg=LemonChiffon3
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=238 ctermfg=145 gui=bold guibg=Gray26 guifg=Honeydew4
    CSAHi VertSplit term=reverse cterm=bold ctermbg=238 ctermfg=59 gui=bold guibg=Gray26 guifg=Gray20
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=RoyalBlue3
    CSAHi Visual term=reverse cterm=NONE ctermbg=59 ctermfg=153 gui=NONE guibg=#22364C guifg=PowderBlue
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=109 gui=bold,underline guibg=bg guifg=SlateGray
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=Gold
    CSAHi WildMenu term=NONE cterm=bold ctermbg=112 ctermfg=16 gui=bold guibg=Chartreuse3 guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=66 ctermfg=114 gui=NONE guibg=DarkSlateGray guifg=PaleGreen3
    CSAHi lCursor term=NONE cterm=NONE ctermbg=152 ctermfg=23 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=37 ctermfg=179 gui=bold guibg=DarkCyan guifg=GoldenRod
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=138 gui=italic guibg=bg guifg=BurlyWood4
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=116 gui=NONE guibg=bg guifg=CadetBlue3
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=104 gui=NONE guibg=bg guifg=SlateBlue
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=SteelBlue3
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=SpringGreen3
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=DodgerBlue3
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=DeepSkyBlue3
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=66 ctermfg=114 gui=bold guibg=DarkSlateGray guifg=PaleGreen3
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=101 ctermfg=216 gui=NONE guibg=DarkOliveGreen guifg=SandyBrown
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#3C444C guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=59 gui=bold guibg=Black guifg=Gray20
    CSAHi DiffText term=reverse cterm=bold ctermbg=23 ctermfg=173 gui=bold guibg=#033B40 guifg=Chocolate
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=37 ctermfg=229 gui=NONE guibg=Turquoise4 guifg=PaleGoldenrod
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=23 ctermfg=195 gui=NONE guibg=#082926 guifg=LightBlue3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=SkyBlue3
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=236 gui=NONE guibg=bg guifg=Gray18
    CSAHi Error term=reverse cterm=NONE ctermbg=132 ctermfg=229 gui=NONE guibg=VioletRed4 guifg=Khaki3
    CSAHi Todo term=NONE cterm=bold ctermbg=bg ctermfg=221 gui=bold guibg=bg guifg=GoldenRod3
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=Turquoise3
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=Aquamarine3
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=138 gui=NONE guibg=bg guifg=RosyBrown4
    CSAHi NonText term=bold cterm=bold ctermbg=23 ctermfg=61 gui=bold guibg=#0C2628 guifg=MidnightBlue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=192 gui=bold guibg=bg guifg=DarkOliveGreen3
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=167 ctermfg=229 gui=NONE guibg=Firebrick guifg=LightGoldenRod
    CSAHi IncSearch term=reverse cterm=bold ctermbg=bg ctermfg=203 gui=bold guibg=bg guifg=Firebrick1
    CSAHi Search term=reverse cterm=NONE ctermbg=195 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=37 gui=bold guibg=bg guifg=DarkCyan
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=191 gui=bold guibg=bg guifg=OliveDrab2
    CSAHi LineNr term=underline cterm=NONE ctermbg=23 ctermfg=194 gui=NONE guibg=#0C2628 guifg=DarkSeaGreen3
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=103 ctermfg=255 gui=NONE guibg=MediumPurple4 guifg=White
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=60 ctermfg=230 gui=NONE guibg=#22364C guifg=Wheat
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=145 ctermfg=223 gui=NONE guibg=SeaShell4 guifg=Tan
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=210 ctermfg=145 gui=reverse guibg=SeaShell4 guifg=IndianRed
    CSAHi TabLine term=underline cterm=underline ctermbg=238 ctermfg=117 gui=underline guibg=Gray26 guifg=CornflowerBlue
    CSAHi TabLineSel term=bold cterm=bold ctermbg=23 ctermfg=105 gui=bold guibg=#082926 guifg=RoyalBlue
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=236 ctermfg=117 gui=underline guibg=Gray20 guifg=CornflowerBlue
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#063C36 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#063C36 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=83 ctermfg=16 gui=NONE guibg=LimeGreen guifg=Black
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=121 gui=NONE guibg=bg guifg=SeaGreen3
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=208 ctermfg=16 gui=NONE guibg=OrangeRed guifg=Black
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=Green
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=67 ctermfg=230 gui=bold guibg=#334680 guifg=LemonChiffon3
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=238 ctermfg=145 gui=bold guibg=Gray26 guifg=Honeydew4
    CSAHi VertSplit term=reverse cterm=bold ctermbg=238 ctermfg=236 gui=bold guibg=Gray26 guifg=Gray20
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=RoyalBlue3
    CSAHi Visual term=reverse cterm=NONE ctermbg=60 ctermfg=195 gui=NONE guibg=#22364C guifg=PowderBlue
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=145 gui=bold,underline guibg=bg guifg=SlateGray
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Gold
    CSAHi WildMenu term=NONE cterm=bold ctermbg=118 ctermfg=16 gui=bold guibg=Chartreuse3 guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=66 ctermfg=157 gui=NONE guibg=DarkSlateGray guifg=PaleGreen3
    CSAHi lCursor term=NONE cterm=NONE ctermbg=195 ctermfg=23 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=37 ctermfg=221 gui=bold guibg=DarkCyan guifg=GoldenRod
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=144 gui=italic guibg=bg guifg=BurlyWood4
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=CadetBlue3
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=105 gui=NONE guibg=bg guifg=SlateBlue
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=SteelBlue3
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=SpringGreen3
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=DodgerBlue3
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=DeepSkyBlue3
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=66 ctermfg=157 gui=bold guibg=DarkSlateGray guifg=PaleGreen3
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=107 ctermfg=222 gui=NONE guibg=DarkOliveGreen guifg=SandyBrown
    CSAHi DiffChange term=bold cterm=NONE ctermbg=66 ctermfg=fg gui=NONE guibg=#3C444C guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=236 gui=bold guibg=Black guifg=Gray20
    CSAHi DiffText term=reverse cterm=bold ctermbg=24 ctermfg=209 gui=bold guibg=#033B40 guifg=Chocolate
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=37 ctermfg=230 gui=NONE guibg=Turquoise4 guifg=PaleGoldenrod
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=110 gui=NONE guibg=#082926 guifg=LightBlue3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=74 gui=underline guibg=bg guifg=SkyBlue3
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=236 gui=NONE guibg=bg guifg=Gray18
    CSAHi Error term=reverse cterm=NONE ctermbg=89 ctermfg=185 gui=NONE guibg=VioletRed4 guifg=Khaki3
    CSAHi Todo term=NONE cterm=bold ctermbg=bg ctermfg=172 gui=bold guibg=bg guifg=GoldenRod3
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=44 gui=NONE guibg=bg guifg=Turquoise3
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=Aquamarine3
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=95 gui=NONE guibg=bg guifg=RosyBrown4
    CSAHi NonText term=bold cterm=bold ctermbg=16 ctermfg=17 gui=bold guibg=#0C2628 guifg=MidnightBlue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=149 gui=bold guibg=bg guifg=DarkOliveGreen3
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=222 gui=NONE guibg=Firebrick guifg=LightGoldenRod
    CSAHi IncSearch term=reverse cterm=bold ctermbg=bg ctermfg=203 gui=bold guibg=bg guifg=Firebrick1
    CSAHi Search term=reverse cterm=NONE ctermbg=110 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=30 gui=bold guibg=bg guifg=DarkCyan
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=155 gui=bold guibg=bg guifg=OliveDrab2
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=114 gui=NONE guibg=#0C2628 guifg=DarkSeaGreen3
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=60 ctermfg=231 gui=NONE guibg=MediumPurple4 guifg=White
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=23 ctermfg=223 gui=NONE guibg=#22364C guifg=Wheat
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=102 ctermfg=180 gui=NONE guibg=SeaShell4 guifg=Tan
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=167 ctermfg=102 gui=reverse guibg=SeaShell4 guifg=IndianRed
    CSAHi TabLine term=underline cterm=underline ctermbg=238 ctermfg=69 gui=underline guibg=Gray26 guifg=CornflowerBlue
    CSAHi TabLineSel term=bold cterm=bold ctermbg=16 ctermfg=62 gui=bold guibg=#082926 guifg=RoyalBlue
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=236 ctermfg=69 gui=underline guibg=Gray20 guifg=CornflowerBlue
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#063C36 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#063C36 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=77 ctermfg=16 gui=NONE guibg=LimeGreen guifg=Black
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=SeaGreen3
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=202 ctermfg=16 gui=NONE guibg=OrangeRed guifg=Black
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=Green
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=60 ctermfg=187 gui=bold guibg=#334680 guifg=LemonChiffon3
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=238 ctermfg=102 gui=bold guibg=Gray26 guifg=Honeydew4
    CSAHi VertSplit term=reverse cterm=bold ctermbg=238 ctermfg=236 gui=bold guibg=Gray26 guifg=Gray20
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=62 gui=bold guibg=bg guifg=RoyalBlue3
    CSAHi Visual term=reverse cterm=NONE ctermbg=23 ctermfg=152 gui=NONE guibg=#22364C guifg=PowderBlue
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=66 gui=bold,underline guibg=bg guifg=SlateGray
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=Gold
    CSAHi WildMenu term=NONE cterm=bold ctermbg=76 ctermfg=16 gui=bold guibg=Chartreuse3 guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=23 ctermfg=114 gui=NONE guibg=DarkSlateGray guifg=PaleGreen3
    CSAHi lCursor term=NONE cterm=NONE ctermbg=110 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=30 ctermfg=178 gui=bold guibg=DarkCyan guifg=GoldenRod
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=95 gui=italic guibg=bg guifg=BurlyWood4
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=116 gui=NONE guibg=bg guifg=CadetBlue3
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=62 gui=NONE guibg=bg guifg=SlateBlue
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=SteelBlue3
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=SpringGreen3
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=DodgerBlue3
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=DeepSkyBlue3
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=23 ctermfg=114 gui=bold guibg=DarkSlateGray guifg=PaleGreen3
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=58 ctermfg=215 gui=NONE guibg=DarkOliveGreen guifg=SandyBrown
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#3C444C guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=236 gui=bold guibg=Black guifg=Gray20
    CSAHi DiffText term=reverse cterm=bold ctermbg=23 ctermfg=166 gui=bold guibg=#033B40 guifg=Chocolate
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=30 ctermfg=223 gui=NONE guibg=Turquoise4 guifg=PaleGoldenrod
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=42 gui=NONE guibg=#082926 guifg=LightBlue3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=SkyBlue3
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=Gray18
    CSAHi Error term=reverse cterm=NONE ctermbg=33 ctermfg=57 gui=NONE guibg=VioletRed4 guifg=Khaki3
    CSAHi Todo term=NONE cterm=bold ctermbg=bg ctermfg=52 gui=bold guibg=bg guifg=GoldenRod3
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=Turquoise3
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=Aquamarine3
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=RosyBrown4
    CSAHi NonText term=bold cterm=bold ctermbg=16 ctermfg=17 gui=bold guibg=#0C2628 guifg=MidnightBlue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=41 gui=bold guibg=bg guifg=DarkOliveGreen3
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=48 ctermfg=73 gui=NONE guibg=Firebrick guifg=LightGoldenRod
    CSAHi IncSearch term=reverse cterm=bold ctermbg=bg ctermfg=64 gui=bold guibg=bg guifg=Firebrick1
    CSAHi Search term=reverse cterm=NONE ctermbg=42 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=DarkCyan
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=60 gui=bold guibg=bg guifg=OliveDrab2
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=41 gui=NONE guibg=#0C2628 guifg=DarkSeaGreen3
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=37 ctermfg=79 gui=NONE guibg=MediumPurple4 guifg=White
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=17 ctermfg=74 gui=NONE guibg=#22364C guifg=Wheat
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=83 ctermfg=57 gui=NONE guibg=SeaShell4 guifg=Tan
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=53 ctermfg=83 gui=reverse guibg=SeaShell4 guifg=IndianRed
    CSAHi TabLine term=underline cterm=underline ctermbg=80 ctermfg=39 gui=underline guibg=Gray26 guifg=CornflowerBlue
    CSAHi TabLineSel term=bold cterm=bold ctermbg=16 ctermfg=22 gui=bold guibg=#082926 guifg=RoyalBlue
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=80 ctermfg=39 gui=underline guibg=Gray20 guifg=CornflowerBlue
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#063C36 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#063C36 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=24 ctermfg=16 gui=NONE guibg=LimeGreen guifg=Black
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=SeaGreen3
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=64 ctermfg=16 gui=NONE guibg=OrangeRed guifg=Black
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=Green
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=21 ctermfg=57 gui=bold guibg=#334680 guifg=LemonChiffon3
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=80 ctermfg=83 gui=bold guibg=Gray26 guifg=Honeydew4
    CSAHi VertSplit term=reverse cterm=bold ctermbg=80 ctermfg=80 gui=bold guibg=Gray26 guifg=Gray20
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=RoyalBlue3
    CSAHi Visual term=reverse cterm=NONE ctermbg=17 ctermfg=58 gui=NONE guibg=#22364C guifg=PowderBlue
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=37 gui=bold,underline guibg=bg guifg=SlateGray
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=Gold
    CSAHi WildMenu term=NONE cterm=bold ctermbg=40 ctermfg=16 gui=bold guibg=Chartreuse3 guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=21 ctermfg=41 gui=NONE guibg=DarkSlateGray guifg=PaleGreen3
    CSAHi lCursor term=NONE cterm=NONE ctermbg=42 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=21 ctermfg=52 gui=bold guibg=DarkCyan guifg=GoldenRod
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=italic guibg=bg guifg=BurlyWood4
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=CadetBlue3
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=SlateBlue
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=SteelBlue3
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=SpringGreen3
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=DodgerBlue3
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=DeepSkyBlue3
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=21 ctermfg=41 gui=bold guibg=DarkSlateGray guifg=PaleGreen3
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=36 ctermfg=69 gui=NONE guibg=DarkOliveGreen guifg=SandyBrown
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#3C444C guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=80 gui=bold guibg=Black guifg=Gray20
    CSAHi DiffText term=reverse cterm=bold ctermbg=16 ctermfg=52 gui=bold guibg=#033B40 guifg=Chocolate
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=21 ctermfg=77 gui=NONE guibg=Turquoise4 guifg=PaleGoldenrod
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
