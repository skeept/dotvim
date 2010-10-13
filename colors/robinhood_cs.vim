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
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=224 gui=NONE guibg=#304020 guifg=wheat
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=lightsalmon
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=lightsalmon
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=lightcyan
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=lightcyan
    CSAHi Float term=NONE cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=lightcyan
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=aquamarine
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=palegreen
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=Red guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=224 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=250 ctermfg=16 gui=bold guibg=gray guifg=black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=58 ctermfg=149 gui=bold guibg=#203010 guifg=yellowgreen
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=palegreen
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=224 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=224 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=250 ctermfg=224 gui=NONE guibg=gray guifg=fg
    CSAHi User2 term=NONE cterm=bold ctermbg=16 ctermfg=149 gui=bold guibg=#091900 guifg=yellowgreen
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=216 gui=bold guibg=bg guifg=salmon
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=216 gui=bold guibg=bg guifg=salmon
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=salmon
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=salmon
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=gray guifg=fg
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=157 gui=bold guibg=bg guifg=palegreen
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=101 ctermfg=224 gui=reverse,bold guibg=wheat guifg=darkolivegreen
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=107 ctermfg=224 gui=reverse guibg=wheat guifg=olivedrab
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=224 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=224 ctermfg=66 gui=NONE guibg=fg guifg=darkslategrey
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=224 ctermfg=16 gui=bold guibg=fg guifg=Black
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=209 ctermfg=231 gui=NONE guibg=Tomato guifg=White
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi Menu term=NONE cterm=NONE ctermbg=59 ctermfg=224 gui=NONE guibg=#304020 guifg=wheat
    CSAHi lCursor term=NONE cterm=NONE ctermbg=224 ctermfg=59 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=lightblue
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=lightcyan
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=157 gui=bold guibg=bg guifg=palegreen
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=216 gui=bold guibg=bg guifg=salmon
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=palegreen
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=149 gui=bold guibg=bg guifg=yellowgreen
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=122 gui=bold guibg=bg guifg=aquamarine
    CSAHi Structure term=NONE cterm=bold ctermbg=bg ctermfg=122 gui=bold guibg=bg guifg=aquamarine
    CSAHi Typedef term=NONE cterm=bold ctermbg=bg ctermfg=122 gui=bold guibg=bg guifg=aquamarine
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=153 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=195 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=65 ctermfg=230 gui=NONE guibg=#304020 guifg=wheat
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=196 ctermfg=255 gui=bold guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=lightsalmon
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=lightsalmon
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=lightcyan
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=lightcyan
    CSAHi Float term=NONE cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=lightcyan
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=aquamarine
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=palegreen
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=255 gui=bold guibg=Red guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=230 ctermfg=65 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=250 ctermfg=16 gui=bold guibg=gray guifg=black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=58 ctermfg=191 gui=bold guibg=#203010 guifg=yellowgreen
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=palegreen
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=65 ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=230 ctermfg=65 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=230 ctermfg=65 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=250 ctermfg=230 gui=NONE guibg=gray guifg=fg
    CSAHi User2 term=NONE cterm=bold ctermbg=22 ctermfg=191 gui=bold guibg=#091900 guifg=yellowgreen
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=217 gui=bold guibg=bg guifg=salmon
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=217 gui=bold guibg=bg guifg=salmon
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=salmon
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=salmon
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=gray guifg=fg
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=194 gui=bold guibg=bg guifg=palegreen
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=107 ctermfg=230 gui=reverse,bold guibg=wheat guifg=darkolivegreen
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=143 ctermfg=230 gui=reverse guibg=wheat guifg=olivedrab
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=230 ctermfg=65 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=230 ctermfg=66 gui=NONE guibg=fg guifg=darkslategrey
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=230 ctermfg=16 gui=bold guibg=fg guifg=Black
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=210 ctermfg=255 gui=NONE guibg=Tomato guifg=White
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi Menu term=NONE cterm=NONE ctermbg=65 ctermfg=230 gui=NONE guibg=#304020 guifg=wheat
    CSAHi lCursor term=NONE cterm=NONE ctermbg=230 ctermfg=65 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=lightblue
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=lightcyan
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=194 gui=bold guibg=bg guifg=palegreen
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=217 gui=bold guibg=bg guifg=salmon
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=palegreen
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=191 gui=bold guibg=bg guifg=yellowgreen
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=159 gui=bold guibg=bg guifg=aquamarine
    CSAHi Structure term=NONE cterm=bold ctermbg=bg ctermfg=159 gui=bold guibg=bg guifg=aquamarine
    CSAHi Typedef term=NONE cterm=bold ctermbg=bg ctermfg=159 gui=bold guibg=bg guifg=aquamarine
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=231 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=58 ctermfg=223 gui=NONE guibg=#304020 guifg=wheat
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=lightsalmon
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=lightsalmon
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=lightcyan
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=lightcyan
    CSAHi Float term=NONE cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=lightcyan
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=aquamarine
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=palegreen
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=Red guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=223 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=250 ctermfg=16 gui=bold guibg=gray guifg=black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=22 ctermfg=113 gui=bold guibg=#203010 guifg=yellowgreen
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=palegreen
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=223 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=223 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=250 ctermfg=223 gui=NONE guibg=gray guifg=fg
    CSAHi User2 term=NONE cterm=bold ctermbg=16 ctermfg=113 gui=bold guibg=#091900 guifg=yellowgreen
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=209 gui=bold guibg=bg guifg=salmon
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=209 gui=bold guibg=bg guifg=salmon
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=salmon
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=salmon
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=gray guifg=fg
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=120 gui=bold guibg=bg guifg=palegreen
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=58 ctermfg=223 gui=reverse,bold guibg=wheat guifg=darkolivegreen
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=64 ctermfg=223 gui=reverse guibg=wheat guifg=olivedrab
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=223 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=223 ctermfg=23 gui=NONE guibg=fg guifg=darkslategrey
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=223 ctermfg=16 gui=bold guibg=fg guifg=Black
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=203 ctermfg=231 gui=NONE guibg=Tomato guifg=White
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=18 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi Menu term=NONE cterm=NONE ctermbg=58 ctermfg=223 gui=NONE guibg=#304020 guifg=wheat
    CSAHi lCursor term=NONE cterm=NONE ctermbg=223 ctermfg=58 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=lightblue
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=lightcyan
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=120 gui=bold guibg=bg guifg=palegreen
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=209 gui=bold guibg=bg guifg=salmon
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=palegreen
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=113 gui=bold guibg=bg guifg=yellowgreen
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=122 gui=bold guibg=bg guifg=aquamarine
    CSAHi Structure term=NONE cterm=bold ctermbg=bg ctermfg=122 gui=bold guibg=bg guifg=aquamarine
    CSAHi Typedef term=NONE cterm=bold ctermbg=bg ctermfg=122 gui=bold guibg=bg guifg=aquamarine
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=152 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=195 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=74 gui=NONE guibg=#304020 guifg=wheat
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=64 ctermfg=79 gui=bold guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=19 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=lightsalmon
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=lightsalmon
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=63 gui=bold guibg=bg guifg=lightcyan
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=63 gui=bold guibg=bg guifg=lightcyan
    CSAHi Float term=NONE cterm=bold ctermbg=bg ctermfg=63 gui=bold guibg=bg guifg=lightcyan
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=aquamarine
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=palegreen
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=64 ctermfg=79 gui=bold guibg=Red guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=74 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=85 ctermfg=16 gui=bold guibg=gray guifg=black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=16 ctermfg=40 gui=bold guibg=#203010 guifg=yellowgreen
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=palegreen
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=74 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=74 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=85 ctermfg=74 gui=NONE guibg=gray guifg=fg
    CSAHi User2 term=NONE cterm=bold ctermbg=16 ctermfg=40 gui=bold guibg=#091900 guifg=yellowgreen
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=salmon
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=salmon
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=salmon
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=salmon
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=gray guifg=fg
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=palegreen
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=36 ctermfg=74 gui=reverse,bold guibg=wheat guifg=darkolivegreen
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=36 ctermfg=74 gui=reverse guibg=wheat guifg=olivedrab
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=74 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=74 ctermfg=21 gui=NONE guibg=fg guifg=darkslategrey
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=74 ctermfg=16 gui=bold guibg=fg guifg=Black
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=69 ctermfg=79 gui=NONE guibg=Tomato guifg=White
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=86 ctermfg=17 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi Menu term=NONE cterm=NONE ctermbg=80 ctermfg=74 gui=NONE guibg=#304020 guifg=wheat
    CSAHi lCursor term=NONE cterm=NONE ctermbg=74 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=lightblue
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=63 gui=bold guibg=bg guifg=lightcyan
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=palegreen
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=salmon
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=palegreen
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=40 gui=bold guibg=bg guifg=yellowgreen
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=aquamarine
    CSAHi Structure term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=aquamarine
    CSAHi Typedef term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=aquamarine
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
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
