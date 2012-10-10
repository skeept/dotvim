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
    CSAHi Normal term=NONE cterm=NONE ctermbg=23 ctermfg=194 gui=NONE guibg=#103040 guifg=honeydew2
    CSAHi Underlined term=underline cterm=underline ctermbg=23 ctermfg=145 gui=underline guibg=bg guifg=honeydew4
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#204050
    CSAHi Error term=reverse cterm=NONE ctermbg=131 ctermfg=230 gui=NONE guibg=FireBrick guifg=LightYellow
    CSAHi Todo term=NONE cterm=NONE ctermbg=103 ctermfg=51 gui=NONE guibg=#507080 guifg=Cyan
    CSAHi Number term=NONE cterm=NONE ctermbg=23 ctermfg=51 gui=NONE guibg=bg guifg=Cyan
    CSAHi Boolean term=NONE cterm=bold ctermbg=23 ctermfg=51 gui=bold guibg=bg guifg=Cyan
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=23 ctermfg=66 gui=NONE guibg=#123A4A guifg=#426272
    CSAHi NonText term=bold cterm=NONE ctermbg=233 ctermfg=135 gui=NONE guibg=grey6 guifg=Purple
    CSAHi Directory term=bold cterm=NONE ctermbg=23 ctermfg=73 gui=NONE guibg=bg guifg=LightSeaGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=131 ctermfg=230 gui=NONE guibg=FireBrick guifg=LightYellow
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=194 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=97 ctermfg=fg gui=NONE guibg=Purple4 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=23 ctermfg=72 gui=bold guibg=bg guifg=SeaGreen4
    CSAHi ModeMsg term=bold cterm=bold ctermbg=28 ctermfg=157 gui=bold guibg=DarkGreen guifg=LightGreen
    CSAHi LineNr term=underline cterm=bold ctermbg=233 ctermfg=98 gui=bold guibg=grey6 guifg=Purple3
    CSAHi CursorIM term=NONE cterm=bold ctermbg=46 ctermfg=231 gui=bold guibg=Green1 guifg=white
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=194 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=194 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=231 gui=NONE guibg=Green guifg=White
    CSAHi Conditional term=NONE cterm=NONE ctermbg=23 ctermfg=157 gui=NONE guibg=bg guifg=LightGreen
    CSAHi Repeat term=NONE cterm=NONE ctermbg=23 ctermfg=121 gui=NONE guibg=bg guifg=SeaGreen2
    CSAHi Operator term=NONE cterm=NONE ctermbg=23 ctermfg=118 gui=NONE guibg=bg guifg=Chartreuse
    CSAHi Keyword term=NONE cterm=bold ctermbg=23 ctermfg=157 gui=bold guibg=bg guifg=LightGreen
    CSAHi Exception term=NONE cterm=bold ctermbg=23 ctermfg=157 gui=bold guibg=bg guifg=LightGreen
    CSAHi Question term=NONE cterm=bold ctermbg=23 ctermfg=121 gui=bold guibg=bg guifg=SeaGreen2
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=254 ctermfg=16 gui=bold guibg=grey88 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=145 ctermfg=234 gui=NONE guibg=grey60 guifg=grey10
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=grey60 guifg=black
    CSAHi Title term=bold cterm=bold ctermbg=23 ctermfg=177 gui=bold guibg=bg guifg=MediumOrchid1
    CSAHi Visual term=reverse cterm=NONE ctermbg=72 ctermfg=231 gui=reverse guibg=WHITE guifg=SeaGreen
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=23 ctermfg=194 gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=23 ctermfg=203 gui=bold guibg=bg guifg=FireBrick1
    CSAHi WildMenu term=NONE cterm=bold ctermbg=118 ctermfg=16 gui=bold guibg=Chartreuse guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=66 ctermfg=152 gui=bold guibg=#305060 guifg=#b0d0e0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=194 ctermfg=23 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=103 ctermfg=23 gui=reverse guibg=bg guifg=#507080
    CSAHi Constant term=underline cterm=NONE ctermbg=23 ctermfg=51 gui=NONE guibg=bg guifg=Cyan
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=White
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=orchid1
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=LightGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=147 gui=NONE guibg=bg guifg=MediumPurple1
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=LightBlue
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=66 ctermfg=152 gui=bold guibg=#305060 guifg=#b0d0e0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=37 ctermfg=194 gui=NONE guibg=DarkCyan guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=34 ctermfg=194 gui=NONE guibg=Green4 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=194 gui=NONE guibg=black guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=23 ctermfg=194 gui=bold guibg=bg guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=24 ctermfg=231 gui=NONE guibg=#103040 guifg=honeydew2
    CSAHi Underlined term=underline cterm=underline ctermbg=24 ctermfg=145 gui=underline guibg=bg guifg=honeydew4
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=#204050
    CSAHi Error term=reverse cterm=NONE ctermbg=167 ctermfg=231 gui=NONE guibg=FireBrick guifg=LightYellow
    CSAHi Todo term=NONE cterm=NONE ctermbg=109 ctermfg=51 gui=NONE guibg=#507080 guifg=Cyan
    CSAHi Number term=NONE cterm=NONE ctermbg=24 ctermfg=51 gui=NONE guibg=bg guifg=Cyan
    CSAHi Boolean term=NONE cterm=bold ctermbg=24 ctermfg=51 gui=bold guibg=bg guifg=Cyan
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=24 ctermfg=103 gui=NONE guibg=#123A4A guifg=#426272
    CSAHi NonText term=bold cterm=NONE ctermbg=233 ctermfg=171 gui=NONE guibg=grey6 guifg=Purple
    CSAHi Directory term=bold cterm=NONE ctermbg=24 ctermfg=80 gui=NONE guibg=bg guifg=LightSeaGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=167 ctermfg=231 gui=NONE guibg=FireBrick guifg=LightYellow
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=24 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=97 ctermfg=fg gui=NONE guibg=Purple4 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=24 ctermfg=72 gui=bold guibg=bg guifg=SeaGreen4
    CSAHi ModeMsg term=bold cterm=bold ctermbg=28 ctermfg=157 gui=bold guibg=DarkGreen guifg=LightGreen
    CSAHi LineNr term=underline cterm=bold ctermbg=233 ctermfg=135 gui=bold guibg=grey6 guifg=Purple3
    CSAHi CursorIM term=NONE cterm=bold ctermbg=46 ctermfg=255 gui=bold guibg=Green1 guifg=white
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=24 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=24 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=255 gui=NONE guibg=Green guifg=White
    CSAHi Conditional term=NONE cterm=NONE ctermbg=24 ctermfg=157 gui=NONE guibg=bg guifg=LightGreen
    CSAHi Repeat term=NONE cterm=NONE ctermbg=24 ctermfg=121 gui=NONE guibg=bg guifg=SeaGreen2
    CSAHi Operator term=NONE cterm=NONE ctermbg=24 ctermfg=154 gui=NONE guibg=bg guifg=Chartreuse
    CSAHi Keyword term=NONE cterm=bold ctermbg=24 ctermfg=157 gui=bold guibg=bg guifg=LightGreen
    CSAHi Exception term=NONE cterm=bold ctermbg=24 ctermfg=157 gui=bold guibg=bg guifg=LightGreen
    CSAHi Question term=NONE cterm=bold ctermbg=24 ctermfg=121 gui=bold guibg=bg guifg=SeaGreen2
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=254 ctermfg=16 gui=bold guibg=grey88 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=246 ctermfg=234 gui=NONE guibg=grey60 guifg=grey10
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=grey60 guifg=black
    CSAHi Title term=bold cterm=bold ctermbg=24 ctermfg=213 gui=bold guibg=bg guifg=MediumOrchid1
    CSAHi Visual term=reverse cterm=NONE ctermbg=72 ctermfg=255 gui=reverse guibg=WHITE guifg=SeaGreen
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=24 ctermfg=231 gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=24 ctermfg=203 gui=bold guibg=bg guifg=FireBrick1
    CSAHi WildMenu term=NONE cterm=bold ctermbg=154 ctermfg=16 gui=bold guibg=Chartreuse guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=66 ctermfg=195 gui=bold guibg=#305060 guifg=#b0d0e0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=24 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=109 ctermfg=24 gui=reverse guibg=bg guifg=#507080
    CSAHi Constant term=underline cterm=NONE ctermbg=24 ctermfg=51 gui=NONE guibg=bg guifg=Cyan
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=White
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=orchid1
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=LightGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=183 gui=NONE guibg=bg guifg=MediumPurple1
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=LightBlue
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=66 ctermfg=195 gui=bold guibg=#305060 guifg=#b0d0e0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=37 ctermfg=231 gui=NONE guibg=DarkCyan guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=34 ctermfg=231 gui=NONE guibg=Green4 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=black guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=24 ctermfg=231 gui=bold guibg=bg guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=23 ctermfg=194 gui=NONE guibg=#103040 guifg=honeydew2
    CSAHi Underlined term=underline cterm=underline ctermbg=23 ctermfg=102 gui=underline guibg=bg guifg=honeydew4
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#204050
    CSAHi Error term=reverse cterm=NONE ctermbg=124 ctermfg=230 gui=NONE guibg=FireBrick guifg=LightYellow
    CSAHi Todo term=NONE cterm=NONE ctermbg=60 ctermfg=51 gui=NONE guibg=#507080 guifg=Cyan
    CSAHi Number term=NONE cterm=NONE ctermbg=23 ctermfg=51 gui=NONE guibg=bg guifg=Cyan
    CSAHi Boolean term=NONE cterm=bold ctermbg=23 ctermfg=51 gui=bold guibg=bg guifg=Cyan
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=23 ctermfg=59 gui=NONE guibg=#123A4A guifg=#426272
    CSAHi NonText term=bold cterm=NONE ctermbg=233 ctermfg=129 gui=NONE guibg=grey6 guifg=Purple
    CSAHi Directory term=bold cterm=NONE ctermbg=23 ctermfg=37 gui=NONE guibg=bg guifg=LightSeaGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=230 gui=NONE guibg=FireBrick guifg=LightYellow
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=194 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=54 ctermfg=fg gui=NONE guibg=Purple4 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=23 ctermfg=29 gui=bold guibg=bg guifg=SeaGreen4
    CSAHi ModeMsg term=bold cterm=bold ctermbg=22 ctermfg=120 gui=bold guibg=DarkGreen guifg=LightGreen
    CSAHi LineNr term=underline cterm=bold ctermbg=233 ctermfg=92 gui=bold guibg=grey6 guifg=Purple3
    CSAHi CursorIM term=NONE cterm=bold ctermbg=46 ctermfg=231 gui=bold guibg=Green1 guifg=white
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=194 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=194 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=231 gui=NONE guibg=Green guifg=White
    CSAHi Conditional term=NONE cterm=NONE ctermbg=23 ctermfg=120 gui=NONE guibg=bg guifg=LightGreen
    CSAHi Repeat term=NONE cterm=NONE ctermbg=23 ctermfg=84 gui=NONE guibg=bg guifg=SeaGreen2
    CSAHi Operator term=NONE cterm=NONE ctermbg=23 ctermfg=118 gui=NONE guibg=bg guifg=Chartreuse
    CSAHi Keyword term=NONE cterm=bold ctermbg=23 ctermfg=120 gui=bold guibg=bg guifg=LightGreen
    CSAHi Exception term=NONE cterm=bold ctermbg=23 ctermfg=120 gui=bold guibg=bg guifg=LightGreen
    CSAHi Question term=NONE cterm=bold ctermbg=23 ctermfg=84 gui=bold guibg=bg guifg=SeaGreen2
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=254 ctermfg=16 gui=bold guibg=grey88 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=246 ctermfg=234 gui=NONE guibg=grey60 guifg=grey10
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=grey60 guifg=black
    CSAHi Title term=bold cterm=bold ctermbg=23 ctermfg=171 gui=bold guibg=bg guifg=MediumOrchid1
    CSAHi Visual term=reverse cterm=NONE ctermbg=29 ctermfg=231 gui=reverse guibg=WHITE guifg=SeaGreen
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=23 ctermfg=194 gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=23 ctermfg=203 gui=bold guibg=bg guifg=FireBrick1
    CSAHi WildMenu term=NONE cterm=bold ctermbg=118 ctermfg=16 gui=bold guibg=Chartreuse guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=59 ctermfg=152 gui=bold guibg=#305060 guifg=#b0d0e0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=194 ctermfg=23 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=60 ctermfg=23 gui=reverse guibg=bg guifg=#507080
    CSAHi Constant term=underline cterm=NONE ctermbg=23 ctermfg=51 gui=NONE guibg=bg guifg=Cyan
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=White
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=213 gui=NONE guibg=bg guifg=orchid1
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=LightGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=141 gui=NONE guibg=bg guifg=MediumPurple1
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=LightBlue
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=59 ctermfg=152 gui=bold guibg=#305060 guifg=#b0d0e0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=30 ctermfg=194 gui=NONE guibg=DarkCyan guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=28 ctermfg=194 gui=NONE guibg=Green4 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=194 gui=NONE guibg=black guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=23 ctermfg=194 gui=bold guibg=bg guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=#103040 guifg=honeydew2
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=83 gui=underline guibg=bg guifg=honeydew4
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=#204050
    CSAHi Error term=reverse cterm=NONE ctermbg=48 ctermfg=78 gui=NONE guibg=FireBrick guifg=LightYellow
    CSAHi Todo term=NONE cterm=NONE ctermbg=37 ctermfg=31 gui=NONE guibg=#507080 guifg=Cyan
    CSAHi Number term=NONE cterm=NONE ctermbg=16 ctermfg=31 gui=NONE guibg=bg guifg=Cyan
    CSAHi Boolean term=NONE cterm=bold ctermbg=16 ctermfg=31 gui=bold guibg=bg guifg=Cyan
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=17 ctermfg=21 gui=NONE guibg=#123A4A guifg=#426272
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=35 gui=NONE guibg=grey6 guifg=Purple
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=25 gui=NONE guibg=bg guifg=LightSeaGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=48 ctermfg=78 gui=NONE guibg=FireBrick guifg=LightYellow
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=87 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=33 ctermfg=fg gui=NONE guibg=Purple4 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=21 gui=bold guibg=bg guifg=SeaGreen4
    CSAHi ModeMsg term=bold cterm=bold ctermbg=20 ctermfg=45 gui=bold guibg=DarkGreen guifg=LightGreen
    CSAHi LineNr term=underline cterm=bold ctermbg=16 ctermfg=34 gui=bold guibg=grey6 guifg=Purple3
    CSAHi CursorIM term=NONE cterm=bold ctermbg=28 ctermfg=79 gui=bold guibg=Green1 guifg=white
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=87 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=87 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=28 ctermfg=79 gui=NONE guibg=Green guifg=White
    CSAHi Conditional term=NONE cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=bg guifg=LightGreen
    CSAHi Repeat term=NONE cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=bg guifg=SeaGreen2
    CSAHi Operator term=NONE cterm=NONE ctermbg=16 ctermfg=44 gui=NONE guibg=bg guifg=Chartreuse
    CSAHi Keyword term=NONE cterm=bold ctermbg=16 ctermfg=45 gui=bold guibg=bg guifg=LightGreen
    CSAHi Exception term=NONE cterm=bold ctermbg=16 ctermfg=45 gui=bold guibg=bg guifg=LightGreen
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=45 gui=bold guibg=bg guifg=SeaGreen2
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=87 ctermfg=16 gui=bold guibg=grey88 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=84 ctermfg=80 gui=NONE guibg=grey60 guifg=grey10
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=84 ctermfg=16 gui=NONE guibg=grey60 guifg=black
    CSAHi Title term=bold cterm=bold ctermbg=16 ctermfg=55 gui=bold guibg=bg guifg=MediumOrchid1
    CSAHi Visual term=reverse cterm=NONE ctermbg=21 ctermfg=79 gui=reverse guibg=WHITE guifg=SeaGreen
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=16 ctermfg=87 gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=16 ctermfg=64 gui=bold guibg=bg guifg=FireBrick1
    CSAHi WildMenu term=NONE cterm=bold ctermbg=44 ctermfg=16 gui=bold guibg=Chartreuse guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=21 ctermfg=58 gui=bold guibg=#305060 guifg=#b0d0e0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=87 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=37 ctermfg=16 gui=reverse guibg=bg guifg=#507080
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=31 gui=NONE guibg=bg guifg=Cyan
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=White
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=orchid1
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=LightGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=MediumPurple1
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=LightBlue
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=21 ctermfg=58 gui=bold guibg=#305060 guifg=#b0d0e0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=21 ctermfg=87 gui=NONE guibg=DarkCyan guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=20 ctermfg=87 gui=NONE guibg=Green4 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=black guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=16 ctermfg=87 gui=bold guibg=bg guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
