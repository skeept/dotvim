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
    CSAHi Normal term=NONE cterm=NONE ctermbg=95 ctermfg=145 gui=NONE guibg=#514c44 guifg=#b0a594
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=231 gui=underline guibg=bg guifg=#ffffff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=fg
    CSAHi Error term=reverse cterm=NONE ctermbg=95 ctermfg=203 gui=NONE guibg=bg guifg=#ff4c4a
    CSAHi Todo term=NONE cterm=NONE ctermbg=124 ctermfg=226 gui=NONE guibg=#aa0006 guifg=#fff300
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=102 gui=bold guibg=bg guifg=#61616d
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=#880000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=230 ctermfg=16 gui=reverse guibg=#000000 guifg=#fff0d6
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=#00ff00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=227 gui=NONE guibg=#000000 guifg=#ffff21
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=145 ctermfg=95 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=145 ctermfg=95 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=95 gui=NONE guibg=#ffffff guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=195 ctermfg=16 gui=reverse,bold guibg=#000000 guifg=#deefff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=146 ctermfg=66 gui=reverse guibg=#395956 guifg=#a4b1bd
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=146 ctermfg=66 gui=reverse guibg=#395956 guifg=#a4b1bd
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi Visual term=reverse cterm=NONE ctermbg=16 ctermfg=230 gui=NONE guibg=#000000 guifg=#fff0d6
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=95 ctermfg=253 gui=bold,underline guibg=bg guifg=#dddddd
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=248 ctermfg=152 gui=NONE guibg=DarkGrey guifg=#88c0c7
    CSAHi lCursor term=NONE cterm=NONE ctermbg=145 ctermfg=95 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#1a1813
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#cefece
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#eeffee
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#cc7c3d
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=230 gui=bold guibg=bg guifg=#effec5
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#85ff85
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=#c6feeb
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=152 gui=NONE guibg=Grey guifg=#88c0c7
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=145 ctermfg=95 gui=NONE guibg=#9e9485 guifg=bg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=102 ctermfg=145 gui=NONE guibg=#70695e guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=59 ctermfg=145 gui=bold guibg=#2e2b26 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=102 ctermfg=124 gui=bold guibg=#70695e guifg=#880000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=102 ctermfg=187 gui=NONE guibg=#514c44 guifg=#b0a594
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=255 gui=underline guibg=bg guifg=#ffffff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=fg
    CSAHi Error term=reverse cterm=NONE ctermbg=102 ctermfg=210 gui=NONE guibg=bg guifg=#ff4c4a
    CSAHi Todo term=NONE cterm=NONE ctermbg=160 ctermfg=226 gui=NONE guibg=#aa0006 guifg=#fff300
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#ffffff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=103 gui=bold guibg=bg guifg=#61616d
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#ffffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=255 gui=NONE guibg=#880000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=#000000 guifg=#fff0d6
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=#00ff00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#ffffff
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=227 gui=NONE guibg=#000000 guifg=#ffff21
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=187 ctermfg=102 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=187 ctermfg=102 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=255 ctermfg=102 gui=NONE guibg=#ffffff guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=231 ctermfg=16 gui=reverse,bold guibg=#000000 guifg=#deefff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=66 gui=reverse guibg=#395956 guifg=#a4b1bd
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=66 gui=reverse guibg=#395956 guifg=#a4b1bd
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#ffffff
    CSAHi Visual term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#fff0d6
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=102 ctermfg=253 gui=bold,underline guibg=bg guifg=#dddddd
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=248 ctermfg=159 gui=NONE guibg=DarkGrey guifg=#88c0c7
    CSAHi lCursor term=NONE cterm=NONE ctermbg=187 ctermfg=102 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#1a1813
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#cefece
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeffee
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#cc7c3d
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#effec5
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#85ff85
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#c6feeb
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=159 gui=NONE guibg=Grey guifg=#88c0c7
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=181 ctermfg=102 gui=NONE guibg=#9e9485 guifg=bg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=138 ctermfg=187 gui=NONE guibg=#70695e guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=59 ctermfg=187 gui=bold guibg=#2e2b26 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=138 ctermfg=124 gui=bold guibg=#70695e guifg=#880000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=144 gui=NONE guibg=#514c44 guifg=#b0a594
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=231 gui=underline guibg=bg guifg=#ffffff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=fg
    CSAHi Error term=reverse cterm=NONE ctermbg=59 ctermfg=203 gui=NONE guibg=bg guifg=#ff4c4a
    CSAHi Todo term=NONE cterm=NONE ctermbg=124 ctermfg=226 gui=NONE guibg=#aa0006 guifg=#fff300
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=59 gui=bold guibg=bg guifg=#61616d
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=#880000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=230 ctermfg=16 gui=reverse guibg=#000000 guifg=#fff0d6
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=#00ff00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=#000000 guifg=#ffff21
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=144 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=144 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=NONE guibg=#ffffff guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=195 ctermfg=16 gui=reverse,bold guibg=#000000 guifg=#deefff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=145 ctermfg=59 gui=reverse guibg=#395956 guifg=#a4b1bd
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=145 ctermfg=59 gui=reverse guibg=#395956 guifg=#a4b1bd
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi Visual term=reverse cterm=NONE ctermbg=16 ctermfg=230 gui=NONE guibg=#000000 guifg=#fff0d6
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=59 ctermfg=253 gui=bold,underline guibg=bg guifg=#dddddd
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=248 ctermfg=110 gui=NONE guibg=DarkGrey guifg=#88c0c7
    CSAHi lCursor term=NONE cterm=NONE ctermbg=144 ctermfg=59 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#1a1813
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#cefece
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#eeffee
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#cc7c3d
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=230 gui=bold guibg=bg guifg=#effec5
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=#85ff85
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=194 gui=bold guibg=bg guifg=#c6feeb
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=110 gui=NONE guibg=Grey guifg=#88c0c7
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=138 ctermfg=59 gui=NONE guibg=#9e9485 guifg=bg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=144 gui=NONE guibg=#70695e guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=144 gui=bold guibg=#2e2b26 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=59 ctermfg=88 gui=bold guibg=#70695e guifg=#880000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=36 ctermfg=53 gui=NONE guibg=#514c44 guifg=#b0a594
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=79 gui=underline guibg=bg guifg=#ffffff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=fg
    CSAHi Error term=reverse cterm=NONE ctermbg=36 ctermfg=69 gui=NONE guibg=bg guifg=#ff4c4a
    CSAHi Todo term=NONE cterm=NONE ctermbg=32 ctermfg=76 gui=NONE guibg=#aa0006 guifg=#fff300
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=37 gui=bold guibg=bg guifg=#61616d
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=#880000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=78 ctermfg=16 gui=reverse guibg=#000000 guifg=#fff0d6
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=#00ff00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#ffffff
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=76 gui=NONE guibg=#000000 guifg=#ffff21
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=53 ctermfg=36 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=53 ctermfg=36 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=79 ctermfg=36 gui=NONE guibg=#ffffff guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=#ffff00
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=63 ctermfg=16 gui=reverse,bold guibg=#000000 guifg=#deefff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=42 ctermfg=21 gui=reverse guibg=#395956 guifg=#a4b1bd
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=42 ctermfg=21 gui=reverse guibg=#395956 guifg=#a4b1bd
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#ffffff
    CSAHi Visual term=reverse cterm=NONE ctermbg=16 ctermfg=78 gui=NONE guibg=#000000 guifg=#fff0d6
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=36 ctermfg=87 gui=bold,underline guibg=bg guifg=#dddddd
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#ffff00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=84 ctermfg=42 gui=NONE guibg=DarkGrey guifg=#88c0c7
    CSAHi lCursor term=NONE cterm=NONE ctermbg=53 ctermfg=36 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#1a1813
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=62 gui=NONE guibg=bg guifg=#cefece
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#eeffee
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#cc7c3d
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=78 gui=bold guibg=bg guifg=#effec5
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#85ff85
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=63 gui=bold guibg=bg guifg=#c6feeb
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=42 gui=NONE guibg=Grey guifg=#88c0c7
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=37 ctermfg=36 gui=NONE guibg=#9e9485 guifg=bg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=37 ctermfg=53 gui=NONE guibg=#70695e guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=80 ctermfg=53 gui=bold guibg=#2e2b26 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=37 ctermfg=32 gui=bold guibg=#70695e guifg=#880000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
