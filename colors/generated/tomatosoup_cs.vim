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
    CSAHi Normal term=NONE cterm=NONE ctermbg=209 ctermfg=16 gui=NONE guibg=tomato1 guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=21 ctermfg=226 gui=bold guibg=blue guifg=yellow
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=253 gui=NONE guibg=bg guifg=grey85
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=violet
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=Cyan
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=209 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=209 gui=NONE guibg=yellow guifg=bg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=yellow
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=yellow
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=209 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=209 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=209 gui=NONE guibg=fg guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=131 ctermfg=209 gui=reverse,bold guibg=bg guifg=brown
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=124 ctermfg=209 gui=reverse guibg=bg guifg=darkred
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=209 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=209 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=124 ctermfg=220 gui=bold guibg=darkred guifg=gold
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=209 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=pink
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=225 gui=bold guibg=bg guifg=lightmagenta
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=red
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#40ffff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=khaki1
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=italic guibg=bg guifg=white
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=yellow
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=124 ctermfg=220 gui=bold guibg=darkred guifg=gold
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=28 ctermfg=226 gui=NONE guibg=darkgreen guifg=yellow
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=195 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=210 ctermfg=16 gui=NONE guibg=tomato1 guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=21 ctermfg=226 gui=bold guibg=blue guifg=yellow
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=253 gui=NONE guibg=bg guifg=grey85
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=violet
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=Cyan
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=210 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=210 gui=NONE guibg=yellow guifg=bg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=yellow
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=yellow
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=210 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=210 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=210 gui=NONE guibg=fg guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=167 ctermfg=210 gui=reverse,bold guibg=bg guifg=brown
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=124 ctermfg=210 gui=reverse guibg=bg guifg=darkred
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=210 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=210 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=124 ctermfg=226 gui=bold guibg=darkred guifg=gold
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=210 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=pink
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=225 gui=bold guibg=bg guifg=lightmagenta
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=red
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#40ffff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=khaki1
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=255 gui=italic guibg=bg guifg=white
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=yellow
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=124 ctermfg=226 gui=bold guibg=darkred guifg=gold
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=28 ctermfg=226 gui=NONE guibg=darkgreen guifg=yellow
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=231 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=203 ctermfg=16 gui=NONE guibg=tomato1 guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=21 ctermfg=226 gui=bold guibg=blue guifg=yellow
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=253 gui=NONE guibg=bg guifg=grey85
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=213 gui=NONE guibg=bg guifg=violet
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=Cyan
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=203 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=203 gui=NONE guibg=yellow guifg=bg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=yellow
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=yellow
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=203 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=203 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=203 gui=NONE guibg=fg guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=124 ctermfg=203 gui=reverse,bold guibg=bg guifg=brown
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=88 ctermfg=203 gui=reverse guibg=bg guifg=darkred
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=203 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=203 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=88 ctermfg=220 gui=bold guibg=darkred guifg=gold
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=203 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=218 gui=NONE guibg=bg guifg=pink
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=lightmagenta
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=red
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#40ffff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=khaki1
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=italic guibg=bg guifg=white
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=yellow
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=88 ctermfg=220 gui=bold guibg=darkred guifg=gold
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=226 gui=NONE guibg=darkgreen guifg=yellow
    CSAHi DiffChange term=bold cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=195 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=69 ctermfg=16 gui=NONE guibg=tomato1 guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=19 ctermfg=76 gui=bold guibg=blue guifg=yellow
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=grey85
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=violet
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=red
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=31 gui=bold guibg=bg guifg=Cyan
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=69 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=69 gui=NONE guibg=yellow guifg=bg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=yellow
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=yellow
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=69 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=69 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=69 gui=NONE guibg=fg guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=32 ctermfg=69 gui=reverse,bold guibg=bg guifg=brown
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=32 ctermfg=69 gui=reverse guibg=bg guifg=darkred
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=69 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=69 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=32 ctermfg=72 gui=bold guibg=darkred guifg=gold
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=69 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=pink
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=75 gui=bold guibg=bg guifg=lightmagenta
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=64 gui=bold guibg=bg guifg=red
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#40ffff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=khaki1
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=79 gui=italic guibg=bg guifg=white
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=yellow
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=32 ctermfg=72 gui=bold guibg=darkred guifg=gold
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=20 ctermfg=76 gui=NONE guibg=darkgreen guifg=yellow
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
