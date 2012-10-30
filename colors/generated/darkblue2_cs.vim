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
    CSAHi Normal term=NONE cterm=NONE ctermbg=60 ctermfg=230 gui=NONE guibg=#233b5a guifg=#fff8dc
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=aquamarine
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=aquamarine
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Float term=NONE cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=lightskyblue
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=253 ctermfg=231 gui=bold guibg=gray85 guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=230 ctermfg=60 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=223 ctermfg=60 gui=bold guibg=lightgoldenrod guifg=#233b5a
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=23 ctermfg=152 gui=bold guibg=#132b4a guifg=lightsteelblue
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=230 ctermfg=60 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=230 ctermfg=60 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=226 ctermfg=60 gui=NONE guibg=Yellow guifg=#233b5a
    CSAHi User2 term=NONE cterm=bold ctermbg=23 ctermfg=153 gui=bold guibg=#021a39 guifg=lightskyblue
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=152 gui=bold guibg=bg guifg=lightsteelblue
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=67 ctermfg=252 gui=reverse,bold guibg=lightgray guifg=steelblue4
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=61 ctermfg=152 gui=reverse guibg=lightsteelblue guifg=royalblue4
    CSAHi VertSplit term=reverse cterm=bold ctermbg=188 ctermfg=fg gui=bold guibg=gray80 guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=230 ctermfg=74 gui=NONE guibg=fg guifg=steelblue
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=230 ctermfg=74 gui=bold guibg=fg guifg=steelblue
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=209 ctermfg=231 gui=NONE guibg=Tomato guifg=White
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi Menu term=NONE cterm=NONE ctermbg=60 ctermfg=230 gui=NONE guibg=#233b5a guifg=#fff8dc
    CSAHi lCursor term=NONE cterm=NONE ctermbg=230 ctermfg=60 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=115 gui=italic guibg=bg guifg=mediumaquamarine
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=157 gui=bold guibg=bg guifg=palegreen
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=157 gui=bold guibg=bg guifg=palegreen
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Structure term=NONE cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Typedef term=NONE cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=153 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=195 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=244 ctermfg=fg gui=bold guibg=grey50 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=60 ctermfg=231 gui=NONE guibg=#233b5a guifg=#fff8dc
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=196 ctermfg=255 gui=bold guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=aquamarine
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=aquamarine
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Float term=NONE cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=lightskyblue
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=253 ctermfg=255 gui=bold guibg=gray85 guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=60 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=229 ctermfg=60 gui=bold guibg=lightgoldenrod guifg=#233b5a
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=24 ctermfg=195 gui=bold guibg=#132b4a guifg=lightsteelblue
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=60 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=60 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=226 ctermfg=60 gui=NONE guibg=Yellow guifg=#233b5a
    CSAHi User2 term=NONE cterm=bold ctermbg=23 ctermfg=159 gui=bold guibg=#021a39 guifg=lightskyblue
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=lightsteelblue
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=67 ctermfg=231 gui=reverse,bold guibg=lightgray guifg=steelblue4
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=67 ctermfg=195 gui=reverse guibg=lightsteelblue guifg=royalblue4
    CSAHi VertSplit term=reverse cterm=bold ctermbg=252 ctermfg=fg gui=bold guibg=gray80 guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=231 ctermfg=110 gui=NONE guibg=fg guifg=steelblue
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=231 ctermfg=110 gui=bold guibg=fg guifg=steelblue
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=210 ctermfg=255 gui=NONE guibg=Tomato guifg=White
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi Menu term=NONE cterm=NONE ctermbg=60 ctermfg=231 gui=NONE guibg=#233b5a guifg=#fff8dc
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=60 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=122 gui=italic guibg=bg guifg=mediumaquamarine
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=194 gui=bold guibg=bg guifg=palegreen
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=194 gui=bold guibg=bg guifg=palegreen
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Structure term=NONE cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Typedef term=NONE cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=231 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=145 ctermfg=fg gui=bold guibg=grey50 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=23 ctermfg=230 gui=NONE guibg=#233b5a guifg=#fff8dc
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=aquamarine
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=aquamarine
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Float term=NONE cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=lightskyblue
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=253 ctermfg=231 gui=bold guibg=gray85 guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=230 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=222 ctermfg=23 gui=bold guibg=lightgoldenrod guifg=#233b5a
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=17 ctermfg=152 gui=bold guibg=#132b4a guifg=lightsteelblue
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=230 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=230 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=226 ctermfg=23 gui=NONE guibg=Yellow guifg=#233b5a
    CSAHi User2 term=NONE cterm=bold ctermbg=17 ctermfg=117 gui=bold guibg=#021a39 guifg=lightskyblue
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=152 gui=bold guibg=bg guifg=lightsteelblue
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=60 ctermfg=252 gui=reverse,bold guibg=lightgray guifg=steelblue4
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=24 ctermfg=152 gui=reverse guibg=lightsteelblue guifg=royalblue4
    CSAHi VertSplit term=reverse cterm=bold ctermbg=252 ctermfg=fg gui=bold guibg=gray80 guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=230 ctermfg=67 gui=NONE guibg=fg guifg=steelblue
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=230 ctermfg=67 gui=bold guibg=fg guifg=steelblue
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=203 ctermfg=231 gui=NONE guibg=Tomato guifg=White
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=18 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi Menu term=NONE cterm=NONE ctermbg=23 ctermfg=230 gui=NONE guibg=#233b5a guifg=#fff8dc
    CSAHi lCursor term=NONE cterm=NONE ctermbg=230 ctermfg=23 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=79 gui=italic guibg=bg guifg=mediumaquamarine
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=120 gui=bold guibg=bg guifg=palegreen
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=120 gui=bold guibg=bg guifg=palegreen
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Structure term=NONE cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Typedef term=NONE cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=152 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=195 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=244 ctermfg=fg gui=bold guibg=grey50 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=17 ctermfg=78 gui=NONE guibg=#233b5a guifg=#fff8dc
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=64 ctermfg=79 gui=bold guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=19 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=aquamarine
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=aquamarine
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Float term=NONE cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=lightskyblue
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=31 gui=bold guibg=bg guifg=cyan
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=86 ctermfg=79 gui=bold guibg=gray85 guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=78 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=73 ctermfg=17 gui=bold guibg=lightgoldenrod guifg=#233b5a
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=17 ctermfg=58 gui=bold guibg=#132b4a guifg=lightsteelblue
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=78 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=78 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=76 ctermfg=17 gui=NONE guibg=Yellow guifg=#233b5a
    CSAHi User2 term=NONE cterm=bold ctermbg=16 ctermfg=43 gui=bold guibg=#021a39 guifg=lightskyblue
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=31 gui=bold guibg=bg guifg=cyan
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=31 gui=bold guibg=bg guifg=cyan
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=cyan
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=cyan
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=76 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=58 gui=bold guibg=bg guifg=lightsteelblue
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=21 ctermfg=86 gui=reverse,bold guibg=lightgray guifg=steelblue4
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=17 ctermfg=58 gui=reverse guibg=lightsteelblue guifg=royalblue4
    CSAHi VertSplit term=reverse cterm=bold ctermbg=58 ctermfg=fg gui=bold guibg=gray80 guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=78 ctermfg=38 gui=NONE guibg=fg guifg=steelblue
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=78 ctermfg=38 gui=bold guibg=fg guifg=steelblue
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=69 ctermfg=79 gui=NONE guibg=Tomato guifg=White
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=86 ctermfg=17 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi Menu term=NONE cterm=NONE ctermbg=17 ctermfg=78 gui=NONE guibg=#233b5a guifg=#fff8dc
    CSAHi lCursor term=NONE cterm=NONE ctermbg=78 ctermfg=17 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=41 gui=italic guibg=bg guifg=mediumaquamarine
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=palegreen
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=31 gui=bold guibg=bg guifg=cyan
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=palegreen
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Structure term=NONE cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi Typedef term=NONE cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=lightgoldenrod1
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=63 ctermfg=19 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=82 ctermfg=fg gui=bold guibg=grey50 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
