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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=#000000 guifg=#bbbbbb
    CSAHi Underlined term=underline cterm=bold ctermbg=bg ctermfg=63 gui=bold guibg=bg guifg=#4444ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#444444
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=160 gui=NONE guibg=#000000 guifg=#bb0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=124 ctermfg=226 gui=NONE guibg=#aa0006 guifg=#fff300
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#4682b4
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=151 gui=NONE guibg=bg guifg=#9bcd9b
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#1e90ff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=63 gui=NONE guibg=bg guifg=#4444ff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=63 gui=bold guibg=bg guifg=#4444ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#44ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=#880000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=188 ctermfg=16 gui=reverse guibg=#000000 guifg=#bbcccc
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=83 gui=bold guibg=bg guifg=#44ff44
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi LineNr term=underline cterm=NONE ctermbg=232 ctermfg=74 gui=NONE guibg=#050505 guifg=#4682b4
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=83 ctermfg=16 gui=NONE guibg=#44ff44 guifg=#000000
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#00bfff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=66 ctermfg=231 gui=NONE guibg=#2f4f4f guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#bbbbbb guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi Visual term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#bbbbbb guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=248 ctermfg=19 gui=NONE guibg=DarkGrey guifg=#000088
    CSAHi lCursor term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#696969
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00aaaa
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#87cefa
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#00e5ee
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=#00ffff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=141 gui=NONE guibg=bg guifg=#8470ff
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=232 ctermfg=226 gui=NONE guibg=#080808 guifg=#ffff00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=232 ctermfg=231 gui=NONE guibg=#080808 guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=bold ctermbg=232 ctermfg=238 gui=bold guibg=#080808 guifg=#444444
    CSAHi DiffText term=reverse cterm=bold ctermbg=232 ctermfg=160 gui=bold guibg=#080808 guifg=#bb0000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=#000000 guifg=#bbbbbb
    CSAHi Underlined term=underline cterm=bold ctermbg=bg ctermfg=105 gui=bold guibg=bg guifg=#4444ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#444444
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=160 gui=NONE guibg=#000000 guifg=#bb0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=160 ctermfg=226 gui=NONE guibg=#aa0006 guifg=#fff300
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#4682b4
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#9bcd9b
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#1e90ff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=105 gui=NONE guibg=bg guifg=#4444ff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=105 gui=bold guibg=bg guifg=#4444ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#44ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=255 gui=NONE guibg=#880000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=195 ctermfg=16 gui=reverse guibg=#000000 guifg=#bbcccc
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=120 gui=bold guibg=bg guifg=#44ff44
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#ffffff
    CSAHi LineNr term=underline cterm=NONE ctermbg=232 ctermfg=110 gui=NONE guibg=#050505 guifg=#4682b4
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=120 ctermfg=16 gui=NONE guibg=#44ff44 guifg=#000000
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#00bfff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=66 ctermfg=255 gui=NONE guibg=#2f4f4f guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#bbbbbb guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#ffffff
    CSAHi Visual term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#bbbbbb guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=248 ctermfg=19 gui=NONE guibg=DarkGrey guifg=#000088
    CSAHi lCursor term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=242 gui=NONE guibg=bg guifg=#696969
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=44 gui=NONE guibg=bg guifg=#00aaaa
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#87cefa
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00e5ee
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=#00ffff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=147 gui=NONE guibg=bg guifg=#8470ff
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#ffffff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=232 ctermfg=226 gui=NONE guibg=#080808 guifg=#ffff00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=232 ctermfg=255 gui=NONE guibg=#080808 guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=bold ctermbg=232 ctermfg=238 gui=bold guibg=#080808 guifg=#444444
    CSAHi DiffText term=reverse cterm=bold ctermbg=232 ctermfg=160 gui=bold guibg=#080808 guifg=#bb0000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=#000000 guifg=#bbbbbb
    CSAHi Underlined term=underline cterm=bold ctermbg=bg ctermfg=63 gui=bold guibg=bg guifg=#4444ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#444444
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=124 gui=NONE guibg=#000000 guifg=#bb0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=124 ctermfg=226 gui=NONE guibg=#aa0006 guifg=#fff300
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=#4682b4
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=114 gui=NONE guibg=bg guifg=#9bcd9b
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#1e90ff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=63 gui=NONE guibg=bg guifg=#4444ff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=63 gui=bold guibg=bg guifg=#4444ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#44ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=#880000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=152 ctermfg=16 gui=reverse guibg=#000000 guifg=#bbcccc
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=83 gui=bold guibg=bg guifg=#44ff44
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi LineNr term=underline cterm=NONE ctermbg=232 ctermfg=67 gui=NONE guibg=#050505 guifg=#4682b4
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=83 ctermfg=16 gui=NONE guibg=#44ff44 guifg=#000000
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#00bfff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#2f4f4f guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#bbbbbb guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi Visual term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#bbbbbb guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=248 ctermfg=18 gui=NONE guibg=DarkGrey guifg=#000088
    CSAHi lCursor term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=242 gui=NONE guibg=bg guifg=#696969
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00aaaa
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#87cefa
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#00e5ee
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=#00ffff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=99 gui=NONE guibg=bg guifg=#8470ff
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=232 ctermfg=226 gui=NONE guibg=#080808 guifg=#ffff00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=232 ctermfg=231 gui=NONE guibg=#080808 guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=bold ctermbg=232 ctermfg=238 gui=bold guibg=#080808 guifg=#444444
    CSAHi DiffText term=reverse cterm=bold ctermbg=232 ctermfg=124 gui=bold guibg=#080808 guifg=#bb0000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=85 gui=NONE guibg=#000000 guifg=#bbbbbb
    CSAHi Underlined term=underline cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=#4444ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#444444
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=48 gui=NONE guibg=#000000 guifg=#bb0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=32 ctermfg=76 gui=NONE guibg=#aa0006 guifg=#fff300
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#4682b4
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#9bcd9b
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#1e90ff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=#4444ff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=#4444ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#44ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=#880000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=58 ctermfg=16 gui=reverse guibg=#000000 guifg=#bbcccc
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=#44ff44
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#ffffff
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=38 gui=NONE guibg=#050505 guifg=#4682b4
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=85 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=85 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=#44ff44 guifg=#000000
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=27 gui=NONE guibg=bg guifg=#00bfff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=#ffff00
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#2f4f4f guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=85 ctermfg=16 gui=NONE guibg=#bbbbbb guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=85 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#ffffff
    CSAHi Visual term=reverse cterm=NONE ctermbg=85 ctermfg=16 gui=NONE guibg=#bbbbbb guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#ffff00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=84 ctermfg=17 gui=NONE guibg=DarkGrey guifg=#000088
    CSAHi lCursor term=NONE cterm=NONE ctermbg=85 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=82 gui=NONE guibg=bg guifg=#696969
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#00aaaa
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#87cefa
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=27 gui=NONE guibg=bg guifg=#00e5ee
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=31 gui=bold guibg=bg guifg=#00ffff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#8470ff
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#ffffff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=76 gui=NONE guibg=#080808 guifg=#ffff00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#080808 guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=80 gui=bold guibg=#080808 guifg=#444444
    CSAHi DiffText term=reverse cterm=bold ctermbg=16 ctermfg=48 gui=bold guibg=#080808 guifg=#bb0000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
