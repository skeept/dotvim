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
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#f0f0f0 guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=20 gui=underline guibg=bg guifg=#0000cd
    CSAHi Ignore term=NONE cterm=NONE ctermbg=255 ctermfg=255 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=255 ctermfg=203 gui=NONE guibg=bg guifg=#ee2c2c
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=fg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=255 ctermfg=130 gui=NONE guibg=bg guifg=#912f11
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=67 gui=bold guibg=bg guifg=#375288
    CSAHi Directory term=bold cterm=NONE ctermbg=255 ctermfg=21 gui=NONE guibg=bg guifg=#0000f0
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=203 ctermfg=231 gui=bold guibg=#ee2c2c guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=222 ctermfg=fg gui=NONE guibg=#ffcd78 guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=157 ctermfg=fg gui=NONE guibg=#a0f0a0 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=255 ctermfg=60 gui=bold guibg=bg guifg=#2f4471
    CSAHi ModeMsg term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=#375288
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=255 ctermfg=16 gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=255 ctermfg=16 gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=255 ctermfg=16 gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=255 ctermfg=16 gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=110 ctermfg=16 gui=NONE guibg=#708bc5 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=68 ctermfg=16 gui=NONE guibg=#4a6db5 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=152 ctermfg=16 gui=NONE guibg=#a6b7db guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=188 ctermfg=16 gui=underline guibg=#b8c6e2 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=188 ctermfg=16 gui=underline guibg=#b8c6e2 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=253 ctermfg=fg gui=NONE guibg=#d8d8d8 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=253 ctermfg=fg gui=NONE guibg=#d8d8d8 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=130 ctermfg=255 gui=NONE guibg=#883400 guifg=bg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBold term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=255 ctermfg=130 gui=bold guibg=bg guifg=#813f11
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=146 ctermfg=16 gui=bold guibg=#8fa5d1 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=152 ctermfg=16 gui=NONE guibg=#a6b7db guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=152 ctermfg=16 gui=NONE guibg=#a6b7db guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=251 ctermfg=fg gui=NONE guibg=#c4c4c4 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=255 ctermfg=247 gui=bold,underline guibg=bg guifg=#a0a0a0
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=255 ctermfg=203 gui=bold guibg=bg guifg=#ee2c2c
    CSAHi WildMenu term=NONE cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=#ffff00 guifg=fg
    CSAHi Folded term=NONE cterm=bold ctermbg=252 ctermfg=60 gui=bold guibg=#cfcfcf guifg=#25365a
    CSAHi lCursor term=NONE cterm=NONE ctermbg=34 ctermfg=231 gui=NONE guibg=#008000 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=#00ffff guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=255 ctermfg=100 gui=NONE guibg=bg guifg=#786000
    CSAHi Constant term=underline cterm=NONE ctermbg=255 ctermfg=28 gui=NONE guibg=bg guifg=#077807
    CSAHi Special term=bold cterm=NONE ctermbg=255 ctermfg=130 gui=NONE guibg=bg guifg=#912f11
    CSAHi Identifier term=underline cterm=NONE ctermbg=255 ctermfg=31 gui=NONE guibg=bg guifg=#007080
    CSAHi Statement term=bold cterm=bold ctermbg=255 ctermfg=61 gui=bold guibg=bg guifg=#1f3f81
    CSAHi PreProc term=underline cterm=NONE ctermbg=255 ctermfg=127 gui=NONE guibg=bg guifg=#800090
    CSAHi Type term=underline cterm=bold ctermbg=255 ctermfg=130 gui=bold guibg=bg guifg=#912f11
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=67 gui=NONE guibg=bg guifg=#375288
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=34 ctermfg=231 gui=NONE guibg=#008b00 guifg=#ffffff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=19 ctermfg=231 gui=NONE guibg=#00008b guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=#8b0000 guifg=#ffffff
    CSAHi DiffText term=reverse cterm=bold ctermbg=20 ctermfg=231 gui=bold guibg=#0000cd guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=255 ctermfg=67 gui=NONE guibg=bg guifg=#375288
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=203 gui=undercurl guibg=bg guifg=fg guisp=#ee2c2c
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=63 gui=undercurl guibg=bg guifg=fg guisp=#2c2cee
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=207 gui=undercurl guibg=bg guifg=fg guisp=#ee2cee
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=#008b8b
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#f0f0f0 guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=21 gui=underline guibg=bg guifg=#0000cd
    CSAHi Ignore term=NONE cterm=NONE ctermbg=255 ctermfg=255 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=255 ctermfg=203 gui=NONE guibg=bg guifg=#ee2c2c
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=fg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=255 ctermfg=130 gui=NONE guibg=bg guifg=#912f11
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=67 gui=bold guibg=bg guifg=#375288
    CSAHi Directory term=bold cterm=NONE ctermbg=255 ctermfg=21 gui=NONE guibg=bg guifg=#0000f0
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=203 ctermfg=255 gui=bold guibg=#ee2c2c guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=229 ctermfg=fg gui=NONE guibg=#ffcd78 guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#a0f0a0 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=255 ctermfg=67 gui=bold guibg=bg guifg=#2f4471
    CSAHi ModeMsg term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=#375288
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=255 ctermfg=16 gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=255 ctermfg=16 gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=255 ctermfg=16 gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=255 ctermfg=16 gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=147 ctermfg=16 gui=NONE guibg=#708bc5 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=110 ctermfg=16 gui=NONE guibg=#4a6db5 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#a6b7db guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=195 ctermfg=16 gui=underline guibg=#b8c6e2 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=195 ctermfg=16 gui=underline guibg=#b8c6e2 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=253 ctermfg=fg gui=NONE guibg=#d8d8d8 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=253 ctermfg=fg gui=NONE guibg=#d8d8d8 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=130 ctermfg=255 gui=NONE guibg=#883400 guifg=bg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBold term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=255 ctermfg=130 gui=bold guibg=bg guifg=#813f11
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#8fa5d1 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#a6b7db guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#a6b7db guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=251 ctermfg=fg gui=NONE guibg=#c4c4c4 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=255 ctermfg=247 gui=bold,underline guibg=bg guifg=#a0a0a0
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=255 ctermfg=203 gui=bold guibg=bg guifg=#ee2c2c
    CSAHi WildMenu term=NONE cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=#ffff00 guifg=fg
    CSAHi Folded term=NONE cterm=bold ctermbg=252 ctermfg=60 gui=bold guibg=#cfcfcf guifg=#25365a
    CSAHi lCursor term=NONE cterm=NONE ctermbg=34 ctermfg=255 gui=NONE guibg=#008000 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=#00ffff guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=255 ctermfg=136 gui=NONE guibg=bg guifg=#786000
    CSAHi Constant term=underline cterm=NONE ctermbg=255 ctermfg=34 gui=NONE guibg=bg guifg=#077807
    CSAHi Special term=bold cterm=NONE ctermbg=255 ctermfg=130 gui=NONE guibg=bg guifg=#912f11
    CSAHi Identifier term=underline cterm=NONE ctermbg=255 ctermfg=37 gui=NONE guibg=bg guifg=#007080
    CSAHi Statement term=bold cterm=bold ctermbg=255 ctermfg=61 gui=bold guibg=bg guifg=#1f3f81
    CSAHi PreProc term=underline cterm=NONE ctermbg=255 ctermfg=127 gui=NONE guibg=bg guifg=#800090
    CSAHi Type term=underline cterm=bold ctermbg=255 ctermfg=130 gui=bold guibg=bg guifg=#912f11
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=67 gui=NONE guibg=bg guifg=#375288
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=34 ctermfg=255 gui=NONE guibg=#008b00 guifg=#ffffff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=19 ctermfg=255 gui=NONE guibg=#00008b guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=124 ctermfg=255 gui=NONE guibg=#8b0000 guifg=#ffffff
    CSAHi DiffText term=reverse cterm=bold ctermbg=21 ctermfg=255 gui=bold guibg=#0000cd guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=255 ctermfg=67 gui=NONE guibg=bg guifg=#375288
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=203 gui=undercurl guibg=bg guifg=fg guisp=#ee2c2c
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=63 gui=undercurl guibg=bg guifg=fg guisp=#2c2cee
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=207 gui=undercurl guibg=bg guifg=fg guisp=#ee2cee
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=#008b8b
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#f0f0f0 guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=20 gui=underline guibg=bg guifg=#0000cd
    CSAHi Ignore term=NONE cterm=NONE ctermbg=255 ctermfg=255 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=255 ctermfg=196 gui=NONE guibg=bg guifg=#ee2c2c
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=fg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=255 ctermfg=88 gui=NONE guibg=bg guifg=#912f11
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=60 gui=bold guibg=bg guifg=#375288
    CSAHi Directory term=bold cterm=NONE ctermbg=255 ctermfg=21 gui=NONE guibg=bg guifg=#0000f0
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=#ee2c2c guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=222 ctermfg=fg gui=NONE guibg=#ffcd78 guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=157 ctermfg=fg gui=NONE guibg=#a0f0a0 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=255 ctermfg=23 gui=bold guibg=bg guifg=#2f4471
    CSAHi ModeMsg term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#375288
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=255 ctermfg=16 gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=255 ctermfg=16 gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=255 ctermfg=16 gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=255 ctermfg=16 gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=68 ctermfg=16 gui=NONE guibg=#708bc5 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=61 ctermfg=16 gui=NONE guibg=#4a6db5 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=146 ctermfg=16 gui=NONE guibg=#a6b7db guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=152 ctermfg=16 gui=underline guibg=#b8c6e2 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=152 ctermfg=16 gui=underline guibg=#b8c6e2 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=188 ctermfg=fg gui=NONE guibg=#d8d8d8 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=188 ctermfg=fg gui=NONE guibg=#d8d8d8 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=94 ctermfg=255 gui=NONE guibg=#883400 guifg=bg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBold term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=255 ctermfg=94 gui=bold guibg=bg guifg=#813f11
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=110 ctermfg=16 gui=bold guibg=#8fa5d1 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=146 ctermfg=16 gui=NONE guibg=#a6b7db guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=146 ctermfg=16 gui=NONE guibg=#a6b7db guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=251 ctermfg=fg gui=NONE guibg=#c4c4c4 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=255 ctermfg=247 gui=bold,underline guibg=bg guifg=#a0a0a0
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=255 ctermfg=196 gui=bold guibg=bg guifg=#ee2c2c
    CSAHi WildMenu term=NONE cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=#ffff00 guifg=fg
    CSAHi Folded term=NONE cterm=bold ctermbg=252 ctermfg=23 gui=bold guibg=#cfcfcf guifg=#25365a
    CSAHi lCursor term=NONE cterm=NONE ctermbg=28 ctermfg=231 gui=NONE guibg=#008000 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=#00ffff guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=255 ctermfg=94 gui=NONE guibg=bg guifg=#786000
    CSAHi Constant term=underline cterm=NONE ctermbg=255 ctermfg=28 gui=NONE guibg=bg guifg=#077807
    CSAHi Special term=bold cterm=NONE ctermbg=255 ctermfg=88 gui=NONE guibg=bg guifg=#912f11
    CSAHi Identifier term=underline cterm=NONE ctermbg=255 ctermfg=24 gui=NONE guibg=bg guifg=#007080
    CSAHi Statement term=bold cterm=bold ctermbg=255 ctermfg=24 gui=bold guibg=bg guifg=#1f3f81
    CSAHi PreProc term=underline cterm=NONE ctermbg=255 ctermfg=90 gui=NONE guibg=bg guifg=#800090
    CSAHi Type term=underline cterm=bold ctermbg=255 ctermfg=88 gui=bold guibg=bg guifg=#912f11
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=60 gui=NONE guibg=bg guifg=#375288
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=28 ctermfg=231 gui=NONE guibg=#008b00 guifg=#ffffff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=18 ctermfg=231 gui=NONE guibg=#00008b guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=#8b0000 guifg=#ffffff
    CSAHi DiffText term=reverse cterm=bold ctermbg=20 ctermfg=231 gui=bold guibg=#0000cd guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=255 ctermfg=60 gui=NONE guibg=bg guifg=#375288
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ee2c2c
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#2c2cee
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ee2cee
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=#008b8b
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=87 ctermfg=16 gui=NONE guibg=#f0f0f0 guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=87 ctermfg=18 gui=underline guibg=bg guifg=#0000cd
    CSAHi Ignore term=NONE cterm=NONE ctermbg=87 ctermfg=87 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=87 ctermfg=64 gui=NONE guibg=bg guifg=#ee2c2c
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=fg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=87 ctermfg=32 gui=NONE guibg=bg guifg=#912f11
    CSAHi NonText term=bold cterm=bold ctermbg=87 ctermfg=21 gui=bold guibg=bg guifg=#375288
    CSAHi Directory term=bold cterm=NONE ctermbg=87 ctermfg=19 gui=NONE guibg=bg guifg=#0000f0
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=64 ctermfg=79 gui=bold guibg=#ee2c2c guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=73 ctermfg=fg gui=NONE guibg=#ffcd78 guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=45 ctermfg=fg gui=NONE guibg=#a0f0a0 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=87 ctermfg=17 gui=bold guibg=bg guifg=#2f4471
    CSAHi ModeMsg term=bold cterm=bold ctermbg=87 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#375288
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=87 ctermfg=16 gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=87 ctermfg=16 gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=87 ctermfg=16 gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=87 ctermfg=16 gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=87 ctermfg=16 gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=38 ctermfg=16 gui=NONE guibg=#708bc5 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=38 ctermfg=16 gui=NONE guibg=#4a6db5 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=42 ctermfg=16 gui=NONE guibg=#a6b7db guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=58 ctermfg=16 gui=underline guibg=#b8c6e2 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=87 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=58 ctermfg=16 gui=underline guibg=#b8c6e2 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=86 ctermfg=fg gui=NONE guibg=#d8d8d8 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=86 ctermfg=fg gui=NONE guibg=#d8d8d8 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=32 ctermfg=87 gui=NONE guibg=#883400 guifg=bg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=87 ctermfg=16 gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBold term=NONE cterm=bold ctermbg=87 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=87 ctermfg=32 gui=bold guibg=bg guifg=#813f11
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=38 ctermfg=16 gui=bold guibg=#8fa5d1 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=42 ctermfg=16 gui=NONE guibg=#a6b7db guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=42 ctermfg=16 gui=NONE guibg=#a6b7db guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#c4c4c4 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=87 ctermfg=84 gui=bold,underline guibg=bg guifg=#a0a0a0
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=87 ctermfg=64 gui=bold guibg=bg guifg=#ee2c2c
    CSAHi WildMenu term=NONE cterm=bold ctermbg=76 ctermfg=16 gui=bold guibg=#ffff00 guifg=fg
    CSAHi Folded term=NONE cterm=bold ctermbg=86 ctermfg=17 gui=bold guibg=#cfcfcf guifg=#25365a
    CSAHi lCursor term=NONE cterm=NONE ctermbg=20 ctermfg=79 gui=NONE guibg=#008000 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=#00ffff guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=87 ctermfg=36 gui=NONE guibg=bg guifg=#786000
    CSAHi Constant term=underline cterm=NONE ctermbg=87 ctermfg=20 gui=NONE guibg=bg guifg=#077807
    CSAHi Special term=bold cterm=NONE ctermbg=87 ctermfg=32 gui=NONE guibg=bg guifg=#912f11
    CSAHi Identifier term=underline cterm=NONE ctermbg=87 ctermfg=21 gui=NONE guibg=bg guifg=#007080
    CSAHi Statement term=bold cterm=bold ctermbg=87 ctermfg=17 gui=bold guibg=bg guifg=#1f3f81
    CSAHi PreProc term=underline cterm=NONE ctermbg=87 ctermfg=33 gui=NONE guibg=bg guifg=#800090
    CSAHi Type term=underline cterm=bold ctermbg=87 ctermfg=32 gui=bold guibg=bg guifg=#912f11
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=87 ctermfg=21 gui=NONE guibg=bg guifg=#375288
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=20 ctermfg=79 gui=NONE guibg=#008b00 guifg=#ffffff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=#00008b guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=#8b0000 guifg=#ffffff
    CSAHi DiffText term=reverse cterm=bold ctermbg=18 ctermfg=79 gui=bold guibg=#0000cd guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=87 ctermfg=21 gui=NONE guibg=bg guifg=#375288
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ee2c2c
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=#2c2cee
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=#ee2cee
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#008b8b
endif

if 1
    delcommand CSAHi
endif
