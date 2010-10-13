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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=Black guifg=ivory
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=231 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=Linen guifg=Red
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=75 gui=NONE guibg=bg guifg=DodgerBlue
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=152 gui=NONE guibg=bg guifg=LightBlue3
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=bg guifg=Cyan
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=Black guifg=Cyan4
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=157 gui=NONE guibg=bg guifg=LightGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=Linen guifg=Red
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=157 ctermfg=16 gui=NONE guibg=LightGreen guifg=Black
    CSAHi Search term=reverse cterm=NONE ctermbg=224 ctermfg=67 gui=NONE guibg=Bisque guifg=SkyBlue4
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=16 ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=152 gui=NONE guibg=bg guifg=LightBlue3
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=59 ctermfg=188 gui=NONE guibg=#272d2f guifg=MistyRose3
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=59 ctermfg=152 gui=NONE guibg=#272d2f guifg=LightBlue3
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=59 ctermfg=59 gui=NONE guibg=#272d2f guifg=#272d2f
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=Lavender guifg=Black
    CSAHi Operator term=NONE cterm=NONE ctermbg=16 ctermfg=141 gui=NONE guibg=bg guifg=#8673e8
    CSAHi Question term=NONE cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=bg guifg=LimeGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=59 ctermfg=152 gui=NONE guibg=#272d2f guifg=LightBlue3
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=188 gui=NONE guibg=#272d2f guifg=MistyRose3
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=109 gui=NONE guibg=Black guifg=LightBlue4
    CSAHi Title term=bold cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=bg guifg=Yellow2
    CSAHi Visual term=reverse cterm=NONE ctermbg=109 ctermfg=16 gui=reverse guibg=Black guifg=LightBlue4
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=16 ctermfg=231 gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=173 gui=NONE guibg=Black guifg=Tomato3
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=67 ctermfg=16 gui=NONE guibg=SkyBlue4 guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=217 gui=NONE guibg=bg guifg=#f4aba2
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=Lavender guifg=Black
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=112 gui=NONE guibg=bg guifg=#62c600
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=188 gui=NONE guibg=bg guifg=MistyRose3
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=179 gui=NONE guibg=bg guifg=GoldenRod
    CSAHi Identifier term=underline cterm=bold ctermbg=16 ctermfg=109 gui=bold guibg=bg guifg=LightBlue4
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=229 gui=NONE guibg=bg guifg=khaki
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=217 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=223 gui=NONE guibg=bg guifg=NavajoWhite
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=195 ctermfg=21 gui=NONE guibg=LightCyan guifg=Blue
    CSAHi DiffChange term=bold cterm=NONE ctermbg=109 ctermfg=231 gui=NONE guibg=LightCyan4 guifg=white
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=195 ctermfg=153 gui=NONE guibg=LightCyan guifg=LightBlue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=103 ctermfg=226 gui=NONE guibg=LightSkyBlue4 guifg=Yellow
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=Black guifg=ivory
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=255 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=Linen guifg=Red
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=75 gui=NONE guibg=bg guifg=DodgerBlue
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=195 gui=NONE guibg=bg guifg=LightBlue3
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=bg guifg=Cyan
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=Black guifg=Cyan4
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=157 gui=NONE guibg=bg guifg=LightGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=Linen guifg=Red
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=157 ctermfg=16 gui=NONE guibg=LightGreen guifg=Black
    CSAHi Search term=reverse cterm=NONE ctermbg=231 ctermfg=109 gui=NONE guibg=Bisque guifg=SkyBlue4
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=16 ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=195 gui=NONE guibg=bg guifg=LightBlue3
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=59 ctermfg=224 gui=NONE guibg=#272d2f guifg=MistyRose3
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=59 ctermfg=195 gui=NONE guibg=#272d2f guifg=LightBlue3
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=59 ctermfg=59 gui=NONE guibg=#272d2f guifg=#272d2f
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=Lavender guifg=Black
    CSAHi Operator term=NONE cterm=NONE ctermbg=16 ctermfg=147 gui=NONE guibg=bg guifg=#8673e8
    CSAHi Question term=NONE cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=bg guifg=LimeGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=59 ctermfg=195 gui=NONE guibg=#272d2f guifg=LightBlue3
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=224 gui=NONE guibg=#272d2f guifg=MistyRose3
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=109 gui=NONE guibg=Black guifg=LightBlue4
    CSAHi Title term=bold cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=bg guifg=Yellow2
    CSAHi Visual term=reverse cterm=NONE ctermbg=109 ctermfg=16 gui=reverse guibg=Black guifg=LightBlue4
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=16 ctermfg=255 gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=209 gui=NONE guibg=Black guifg=Tomato3
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=109 ctermfg=16 gui=NONE guibg=SkyBlue4 guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=224 gui=NONE guibg=bg guifg=#f4aba2
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=Lavender guifg=Black
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=118 gui=NONE guibg=bg guifg=#62c600
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=224 gui=NONE guibg=bg guifg=MistyRose3
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=221 gui=NONE guibg=bg guifg=GoldenRod
    CSAHi Identifier term=underline cterm=bold ctermbg=16 ctermfg=109 gui=bold guibg=bg guifg=LightBlue4
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=229 gui=NONE guibg=bg guifg=khaki
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=224 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=230 gui=NONE guibg=bg guifg=NavajoWhite
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=231 ctermfg=21 gui=NONE guibg=LightCyan guifg=Blue
    CSAHi DiffChange term=bold cterm=NONE ctermbg=145 ctermfg=255 gui=NONE guibg=LightCyan4 guifg=white
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=231 ctermfg=195 gui=NONE guibg=LightCyan guifg=LightBlue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=109 ctermfg=226 gui=NONE guibg=LightSkyBlue4 guifg=Yellow
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=Black guifg=ivory
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=231 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=230 ctermfg=196 gui=NONE guibg=Linen guifg=Red
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=33 gui=NONE guibg=bg guifg=DodgerBlue
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=110 gui=NONE guibg=bg guifg=LightBlue3
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=bg guifg=Cyan
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=30 gui=NONE guibg=Black guifg=Cyan4
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=bg guifg=LightGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=230 ctermfg=196 gui=NONE guibg=Linen guifg=Red
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=120 ctermfg=16 gui=NONE guibg=LightGreen guifg=Black
    CSAHi Search term=reverse cterm=NONE ctermbg=224 ctermfg=60 gui=NONE guibg=Bisque guifg=SkyBlue4
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=16 ctermfg=29 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=110 gui=NONE guibg=bg guifg=LightBlue3
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=16 ctermfg=181 gui=NONE guibg=#272d2f guifg=MistyRose3
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=16 ctermfg=110 gui=NONE guibg=#272d2f guifg=LightBlue3
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#272d2f guifg=#272d2f
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=Lavender guifg=Black
    CSAHi Operator term=NONE cterm=NONE ctermbg=16 ctermfg=98 gui=NONE guibg=bg guifg=#8673e8
    CSAHi Question term=NONE cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=bg guifg=LimeGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=16 ctermfg=110 gui=NONE guibg=#272d2f guifg=LightBlue3
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=181 gui=NONE guibg=#272d2f guifg=MistyRose3
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=66 gui=NONE guibg=Black guifg=LightBlue4
    CSAHi Title term=bold cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=bg guifg=Yellow2
    CSAHi Visual term=reverse cterm=NONE ctermbg=66 ctermfg=16 gui=reverse guibg=Black guifg=LightBlue4
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=16 ctermfg=231 gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=167 gui=NONE guibg=Black guifg=Tomato3
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=60 ctermfg=16 gui=NONE guibg=SkyBlue4 guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=217 gui=NONE guibg=bg guifg=#f4aba2
    CSAHi lCursor term=NONE cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=Lavender guifg=Black
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=76 gui=NONE guibg=bg guifg=#62c600
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=181 gui=NONE guibg=bg guifg=MistyRose3
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=178 gui=NONE guibg=bg guifg=GoldenRod
    CSAHi Identifier term=underline cterm=bold ctermbg=16 ctermfg=66 gui=bold guibg=bg guifg=LightBlue4
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=222 gui=NONE guibg=bg guifg=khaki
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=217 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=223 gui=NONE guibg=bg guifg=NavajoWhite
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=195 ctermfg=21 gui=NONE guibg=LightCyan guifg=Blue
    CSAHi DiffChange term=bold cterm=NONE ctermbg=102 ctermfg=231 gui=NONE guibg=LightCyan4 guifg=white
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=195 ctermfg=152 gui=NONE guibg=LightCyan guifg=LightBlue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=66 ctermfg=226 gui=NONE guibg=LightSkyBlue4 guifg=Yellow
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=Black guifg=ivory
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=79 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=78 ctermfg=64 gui=NONE guibg=Linen guifg=Red
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=23 gui=NONE guibg=bg guifg=DodgerBlue
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=42 gui=NONE guibg=bg guifg=LightBlue3
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=31 gui=NONE guibg=bg guifg=Cyan
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=Black guifg=Cyan4
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=bg guifg=LightGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=78 ctermfg=64 gui=NONE guibg=Linen guifg=Red
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=45 ctermfg=16 gui=NONE guibg=LightGreen guifg=Black
    CSAHi Search term=reverse cterm=NONE ctermbg=74 ctermfg=37 gui=NONE guibg=Bisque guifg=SkyBlue4
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=42 gui=NONE guibg=bg guifg=LightBlue3
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#272d2f guifg=MistyRose3
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=80 ctermfg=42 gui=NONE guibg=#272d2f guifg=LightBlue3
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=80 ctermfg=80 gui=NONE guibg=#272d2f guifg=#272d2f
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=59 ctermfg=16 gui=NONE guibg=Lavender guifg=Black
    CSAHi Operator term=NONE cterm=NONE ctermbg=16 ctermfg=39 gui=NONE guibg=bg guifg=#8673e8
    CSAHi Question term=NONE cterm=NONE ctermbg=16 ctermfg=24 gui=NONE guibg=bg guifg=LimeGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=80 ctermfg=42 gui=NONE guibg=#272d2f guifg=LightBlue3
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#272d2f guifg=MistyRose3
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=Black guifg=LightBlue4
    CSAHi Title term=bold cterm=NONE ctermbg=16 ctermfg=76 gui=NONE guibg=bg guifg=Yellow2
    CSAHi Visual term=reverse cterm=NONE ctermbg=37 ctermfg=16 gui=reverse guibg=Black guifg=LightBlue4
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=16 ctermfg=79 gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=52 gui=NONE guibg=Black guifg=Tomato3
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=SkyBlue4 guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=69 gui=NONE guibg=bg guifg=#f4aba2
    CSAHi lCursor term=NONE cterm=NONE ctermbg=59 ctermfg=16 gui=NONE guibg=Lavender guifg=Black
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=40 gui=NONE guibg=bg guifg=#62c600
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=58 gui=NONE guibg=bg guifg=MistyRose3
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=52 gui=NONE guibg=bg guifg=GoldenRod
    CSAHi Identifier term=underline cterm=bold ctermbg=16 ctermfg=37 gui=bold guibg=bg guifg=LightBlue4
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=73 gui=NONE guibg=bg guifg=khaki
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=69 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=74 gui=NONE guibg=bg guifg=NavajoWhite
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=63 ctermfg=19 gui=NONE guibg=LightCyan guifg=Blue
    CSAHi DiffChange term=bold cterm=NONE ctermbg=37 ctermfg=79 gui=NONE guibg=LightCyan4 guifg=white
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=63 ctermfg=58 gui=NONE guibg=LightCyan guifg=LightBlue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=37 ctermfg=76 gui=NONE guibg=LightSkyBlue4 guifg=Yellow
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
