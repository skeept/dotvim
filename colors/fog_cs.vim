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
    CSAHi Normal term=NONE cterm=NONE ctermbg=188 ctermfg=90 gui=NONE guibg=grey80 guifg=#660066
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=104 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=grey90
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=reverse guibg=Yellow guifg=Blue
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=188 ctermfg=153 gui=bold guibg=grey80 guifg=LightBlue
    CSAHi Directory term=bold cterm=underline ctermbg=bg ctermfg=196 gui=underline guibg=bg guifg=Red
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=DarkRed guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=90 ctermfg=188 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=137 ctermfg=16 gui=NONE guibg=#887722 guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#ccaa22
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=90 ctermfg=188 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=90 ctermfg=188 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=127 ctermfg=252 gui=NONE guibg=#880088 guifg=LightGrey
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#c06000
    CSAHi Operator term=NONE cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=DarkGreen
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=DarkGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=90 ctermfg=188 gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=90 ctermfg=188 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=90 ctermfg=188 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=underline ctermbg=bg ctermfg=127 gui=underline guibg=bg guifg=DarkMagenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=248 ctermfg=90 gui=reverse guibg=fg guifg=DarkGrey
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=146 ctermfg=19 gui=NONE guibg=#9999cc guifg=DarkBlue
    CSAHi WildMenu term=NONE cterm=underline ctermbg=226 ctermfg=16 gui=underline guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=Cyan guifg=Black
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=61 gui=NONE guibg=bg guifg=#444499
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=103 gui=NONE guibg=bg guifg=#7070a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#aa8822
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=DarkGreen
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=DarkGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#408040
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=DarkBlue
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=132 gui=bold guibg=bg guifg=#a02060
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=bg ctermfg=248 gui=bold guibg=bg guifg=DarkGrey
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=DarkBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=DarkMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=21 gui=bold guibg=DarkCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=124 ctermfg=fg gui=bold guibg=DarkRed guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=252 ctermfg=90 gui=NONE guibg=grey80 guifg=#660066
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=105 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=grey90
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=reverse guibg=Yellow guifg=Blue
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=252 ctermfg=195 gui=bold guibg=grey80 guifg=LightBlue
    CSAHi Directory term=bold cterm=underline ctermbg=bg ctermfg=196 gui=underline guibg=bg guifg=Red
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=255 gui=NONE guibg=DarkRed guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=90 ctermfg=252 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=143 ctermfg=16 gui=NONE guibg=#887722 guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#ccaa22
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=90 ctermfg=252 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=90 ctermfg=252 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=127 ctermfg=231 gui=NONE guibg=#880088 guifg=LightGrey
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#c06000
    CSAHi Operator term=NONE cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=DarkGreen
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=DarkGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=90 ctermfg=252 gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=90 ctermfg=252 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=90 ctermfg=252 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=underline ctermbg=bg ctermfg=127 gui=underline guibg=bg guifg=DarkMagenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=248 ctermfg=90 gui=reverse guibg=fg guifg=DarkGrey
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=189 ctermfg=19 gui=NONE guibg=#9999cc guifg=DarkBlue
    CSAHi WildMenu term=NONE cterm=underline ctermbg=226 ctermfg=16 gui=underline guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=Cyan guifg=Black
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=104 gui=NONE guibg=bg guifg=#444499
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=#7070a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#aa8822
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=DarkGreen
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=DarkGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=108 gui=NONE guibg=bg guifg=#408040
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=DarkBlue
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=168 gui=bold guibg=bg guifg=#a02060
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=bg ctermfg=248 gui=bold guibg=bg guifg=DarkGrey
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=DarkBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=DarkMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=21 gui=bold guibg=DarkCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=124 ctermfg=fg gui=bold guibg=DarkRed guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=252 ctermfg=53 gui=NONE guibg=grey80 guifg=#660066
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=62 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=grey90
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=reverse guibg=Yellow guifg=Blue
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=252 ctermfg=152 gui=bold guibg=grey80 guifg=LightBlue
    CSAHi Directory term=bold cterm=underline ctermbg=bg ctermfg=196 gui=underline guibg=bg guifg=Red
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=DarkRed guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=53 ctermfg=252 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=100 ctermfg=16 gui=NONE guibg=#887722 guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=178 gui=NONE guibg=bg guifg=#ccaa22
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=53 ctermfg=252 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=53 ctermfg=252 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=90 ctermfg=252 gui=NONE guibg=#880088 guifg=LightGrey
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=130 gui=NONE guibg=bg guifg=#c06000
    CSAHi Operator term=NONE cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=DarkGreen
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=DarkGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=53 ctermfg=252 gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=53 ctermfg=252 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=53 ctermfg=252 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=underline ctermbg=bg ctermfg=90 gui=underline guibg=bg guifg=DarkMagenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=248 ctermfg=53 gui=reverse guibg=fg guifg=DarkGrey
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=104 ctermfg=18 gui=NONE guibg=#9999cc guifg=DarkBlue
    CSAHi WildMenu term=NONE cterm=underline ctermbg=226 ctermfg=16 gui=underline guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=18 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=Cyan guifg=Black
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#444499
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=61 gui=NONE guibg=bg guifg=#7070a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=136 gui=NONE guibg=bg guifg=#aa8822
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=DarkGreen
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=DarkGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#408040
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=18 gui=bold guibg=bg guifg=DarkBlue
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=125 gui=bold guibg=bg guifg=#a02060
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=bg ctermfg=248 gui=bold guibg=bg guifg=DarkGrey
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=18 ctermfg=fg gui=NONE guibg=DarkBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=DarkMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=30 ctermfg=21 gui=bold guibg=DarkCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=88 ctermfg=fg gui=bold guibg=DarkRed guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=58 ctermfg=33 gui=NONE guibg=grey80 guifg=#660066
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=grey90
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=19 ctermfg=76 gui=reverse guibg=Yellow guifg=Blue
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=58 ctermfg=58 gui=bold guibg=grey80 guifg=LightBlue
    CSAHi Directory term=bold cterm=underline ctermbg=bg ctermfg=64 gui=underline guibg=bg guifg=Red
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=DarkRed guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=33 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=36 ctermfg=16 gui=NONE guibg=#887722 guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#ccaa22
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=33 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=33 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=33 ctermfg=86 gui=NONE guibg=#880088 guifg=LightGrey
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#c06000
    CSAHi Operator term=NONE cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=DarkGreen
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=DarkGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=33 ctermfg=58 gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=33 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=33 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=underline ctermbg=bg ctermfg=33 gui=underline guibg=bg guifg=DarkMagenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=84 ctermfg=33 gui=reverse guibg=fg guifg=DarkGrey
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=38 ctermfg=17 gui=NONE guibg=#9999cc guifg=DarkBlue
    CSAHi WildMenu term=NONE cterm=underline ctermbg=76 ctermfg=16 gui=underline guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=86 ctermfg=17 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=31 ctermfg=16 gui=NONE guibg=Cyan guifg=Black
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=#444499
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#7070a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#aa8822
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=DarkGreen
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=DarkGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=#408040
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=17 gui=bold guibg=bg guifg=DarkBlue
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=33 gui=bold guibg=bg guifg=#a02060
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=bg ctermfg=84 gui=bold guibg=bg guifg=DarkGrey
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=DarkBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=33 ctermfg=fg gui=NONE guibg=DarkMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=21 ctermfg=19 gui=bold guibg=DarkCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=32 ctermfg=fg gui=bold guibg=DarkRed guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
