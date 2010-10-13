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
    CSAHi Normal term=NONE cterm=NONE ctermbg=23 ctermfg=109 gui=NONE guibg=#152535 guifg=#7990a4
    CSAHi Underlined term=underline cterm=underline ctermbg=23 ctermfg=139 gui=underline guibg=bg guifg=#826699
    CSAHi Ignore term=NONE cterm=NONE ctermbg=23 ctermfg=23 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=underline ctermbg=131 ctermfg=109 gui=underline guibg=#884422 guifg=fg
    CSAHi Todo term=NONE cterm=underline ctermbg=114 ctermfg=23 gui=underline guibg=#66cc6a guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=23 ctermfg=110 gui=NONE guibg=bg guifg=#6695cc
    CSAHi NonText term=bold cterm=underline ctermbg=59 ctermfg=59 gui=underline guibg=#1d2d30 guifg=#1d2d30
    CSAHi Directory term=bold cterm=NONE ctermbg=23 ctermfg=66 gui=NONE guibg=bg guifg=#447760
    CSAHi ErrorMsg term=NONE cterm=underline ctermbg=150 ctermfg=23 gui=underline guibg=#8cdd66 guifg=bg
    CSAHi IncSearch term=reverse cterm=underline ctermbg=152 ctermfg=23 gui=underline guibg=#99ccb5 guifg=bg
    CSAHi Search term=reverse cterm=underline ctermbg=67 ctermfg=23 gui=underline guibg=#33669a guifg=bg
    CSAHi MoreMsg term=bold cterm=underline ctermbg=72 ctermfg=23 gui=underline guibg=#329858 guifg=bg
    CSAHi ModeMsg term=bold cterm=underline ctermbg=73 ctermfg=23 gui=underline guibg=#339599 guifg=bg
    CSAHi LineNr term=underline cterm=underline ctermbg=17 ctermfg=102 gui=underline guibg=#051525 guifg=#54657d
    CSAHi htmlBold term=NONE cterm=underline ctermbg=108 ctermfg=23 gui=underline guibg=#74aa66 guifg=bg
    CSAHi htmlBoldUnderline term=NONE cterm=underline ctermbg=23 ctermfg=108 gui=underline guibg=bg guifg=#74aa66
    CSAHi htmlItalic term=NONE cterm=underline ctermbg=80 ctermfg=23 gui=underline guibg=#44ccc0 guifg=bg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=23 ctermfg=80 gui=underline guibg=bg guifg=#44ccc0
    CSAHi htmlBoldItalic term=NONE cterm=underline ctermbg=71 ctermfg=23 gui=underline guibg=#33aa40 guifg=bg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=underline ctermbg=23 ctermfg=71 gui=underline guibg=bg guifg=#33aa40
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=23 ctermfg=109 gui=underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=109 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=109 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=underline ctermbg=152 ctermfg=23 gui=underline guibg=#99ccb5 guifg=bg
    CSAHi htmlLink term=NONE cterm=underline ctermbg=23 ctermfg=109 gui=underline guibg=bg guifg=#6696aa
    CSAHi CursorIM term=NONE cterm=underline ctermbg=31 ctermfg=109 gui=underline guibg=#006188 guifg=fg
    CSAHi Question term=NONE cterm=underline ctermbg=72 ctermfg=23 gui=underline guibg=#329858 guifg=bg
    CSAHi StatusLine term=reverse,bold cterm=underline ctermbg=17 ctermfg=109 gui=underline guibg=#051525 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=underline ctermbg=17 ctermfg=59 gui=underline guibg=#051525 guifg=#2c3c45
    CSAHi VertSplit term=reverse cterm=underline ctermbg=17 ctermfg=23 gui=underline guibg=#051525 guifg=bg
    CSAHi Title term=bold cterm=underline ctermbg=60 ctermfg=109 gui=underline guibg=#34455d guifg=fg
    CSAHi Visual term=reverse cterm=underline ctermbg=103 ctermfg=23 gui=underline guibg=#667888 guifg=bg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=underline ctermbg=114 ctermfg=23 gui=underline guibg=#66cc6a guifg=bg
    CSAHi WildMenu term=NONE cterm=underline ctermbg=152 ctermfg=23 gui=underline guibg=#99ccb5 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=23 ctermfg=102 gui=NONE guibg=bg guifg=#54657d
    CSAHi lCursor term=NONE cterm=NONE ctermbg=109 ctermfg=23 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=23 ctermfg=31 gui=NONE guibg=bg guifg=#006188
    CSAHi Constant term=underline cterm=NONE ctermbg=23 ctermfg=72 gui=NONE guibg=bg guifg=#22887b
    CSAHi Special term=bold cterm=NONE ctermbg=23 ctermfg=116 gui=NONE guibg=bg guifg=#66bbb6
    CSAHi Identifier term=underline cterm=NONE ctermbg=23 ctermfg=115 gui=NONE guibg=bg guifg=#69be97
    CSAHi Statement term=bold cterm=NONE ctermbg=23 ctermfg=108 gui=NONE guibg=bg guifg=#74aa66
    CSAHi PreProc term=underline cterm=NONE ctermbg=23 ctermfg=102 gui=NONE guibg=bg guifg=#557767
    CSAHi Type term=underline cterm=NONE ctermbg=23 ctermfg=73 gui=NONE guibg=bg guifg=#429999
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=23 ctermfg=102 gui=NONE guibg=bg guifg=#54657d
    CSAHi DiffAdd term=bold cterm=underline ctermbg=77 ctermfg=23 gui=underline guibg=#2ccc22 guifg=bg
    CSAHi DiffChange term=bold cterm=underline ctermbg=109 ctermfg=23 gui=underline guibg=#55aa83 guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=73 ctermfg=23 gui=NONE guibg=#22a5aa guifg=bg
    CSAHi DiffText term=reverse cterm=underline ctermbg=158 ctermfg=23 gui=underline guibg=#99ffd0 guifg=bg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=23 ctermfg=146 gui=NONE guibg=#152535 guifg=#7990a4
    CSAHi Underlined term=underline cterm=underline ctermbg=23 ctermfg=140 gui=underline guibg=bg guifg=#826699
    CSAHi Ignore term=NONE cterm=NONE ctermbg=23 ctermfg=23 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=underline ctermbg=137 ctermfg=146 gui=underline guibg=#884422 guifg=fg
    CSAHi Todo term=NONE cterm=underline ctermbg=120 ctermfg=23 gui=underline guibg=#66cc6a guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=23 ctermfg=117 gui=NONE guibg=bg guifg=#6695cc
    CSAHi NonText term=bold cterm=underline ctermbg=59 ctermfg=59 gui=underline guibg=#1d2d30 guifg=#1d2d30
    CSAHi Directory term=bold cterm=NONE ctermbg=23 ctermfg=108 gui=NONE guibg=bg guifg=#447760
    CSAHi ErrorMsg term=NONE cterm=underline ctermbg=156 ctermfg=23 gui=underline guibg=#8cdd66 guifg=bg
    CSAHi IncSearch term=reverse cterm=underline ctermbg=194 ctermfg=23 gui=underline guibg=#99ccb5 guifg=bg
    CSAHi Search term=reverse cterm=underline ctermbg=68 ctermfg=23 gui=underline guibg=#33669a guifg=bg
    CSAHi MoreMsg term=bold cterm=underline ctermbg=78 ctermfg=23 gui=underline guibg=#329858 guifg=bg
    CSAHi ModeMsg term=bold cterm=underline ctermbg=80 ctermfg=23 gui=underline guibg=#339599 guifg=bg
    CSAHi LineNr term=underline cterm=underline ctermbg=17 ctermfg=103 gui=underline guibg=#051525 guifg=#54657d
    CSAHi htmlBold term=NONE cterm=underline ctermbg=150 ctermfg=23 gui=underline guibg=#74aa66 guifg=bg
    CSAHi htmlBoldUnderline term=NONE cterm=underline ctermbg=23 ctermfg=150 gui=underline guibg=bg guifg=#74aa66
    CSAHi htmlItalic term=NONE cterm=underline ctermbg=123 ctermfg=23 gui=underline guibg=#44ccc0 guifg=bg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=23 ctermfg=123 gui=underline guibg=bg guifg=#44ccc0
    CSAHi htmlBoldItalic term=NONE cterm=underline ctermbg=78 ctermfg=23 gui=underline guibg=#33aa40 guifg=bg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=underline ctermbg=23 ctermfg=78 gui=underline guibg=bg guifg=#33aa40
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=23 ctermfg=146 gui=underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=146 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=146 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=underline ctermbg=194 ctermfg=23 gui=underline guibg=#99ccb5 guifg=bg
    CSAHi htmlLink term=NONE cterm=underline ctermbg=23 ctermfg=116 gui=underline guibg=bg guifg=#6696aa
    CSAHi CursorIM term=NONE cterm=underline ctermbg=31 ctermfg=146 gui=underline guibg=#006188 guifg=fg
    CSAHi Question term=NONE cterm=underline ctermbg=78 ctermfg=23 gui=underline guibg=#329858 guifg=bg
    CSAHi StatusLine term=reverse,bold cterm=underline ctermbg=17 ctermfg=146 gui=underline guibg=#051525 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=underline ctermbg=17 ctermfg=60 gui=underline guibg=#051525 guifg=#2c3c45
    CSAHi VertSplit term=reverse cterm=underline ctermbg=17 ctermfg=23 gui=underline guibg=#051525 guifg=bg
    CSAHi Title term=bold cterm=underline ctermbg=66 ctermfg=146 gui=underline guibg=#34455d guifg=fg
    CSAHi Visual term=reverse cterm=underline ctermbg=109 ctermfg=23 gui=underline guibg=#667888 guifg=bg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=underline ctermbg=120 ctermfg=23 gui=underline guibg=#66cc6a guifg=bg
    CSAHi WildMenu term=NONE cterm=underline ctermbg=194 ctermfg=23 gui=underline guibg=#99ccb5 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=23 ctermfg=103 gui=NONE guibg=bg guifg=#54657d
    CSAHi lCursor term=NONE cterm=NONE ctermbg=146 ctermfg=23 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=23 ctermfg=31 gui=NONE guibg=bg guifg=#006188
    CSAHi Constant term=underline cterm=NONE ctermbg=23 ctermfg=73 gui=NONE guibg=bg guifg=#22887b
    CSAHi Special term=bold cterm=NONE ctermbg=23 ctermfg=116 gui=NONE guibg=bg guifg=#66bbb6
    CSAHi Identifier term=underline cterm=NONE ctermbg=23 ctermfg=116 gui=NONE guibg=bg guifg=#69be97
    CSAHi Statement term=bold cterm=NONE ctermbg=23 ctermfg=150 gui=NONE guibg=bg guifg=#74aa66
    CSAHi PreProc term=underline cterm=NONE ctermbg=23 ctermfg=108 gui=NONE guibg=bg guifg=#557767
    CSAHi Type term=underline cterm=NONE ctermbg=23 ctermfg=116 gui=NONE guibg=bg guifg=#429999
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=23 ctermfg=103 gui=NONE guibg=bg guifg=#54657d
    CSAHi DiffAdd term=bold cterm=underline ctermbg=83 ctermfg=23 gui=underline guibg=#2ccc22 guifg=bg
    CSAHi DiffChange term=bold cterm=underline ctermbg=115 ctermfg=23 gui=underline guibg=#55aa83 guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=80 ctermfg=23 gui=NONE guibg=#22a5aa guifg=bg
    CSAHi DiffText term=reverse cterm=underline ctermbg=195 ctermfg=23 gui=underline guibg=#99ffd0 guifg=bg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=17 ctermfg=103 gui=NONE guibg=#152535 guifg=#7990a4
    CSAHi Underlined term=underline cterm=underline ctermbg=17 ctermfg=96 gui=underline guibg=bg guifg=#826699
    CSAHi Ignore term=NONE cterm=NONE ctermbg=17 ctermfg=17 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=underline ctermbg=94 ctermfg=103 gui=underline guibg=#884422 guifg=fg
    CSAHi Todo term=NONE cterm=underline ctermbg=77 ctermfg=17 gui=underline guibg=#66cc6a guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=17 ctermfg=68 gui=NONE guibg=bg guifg=#6695cc
    CSAHi NonText term=bold cterm=underline ctermbg=17 ctermfg=17 gui=underline guibg=#1d2d30 guifg=#1d2d30
    CSAHi Directory term=bold cterm=NONE ctermbg=17 ctermfg=65 gui=NONE guibg=bg guifg=#447760
    CSAHi ErrorMsg term=NONE cterm=underline ctermbg=113 ctermfg=17 gui=underline guibg=#8cdd66 guifg=bg
    CSAHi IncSearch term=reverse cterm=underline ctermbg=115 ctermfg=17 gui=underline guibg=#99ccb5 guifg=bg
    CSAHi Search term=reverse cterm=underline ctermbg=60 ctermfg=17 gui=underline guibg=#33669a guifg=bg
    CSAHi MoreMsg term=bold cterm=underline ctermbg=65 ctermfg=17 gui=underline guibg=#329858 guifg=bg
    CSAHi ModeMsg term=bold cterm=underline ctermbg=66 ctermfg=17 gui=underline guibg=#339599 guifg=bg
    CSAHi LineNr term=underline cterm=underline ctermbg=16 ctermfg=60 gui=underline guibg=#051525 guifg=#54657d
    CSAHi htmlBold term=NONE cterm=underline ctermbg=107 ctermfg=17 gui=underline guibg=#74aa66 guifg=bg
    CSAHi htmlBoldUnderline term=NONE cterm=underline ctermbg=17 ctermfg=107 gui=underline guibg=bg guifg=#74aa66
    CSAHi htmlItalic term=NONE cterm=underline ctermbg=79 ctermfg=17 gui=underline guibg=#44ccc0 guifg=bg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=17 ctermfg=79 gui=underline guibg=bg guifg=#44ccc0
    CSAHi htmlBoldItalic term=NONE cterm=underline ctermbg=71 ctermfg=17 gui=underline guibg=#33aa40 guifg=bg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=underline ctermbg=17 ctermfg=71 gui=underline guibg=bg guifg=#33aa40
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=17 ctermfg=103 gui=underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=103 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=103 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=underline ctermbg=115 ctermfg=17 gui=underline guibg=#99ccb5 guifg=bg
    CSAHi htmlLink term=NONE cterm=underline ctermbg=17 ctermfg=67 gui=underline guibg=bg guifg=#6696aa
    CSAHi CursorIM term=NONE cterm=underline ctermbg=24 ctermfg=103 gui=underline guibg=#006188 guifg=fg
    CSAHi Question term=NONE cterm=underline ctermbg=65 ctermfg=17 gui=underline guibg=#329858 guifg=bg
    CSAHi StatusLine term=reverse,bold cterm=underline ctermbg=16 ctermfg=103 gui=underline guibg=#051525 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=underline ctermbg=16 ctermfg=23 gui=underline guibg=#051525 guifg=#2c3c45
    CSAHi VertSplit term=reverse cterm=underline ctermbg=16 ctermfg=17 gui=underline guibg=#051525 guifg=bg
    CSAHi Title term=bold cterm=underline ctermbg=59 ctermfg=103 gui=underline guibg=#34455d guifg=fg
    CSAHi Visual term=reverse cterm=underline ctermbg=66 ctermfg=17 gui=underline guibg=#667888 guifg=bg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=underline ctermbg=77 ctermfg=17 gui=underline guibg=#66cc6a guifg=bg
    CSAHi WildMenu term=NONE cterm=underline ctermbg=115 ctermfg=17 gui=underline guibg=#99ccb5 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=17 ctermfg=60 gui=NONE guibg=bg guifg=#54657d
    CSAHi lCursor term=NONE cterm=NONE ctermbg=103 ctermfg=17 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=17 ctermfg=24 gui=NONE guibg=bg guifg=#006188
    CSAHi Constant term=underline cterm=NONE ctermbg=17 ctermfg=30 gui=NONE guibg=bg guifg=#22887b
    CSAHi Special term=bold cterm=NONE ctermbg=17 ctermfg=73 gui=NONE guibg=bg guifg=#66bbb6
    CSAHi Identifier term=underline cterm=NONE ctermbg=17 ctermfg=72 gui=NONE guibg=bg guifg=#69be97
    CSAHi Statement term=bold cterm=NONE ctermbg=17 ctermfg=107 gui=NONE guibg=bg guifg=#74aa66
    CSAHi PreProc term=underline cterm=NONE ctermbg=17 ctermfg=65 gui=NONE guibg=bg guifg=#557767
    CSAHi Type term=underline cterm=NONE ctermbg=17 ctermfg=66 gui=NONE guibg=bg guifg=#429999
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=17 ctermfg=60 gui=NONE guibg=bg guifg=#54657d
    CSAHi DiffAdd term=bold cterm=underline ctermbg=40 ctermfg=17 gui=underline guibg=#2ccc22 guifg=bg
    CSAHi DiffChange term=bold cterm=underline ctermbg=72 ctermfg=17 gui=underline guibg=#55aa83 guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=37 ctermfg=17 gui=NONE guibg=#22a5aa guifg=bg
    CSAHi DiffText term=reverse cterm=underline ctermbg=122 ctermfg=17 gui=underline guibg=#99ffd0 guifg=bg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=#152535 guifg=#7990a4
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=37 gui=underline guibg=bg guifg=#826699
    CSAHi Ignore term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=underline ctermbg=32 ctermfg=37 gui=underline guibg=#884422 guifg=fg
    CSAHi Todo term=NONE cterm=underline ctermbg=41 ctermfg=16 gui=underline guibg=#66cc6a guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=38 gui=NONE guibg=bg guifg=#6695cc
    CSAHi NonText term=bold cterm=underline ctermbg=80 ctermfg=80 gui=underline guibg=#1d2d30 guifg=#1d2d30
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=bg guifg=#447760
    CSAHi ErrorMsg term=NONE cterm=underline ctermbg=41 ctermfg=16 gui=underline guibg=#8cdd66 guifg=bg
    CSAHi IncSearch term=reverse cterm=underline ctermbg=42 ctermfg=16 gui=underline guibg=#99ccb5 guifg=bg
    CSAHi Search term=reverse cterm=underline ctermbg=21 ctermfg=16 gui=underline guibg=#33669a guifg=bg
    CSAHi MoreMsg term=bold cterm=underline ctermbg=21 ctermfg=16 gui=underline guibg=#329858 guifg=bg
    CSAHi ModeMsg term=bold cterm=underline ctermbg=21 ctermfg=16 gui=underline guibg=#339599 guifg=bg
    CSAHi LineNr term=underline cterm=underline ctermbg=16 ctermfg=37 gui=underline guibg=#051525 guifg=#54657d
    CSAHi htmlBold term=NONE cterm=underline ctermbg=37 ctermfg=16 gui=underline guibg=#74aa66 guifg=bg
    CSAHi htmlBoldUnderline term=NONE cterm=underline ctermbg=16 ctermfg=37 gui=underline guibg=bg guifg=#74aa66
    CSAHi htmlItalic term=NONE cterm=underline ctermbg=26 ctermfg=16 gui=underline guibg=#44ccc0 guifg=bg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=16 ctermfg=26 gui=underline guibg=bg guifg=#44ccc0
    CSAHi htmlBoldItalic term=NONE cterm=underline ctermbg=20 ctermfg=16 gui=underline guibg=#33aa40 guifg=bg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=underline ctermbg=16 ctermfg=20 gui=underline guibg=bg guifg=#33aa40
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=16 ctermfg=37 gui=underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=37 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=37 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=underline ctermbg=42 ctermfg=16 gui=underline guibg=#99ccb5 guifg=bg
    CSAHi htmlLink term=NONE cterm=underline ctermbg=16 ctermfg=37 gui=underline guibg=bg guifg=#6696aa
    CSAHi CursorIM term=NONE cterm=underline ctermbg=21 ctermfg=37 gui=underline guibg=#006188 guifg=fg
    CSAHi Question term=NONE cterm=underline ctermbg=21 ctermfg=16 gui=underline guibg=#329858 guifg=bg
    CSAHi StatusLine term=reverse,bold cterm=underline ctermbg=16 ctermfg=37 gui=underline guibg=#051525 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=underline ctermbg=16 ctermfg=80 gui=underline guibg=#051525 guifg=#2c3c45
    CSAHi VertSplit term=reverse cterm=underline ctermbg=16 ctermfg=16 gui=underline guibg=#051525 guifg=bg
    CSAHi Title term=bold cterm=underline ctermbg=17 ctermfg=37 gui=underline guibg=#34455d guifg=fg
    CSAHi Visual term=reverse cterm=underline ctermbg=37 ctermfg=16 gui=underline guibg=#667888 guifg=bg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=underline ctermbg=41 ctermfg=16 gui=underline guibg=#66cc6a guifg=bg
    CSAHi WildMenu term=NONE cterm=underline ctermbg=42 ctermfg=16 gui=underline guibg=#99ccb5 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=bg guifg=#54657d
    CSAHi lCursor term=NONE cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=bg guifg=#006188
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=bg guifg=#22887b
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=42 gui=NONE guibg=bg guifg=#66bbb6
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=41 gui=NONE guibg=bg guifg=#69be97
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=bg guifg=#74aa66
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=bg guifg=#557767
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=bg guifg=#429999
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=bg guifg=#54657d
    CSAHi DiffAdd term=bold cterm=underline ctermbg=24 ctermfg=16 gui=underline guibg=#2ccc22 guifg=bg
    CSAHi DiffChange term=bold cterm=underline ctermbg=37 ctermfg=16 gui=underline guibg=#55aa83 guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=21 ctermfg=16 gui=NONE guibg=#22a5aa guifg=bg
    CSAHi DiffText term=reverse cterm=underline ctermbg=46 ctermfg=16 gui=underline guibg=#99ffd0 guifg=bg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
