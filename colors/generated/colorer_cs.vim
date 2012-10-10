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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=248 gui=NONE guibg=black guifg=DarkGray
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=darkRed guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=136 ctermfg=16 gui=NONE guibg=#AD5500 guifg=Black
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=DarkGray
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=131 gui=NONE guibg=bg guifg=Brown
    CSAHi PerlPOD term=NONE cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#B86A18
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=201 gui=NONE guibg=bg guifg=Magenta
    CSAHi SpellErrors term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=Black
    CSAHi MailQ term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=black guifg=fg
    CSAHi MailQu term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=black guifg=fg
    CSAHi MyDiffNew term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red
    CSAHi MyDiffCommLine term=NONE cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=darkred guifg=white
    CSAHi MyDiffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Charachter term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=gray guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=201 gui=NONE guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=black guifg=DarkCyan
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=19 ctermfg=248 gui=NONE guibg=DarkBlue guifg=DarkGray
    CSAHi Done term=NONE cterm=NONE ctermbg=250 ctermfg=231 gui=NONE guibg=Gray guifg=White
    CSAHi lCursor term=NONE cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#B46918
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green
    CSAHi MyDiffSubName term=NONE cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=Cyan
    CSAHi MyDiffNormal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=White guifg=black
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=153 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=37 ctermfg=21 gui=NONE guibg=DarkCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=196 ctermfg=fg gui=NONE guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=248 gui=NONE guibg=black guifg=DarkGray
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=124 ctermfg=255 gui=NONE guibg=darkRed guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=172 ctermfg=16 gui=NONE guibg=#AD5500 guifg=Black
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=White
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=DarkGray
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=White
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=Brown
    CSAHi PerlPOD term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#B86A18
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=201 gui=NONE guibg=bg guifg=Magenta
    CSAHi SpellErrors term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=Black
    CSAHi MailQ term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=black guifg=fg
    CSAHi MailQu term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=black guifg=fg
    CSAHi MyDiffNew term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red
    CSAHi MyDiffCommLine term=NONE cterm=NONE ctermbg=124 ctermfg=255 gui=NONE guibg=darkred guifg=white
    CSAHi MyDiffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Charachter term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=White
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=White
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=White
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=White
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=White
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=gray guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=201 gui=NONE guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=black guifg=DarkCyan
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=19 ctermfg=248 gui=NONE guibg=DarkBlue guifg=DarkGray
    CSAHi Done term=NONE cterm=NONE ctermbg=250 ctermfg=255 gui=NONE guibg=Gray guifg=White
    CSAHi lCursor term=NONE cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#B46918
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=White
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=White
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green
    CSAHi MyDiffSubName term=NONE cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=Cyan
    CSAHi MyDiffNormal term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=White guifg=black
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=37 ctermfg=21 gui=NONE guibg=DarkCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=196 ctermfg=fg gui=NONE guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=248 gui=NONE guibg=black guifg=DarkGray
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=darkRed guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=130 ctermfg=16 gui=NONE guibg=#AD5500 guifg=Black
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=DarkGray
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=Brown
    CSAHi PerlPOD term=NONE cterm=NONE ctermbg=bg ctermfg=130 gui=NONE guibg=bg guifg=#B86A18
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=201 gui=NONE guibg=bg guifg=Magenta
    CSAHi SpellErrors term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=Black
    CSAHi MailQ term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=black guifg=fg
    CSAHi MailQu term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=black guifg=fg
    CSAHi MyDiffNew term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red
    CSAHi MyDiffCommLine term=NONE cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=darkred guifg=white
    CSAHi MyDiffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Charachter term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=gray guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=201 gui=NONE guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=16 ctermfg=30 gui=NONE guibg=black guifg=DarkCyan
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=18 ctermfg=248 gui=NONE guibg=DarkBlue guifg=DarkGray
    CSAHi Done term=NONE cterm=NONE ctermbg=250 ctermfg=231 gui=NONE guibg=Gray guifg=White
    CSAHi lCursor term=NONE cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=130 gui=NONE guibg=bg guifg=#B46918
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=White
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=Green
    CSAHi MyDiffSubName term=NONE cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=Cyan
    CSAHi MyDiffNormal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=White guifg=black
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=152 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=30 ctermfg=21 gui=NONE guibg=DarkCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=196 ctermfg=fg gui=NONE guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=84 gui=NONE guibg=black guifg=DarkGray
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=darkRed guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=52 ctermfg=16 gui=NONE guibg=#AD5500 guifg=Black
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=Yellow
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=White
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=DarkGray
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=White
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=84 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=Brown
    CSAHi PerlPOD term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#B86A18
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=Magenta
    CSAHi SpellErrors term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=Black
    CSAHi MailQ term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=black guifg=fg
    CSAHi MailQu term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=black guifg=fg
    CSAHi MyDiffNew term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=red
    CSAHi MyDiffCommLine term=NONE cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=darkred guifg=white
    CSAHi MyDiffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=red
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=84 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=84 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=84 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Charachter term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=Yellow
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=White
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=White
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=White
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=White
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=White
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=Green
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=85 ctermfg=16 gui=NONE guibg=gray guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=84 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=84 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=black guifg=DarkCyan
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=17 ctermfg=84 gui=NONE guibg=DarkBlue guifg=DarkGray
    CSAHi Done term=NONE cterm=NONE ctermbg=85 ctermfg=79 gui=NONE guibg=Gray guifg=White
    CSAHi lCursor term=NONE cterm=NONE ctermbg=84 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#B46918
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=White
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=Green
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=White
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=Green
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=Green
    CSAHi MyDiffSubName term=NONE cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=Cyan
    CSAHi MyDiffNormal term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=White guifg=black
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=21 ctermfg=19 gui=NONE guibg=DarkCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=64 ctermfg=fg gui=NONE guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
