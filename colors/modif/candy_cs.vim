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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#f0f0f8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=231 gui=underline guibg=bg guifg=#f0f0f8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Error term=reverse cterm=bold ctermbg=199 ctermfg=231 gui=bold guibg=#ff0088 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=217 gui=bold,underline guibg=bg guifg=#ffa0a0
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=147 gui=bold guibg=bg guifg=#8080ff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=75 gui=bold guibg=bg guifg=#4080ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=#40f0d0
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi IncSearch term=reverse cterm=underline ctermbg=32 ctermfg=159 gui=underline guibg=#0060c0 guifg=#80ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=32 ctermfg=231 gui=NONE guibg=#0060c0 guifg=#f0f0f8
    CSAHi MoreMsg term=bold cterm=bold ctermbg=36 ctermfg=51 gui=bold guibg=#008070 guifg=#00ffff
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=86 gui=bold guibg=bg guifg=#40f0d0
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#9090a0
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=36 ctermfg=51 gui=NONE guibg=#008070 guifg=#00ffff
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=129 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#c8c8d8 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=103 gui=NONE guibg=#c8c8d8 guifg=#707080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=103 gui=NONE guibg=#c8c8d8 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f0f0f8
    CSAHi Visual term=reverse cterm=NONE ctermbg=103 ctermfg=189 gui=NONE guibg=#707080 guifg=#e0e0f0
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=147 ctermfg=16 gui=NONE guibg=#a0a0ff guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=31 ctermfg=87 gui=NONE guibg=#005080 guifg=#40f0f0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=129 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#c0c0d0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#90d0ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#e0e080
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#40f0f0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffa0ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#40f0a0
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#ffc864
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=24 ctermfg=81 gui=NONE guibg=#00305c guifg=#40c0ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=25 ctermfg=153 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=89 ctermfg=168 gui=NONE guibg=#601830 guifg=#e03870
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=25 ctermfg=153 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=132 ctermfg=213 gui=NONE guibg=#a02860 guifg=#ff78f0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#000000 guifg=#f0f0f8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=255 gui=underline guibg=bg guifg=#f0f0f8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Error term=reverse cterm=bold ctermbg=199 ctermfg=255 gui=bold guibg=#ff0088 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=224 gui=bold,underline guibg=bg guifg=#ffa0a0
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=147 gui=bold guibg=bg guifg=#8080ff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=#4080ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#40f0d0
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=225 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi IncSearch term=reverse cterm=underline ctermbg=33 ctermfg=159 gui=underline guibg=#0060c0 guifg=#80ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=33 ctermfg=255 gui=NONE guibg=#0060c0 guifg=#f0f0f8
    CSAHi MoreMsg term=bold cterm=bold ctermbg=37 ctermfg=51 gui=bold guibg=#008070 guifg=#00ffff
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=123 gui=bold guibg=bg guifg=#40f0d0
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=#9090a0
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=37 ctermfg=51 gui=NONE guibg=#008070 guifg=#00ffff
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=129 ctermfg=255 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#c8c8d8 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=231 ctermfg=145 gui=NONE guibg=#c8c8d8 guifg=#707080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=231 ctermfg=103 gui=NONE guibg=#c8c8d8 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#f0f0f8
    CSAHi Visual term=reverse cterm=NONE ctermbg=145 ctermfg=231 gui=NONE guibg=#707080 guifg=#e0e0f0
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=225 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#a0a0ff guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=31 ctermfg=123 gui=NONE guibg=#005080 guifg=#40f0f0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=129 ctermfg=255 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#c0c0d0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#90d0ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#e0e080
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#40f0f0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#ffa0ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=#40f0a0
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#ffc864
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=24 ctermfg=123 gui=NONE guibg=#00305c guifg=#40c0ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=26 ctermfg=195 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=95 ctermfg=205 gui=NONE guibg=#601830 guifg=#e03870
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=26 ctermfg=195 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=168 ctermfg=219 gui=NONE guibg=#a02860 guifg=#ff78f0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#f0f0f8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=231 gui=underline guibg=bg guifg=#f0f0f8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Error term=reverse cterm=bold ctermbg=198 ctermfg=231 gui=bold guibg=#ff0088 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=217 gui=bold,underline guibg=bg guifg=#ffa0a0
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=105 gui=bold guibg=bg guifg=#8080ff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=#4080ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=#40f0d0
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi IncSearch term=reverse cterm=underline ctermbg=25 ctermfg=123 gui=underline guibg=#0060c0 guifg=#80ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=25 ctermfg=231 gui=NONE guibg=#0060c0 guifg=#f0f0f8
    CSAHi MoreMsg term=bold cterm=bold ctermbg=29 ctermfg=51 gui=bold guibg=#008070 guifg=#00ffff
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=86 gui=bold guibg=bg guifg=#40f0d0
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=103 gui=NONE guibg=bg guifg=#9090a0
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=29 ctermfg=51 gui=NONE guibg=#008070 guifg=#00ffff
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=184 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#c8c8d8 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=60 gui=NONE guibg=#c8c8d8 guifg=#707080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=60 gui=NONE guibg=#c8c8d8 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f0f0f8
    CSAHi Visual term=reverse cterm=NONE ctermbg=60 ctermfg=189 gui=NONE guibg=#707080 guifg=#e0e0f0
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=147 ctermfg=16 gui=NONE guibg=#a0a0ff guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=24 ctermfg=87 gui=NONE guibg=#005080 guifg=#40f0f0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=#c0c0d0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#90d0ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#e0e080
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#40f0f0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffa0ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#40f0a0
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#ffc864
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=23 ctermfg=75 gui=NONE guibg=#00305c guifg=#40c0ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=153 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=53 ctermfg=167 gui=NONE guibg=#601830 guifg=#e03870
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=19 ctermfg=153 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=125 ctermfg=213 gui=NONE guibg=#a02860 guifg=#ff78f0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#f0f0f8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=79 gui=underline guibg=bg guifg=#f0f0f8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Error term=reverse cterm=bold ctermbg=65 ctermfg=79 gui=bold guibg=#ff0088 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=69 gui=bold,underline guibg=bg guifg=#ffa0a0
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=39 gui=bold guibg=bg guifg=#8080ff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#4080ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=30 gui=NONE guibg=bg guifg=#40f0d0
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi IncSearch term=reverse cterm=underline ctermbg=22 ctermfg=47 gui=underline guibg=#0060c0 guifg=#80ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=22 ctermfg=79 gui=NONE guibg=#0060c0 guifg=#f0f0f8
    CSAHi MoreMsg term=bold cterm=bold ctermbg=21 ctermfg=31 gui=bold guibg=#008070 guifg=#00ffff
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=30 gui=bold guibg=bg guifg=#40f0d0
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#9090a0
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=21 ctermfg=31 gui=NONE guibg=#008070 guifg=#00ffff
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=58 ctermfg=16 gui=NONE guibg=#c8c8d8 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=58 ctermfg=37 gui=NONE guibg=#c8c8d8 guifg=#707080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=58 ctermfg=37 gui=NONE guibg=#c8c8d8 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#f0f0f8
    CSAHi Visual term=reverse cterm=NONE ctermbg=37 ctermfg=87 gui=NONE guibg=#707080 guifg=#e0e0f0
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=39 ctermfg=16 gui=NONE guibg=#a0a0ff guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=21 ctermfg=31 gui=NONE guibg=#005080 guifg=#40f0f0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#c0c0d0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#90d0ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#e0e080
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#40f0f0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#ffa0ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#40f0a0
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#ffc864
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=17 ctermfg=27 gui=NONE guibg=#00305c guifg=#40c0ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=17 ctermfg=43 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=32 ctermfg=49 gui=NONE guibg=#601830 guifg=#e03870
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=17 ctermfg=43 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=33 ctermfg=71 gui=NONE guibg=#a02860 guifg=#ff78f0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
