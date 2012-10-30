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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=148 gui=NONE guibg=black guifg=#90c009
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=Gray75
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=PeachPuff
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff00aa
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=105 gui=NONE guibg=bg guifg=#6666ff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=230 ctermfg=131 gui=NONE guibg=AntiqueWhite1 guifg=FireBrick4
    CSAHi Search term=reverse cterm=NONE ctermbg=75 ctermfg=231 gui=NONE guibg=DodgerBlue guifg=snow
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=SlateGray2
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=Red
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=148 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=148 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=174 ctermfg=231 gui=NONE guibg=IndianRed guifg=Snow
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=DeepSkyBlue1
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=LightCoral
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=Tomato
    CSAHi browseDirectory term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=DarkSlateGray1
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=74 ctermfg=153 gui=NONE guibg=SteelBlue guifg=PowderBlue
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=109 ctermfg=224 gui=NONE guibg=LightSlateGray guifg=MistyRose
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=153 gui=NONE guibg=black guifg=SkyBlue
    CSAHi Title term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi Visual term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=74 ctermfg=153 gui=bold guibg=SteelBlue guifg=PowderBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ff8080
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=107 gui=NONE guibg=bg guifg=OliveDrab
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#f0f0ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=italic guibg=bg guifg=#ffff00
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#ffffc8
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=200 gui=NONE guibg=bg guifg=#ff00c8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=217 gui=italic guibg=black guifg=#ff8080
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=28 ctermfg=226 gui=NONE guibg=#006000 guifg=yellow
    CSAHi DiffChange term=bold cterm=NONE ctermbg=18 ctermfg=226 gui=NONE guibg=#000060 guifg=yellow
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=88 ctermfg=16 gui=NONE guibg=#600000 guifg=black
    CSAHi DiffText term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=italic guibg=yellow guifg=black
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=154 gui=NONE guibg=black guifg=#90c009
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=Gray75
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=PeachPuff
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=200 gui=NONE guibg=bg guifg=#ff00aa
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=105 gui=NONE guibg=bg guifg=#6666ff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=131 gui=NONE guibg=AntiqueWhite1 guifg=FireBrick4
    CSAHi Search term=reverse cterm=NONE ctermbg=75 ctermfg=255 gui=NONE guibg=DodgerBlue guifg=snow
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=SlateGray2
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=Red
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=154 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=154 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=210 ctermfg=255 gui=NONE guibg=IndianRed guifg=Snow
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=DeepSkyBlue1
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=LightCoral
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=Tomato
    CSAHi browseDirectory term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=DarkSlateGray1
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=110 ctermfg=195 gui=NONE guibg=SteelBlue guifg=PowderBlue
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=146 ctermfg=231 gui=NONE guibg=LightSlateGray guifg=MistyRose
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=159 gui=NONE guibg=black guifg=SkyBlue
    CSAHi Title term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi Visual term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=110 ctermfg=195 gui=bold guibg=SteelBlue guifg=PowderBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ff8080
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=OliveDrab
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#f0f0ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=italic guibg=bg guifg=#ffff00
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffc8
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=201 gui=NONE guibg=bg guifg=#ff00c8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=217 gui=italic guibg=black guifg=#ff8080
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=28 ctermfg=226 gui=NONE guibg=#006000 guifg=yellow
    CSAHi DiffChange term=bold cterm=NONE ctermbg=18 ctermfg=226 gui=NONE guibg=#000060 guifg=yellow
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=88 ctermfg=16 gui=NONE guibg=#600000 guifg=black
    CSAHi DiffText term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=italic guibg=yellow guifg=black
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=106 gui=NONE guibg=black guifg=#90c009
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=Gray75
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=PeachPuff
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff00aa
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=63 gui=NONE guibg=bg guifg=#6666ff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=230 ctermfg=88 gui=NONE guibg=AntiqueWhite1 guifg=FireBrick4
    CSAHi Search term=reverse cterm=NONE ctermbg=33 ctermfg=231 gui=NONE guibg=DodgerBlue guifg=snow
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=SlateGray2
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=Red
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=106 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=106 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=167 ctermfg=231 gui=NONE guibg=IndianRed guifg=Snow
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=DeepSkyBlue1
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=LightCoral
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=Tomato
    CSAHi browseDirectory term=NONE cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=DarkSlateGray1
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=67 ctermfg=152 gui=NONE guibg=SteelBlue guifg=PowderBlue
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=102 ctermfg=224 gui=NONE guibg=LightSlateGray guifg=MistyRose
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=116 gui=NONE guibg=black guifg=SkyBlue
    CSAHi Title term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi Visual term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=67 ctermfg=152 gui=bold guibg=SteelBlue guifg=PowderBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff8080
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=OliveDrab
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#f0f0ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=italic guibg=bg guifg=#ffff00
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#ffffc8
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=200 gui=NONE guibg=bg guifg=#ff00c8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=210 gui=italic guibg=black guifg=#ff8080
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=226 gui=NONE guibg=#006000 guifg=yellow
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=226 gui=NONE guibg=#000060 guifg=yellow
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=16 gui=NONE guibg=#600000 guifg=black
    CSAHi DiffText term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=italic guibg=yellow guifg=black
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=40 gui=NONE guibg=black guifg=#90c009
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=19 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=Gray75
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=PeachPuff
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#ff00aa
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#6666ff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=78 ctermfg=32 gui=NONE guibg=AntiqueWhite1 guifg=FireBrick4
    CSAHi Search term=reverse cterm=NONE ctermbg=23 ctermfg=79 gui=NONE guibg=DodgerBlue guifg=snow
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=SlateGray2
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=64 gui=bold guibg=bg guifg=Red
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=40 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=40 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=53 ctermfg=79 gui=NONE guibg=IndianRed guifg=Snow
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=27 gui=NONE guibg=bg guifg=DeepSkyBlue1
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=LightCoral
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=Tomato
    CSAHi browseDirectory term=NONE cterm=NONE ctermbg=bg ctermfg=47 gui=NONE guibg=bg guifg=DarkSlateGray1
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=38 ctermfg=58 gui=NONE guibg=SteelBlue guifg=PowderBlue
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=37 ctermfg=74 gui=NONE guibg=LightSlateGray guifg=MistyRose
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=43 gui=NONE guibg=black guifg=SkyBlue
    CSAHi Title term=bold cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi Visual term=reverse cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=38 ctermfg=58 gui=bold guibg=SteelBlue guifg=PowderBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff8080
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=OliveDrab
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#f0f0ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=76 gui=italic guibg=bg guifg=#ffff00
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=#ffffc8
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=#ff00c8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=69 gui=italic guibg=black guifg=#ff8080
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=20 ctermfg=76 gui=NONE guibg=#006000 guifg=yellow
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=76 gui=NONE guibg=#000060 guifg=yellow
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=32 ctermfg=16 gui=NONE guibg=#600000 guifg=black
    CSAHi DiffText term=reverse cterm=NONE ctermbg=76 ctermfg=16 gui=italic guibg=yellow guifg=black
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
