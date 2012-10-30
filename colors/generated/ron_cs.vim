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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=black guifg=cyan
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=orange guifg=Black
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=131 gui=bold guibg=bg guifg=brown
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=16 gui=NONE guibg=Red guifg=Black
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=74 ctermfg=fg gui=NONE guibg=steelblue guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=141 ctermfg=16 gui=NONE guibg=lightslateblue guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=darkgrey
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=51 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=108 ctermfg=46 gui=NONE guibg=#60a060 guifg=#00ff00
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=gold2
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=orange
    CSAHi cIf0 term=NONE cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=gray
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=21 ctermfg=51 gui=bold guibg=blue guifg=cyan
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=19 ctermfg=153 gui=NONE guibg=darkblue guifg=lightblue
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=51 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=248 gui=bold guibg=bg guifg=darkgrey
    CSAHi Visual term=reverse cterm=NONE ctermbg=51 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=Green guifg=Black
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=239 ctermfg=51 gui=NONE guibg=gray30 guifg=Cyan
    CSAHi lCursor term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=green
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=yellow
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=lightblue
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=218 gui=NONE guibg=bg guifg=Pink2
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=seagreen
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=239 ctermfg=231 gui=NONE guibg=gray30 guifg=white
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=104 ctermfg=fg gui=NONE guibg=slateblue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=28 ctermfg=fg gui=NONE guibg=darkgreen guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=210 ctermfg=21 gui=bold guibg=coral guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=107 ctermfg=fg gui=bold guibg=olivedrab guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=black guifg=cyan
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=orange guifg=Black
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=167 gui=bold guibg=bg guifg=brown
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=16 gui=NONE guibg=Red guifg=Black
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=110 ctermfg=fg gui=NONE guibg=steelblue guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=147 ctermfg=16 gui=NONE guibg=lightslateblue guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=darkgrey
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=51 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=114 ctermfg=46 gui=NONE guibg=#60a060 guifg=#00ff00
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=gold2
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=orange
    CSAHi cIf0 term=NONE cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=gray
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=21 ctermfg=51 gui=bold guibg=blue guifg=cyan
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=19 ctermfg=195 gui=NONE guibg=darkblue guifg=lightblue
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=51 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=248 gui=bold guibg=bg guifg=darkgrey
    CSAHi Visual term=reverse cterm=NONE ctermbg=51 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=Green guifg=Black
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=239 ctermfg=51 gui=NONE guibg=gray30 guifg=Cyan
    CSAHi lCursor term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=green
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=yellow
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=lightblue
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=Pink2
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=seagreen
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=239 ctermfg=255 gui=NONE guibg=gray30 guifg=white
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=105 ctermfg=fg gui=NONE guibg=slateblue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=28 ctermfg=fg gui=NONE guibg=darkgreen guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=216 ctermfg=21 gui=bold guibg=coral guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=143 ctermfg=fg gui=bold guibg=olivedrab guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=black guifg=cyan
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=orange guifg=Black
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=124 gui=bold guibg=bg guifg=brown
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=16 gui=NONE guibg=Red guifg=Black
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=67 ctermfg=fg gui=NONE guibg=steelblue guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=99 ctermfg=16 gui=NONE guibg=lightslateblue guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=darkgrey
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=51 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=71 ctermfg=46 gui=NONE guibg=#60a060 guifg=#00ff00
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=gold2
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=orange
    CSAHi cIf0 term=NONE cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=gray
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=21 ctermfg=51 gui=bold guibg=blue guifg=cyan
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=18 ctermfg=152 gui=NONE guibg=darkblue guifg=lightblue
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=51 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=248 gui=bold guibg=bg guifg=darkgrey
    CSAHi Visual term=reverse cterm=NONE ctermbg=51 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=Green guifg=Black
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=239 ctermfg=51 gui=NONE guibg=gray30 guifg=Cyan
    CSAHi lCursor term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=green
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=yellow
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=lightblue
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=Pink2
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=seagreen
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=239 ctermfg=231 gui=NONE guibg=gray30 guifg=white
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=62 ctermfg=fg gui=NONE guibg=slateblue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=darkgreen guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=209 ctermfg=21 gui=bold guibg=coral guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=64 ctermfg=fg gui=bold guibg=olivedrab guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=31 gui=NONE guibg=black guifg=cyan
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=68 ctermfg=16 gui=NONE guibg=orange guifg=Black
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=32 gui=bold guibg=bg guifg=brown
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=16 gui=NONE guibg=Red guifg=Black
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=38 ctermfg=fg gui=NONE guibg=steelblue guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=39 ctermfg=16 gui=NONE guibg=lightslateblue guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=darkgrey
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=31 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=31 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=37 ctermfg=28 gui=NONE guibg=#60a060 guifg=#00ff00
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=gold2
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=orange
    CSAHi cIf0 term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=gray
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=19 ctermfg=31 gui=bold guibg=blue guifg=cyan
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=17 ctermfg=58 gui=NONE guibg=darkblue guifg=lightblue
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=31 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=84 gui=bold guibg=bg guifg=darkgrey
    CSAHi Visual term=reverse cterm=NONE ctermbg=31 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=Green guifg=Black
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=81 ctermfg=31 gui=NONE guibg=gray30 guifg=Cyan
    CSAHi lCursor term=NONE cterm=NONE ctermbg=31 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=green
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=31 gui=bold guibg=bg guifg=cyan
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=yellow
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=cyan
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=lightblue
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=70 gui=NONE guibg=bg guifg=Pink2
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=seagreen
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=81 ctermfg=79 gui=NONE guibg=gray30 guifg=white
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=38 ctermfg=fg gui=NONE guibg=slateblue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=20 ctermfg=fg gui=NONE guibg=darkgreen guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=69 ctermfg=19 gui=bold guibg=coral guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=36 ctermfg=fg gui=bold guibg=olivedrab guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
