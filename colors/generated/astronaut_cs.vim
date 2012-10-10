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
    CSAHi Normal term=NONE cterm=NONE ctermbg=19 ctermfg=46 gui=NONE guibg=navyblue guifg=green
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=46 gui=underline guibg=bg guifg=green
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=red guifg=white
    CSAHi Todo term=NONE cterm=NONE ctermbg=201 ctermfg=231 gui=NONE guibg=magenta guifg=white
    CSAHi String term=NONE cterm=NONE ctermbg=19 ctermfg=226 gui=NONE guibg=navyblue guifg=yellow
    CSAHi Function term=NONE cterm=NONE ctermbg=19 ctermfg=51 gui=NONE guibg=navyblue guifg=cyan
    CSAHi SpecialKey term=NONE cterm=NONE ctermbg=201 ctermfg=16 gui=NONE guibg=magenta guifg=black
    CSAHi NonText term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi Directory term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi Search term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=NONE guibg=blue guifg=yellow
    CSAHi MoreMsg term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi Cyan term=NONE cterm=NONE ctermbg=19 ctermfg=51 gui=NONE guibg=navyblue guifg=cyan
    CSAHi Green term=NONE cterm=NONE ctermbg=19 ctermfg=46 gui=NONE guibg=navyblue guifg=green
    CSAHi Magenta term=NONE cterm=NONE ctermbg=19 ctermfg=201 gui=NONE guibg=navyblue guifg=magenta
    CSAHi Menu term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=gray75 guifg=black
    CSAHi Red term=NONE cterm=NONE ctermbg=19 ctermfg=196 gui=NONE guibg=navyblue guifg=red
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=249 ctermfg=188 gui=NONE guibg=gray70 guifg=gray80
    CSAHi Subtitle term=NONE cterm=NONE ctermbg=19 ctermfg=201 gui=NONE guibg=navyblue guifg=magenta
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=46 ctermfg=19 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=NONE cterm=underline ctermbg=21 ctermfg=16 gui=underline guibg=blue guifg=black
    CSAHi TabLineSel term=NONE cterm=underline ctermbg=21 ctermfg=46 gui=underline guibg=blue guifg=green
    CSAHi TabLineFill term=NONE cterm=NONE ctermbg=21 ctermfg=21 gui=NONE guibg=blue guifg=blue
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=21 gui=NONE guibg=green guifg=blue
    CSAHi Conceal term=NONE cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=Black guifg=Blue
    CSAHi Debug term=NONE cterm=NONE ctermbg=16 ctermfg=201 gui=NONE guibg=black guifg=magenta
    CSAHi Blue term=NONE cterm=NONE ctermbg=19 ctermfg=21 gui=NONE guibg=navyblue guifg=blue
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=yellow
    CSAHi StatusLine term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=cyan guifg=black
    CSAHi StatusLineNC term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi VertSplit term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi Title term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi Visual term=NONE cterm=NONE ctermbg=46 ctermfg=250 gui=NONE guibg=fg guifg=Grey
    CSAHi VisualNOS term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=yellow guifg=black
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=201 gui=NONE guibg=black guifg=magenta
    CSAHi AltAltUnique term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi White term=NONE cterm=NONE ctermbg=19 ctermfg=231 gui=NONE guibg=navyblue guifg=white
    CSAHi Yellow term=NONE cterm=NONE ctermbg=19 ctermfg=226 gui=NONE guibg=navyblue guifg=yellow
    CSAHi AltConstant term=NONE cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=black guifg=yellow
    CSAHi AltFunction term=NONE cterm=NONE ctermbg=16 ctermfg=46 gui=NONE guibg=black guifg=green
    CSAHi AltType term=underline cterm=underline ctermbg=16 ctermfg=121 gui=underline guibg=black guifg=seagreen1
    CSAHi User1 term=NONE cterm=NONE ctermbg=21 ctermfg=231 gui=NONE guibg=blue guifg=white
    CSAHi lCursor term=NONE cterm=NONE ctermbg=46 ctermfg=19 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi Constant term=NONE cterm=NONE ctermbg=19 ctermfg=226 gui=NONE guibg=navyblue guifg=yellow
    CSAHi Special term=NONE cterm=NONE ctermbg=21 ctermfg=46 gui=NONE guibg=blue guifg=green
    CSAHi Identifier term=NONE cterm=NONE ctermbg=19 ctermfg=201 gui=NONE guibg=navyblue guifg=magenta
    CSAHi Statement term=NONE cterm=NONE ctermbg=19 ctermfg=51 gui=NONE guibg=navyblue guifg=cyan
    CSAHi PreProc term=NONE cterm=NONE ctermbg=20 ctermfg=231 gui=NONE guibg=blue3 guifg=white
    CSAHi Type term=underline cterm=underline ctermbg=bg ctermfg=121 gui=underline guibg=bg guifg=seagreen1
    CSAHi User2 term=NONE cterm=NONE ctermbg=21 ctermfg=51 gui=NONE guibg=blue guifg=cyan
    CSAHi Tags term=NONE cterm=NONE ctermbg=20 ctermfg=226 gui=NONE guibg=blue3 guifg=yellow
    CSAHi Unique term=NONE cterm=NONE ctermbg=231 ctermfg=20 gui=NONE guibg=white guifg=blue3
    CSAHi AltUnique term=NONE cterm=NONE ctermbg=231 ctermfg=201 gui=NONE guibg=white guifg=magenta
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=19 ctermfg=231 gui=NONE guibg=navyblue guifg=white
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=131 ctermfg=51 gui=NONE guibg=Brown guifg=Cyan
    CSAHi DiffAdd term=NONE cterm=NONE ctermbg=201 ctermfg=231 gui=NONE guibg=Magenta guifg=White
    CSAHi DiffChange term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=NONE guibg=Blue guifg=Yellow
    CSAHi DiffDelete term=NONE cterm=NONE ctermbg=21 ctermfg=231 gui=NONE guibg=Blue guifg=White
    CSAHi DiffText term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=19 ctermfg=46 gui=NONE guibg=navyblue guifg=green
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=46 gui=underline guibg=bg guifg=green
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=red guifg=white
    CSAHi Todo term=NONE cterm=NONE ctermbg=201 ctermfg=255 gui=NONE guibg=magenta guifg=white
    CSAHi String term=NONE cterm=NONE ctermbg=19 ctermfg=226 gui=NONE guibg=navyblue guifg=yellow
    CSAHi Function term=NONE cterm=NONE ctermbg=19 ctermfg=51 gui=NONE guibg=navyblue guifg=cyan
    CSAHi SpecialKey term=NONE cterm=NONE ctermbg=201 ctermfg=16 gui=NONE guibg=magenta guifg=black
    CSAHi NonText term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi Directory term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=white
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi Search term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=NONE guibg=blue guifg=yellow
    CSAHi MoreMsg term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi Cyan term=NONE cterm=NONE ctermbg=19 ctermfg=51 gui=NONE guibg=navyblue guifg=cyan
    CSAHi Green term=NONE cterm=NONE ctermbg=19 ctermfg=46 gui=NONE guibg=navyblue guifg=green
    CSAHi Magenta term=NONE cterm=NONE ctermbg=19 ctermfg=201 gui=NONE guibg=navyblue guifg=magenta
    CSAHi Menu term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=gray75 guifg=black
    CSAHi Red term=NONE cterm=NONE ctermbg=19 ctermfg=196 gui=NONE guibg=navyblue guifg=red
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=249 ctermfg=252 gui=NONE guibg=gray70 guifg=gray80
    CSAHi Subtitle term=NONE cterm=NONE ctermbg=19 ctermfg=201 gui=NONE guibg=navyblue guifg=magenta
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=46 ctermfg=19 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=NONE cterm=underline ctermbg=21 ctermfg=16 gui=underline guibg=blue guifg=black
    CSAHi TabLineSel term=NONE cterm=underline ctermbg=21 ctermfg=46 gui=underline guibg=blue guifg=green
    CSAHi TabLineFill term=NONE cterm=NONE ctermbg=21 ctermfg=21 gui=NONE guibg=blue guifg=blue
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=21 gui=NONE guibg=green guifg=blue
    CSAHi Conceal term=NONE cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=Black guifg=Blue
    CSAHi Debug term=NONE cterm=NONE ctermbg=16 ctermfg=201 gui=NONE guibg=black guifg=magenta
    CSAHi Blue term=NONE cterm=NONE ctermbg=19 ctermfg=21 gui=NONE guibg=navyblue guifg=blue
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=yellow
    CSAHi StatusLine term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=cyan guifg=black
    CSAHi StatusLineNC term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi VertSplit term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi Title term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=white
    CSAHi Visual term=NONE cterm=NONE ctermbg=46 ctermfg=250 gui=NONE guibg=fg guifg=Grey
    CSAHi VisualNOS term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=yellow guifg=black
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=201 gui=NONE guibg=black guifg=magenta
    CSAHi AltAltUnique term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi White term=NONE cterm=NONE ctermbg=19 ctermfg=255 gui=NONE guibg=navyblue guifg=white
    CSAHi Yellow term=NONE cterm=NONE ctermbg=19 ctermfg=226 gui=NONE guibg=navyblue guifg=yellow
    CSAHi AltConstant term=NONE cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=black guifg=yellow
    CSAHi AltFunction term=NONE cterm=NONE ctermbg=16 ctermfg=46 gui=NONE guibg=black guifg=green
    CSAHi AltType term=underline cterm=underline ctermbg=16 ctermfg=122 gui=underline guibg=black guifg=seagreen1
    CSAHi User1 term=NONE cterm=NONE ctermbg=21 ctermfg=255 gui=NONE guibg=blue guifg=white
    CSAHi lCursor term=NONE cterm=NONE ctermbg=46 ctermfg=19 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=white
    CSAHi Constant term=NONE cterm=NONE ctermbg=19 ctermfg=226 gui=NONE guibg=navyblue guifg=yellow
    CSAHi Special term=NONE cterm=NONE ctermbg=21 ctermfg=46 gui=NONE guibg=blue guifg=green
    CSAHi Identifier term=NONE cterm=NONE ctermbg=19 ctermfg=201 gui=NONE guibg=navyblue guifg=magenta
    CSAHi Statement term=NONE cterm=NONE ctermbg=19 ctermfg=51 gui=NONE guibg=navyblue guifg=cyan
    CSAHi PreProc term=NONE cterm=NONE ctermbg=21 ctermfg=255 gui=NONE guibg=blue3 guifg=white
    CSAHi Type term=underline cterm=underline ctermbg=bg ctermfg=122 gui=underline guibg=bg guifg=seagreen1
    CSAHi User2 term=NONE cterm=NONE ctermbg=21 ctermfg=51 gui=NONE guibg=blue guifg=cyan
    CSAHi Tags term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=NONE guibg=blue3 guifg=yellow
    CSAHi Unique term=NONE cterm=NONE ctermbg=255 ctermfg=21 gui=NONE guibg=white guifg=blue3
    CSAHi AltUnique term=NONE cterm=NONE ctermbg=255 ctermfg=201 gui=NONE guibg=white guifg=magenta
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=19 ctermfg=255 gui=NONE guibg=navyblue guifg=white
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=167 ctermfg=51 gui=NONE guibg=Brown guifg=Cyan
    CSAHi DiffAdd term=NONE cterm=NONE ctermbg=201 ctermfg=255 gui=NONE guibg=Magenta guifg=White
    CSAHi DiffChange term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=NONE guibg=Blue guifg=Yellow
    CSAHi DiffDelete term=NONE cterm=NONE ctermbg=21 ctermfg=255 gui=NONE guibg=Blue guifg=White
    CSAHi DiffText term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=18 ctermfg=46 gui=NONE guibg=navyblue guifg=green
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=46 gui=underline guibg=bg guifg=green
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=red guifg=white
    CSAHi Todo term=NONE cterm=NONE ctermbg=201 ctermfg=231 gui=NONE guibg=magenta guifg=white
    CSAHi String term=NONE cterm=NONE ctermbg=18 ctermfg=226 gui=NONE guibg=navyblue guifg=yellow
    CSAHi Function term=NONE cterm=NONE ctermbg=18 ctermfg=51 gui=NONE guibg=navyblue guifg=cyan
    CSAHi SpecialKey term=NONE cterm=NONE ctermbg=201 ctermfg=16 gui=NONE guibg=magenta guifg=black
    CSAHi NonText term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi Directory term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi Search term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=NONE guibg=blue guifg=yellow
    CSAHi MoreMsg term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi Cyan term=NONE cterm=NONE ctermbg=18 ctermfg=51 gui=NONE guibg=navyblue guifg=cyan
    CSAHi Green term=NONE cterm=NONE ctermbg=18 ctermfg=46 gui=NONE guibg=navyblue guifg=green
    CSAHi Magenta term=NONE cterm=NONE ctermbg=18 ctermfg=201 gui=NONE guibg=navyblue guifg=magenta
    CSAHi Menu term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=gray75 guifg=black
    CSAHi Red term=NONE cterm=NONE ctermbg=18 ctermfg=196 gui=NONE guibg=navyblue guifg=red
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=249 ctermfg=252 gui=NONE guibg=gray70 guifg=gray80
    CSAHi Subtitle term=NONE cterm=NONE ctermbg=18 ctermfg=201 gui=NONE guibg=navyblue guifg=magenta
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=46 ctermfg=18 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=NONE cterm=underline ctermbg=21 ctermfg=16 gui=underline guibg=blue guifg=black
    CSAHi TabLineSel term=NONE cterm=underline ctermbg=21 ctermfg=46 gui=underline guibg=blue guifg=green
    CSAHi TabLineFill term=NONE cterm=NONE ctermbg=21 ctermfg=21 gui=NONE guibg=blue guifg=blue
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=21 gui=NONE guibg=green guifg=blue
    CSAHi Conceal term=NONE cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=Black guifg=Blue
    CSAHi Debug term=NONE cterm=NONE ctermbg=16 ctermfg=201 gui=NONE guibg=black guifg=magenta
    CSAHi Blue term=NONE cterm=NONE ctermbg=18 ctermfg=21 gui=NONE guibg=navyblue guifg=blue
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=yellow
    CSAHi StatusLine term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=cyan guifg=black
    CSAHi StatusLineNC term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi VertSplit term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi Title term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi Visual term=NONE cterm=NONE ctermbg=46 ctermfg=250 gui=NONE guibg=fg guifg=Grey
    CSAHi VisualNOS term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=yellow guifg=black
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=201 gui=NONE guibg=black guifg=magenta
    CSAHi AltAltUnique term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi White term=NONE cterm=NONE ctermbg=18 ctermfg=231 gui=NONE guibg=navyblue guifg=white
    CSAHi Yellow term=NONE cterm=NONE ctermbg=18 ctermfg=226 gui=NONE guibg=navyblue guifg=yellow
    CSAHi AltConstant term=NONE cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=black guifg=yellow
    CSAHi AltFunction term=NONE cterm=NONE ctermbg=16 ctermfg=46 gui=NONE guibg=black guifg=green
    CSAHi AltType term=underline cterm=underline ctermbg=16 ctermfg=85 gui=underline guibg=black guifg=seagreen1
    CSAHi User1 term=NONE cterm=NONE ctermbg=21 ctermfg=231 gui=NONE guibg=blue guifg=white
    CSAHi lCursor term=NONE cterm=NONE ctermbg=46 ctermfg=18 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi Constant term=NONE cterm=NONE ctermbg=18 ctermfg=226 gui=NONE guibg=navyblue guifg=yellow
    CSAHi Special term=NONE cterm=NONE ctermbg=21 ctermfg=46 gui=NONE guibg=blue guifg=green
    CSAHi Identifier term=NONE cterm=NONE ctermbg=18 ctermfg=201 gui=NONE guibg=navyblue guifg=magenta
    CSAHi Statement term=NONE cterm=NONE ctermbg=18 ctermfg=51 gui=NONE guibg=navyblue guifg=cyan
    CSAHi PreProc term=NONE cterm=NONE ctermbg=20 ctermfg=231 gui=NONE guibg=blue3 guifg=white
    CSAHi Type term=underline cterm=underline ctermbg=bg ctermfg=85 gui=underline guibg=bg guifg=seagreen1
    CSAHi User2 term=NONE cterm=NONE ctermbg=21 ctermfg=51 gui=NONE guibg=blue guifg=cyan
    CSAHi Tags term=NONE cterm=NONE ctermbg=20 ctermfg=226 gui=NONE guibg=blue3 guifg=yellow
    CSAHi Unique term=NONE cterm=NONE ctermbg=231 ctermfg=20 gui=NONE guibg=white guifg=blue3
    CSAHi AltUnique term=NONE cterm=NONE ctermbg=231 ctermfg=201 gui=NONE guibg=white guifg=magenta
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=18 ctermfg=231 gui=NONE guibg=navyblue guifg=white
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=124 ctermfg=51 gui=NONE guibg=Brown guifg=Cyan
    CSAHi DiffAdd term=NONE cterm=NONE ctermbg=201 ctermfg=231 gui=NONE guibg=Magenta guifg=White
    CSAHi DiffChange term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=NONE guibg=Blue guifg=Yellow
    CSAHi DiffDelete term=NONE cterm=NONE ctermbg=21 ctermfg=231 gui=NONE guibg=Blue guifg=White
    CSAHi DiffText term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=17 ctermfg=28 gui=NONE guibg=navyblue guifg=green
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=28 gui=underline guibg=bg guifg=green
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=red guifg=white
    CSAHi Todo term=NONE cterm=NONE ctermbg=67 ctermfg=79 gui=NONE guibg=magenta guifg=white
    CSAHi String term=NONE cterm=NONE ctermbg=17 ctermfg=76 gui=NONE guibg=navyblue guifg=yellow
    CSAHi Function term=NONE cterm=NONE ctermbg=17 ctermfg=31 gui=NONE guibg=navyblue guifg=cyan
    CSAHi SpecialKey term=NONE cterm=NONE ctermbg=67 ctermfg=16 gui=NONE guibg=magenta guifg=black
    CSAHi NonText term=NONE cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi Directory term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=white
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=NONE cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi Search term=NONE cterm=NONE ctermbg=19 ctermfg=76 gui=NONE guibg=blue guifg=yellow
    CSAHi MoreMsg term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=Yellow
    CSAHi Cyan term=NONE cterm=NONE ctermbg=17 ctermfg=31 gui=NONE guibg=navyblue guifg=cyan
    CSAHi Green term=NONE cterm=NONE ctermbg=17 ctermfg=28 gui=NONE guibg=navyblue guifg=green
    CSAHi Magenta term=NONE cterm=NONE ctermbg=17 ctermfg=67 gui=NONE guibg=navyblue guifg=magenta
    CSAHi Menu term=NONE cterm=NONE ctermbg=85 ctermfg=16 gui=NONE guibg=gray75 guifg=black
    CSAHi Red term=NONE cterm=NONE ctermbg=17 ctermfg=64 gui=NONE guibg=navyblue guifg=red
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=85 ctermfg=58 gui=NONE guibg=gray70 guifg=gray80
    CSAHi Subtitle term=NONE cterm=NONE ctermbg=17 ctermfg=67 gui=NONE guibg=navyblue guifg=magenta
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=28 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=NONE cterm=underline ctermbg=19 ctermfg=16 gui=underline guibg=blue guifg=black
    CSAHi TabLineSel term=NONE cterm=underline ctermbg=19 ctermfg=28 gui=underline guibg=blue guifg=green
    CSAHi TabLineFill term=NONE cterm=NONE ctermbg=19 ctermfg=19 gui=NONE guibg=blue guifg=blue
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=28 ctermfg=19 gui=NONE guibg=green guifg=blue
    CSAHi Conceal term=NONE cterm=NONE ctermbg=16 ctermfg=19 gui=NONE guibg=Black guifg=Blue
    CSAHi Debug term=NONE cterm=NONE ctermbg=16 ctermfg=67 gui=NONE guibg=black guifg=magenta
    CSAHi Blue term=NONE cterm=NONE ctermbg=17 ctermfg=19 gui=NONE guibg=navyblue guifg=blue
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=yellow
    CSAHi StatusLine term=NONE cterm=NONE ctermbg=31 ctermfg=16 gui=NONE guibg=cyan guifg=black
    CSAHi StatusLineNC term=NONE cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi VertSplit term=NONE cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi Title term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=white
    CSAHi Visual term=NONE cterm=NONE ctermbg=28 ctermfg=85 gui=NONE guibg=fg guifg=Grey
    CSAHi VisualNOS term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=yellow guifg=black
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=67 gui=NONE guibg=black guifg=magenta
    CSAHi AltAltUnique term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi White term=NONE cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=navyblue guifg=white
    CSAHi Yellow term=NONE cterm=NONE ctermbg=17 ctermfg=76 gui=NONE guibg=navyblue guifg=yellow
    CSAHi AltConstant term=NONE cterm=NONE ctermbg=16 ctermfg=76 gui=NONE guibg=black guifg=yellow
    CSAHi AltFunction term=NONE cterm=NONE ctermbg=16 ctermfg=28 gui=NONE guibg=black guifg=green
    CSAHi AltType term=underline cterm=underline ctermbg=16 ctermfg=45 gui=underline guibg=black guifg=seagreen1
    CSAHi User1 term=NONE cterm=NONE ctermbg=19 ctermfg=79 gui=NONE guibg=blue guifg=white
    CSAHi lCursor term=NONE cterm=NONE ctermbg=28 ctermfg=17 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=white
    CSAHi Constant term=NONE cterm=NONE ctermbg=17 ctermfg=76 gui=NONE guibg=navyblue guifg=yellow
    CSAHi Special term=NONE cterm=NONE ctermbg=19 ctermfg=28 gui=NONE guibg=blue guifg=green
    CSAHi Identifier term=NONE cterm=NONE ctermbg=17 ctermfg=67 gui=NONE guibg=navyblue guifg=magenta
    CSAHi Statement term=NONE cterm=NONE ctermbg=17 ctermfg=31 gui=NONE guibg=navyblue guifg=cyan
    CSAHi PreProc term=NONE cterm=NONE ctermbg=18 ctermfg=79 gui=NONE guibg=blue3 guifg=white
    CSAHi Type term=underline cterm=underline ctermbg=bg ctermfg=45 gui=underline guibg=bg guifg=seagreen1
    CSAHi User2 term=NONE cterm=NONE ctermbg=19 ctermfg=31 gui=NONE guibg=blue guifg=cyan
    CSAHi Tags term=NONE cterm=NONE ctermbg=18 ctermfg=76 gui=NONE guibg=blue3 guifg=yellow
    CSAHi Unique term=NONE cterm=NONE ctermbg=79 ctermfg=18 gui=NONE guibg=white guifg=blue3
    CSAHi AltUnique term=NONE cterm=NONE ctermbg=79 ctermfg=67 gui=NONE guibg=white guifg=magenta
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=navyblue guifg=white
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=32 ctermfg=31 gui=NONE guibg=Brown guifg=Cyan
    CSAHi DiffAdd term=NONE cterm=NONE ctermbg=67 ctermfg=79 gui=NONE guibg=Magenta guifg=White
    CSAHi DiffChange term=NONE cterm=NONE ctermbg=19 ctermfg=76 gui=NONE guibg=Blue guifg=Yellow
    CSAHi DiffDelete term=NONE cterm=NONE ctermbg=19 ctermfg=79 gui=NONE guibg=Blue guifg=White
    CSAHi DiffText term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
