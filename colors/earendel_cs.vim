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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=231 ctermfg=62 gui=underline guibg=bg guifg=#272fc2
    CSAHi Ignore term=NONE cterm=NONE ctermbg=231 ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=231 ctermfg=161 gui=NONE guibg=bg guifg=#bf001d
    CSAHi Todo term=NONE cterm=bold ctermbg=222 ctermfg=95 gui=bold guibg=#fedc56 guifg=#512b1e
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=231 ctermfg=131 gui=NONE guibg=bg guifg=#844631
    CSAHi NonText term=bold cterm=bold ctermbg=231 ctermfg=102 gui=bold guibg=bg guifg=#656565
    CSAHi Directory term=bold cterm=NONE ctermbg=231 ctermfg=62 gui=NONE guibg=bg guifg=#272fc2
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=161 ctermfg=231 gui=bold guibg=#ca001f guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=223 ctermfg=fg gui=NONE guibg=#f7b69d guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=223 ctermfg=fg gui=NONE guibg=#fee481 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=231 ctermfg=239 gui=bold guibg=bg guifg=#4a4a4a
    CSAHi ModeMsg term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=231 ctermfg=102 gui=NONE guibg=bg guifg=#656565
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=231 ctermfg=16 gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=231 ctermfg=16 gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=231 ctermfg=16 gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=231 ctermfg=16 gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=152 ctermfg=16 gui=NONE guibg=#aab8d5 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=222 ctermfg=16 gui=NONE guibg=#fee06b guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=110 ctermfg=16 gui=NONE guibg=#6a83b5 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#c7cfe2 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=16 gui=underline guibg=#d4d4d4 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=252 ctermfg=16 gui=underline guibg=#d4d4d4 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=253 ctermfg=fg gui=NONE guibg=#dfdfdf guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=253 ctermfg=fg gui=NONE guibg=#dfdfdf guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBold term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=231 ctermfg=239 gui=bold guibg=bg guifg=#4a4a4a
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=146 ctermfg=16 gui=bold guibg=#96aad3 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=#bcc7de guifg=#384547
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=#bcc7de guifg=#384547
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=189 ctermfg=fg gui=NONE guibg=#b5c5e6 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=231 ctermfg=68 gui=bold,underline guibg=bg guifg=#4069bf
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=231 ctermfg=161 gui=bold guibg=bg guifg=#ca001f
    CSAHi WildMenu term=NONE cterm=bold ctermbg=222 ctermfg=16 gui=bold guibg=#fedc56 guifg=fg
    CSAHi Folded term=NONE cterm=bold ctermbg=188 ctermfg=60 gui=bold guibg=#cacaca guifg=#324263
    CSAHi lCursor term=NONE cterm=NONE ctermbg=113 ctermfg=231 gui=NONE guibg=#79bf21 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=36 ctermfg=231 gui=NONE guibg=#0f8674 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=231 ctermfg=106 gui=NONE guibg=bg guifg=#558817
    CSAHi Constant term=underline cterm=NONE ctermbg=231 ctermfg=136 gui=NONE guibg=bg guifg=#a8660d
    CSAHi Special term=bold cterm=NONE ctermbg=231 ctermfg=131 gui=NONE guibg=bg guifg=#844631
    CSAHi Identifier term=underline cterm=NONE ctermbg=231 ctermfg=30 gui=NONE guibg=bg guifg=#0e7c6b
    CSAHi Statement term=bold cterm=bold ctermbg=231 ctermfg=61 gui=bold guibg=bg guifg=#2239a8
    CSAHi PreProc term=underline cterm=NONE ctermbg=231 ctermfg=131 gui=NONE guibg=bg guifg=#a33243
    CSAHi Type term=underline cterm=bold ctermbg=231 ctermfg=61 gui=bold guibg=bg guifg=#1d318d
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=231 ctermfg=102 gui=NONE guibg=bg guifg=#656565
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=193 ctermfg=16 gui=NONE guibg=#bae981 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=147 ctermfg=16 gui=NONE guibg=#8495e6 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=217 ctermfg=16 gui=NONE guibg=#ff95a5 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=189 ctermfg=16 gui=bold guibg=#b9c2f0 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=231 ctermfg=102 gui=NONE guibg=bg guifg=#656565
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=161 gui=undercurl guibg=bg guifg=fg guisp=#ca001f
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=62 gui=undercurl guibg=bg guifg=fg guisp=#272fc2
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=174 gui=undercurl guibg=bg guifg=fg guisp=#d16c7a
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=36 gui=undercurl guibg=bg guifg=fg guisp=#0f8674
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=63 gui=underline guibg=bg guifg=#272fc2
    CSAHi Ignore term=NONE cterm=NONE ctermbg=255 ctermfg=255 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=255 ctermfg=161 gui=NONE guibg=bg guifg=#bf001d
    CSAHi Todo term=NONE cterm=bold ctermbg=228 ctermfg=95 gui=bold guibg=#fedc56 guifg=#512b1e
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=255 ctermfg=137 gui=NONE guibg=bg guifg=#844631
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=241 gui=bold guibg=bg guifg=#656565
    CSAHi Directory term=bold cterm=NONE ctermbg=255 ctermfg=63 gui=NONE guibg=bg guifg=#272fc2
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=197 ctermfg=255 gui=bold guibg=#ca001f guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=224 ctermfg=fg gui=NONE guibg=#f7b69d guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=229 ctermfg=fg gui=NONE guibg=#fee481 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=255 ctermfg=239 gui=bold guibg=bg guifg=#4a4a4a
    CSAHi ModeMsg term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=255 ctermfg=241 gui=NONE guibg=bg guifg=#656565
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=255 ctermfg=16 gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=255 ctermfg=16 gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=255 ctermfg=16 gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=255 ctermfg=16 gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#aab8d5 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#fee06b guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=110 ctermfg=16 gui=NONE guibg=#6a83b5 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#c7cfe2 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=16 gui=underline guibg=#d4d4d4 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=231 ctermfg=16 gui=underline guibg=#d4d4d4 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=253 ctermfg=fg gui=NONE guibg=#dfdfdf guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=253 ctermfg=fg gui=NONE guibg=#dfdfdf guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBold term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=255 ctermfg=239 gui=bold guibg=bg guifg=#4a4a4a
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=189 ctermfg=16 gui=bold guibg=#96aad3 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=195 ctermfg=66 gui=NONE guibg=#bcc7de guifg=#384547
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=195 ctermfg=66 gui=NONE guibg=#bcc7de guifg=#384547
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=#b5c5e6 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=255 ctermfg=104 gui=bold,underline guibg=bg guifg=#4069bf
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=255 ctermfg=197 gui=bold guibg=bg guifg=#ca001f
    CSAHi WildMenu term=NONE cterm=bold ctermbg=228 ctermfg=16 gui=bold guibg=#fedc56 guifg=fg
    CSAHi Folded term=NONE cterm=bold ctermbg=251 ctermfg=66 gui=bold guibg=#cacaca guifg=#324263
    CSAHi lCursor term=NONE cterm=NONE ctermbg=149 ctermfg=255 gui=NONE guibg=#79bf21 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=37 ctermfg=255 gui=NONE guibg=#0f8674 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=255 ctermfg=107 gui=NONE guibg=bg guifg=#558817
    CSAHi Constant term=underline cterm=NONE ctermbg=255 ctermfg=172 gui=NONE guibg=bg guifg=#a8660d
    CSAHi Special term=bold cterm=NONE ctermbg=255 ctermfg=137 gui=NONE guibg=bg guifg=#844631
    CSAHi Identifier term=underline cterm=NONE ctermbg=255 ctermfg=37 gui=NONE guibg=bg guifg=#0e7c6b
    CSAHi Statement term=bold cterm=bold ctermbg=255 ctermfg=62 gui=bold guibg=bg guifg=#2239a8
    CSAHi PreProc term=underline cterm=NONE ctermbg=255 ctermfg=168 gui=NONE guibg=bg guifg=#a33243
    CSAHi Type term=underline cterm=bold ctermbg=255 ctermfg=61 gui=bold guibg=bg guifg=#1d318d
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=241 gui=NONE guibg=bg guifg=#656565
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=193 ctermfg=16 gui=NONE guibg=#bae981 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#8495e6 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=224 ctermfg=16 gui=NONE guibg=#ff95a5 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=195 ctermfg=16 gui=bold guibg=#b9c2f0 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=255 ctermfg=241 gui=NONE guibg=bg guifg=#656565
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=197 gui=undercurl guibg=bg guifg=fg guisp=#ca001f
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=63 gui=undercurl guibg=bg guifg=fg guisp=#272fc2
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=217 gui=undercurl guibg=bg guifg=fg guisp=#d16c7a
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=#0f8674
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=231 ctermfg=19 gui=underline guibg=bg guifg=#272fc2
    CSAHi Ignore term=NONE cterm=NONE ctermbg=231 ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=231 ctermfg=124 gui=NONE guibg=bg guifg=#bf001d
    CSAHi Todo term=NONE cterm=bold ctermbg=221 ctermfg=52 gui=bold guibg=#fedc56 guifg=#512b1e
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=231 ctermfg=95 gui=NONE guibg=bg guifg=#844631
    CSAHi NonText term=bold cterm=bold ctermbg=231 ctermfg=241 gui=bold guibg=bg guifg=#656565
    CSAHi Directory term=bold cterm=NONE ctermbg=231 ctermfg=19 gui=NONE guibg=bg guifg=#272fc2
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=160 ctermfg=231 gui=bold guibg=#ca001f guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=217 ctermfg=fg gui=NONE guibg=#f7b69d guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=222 ctermfg=fg gui=NONE guibg=#fee481 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=231 ctermfg=239 gui=bold guibg=bg guifg=#4a4a4a
    CSAHi ModeMsg term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=231 ctermfg=241 gui=NONE guibg=bg guifg=#656565
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=231 ctermfg=16 gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=231 ctermfg=16 gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=231 ctermfg=16 gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=231 ctermfg=16 gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=146 ctermfg=16 gui=NONE guibg=#aab8d5 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=221 ctermfg=16 gui=NONE guibg=#fee06b guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=67 ctermfg=16 gui=NONE guibg=#6a83b5 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#c7cfe2 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=188 ctermfg=16 gui=underline guibg=#d4d4d4 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=188 ctermfg=16 gui=underline guibg=#d4d4d4 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=253 ctermfg=fg gui=NONE guibg=#dfdfdf guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=253 ctermfg=fg gui=NONE guibg=#dfdfdf guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBold term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=231 ctermfg=239 gui=bold guibg=bg guifg=#4a4a4a
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=110 ctermfg=16 gui=bold guibg=#96aad3 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=152 ctermfg=59 gui=NONE guibg=#bcc7de guifg=#384547
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=152 ctermfg=59 gui=NONE guibg=#bcc7de guifg=#384547
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=152 ctermfg=fg gui=NONE guibg=#b5c5e6 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=231 ctermfg=61 gui=bold,underline guibg=bg guifg=#4069bf
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=231 ctermfg=160 gui=bold guibg=bg guifg=#ca001f
    CSAHi WildMenu term=NONE cterm=bold ctermbg=221 ctermfg=16 gui=bold guibg=#fedc56 guifg=fg
    CSAHi Folded term=NONE cterm=bold ctermbg=251 ctermfg=59 gui=bold guibg=#cacaca guifg=#324263
    CSAHi lCursor term=NONE cterm=NONE ctermbg=106 ctermfg=231 gui=NONE guibg=#79bf21 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=30 ctermfg=231 gui=NONE guibg=#0f8674 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=231 ctermfg=64 gui=NONE guibg=bg guifg=#558817
    CSAHi Constant term=underline cterm=NONE ctermbg=231 ctermfg=130 gui=NONE guibg=bg guifg=#a8660d
    CSAHi Special term=bold cterm=NONE ctermbg=231 ctermfg=95 gui=NONE guibg=bg guifg=#844631
    CSAHi Identifier term=underline cterm=NONE ctermbg=231 ctermfg=29 gui=NONE guibg=bg guifg=#0e7c6b
    CSAHi Statement term=bold cterm=bold ctermbg=231 ctermfg=25 gui=bold guibg=bg guifg=#2239a8
    CSAHi PreProc term=underline cterm=NONE ctermbg=231 ctermfg=131 gui=NONE guibg=bg guifg=#a33243
    CSAHi Type term=underline cterm=bold ctermbg=231 ctermfg=24 gui=bold guibg=bg guifg=#1d318d
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=231 ctermfg=241 gui=NONE guibg=bg guifg=#656565
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=150 ctermfg=16 gui=NONE guibg=#bae981 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=104 ctermfg=16 gui=NONE guibg=#8495e6 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=211 ctermfg=16 gui=NONE guibg=#ff95a5 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=147 ctermfg=16 gui=bold guibg=#b9c2f0 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=231 ctermfg=241 gui=NONE guibg=bg guifg=#656565
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=160 gui=undercurl guibg=bg guifg=fg guisp=#ca001f
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=#272fc2
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=168 gui=undercurl guibg=bg guifg=fg guisp=#d16c7a
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=#0f8674
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=79 ctermfg=18 gui=underline guibg=bg guifg=#272fc2
    CSAHi Ignore term=NONE cterm=NONE ctermbg=79 ctermfg=79 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=79 ctermfg=48 gui=NONE guibg=bg guifg=#bf001d
    CSAHi Todo term=NONE cterm=bold ctermbg=73 ctermfg=32 gui=bold guibg=#fedc56 guifg=#512b1e
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=79 ctermfg=36 gui=NONE guibg=bg guifg=#844631
    CSAHi NonText term=bold cterm=bold ctermbg=79 ctermfg=81 gui=bold guibg=bg guifg=#656565
    CSAHi Directory term=bold cterm=NONE ctermbg=79 ctermfg=18 gui=NONE guibg=bg guifg=#272fc2
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=48 ctermfg=79 gui=bold guibg=#ca001f guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=73 ctermfg=fg gui=NONE guibg=#f7b69d guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=73 ctermfg=fg gui=NONE guibg=#fee481 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=79 ctermfg=81 gui=bold guibg=bg guifg=#4a4a4a
    CSAHi ModeMsg term=bold cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=79 ctermfg=81 gui=NONE guibg=bg guifg=#656565
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=79 ctermfg=16 gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=79 ctermfg=16 gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=79 ctermfg=16 gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=79 ctermfg=16 gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=42 ctermfg=16 gui=NONE guibg=#aab8d5 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=73 ctermfg=16 gui=NONE guibg=#fee06b guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=38 ctermfg=16 gui=NONE guibg=#6a83b5 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=58 ctermfg=16 gui=NONE guibg=#c7cfe2 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=16 gui=underline guibg=#d4d4d4 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=86 ctermfg=16 gui=underline guibg=#d4d4d4 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=#dfdfdf guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=#dfdfdf guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBold term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=79 ctermfg=81 gui=bold guibg=bg guifg=#4a4a4a
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=38 ctermfg=16 gui=bold guibg=#96aad3 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=58 ctermfg=17 gui=NONE guibg=#bcc7de guifg=#384547
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=58 ctermfg=17 gui=NONE guibg=#bcc7de guifg=#384547
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#b5c5e6 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=79 ctermfg=22 gui=bold,underline guibg=bg guifg=#4069bf
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=79 ctermfg=48 gui=bold guibg=bg guifg=#ca001f
    CSAHi WildMenu term=NONE cterm=bold ctermbg=73 ctermfg=16 gui=bold guibg=#fedc56 guifg=fg
    CSAHi Folded term=NONE cterm=bold ctermbg=58 ctermfg=17 gui=bold guibg=#cacaca guifg=#324263
    CSAHi lCursor term=NONE cterm=NONE ctermbg=40 ctermfg=79 gui=NONE guibg=#79bf21 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#0f8674 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=79 ctermfg=36 gui=NONE guibg=bg guifg=#558817
    CSAHi Constant term=underline cterm=NONE ctermbg=79 ctermfg=36 gui=NONE guibg=bg guifg=#a8660d
    CSAHi Special term=bold cterm=NONE ctermbg=79 ctermfg=36 gui=NONE guibg=bg guifg=#844631
    CSAHi Identifier term=underline cterm=NONE ctermbg=79 ctermfg=21 gui=NONE guibg=bg guifg=#0e7c6b
    CSAHi Statement term=bold cterm=bold ctermbg=79 ctermfg=17 gui=bold guibg=bg guifg=#2239a8
    CSAHi PreProc term=underline cterm=NONE ctermbg=79 ctermfg=32 gui=NONE guibg=bg guifg=#a33243
    CSAHi Type term=underline cterm=bold ctermbg=79 ctermfg=17 gui=bold guibg=bg guifg=#1d318d
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=79 ctermfg=81 gui=NONE guibg=bg guifg=#656565
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=61 ctermfg=16 gui=NONE guibg=#bae981 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=38 ctermfg=16 gui=NONE guibg=#8495e6 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=69 ctermfg=16 gui=NONE guibg=#ff95a5 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=59 ctermfg=16 gui=bold guibg=#b9c2f0 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=79 ctermfg=81 gui=NONE guibg=bg guifg=#656565
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=48 gui=undercurl guibg=bg guifg=fg guisp=#ca001f
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=18 gui=undercurl guibg=bg guifg=fg guisp=#272fc2
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=53 gui=undercurl guibg=bg guifg=fg guisp=#d16c7a
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0f8674
endif

if 1
    delcommand CSAHi
endif
