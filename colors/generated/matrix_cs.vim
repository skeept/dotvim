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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=#000000 guifg=#44cc44
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=120 gui=underline guibg=#000000 guifg=#55ff55
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=71 ctermfg=120 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi Todo term=NONE cterm=NONE ctermbg=77 ctermfg=22 gui=NONE guibg=#44cc44 guifg=#113311
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=#000000 guifg=#44cc44
    CSAHi NonText term=bold cterm=bold ctermbg=22 ctermfg=77 gui=bold guibg=#113311 guifg=#44cc44
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#55ff55
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=71 ctermfg=120 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=120 ctermfg=65 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi Search term=reverse cterm=NONE ctermbg=77 ctermfg=22 gui=NONE guibg=#44cc44 guifg=#113311
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=77 gui=bold guibg=#000000 guifg=#44cc44
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=77 gui=bold guibg=#000000 guifg=#44cc44
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=#000000 guifg=#44cc44
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=77 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=77 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=120 ctermfg=65 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=120 ctermfg=65 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=77 gui=bold guibg=#000000 guifg=#44cc44
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=71 ctermfg=120 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=71 ctermfg=22 gui=NONE guibg=#339933 guifg=#113311
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=71 ctermfg=71 gui=reverse guibg=#339933 guifg=#339933
    CSAHi Title term=bold cterm=bold ctermbg=22 ctermfg=120 gui=bold guibg=#113311 guifg=#55ff55
    CSAHi Visual term=reverse cterm=NONE ctermbg=71 ctermfg=120 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=16 ctermfg=77 gui=bold,underline guibg=#000000 guifg=#44cc44
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#55ff55
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=120 ctermfg=65 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi Folded term=NONE cterm=NONE ctermbg=22 ctermfg=77 gui=NONE guibg=#113311 guifg=#44cc44
    CSAHi lCursor term=NONE cterm=NONE ctermbg=120 ctermfg=65 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=65 gui=NONE guibg=#000000 guifg=#226622
    CSAHi Constant term=underline cterm=NONE ctermbg=65 ctermfg=120 gui=NONE guibg=#226622 guifg=#55ff55
    CSAHi Special term=bold cterm=NONE ctermbg=65 ctermfg=77 gui=NONE guibg=#226622 guifg=#44cc44
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#55ff55
    CSAHi Statement term=bold cterm=bold ctermbg=16 ctermfg=120 gui=bold guibg=#000000 guifg=#55ff55
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=71 gui=NONE guibg=#000000 guifg=#339933
    CSAHi Type term=underline cterm=bold ctermbg=16 ctermfg=120 gui=bold guibg=#000000 guifg=#55ff55
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=65 ctermfg=77 gui=NONE guibg=#226622 guifg=#44cc44
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=65 ctermfg=120 gui=NONE guibg=#226622 guifg=#55ff55
    CSAHi DiffChange term=bold cterm=NONE ctermbg=65 ctermfg=120 gui=NONE guibg=#226622 guifg=#55ff55
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=22 ctermfg=22 gui=NONE guibg=#113311 guifg=#113311
    CSAHi DiffText term=reverse cterm=bold ctermbg=71 ctermfg=120 gui=bold guibg=#339933 guifg=#55ff55
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#44cc44
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=120 gui=underline guibg=#000000 guifg=#55ff55
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=77 ctermfg=120 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi Todo term=NONE cterm=NONE ctermbg=120 ctermfg=22 gui=NONE guibg=#44cc44 guifg=#113311
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#44cc44
    CSAHi NonText term=bold cterm=bold ctermbg=22 ctermfg=120 gui=bold guibg=#113311 guifg=#44cc44
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#55ff55
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=77 ctermfg=120 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=120 ctermfg=65 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi Search term=reverse cterm=NONE ctermbg=120 ctermfg=22 gui=NONE guibg=#44cc44 guifg=#113311
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=120 gui=bold guibg=#000000 guifg=#44cc44
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=120 gui=bold guibg=#000000 guifg=#44cc44
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#44cc44
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=120 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=120 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=120 ctermfg=65 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=120 ctermfg=65 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=120 gui=bold guibg=#000000 guifg=#44cc44
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=77 ctermfg=120 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=77 ctermfg=22 gui=NONE guibg=#339933 guifg=#113311
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=77 ctermfg=77 gui=reverse guibg=#339933 guifg=#339933
    CSAHi Title term=bold cterm=bold ctermbg=22 ctermfg=120 gui=bold guibg=#113311 guifg=#55ff55
    CSAHi Visual term=reverse cterm=NONE ctermbg=77 ctermfg=120 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=16 ctermfg=120 gui=bold,underline guibg=#000000 guifg=#44cc44
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#55ff55
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=120 ctermfg=65 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi Folded term=NONE cterm=NONE ctermbg=22 ctermfg=120 gui=NONE guibg=#113311 guifg=#44cc44
    CSAHi lCursor term=NONE cterm=NONE ctermbg=120 ctermfg=65 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=65 gui=NONE guibg=#000000 guifg=#226622
    CSAHi Constant term=underline cterm=NONE ctermbg=65 ctermfg=120 gui=NONE guibg=#226622 guifg=#55ff55
    CSAHi Special term=bold cterm=NONE ctermbg=65 ctermfg=120 gui=NONE guibg=#226622 guifg=#44cc44
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#55ff55
    CSAHi Statement term=bold cterm=bold ctermbg=16 ctermfg=120 gui=bold guibg=#000000 guifg=#55ff55
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=#000000 guifg=#339933
    CSAHi Type term=underline cterm=bold ctermbg=16 ctermfg=120 gui=bold guibg=#000000 guifg=#55ff55
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=65 ctermfg=120 gui=NONE guibg=#226622 guifg=#44cc44
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=65 ctermfg=120 gui=NONE guibg=#226622 guifg=#55ff55
    CSAHi DiffChange term=bold cterm=NONE ctermbg=65 ctermfg=120 gui=NONE guibg=#226622 guifg=#55ff55
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=22 ctermfg=22 gui=NONE guibg=#113311 guifg=#113311
    CSAHi DiffText term=reverse cterm=bold ctermbg=77 ctermfg=120 gui=bold guibg=#339933 guifg=#55ff55
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=#000000 guifg=#44cc44
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=83 gui=underline guibg=#000000 guifg=#55ff55
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=65 ctermfg=83 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi Todo term=NONE cterm=NONE ctermbg=77 ctermfg=22 gui=NONE guibg=#44cc44 guifg=#113311
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=#000000 guifg=#44cc44
    CSAHi NonText term=bold cterm=bold ctermbg=22 ctermfg=77 gui=bold guibg=#113311 guifg=#44cc44
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#000000 guifg=#55ff55
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=65 ctermfg=83 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=83 ctermfg=22 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi Search term=reverse cterm=NONE ctermbg=77 ctermfg=22 gui=NONE guibg=#44cc44 guifg=#113311
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=77 gui=bold guibg=#000000 guifg=#44cc44
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=77 gui=bold guibg=#000000 guifg=#44cc44
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=#000000 guifg=#44cc44
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=77 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=77 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=83 ctermfg=22 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=83 ctermfg=22 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=77 gui=bold guibg=#000000 guifg=#44cc44
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=65 ctermfg=83 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=65 ctermfg=22 gui=NONE guibg=#339933 guifg=#113311
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=65 ctermfg=65 gui=reverse guibg=#339933 guifg=#339933
    CSAHi Title term=bold cterm=bold ctermbg=22 ctermfg=83 gui=bold guibg=#113311 guifg=#55ff55
    CSAHi Visual term=reverse cterm=NONE ctermbg=65 ctermfg=83 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=16 ctermfg=77 gui=bold,underline guibg=#000000 guifg=#44cc44
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#000000 guifg=#55ff55
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=83 ctermfg=22 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi Folded term=NONE cterm=NONE ctermbg=22 ctermfg=77 gui=NONE guibg=#113311 guifg=#44cc44
    CSAHi lCursor term=NONE cterm=NONE ctermbg=83 ctermfg=22 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=22 gui=NONE guibg=#000000 guifg=#226622
    CSAHi Constant term=underline cterm=NONE ctermbg=22 ctermfg=83 gui=NONE guibg=#226622 guifg=#55ff55
    CSAHi Special term=bold cterm=NONE ctermbg=22 ctermfg=77 gui=NONE guibg=#226622 guifg=#44cc44
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#000000 guifg=#55ff55
    CSAHi Statement term=bold cterm=bold ctermbg=16 ctermfg=83 gui=bold guibg=#000000 guifg=#55ff55
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=65 gui=NONE guibg=#000000 guifg=#339933
    CSAHi Type term=underline cterm=bold ctermbg=16 ctermfg=83 gui=bold guibg=#000000 guifg=#55ff55
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=22 ctermfg=77 gui=NONE guibg=#226622 guifg=#44cc44
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=83 gui=NONE guibg=#226622 guifg=#55ff55
    CSAHi DiffChange term=bold cterm=NONE ctermbg=22 ctermfg=83 gui=NONE guibg=#226622 guifg=#55ff55
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=22 ctermfg=22 gui=NONE guibg=#113311 guifg=#113311
    CSAHi DiffText term=reverse cterm=bold ctermbg=65 ctermfg=83 gui=bold guibg=#339933 guifg=#55ff55
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=24 gui=NONE guibg=#000000 guifg=#44cc44
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=45 gui=underline guibg=#000000 guifg=#55ff55
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=20 ctermfg=45 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi Todo term=NONE cterm=NONE ctermbg=24 ctermfg=16 gui=NONE guibg=#44cc44 guifg=#113311
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=24 gui=NONE guibg=#000000 guifg=#44cc44
    CSAHi NonText term=bold cterm=bold ctermbg=16 ctermfg=24 gui=bold guibg=#113311 guifg=#44cc44
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=#000000 guifg=#55ff55
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=20 ctermfg=45 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=45 ctermfg=20 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi Search term=reverse cterm=NONE ctermbg=24 ctermfg=16 gui=NONE guibg=#44cc44 guifg=#113311
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=24 gui=bold guibg=#000000 guifg=#44cc44
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=24 gui=bold guibg=#000000 guifg=#44cc44
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=24 gui=NONE guibg=#000000 guifg=#44cc44
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=24 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=24 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=45 ctermfg=20 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=45 ctermfg=20 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=24 gui=bold guibg=#000000 guifg=#44cc44
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=20 ctermfg=45 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=20 ctermfg=16 gui=NONE guibg=#339933 guifg=#113311
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=20 ctermfg=20 gui=reverse guibg=#339933 guifg=#339933
    CSAHi Title term=bold cterm=bold ctermbg=16 ctermfg=45 gui=bold guibg=#113311 guifg=#55ff55
    CSAHi Visual term=reverse cterm=NONE ctermbg=20 ctermfg=45 gui=NONE guibg=#339933 guifg=#55ff55
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=16 ctermfg=24 gui=bold,underline guibg=#000000 guifg=#44cc44
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=#000000 guifg=#55ff55
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=45 ctermfg=20 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=24 gui=NONE guibg=#113311 guifg=#44cc44
    CSAHi lCursor term=NONE cterm=NONE ctermbg=45 ctermfg=20 gui=NONE guibg=#55ff55 guifg=#226622
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=20 gui=NONE guibg=#000000 guifg=#226622
    CSAHi Constant term=underline cterm=NONE ctermbg=20 ctermfg=45 gui=NONE guibg=#226622 guifg=#55ff55
    CSAHi Special term=bold cterm=NONE ctermbg=20 ctermfg=24 gui=NONE guibg=#226622 guifg=#44cc44
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=#000000 guifg=#55ff55
    CSAHi Statement term=bold cterm=bold ctermbg=16 ctermfg=45 gui=bold guibg=#000000 guifg=#55ff55
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=20 gui=NONE guibg=#000000 guifg=#339933
    CSAHi Type term=underline cterm=bold ctermbg=16 ctermfg=45 gui=bold guibg=#000000 guifg=#55ff55
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=20 ctermfg=24 gui=NONE guibg=#226622 guifg=#44cc44
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=20 ctermfg=45 gui=NONE guibg=#226622 guifg=#55ff55
    CSAHi DiffChange term=bold cterm=NONE ctermbg=20 ctermfg=45 gui=NONE guibg=#226622 guifg=#55ff55
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#113311 guifg=#113311
    CSAHi DiffText term=reverse cterm=bold ctermbg=20 ctermfg=45 gui=bold guibg=#339933 guifg=#55ff55
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
