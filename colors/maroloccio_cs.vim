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
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#1a202a guifg=#8b9aaa
    CSAHi Underlined term=underline cterm=bold,underline ctermbg=bg ctermfg=104 gui=bold,underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=131 ctermfg=145 gui=NONE guibg=#8f3231 guifg=fg
    CSAHi Todo term=NONE cterm=bold,undercurl ctermbg=16 ctermfg=185 gui=bold,undercurl guibg=#0e1219 guifg=#8f3231 guisp=#cbc32a
    CSAHi String term=NONE cterm=NONE ctermbg=59 ctermfg=61 gui=NONE guibg=bg guifg=#4c4cad
    CSAHi Character term=NONE cterm=NONE ctermbg=59 ctermfg=146 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Number term=NONE cterm=NONE ctermbg=59 ctermfg=142 gui=NONE guibg=bg guifg=#8b8b00
    CSAHi Boolean term=NONE cterm=NONE ctermbg=59 ctermfg=146 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Float term=NONE cterm=NONE ctermbg=59 ctermfg=146 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Function term=NONE cterm=NONE ctermbg=59 ctermfg=220 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Macro term=NONE cterm=NONE ctermbg=59 ctermfg=29 gui=NONE guibg=bg guifg=#107040
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=59 ctermfg=29 gui=NONE guibg=bg guifg=#107040
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=59 ctermfg=60 gui=NONE guibg=bg guifg=#333366
    CSAHi NonText term=bold cterm=NONE ctermbg=59 ctermfg=60 gui=NONE guibg=bg guifg=#333366
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=bold ctermbg=146 ctermfg=16 gui=bold guibg=#82ade0 guifg=#0e1219
    CSAHi Search term=reverse cterm=NONE ctermbg=29 ctermfg=113 gui=NONE guibg=#107040 guifg=#78ba42
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=#0e1219 guifg=#2c3138
    CSAHi htmlBold term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Define term=NONE cterm=NONE ctermbg=59 ctermfg=29 gui=NONE guibg=bg guifg=#107040
    CSAHi htmlBoldUnderlineItalic term=bold,italic,underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlItalic term=italic cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlUnderline term=underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=italic,underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=61 ctermfg=145 gui=NONE guibg=#3741ad guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=60 ctermfg=145 gui=NONE guibg=#333366 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=145 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=16 ctermfg=145 gui=NONE guibg=black guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=145 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0e1219 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0e1219 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#8b9aaa guifg=#0e1219
    CSAHi htmlBoldItalic term=bold,italic cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Conditional term=NONE cterm=NONE ctermbg=59 ctermfg=214 gui=NONE guibg=bg guifg=#ff9900
    CSAHi Repeat term=NONE cterm=NONE ctermbg=59 ctermfg=113 gui=NONE guibg=bg guifg=#78ba42
    CSAHi Label term=NONE cterm=NONE ctermbg=59 ctermfg=97 gui=NONE guibg=bg guifg=#7e28a9
    CSAHi Operator term=NONE cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=bg guifg=#6d5279
    CSAHi Exception term=NONE cterm=NONE ctermbg=59 ctermfg=131 gui=NONE guibg=bg guifg=#8f3231
    CSAHi Include term=NONE cterm=NONE ctermbg=59 ctermfg=29 gui=NONE guibg=bg guifg=#107040
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=16 ctermfg=145 gui=NONE guibg=black guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=black guifg=#2c3138
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=60 ctermfg=145 gui=NONE guibg=#333366 guifg=fg
    CSAHi Title term=bold cterm=NONE ctermbg=59 ctermfg=131 gui=NONE guibg=bg guifg=#8f3231
    CSAHi Visual term=reverse cterm=NONE ctermbg=61 ctermfg=145 gui=NONE guibg=#3741ad guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=145 gui=NONE guibg=#0e1219 guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=60 ctermfg=145 gui=NONE guibg=#333366 guifg=fg
    CSAHi htmlBoldUnderline term=bold,underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=145 ctermfg=59 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=113 ctermfg=16 gui=NONE guibg=#78ba42 guifg=#0e1219
    CSAHi Comment term=bold cterm=NONE ctermbg=59 ctermfg=30 gui=NONE guibg=bg guifg=#006666
    CSAHi Constant term=underline cterm=NONE ctermbg=59 ctermfg=146 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Special term=bold cterm=NONE ctermbg=59 ctermfg=61 gui=NONE guibg=bg guifg=#3741ad
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=DarkCyan
    CSAHi Statement term=bold cterm=NONE ctermbg=59 ctermfg=140 gui=NONE guibg=bg guifg=#9966cc
    CSAHi PreProc term=underline cterm=NONE ctermbg=59 ctermfg=29 gui=NONE guibg=bg guifg=#107040
    CSAHi Type term=underline cterm=NONE ctermbg=59 ctermfg=220 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=59 ctermfg=220 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Structure term=NONE cterm=NONE ctermbg=59 ctermfg=220 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Typedef term=NONE cterm=NONE ctermbg=59 ctermfg=220 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Tag term=NONE cterm=NONE ctermbg=59 ctermfg=61 gui=NONE guibg=bg guifg=#3741ad
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=59 ctermfg=61 gui=NONE guibg=bg guifg=#3741ad
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=59 ctermfg=61 gui=NONE guibg=bg guifg=#3741ad
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=59 ctermfg=73 gui=NONE guibg=bg guifg=#2680af
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=60 gui=NONE guibg=#0e1219 guifg=#333366
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=29 ctermfg=113 gui=NONE guibg=#107040 guifg=#78ba42
    CSAHi DiffChange term=bold cterm=NONE ctermbg=61 ctermfg=145 gui=NONE guibg=#3741ad guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=131 ctermfg=145 gui=NONE guibg=#8f3231 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=146 ctermfg=16 gui=bold guibg=#82ade0 guifg=#0e1219
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=152 gui=NONE guibg=#1a202a guifg=#8b9aaa
    CSAHi Underlined term=underline cterm=bold,underline ctermbg=bg ctermfg=105 gui=bold,underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=131 ctermfg=152 gui=NONE guibg=#8f3231 guifg=fg
    CSAHi Todo term=NONE cterm=bold,undercurl ctermbg=17 ctermfg=227 gui=bold,undercurl guibg=#0e1219 guifg=#8f3231 guisp=#cbc32a
    CSAHi String term=NONE cterm=NONE ctermbg=59 ctermfg=104 gui=NONE guibg=bg guifg=#4c4cad
    CSAHi Character term=NONE cterm=NONE ctermbg=59 ctermfg=153 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Number term=NONE cterm=NONE ctermbg=59 ctermfg=142 gui=NONE guibg=bg guifg=#8b8b00
    CSAHi Boolean term=NONE cterm=NONE ctermbg=59 ctermfg=153 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Float term=NONE cterm=NONE ctermbg=59 ctermfg=153 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Function term=NONE cterm=NONE ctermbg=59 ctermfg=226 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Macro term=NONE cterm=NONE ctermbg=59 ctermfg=36 gui=NONE guibg=bg guifg=#107040
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=59 ctermfg=36 gui=NONE guibg=bg guifg=#107040
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=59 ctermfg=60 gui=NONE guibg=bg guifg=#333366
    CSAHi NonText term=bold cterm=NONE ctermbg=59 ctermfg=60 gui=NONE guibg=bg guifg=#333366
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=bold ctermbg=153 ctermfg=17 gui=bold guibg=#82ade0 guifg=#0e1219
    CSAHi Search term=reverse cterm=NONE ctermbg=36 ctermfg=150 gui=NONE guibg=#107040 guifg=#78ba42
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=17 ctermfg=59 gui=NONE guibg=#0e1219 guifg=#2c3138
    CSAHi htmlBold term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Define term=NONE cterm=NONE ctermbg=59 ctermfg=36 gui=NONE guibg=bg guifg=#107040
    CSAHi htmlBoldUnderlineItalic term=bold,italic,underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlItalic term=italic cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlUnderline term=underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=italic,underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=68 ctermfg=152 gui=NONE guibg=#3741ad guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=60 ctermfg=152 gui=NONE guibg=#333366 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=152 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=16 ctermfg=152 gui=NONE guibg=black guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=152 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#0e1219 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#0e1219 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=152 ctermfg=17 gui=NONE guibg=#8b9aaa guifg=#0e1219
    CSAHi htmlBoldItalic term=bold,italic cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Conditional term=NONE cterm=NONE ctermbg=59 ctermfg=220 gui=NONE guibg=bg guifg=#ff9900
    CSAHi Repeat term=NONE cterm=NONE ctermbg=59 ctermfg=150 gui=NONE guibg=bg guifg=#78ba42
    CSAHi Label term=NONE cterm=NONE ctermbg=59 ctermfg=134 gui=NONE guibg=bg guifg=#7e28a9
    CSAHi Operator term=NONE cterm=NONE ctermbg=59 ctermfg=139 gui=NONE guibg=bg guifg=#6d5279
    CSAHi Exception term=NONE cterm=NONE ctermbg=59 ctermfg=131 gui=NONE guibg=bg guifg=#8f3231
    CSAHi Include term=NONE cterm=NONE ctermbg=59 ctermfg=36 gui=NONE guibg=bg guifg=#107040
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=16 ctermfg=152 gui=NONE guibg=black guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=black guifg=#2c3138
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=60 ctermfg=152 gui=NONE guibg=#333366 guifg=fg
    CSAHi Title term=bold cterm=NONE ctermbg=59 ctermfg=131 gui=NONE guibg=bg guifg=#8f3231
    CSAHi Visual term=reverse cterm=NONE ctermbg=68 ctermfg=152 gui=NONE guibg=#3741ad guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=17 ctermfg=152 gui=NONE guibg=#0e1219 guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=60 ctermfg=152 gui=NONE guibg=#333366 guifg=fg
    CSAHi htmlBoldUnderline term=bold,underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=152 ctermfg=59 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=150 ctermfg=17 gui=NONE guibg=#78ba42 guifg=#0e1219
    CSAHi Comment term=bold cterm=NONE ctermbg=59 ctermfg=30 gui=NONE guibg=bg guifg=#006666
    CSAHi Constant term=underline cterm=NONE ctermbg=59 ctermfg=153 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Special term=bold cterm=NONE ctermbg=59 ctermfg=68 gui=NONE guibg=bg guifg=#3741ad
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=DarkCyan
    CSAHi Statement term=bold cterm=NONE ctermbg=59 ctermfg=177 gui=NONE guibg=bg guifg=#9966cc
    CSAHi PreProc term=underline cterm=NONE ctermbg=59 ctermfg=36 gui=NONE guibg=bg guifg=#107040
    CSAHi Type term=underline cterm=NONE ctermbg=59 ctermfg=226 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=59 ctermfg=226 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Structure term=NONE cterm=NONE ctermbg=59 ctermfg=226 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Typedef term=NONE cterm=NONE ctermbg=59 ctermfg=226 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Tag term=NONE cterm=NONE ctermbg=59 ctermfg=68 gui=NONE guibg=bg guifg=#3741ad
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=59 ctermfg=68 gui=NONE guibg=bg guifg=#3741ad
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=59 ctermfg=68 gui=NONE guibg=bg guifg=#3741ad
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=59 ctermfg=74 gui=NONE guibg=bg guifg=#2680af
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=17 ctermfg=60 gui=NONE guibg=#0e1219 guifg=#333366
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=36 ctermfg=150 gui=NONE guibg=#107040 guifg=#78ba42
    CSAHi DiffChange term=bold cterm=NONE ctermbg=68 ctermfg=152 gui=NONE guibg=#3741ad guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=131 ctermfg=152 gui=NONE guibg=#8f3231 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=153 ctermfg=17 gui=bold guibg=#82ade0 guifg=#0e1219
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=103 gui=NONE guibg=#1a202a guifg=#8b9aaa
    CSAHi Underlined term=underline cterm=bold,underline ctermbg=bg ctermfg=62 gui=bold,underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=95 ctermfg=103 gui=NONE guibg=#8f3231 guifg=fg
    CSAHi Todo term=NONE cterm=bold,undercurl ctermbg=16 ctermfg=178 gui=bold,undercurl guibg=#0e1219 guifg=#8f3231 guisp=#cbc32a
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=61 gui=NONE guibg=bg guifg=#4c4cad
    CSAHi Character term=NONE cterm=NONE ctermbg=16 ctermfg=110 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Number term=NONE cterm=NONE ctermbg=16 ctermfg=100 gui=NONE guibg=bg guifg=#8b8b00
    CSAHi Boolean term=NONE cterm=NONE ctermbg=16 ctermfg=110 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Float term=NONE cterm=NONE ctermbg=16 ctermfg=110 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Function term=NONE cterm=NONE ctermbg=16 ctermfg=220 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Macro term=NONE cterm=NONE ctermbg=16 ctermfg=23 gui=NONE guibg=bg guifg=#107040
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=16 ctermfg=23 gui=NONE guibg=bg guifg=#107040
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=bg guifg=#333366
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=bg guifg=#333366
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=bold ctermbg=110 ctermfg=16 gui=bold guibg=#82ade0 guifg=#0e1219
    CSAHi Search term=reverse cterm=NONE ctermbg=23 ctermfg=107 gui=NONE guibg=#107040 guifg=#78ba42
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=23 gui=NONE guibg=#0e1219 guifg=#2c3138
    CSAHi htmlBold term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Define term=NONE cterm=NONE ctermbg=16 ctermfg=23 gui=NONE guibg=bg guifg=#107040
    CSAHi htmlBoldUnderlineItalic term=bold,italic,underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlItalic term=italic cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlUnderline term=underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=italic,underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=61 ctermfg=103 gui=NONE guibg=#3741ad guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=59 ctermfg=103 gui=NONE guibg=#333366 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=103 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=16 ctermfg=103 gui=NONE guibg=black guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=103 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0e1219 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0e1219 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=103 ctermfg=16 gui=NONE guibg=#8b9aaa guifg=#0e1219
    CSAHi htmlBoldItalic term=bold,italic cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Conditional term=NONE cterm=NONE ctermbg=16 ctermfg=208 gui=NONE guibg=bg guifg=#ff9900
    CSAHi Repeat term=NONE cterm=NONE ctermbg=16 ctermfg=107 gui=NONE guibg=bg guifg=#78ba42
    CSAHi Label term=NONE cterm=NONE ctermbg=16 ctermfg=91 gui=NONE guibg=bg guifg=#7e28a9
    CSAHi Operator term=NONE cterm=NONE ctermbg=16 ctermfg=60 gui=NONE guibg=bg guifg=#6d5279
    CSAHi Exception term=NONE cterm=NONE ctermbg=16 ctermfg=95 gui=NONE guibg=bg guifg=#8f3231
    CSAHi Include term=NONE cterm=NONE ctermbg=16 ctermfg=23 gui=NONE guibg=bg guifg=#107040
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=16 ctermfg=103 gui=NONE guibg=black guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=23 gui=NONE guibg=black guifg=#2c3138
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=59 ctermfg=103 gui=NONE guibg=#333366 guifg=fg
    CSAHi Title term=bold cterm=NONE ctermbg=16 ctermfg=95 gui=NONE guibg=bg guifg=#8f3231
    CSAHi Visual term=reverse cterm=NONE ctermbg=61 ctermfg=103 gui=NONE guibg=#3741ad guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=103 gui=NONE guibg=#0e1219 guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=103 gui=NONE guibg=#333366 guifg=fg
    CSAHi htmlBoldUnderline term=bold,underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=103 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=107 ctermfg=16 gui=NONE guibg=#78ba42 guifg=#0e1219
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=23 gui=NONE guibg=bg guifg=#006666
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=110 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=61 gui=NONE guibg=bg guifg=#3741ad
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=30 gui=NONE guibg=bg guifg=DarkCyan
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=98 gui=NONE guibg=bg guifg=#9966cc
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=23 gui=NONE guibg=bg guifg=#107040
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=220 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=16 ctermfg=220 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Structure term=NONE cterm=NONE ctermbg=16 ctermfg=220 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Typedef term=NONE cterm=NONE ctermbg=16 ctermfg=220 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Tag term=NONE cterm=NONE ctermbg=16 ctermfg=61 gui=NONE guibg=bg guifg=#3741ad
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=16 ctermfg=61 gui=NONE guibg=bg guifg=#3741ad
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=16 ctermfg=61 gui=NONE guibg=bg guifg=#3741ad
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=16 ctermfg=31 gui=NONE guibg=bg guifg=#2680af
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=#0e1219 guifg=#333366
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=23 ctermfg=107 gui=NONE guibg=#107040 guifg=#78ba42
    CSAHi DiffChange term=bold cterm=NONE ctermbg=61 ctermfg=103 gui=NONE guibg=#3741ad guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=95 ctermfg=103 gui=NONE guibg=#8f3231 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=110 ctermfg=16 gui=bold guibg=#82ade0 guifg=#0e1219
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#1a202a guifg=#8b9aaa
    CSAHi Underlined term=underline cterm=bold,underline ctermbg=bg ctermfg=38 gui=bold,underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=32 ctermfg=37 gui=NONE guibg=#8f3231 guifg=fg
    CSAHi Todo term=NONE cterm=bold,undercurl ctermbg=16 ctermfg=56 gui=bold,undercurl guibg=#0e1219 guifg=#8f3231 guisp=#cbc32a
    CSAHi String term=NONE cterm=NONE ctermbg=80 ctermfg=38 gui=NONE guibg=bg guifg=#4c4cad
    CSAHi Character term=NONE cterm=NONE ctermbg=80 ctermfg=42 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Number term=NONE cterm=NONE ctermbg=80 ctermfg=36 gui=NONE guibg=bg guifg=#8b8b00
    CSAHi Boolean term=NONE cterm=NONE ctermbg=80 ctermfg=42 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Float term=NONE cterm=NONE ctermbg=80 ctermfg=42 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Function term=NONE cterm=NONE ctermbg=80 ctermfg=72 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Macro term=NONE cterm=NONE ctermbg=80 ctermfg=20 gui=NONE guibg=bg guifg=#107040
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=80 ctermfg=20 gui=NONE guibg=bg guifg=#107040
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=80 ctermfg=17 gui=NONE guibg=bg guifg=#333366
    CSAHi NonText term=bold cterm=NONE ctermbg=80 ctermfg=17 gui=NONE guibg=bg guifg=#333366
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=bold ctermbg=42 ctermfg=16 gui=bold guibg=#82ade0 guifg=#0e1219
    CSAHi Search term=reverse cterm=NONE ctermbg=20 ctermfg=40 gui=NONE guibg=#107040 guifg=#78ba42
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=80 gui=NONE guibg=#0e1219 guifg=#2c3138
    CSAHi htmlBold term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Define term=NONE cterm=NONE ctermbg=80 ctermfg=20 gui=NONE guibg=bg guifg=#107040
    CSAHi htmlBoldUnderlineItalic term=bold,italic,underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlItalic term=italic cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlUnderline term=underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=italic,underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=18 ctermfg=37 gui=NONE guibg=#3741ad guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=17 ctermfg=37 gui=NONE guibg=#333366 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=37 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=black guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=37 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0e1219 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#0e1219 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=#8b9aaa guifg=#0e1219
    CSAHi htmlBoldItalic term=bold,italic cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Conditional term=NONE cterm=NONE ctermbg=80 ctermfg=68 gui=NONE guibg=bg guifg=#ff9900
    CSAHi Repeat term=NONE cterm=NONE ctermbg=80 ctermfg=40 gui=NONE guibg=bg guifg=#78ba42
    CSAHi Label term=NONE cterm=NONE ctermbg=80 ctermfg=33 gui=NONE guibg=bg guifg=#7e28a9
    CSAHi Operator term=NONE cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=bg guifg=#6d5279
    CSAHi Exception term=NONE cterm=NONE ctermbg=80 ctermfg=32 gui=NONE guibg=bg guifg=#8f3231
    CSAHi Include term=NONE cterm=NONE ctermbg=80 ctermfg=20 gui=NONE guibg=bg guifg=#107040
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=black guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=80 gui=NONE guibg=black guifg=#2c3138
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=17 ctermfg=37 gui=NONE guibg=#333366 guifg=fg
    CSAHi Title term=bold cterm=NONE ctermbg=80 ctermfg=32 gui=NONE guibg=bg guifg=#8f3231
    CSAHi Visual term=reverse cterm=NONE ctermbg=18 ctermfg=37 gui=NONE guibg=#3741ad guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=#0e1219 guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=17 ctermfg=37 gui=NONE guibg=#333366 guifg=fg
    CSAHi htmlBoldUnderline term=bold,underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=37 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=40 ctermfg=16 gui=NONE guibg=#78ba42 guifg=#0e1219
    CSAHi Comment term=bold cterm=NONE ctermbg=80 ctermfg=21 gui=NONE guibg=bg guifg=#006666
    CSAHi Constant term=underline cterm=NONE ctermbg=80 ctermfg=42 gui=NONE guibg=bg guifg=#82ade0
    CSAHi Special term=bold cterm=NONE ctermbg=80 ctermfg=18 gui=NONE guibg=bg guifg=#3741ad
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=DarkCyan
    CSAHi Statement term=bold cterm=NONE ctermbg=80 ctermfg=38 gui=NONE guibg=bg guifg=#9966cc
    CSAHi PreProc term=underline cterm=NONE ctermbg=80 ctermfg=20 gui=NONE guibg=bg guifg=#107040
    CSAHi Type term=underline cterm=NONE ctermbg=80 ctermfg=72 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=80 ctermfg=72 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Structure term=NONE cterm=NONE ctermbg=80 ctermfg=72 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Typedef term=NONE cterm=NONE ctermbg=80 ctermfg=72 gui=NONE guibg=bg guifg=#ffcc00
    CSAHi Tag term=NONE cterm=NONE ctermbg=80 ctermfg=18 gui=NONE guibg=bg guifg=#3741ad
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=80 ctermfg=18 gui=NONE guibg=bg guifg=#3741ad
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=80 ctermfg=18 gui=NONE guibg=bg guifg=#3741ad
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=80 ctermfg=22 gui=NONE guibg=bg guifg=#2680af
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=17 gui=NONE guibg=#0e1219 guifg=#333366
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=20 ctermfg=40 gui=NONE guibg=#107040 guifg=#78ba42
    CSAHi DiffChange term=bold cterm=NONE ctermbg=18 ctermfg=37 gui=NONE guibg=#3741ad guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=32 ctermfg=37 gui=NONE guibg=#8f3231 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=42 ctermfg=16 gui=bold guibg=#82ade0 guifg=#0e1219
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
