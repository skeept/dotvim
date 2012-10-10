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
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=188 gui=NONE guibg=#2a2a2a guifg=#dcdccc
    CSAHi Underlined term=underline cterm=underline ctermbg=235 ctermfg=180 gui=underline guibg=bg guifg=#d4b064
    CSAHi Ignore term=NONE cterm=NONE ctermbg=235 ctermfg=235 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=235 ctermfg=210 gui=NONE guibg=bg guifg=#f07070
    CSAHi Todo term=NONE cterm=NONE ctermbg=151 ctermfg=235 gui=NONE guibg=#aed0ae guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=235 ctermfg=180 gui=NONE guibg=bg guifg=#d4b064
    CSAHi NonText term=bold cterm=bold ctermbg=235 ctermfg=145 gui=bold guibg=bg guifg=#9f8f80
    CSAHi Directory term=bold cterm=NONE ctermbg=235 ctermfg=180 gui=NONE guibg=bg guifg=#d4b064
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=235 ctermfg=210 gui=bold guibg=bg guifg=#f07070
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=138 ctermfg=188 gui=NONE guibg=#866a4f guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=181 ctermfg=235 gui=NONE guibg=#c0aa94 guifg=bg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=235 ctermfg=187 gui=bold guibg=bg guifg=#dabfa5
    CSAHi ModeMsg term=bold cterm=bold ctermbg=235 ctermfg=188 gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=145 gui=NONE guibg=bg guifg=#9f8f80
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=235 ctermfg=188 gui=underline guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=235 ctermfg=188 gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=235 ctermfg=188 gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=235 ctermfg=188 gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=235 ctermfg=188 gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=144 ctermfg=16 gui=NONE guibg=#a78869 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=181 ctermfg=235 gui=NONE guibg=#c0aa94 guifg=bg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=181 ctermfg=188 gui=NONE guibg=#B99F86 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=NONE guibg=#f7f7f1 guifg=bg
    CSAHi TabLine term=underline cterm=underline ctermbg=101 ctermfg=231 gui=underline guibg=#564d43 guifg=#f7f7f1
    CSAHi TabLineSel term=bold cterm=bold ctermbg=235 ctermfg=231 gui=bold guibg=bg guifg=#f7f7f1
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=101 ctermfg=231 gui=underline guibg=#564d43 guifg=#f7f7f1
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=237 ctermfg=fg gui=NONE guibg=#3f3f3f guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=237 ctermfg=fg gui=NONE guibg=#3f3f3f guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=188 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=235 ctermfg=188 gui=italic guibg=bg guifg=fg
    CSAHi htmlBold term=NONE cterm=bold ctermbg=235 ctermfg=188 gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=235 ctermfg=187 gui=bold guibg=bg guifg=#dabfa5
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=102 ctermfg=231 gui=bold guibg=#736559 guifg=#f7f7f1
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=101 ctermfg=231 gui=NONE guibg=#564d43 guifg=#f7f7f1
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=101 ctermfg=231 gui=NONE guibg=#564d43 guifg=#f7f7f1
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f7f7f1
    CSAHi Visual term=reverse cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=#5f5f5f guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=235 ctermfg=181 gui=bold,underline guibg=bg guifg=#c0aa94
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=235 ctermfg=210 gui=NONE guibg=bg guifg=#f07070
    CSAHi WildMenu term=NONE cterm=bold ctermbg=181 ctermfg=235 gui=bold guibg=#c0aa94 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=233 ctermfg=187 gui=NONE guibg=#101010 guifg=#c2b680
    CSAHi lCursor term=NONE cterm=NONE ctermbg=181 ctermfg=235 gui=NONE guibg=#c0aa94 guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#008b8b guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=235 ctermfg=187 gui=NONE guibg=bg guifg=#c2b680
    CSAHi Constant term=underline cterm=NONE ctermbg=235 ctermfg=151 gui=NONE guibg=bg guifg=#afe091
    CSAHi Special term=bold cterm=NONE ctermbg=235 ctermfg=180 gui=NONE guibg=bg guifg=#d4b064
    CSAHi Identifier term=underline cterm=NONE ctermbg=235 ctermfg=187 gui=NONE guibg=bg guifg=#dabfa5
    CSAHi Statement term=bold cterm=bold ctermbg=235 ctermfg=181 gui=bold guibg=bg guifg=#e0af91
    CSAHi PreProc term=underline cterm=NONE ctermbg=235 ctermfg=182 gui=NONE guibg=bg guifg=#c2aed0
    CSAHi Type term=underline cterm=bold ctermbg=235 ctermfg=187 gui=bold guibg=bg guifg=#dabfa5
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=235 ctermfg=187 gui=NONE guibg=bg guifg=#c2b680
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=34 ctermfg=188 gui=NONE guibg=#008b00 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=19 ctermfg=188 gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=124 ctermfg=188 gui=NONE guibg=#8b0000 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=20 ctermfg=188 gui=bold guibg=#0000cd guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=235 ctermfg=187 gui=NONE guibg=bg guifg=#c2b680
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=210 gui=undercurl guibg=bg guifg=fg guisp=#f07070
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=105 gui=undercurl guibg=bg guifg=fg guisp=#7070f0
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=213 gui=undercurl guibg=bg guifg=fg guisp=#f070f0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=123 gui=undercurl guibg=bg guifg=fg guisp=#70f0f0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#2a2a2a guifg=#dcdccc
    CSAHi Underlined term=underline cterm=underline ctermbg=59 ctermfg=222 gui=underline guibg=bg guifg=#d4b064
    CSAHi Ignore term=NONE cterm=NONE ctermbg=59 ctermfg=59 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=59 ctermfg=217 gui=NONE guibg=bg guifg=#f07070
    CSAHi Todo term=NONE cterm=NONE ctermbg=194 ctermfg=59 gui=NONE guibg=#aed0ae guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=59 ctermfg=222 gui=NONE guibg=bg guifg=#d4b064
    CSAHi NonText term=bold cterm=bold ctermbg=59 ctermfg=181 gui=bold guibg=bg guifg=#9f8f80
    CSAHi Directory term=bold cterm=NONE ctermbg=59 ctermfg=222 gui=NONE guibg=bg guifg=#d4b064
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=59 ctermfg=217 gui=bold guibg=bg guifg=#f07070
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=138 ctermfg=231 gui=NONE guibg=#866a4f guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=223 ctermfg=59 gui=NONE guibg=#c0aa94 guifg=bg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=59 ctermfg=224 gui=bold guibg=bg guifg=#dabfa5
    CSAHi ModeMsg term=bold cterm=bold ctermbg=59 ctermfg=231 gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=59 ctermfg=181 gui=NONE guibg=bg guifg=#9f8f80
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=59 ctermfg=231 gui=underline guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=59 ctermfg=231 gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=59 ctermfg=231 gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=59 ctermfg=231 gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=59 ctermfg=231 gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=180 ctermfg=16 gui=NONE guibg=#a78869 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=223 ctermfg=59 gui=NONE guibg=#c0aa94 guifg=bg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=187 ctermfg=231 gui=NONE guibg=#B99F86 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=59 gui=NONE guibg=#f7f7f1 guifg=bg
    CSAHi TabLine term=underline cterm=underline ctermbg=102 ctermfg=255 gui=underline guibg=#564d43 guifg=#f7f7f1
    CSAHi TabLineSel term=bold cterm=bold ctermbg=59 ctermfg=255 gui=bold guibg=bg guifg=#f7f7f1
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=102 ctermfg=255 gui=underline guibg=#564d43 guifg=#f7f7f1
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=237 ctermfg=fg gui=NONE guibg=#3f3f3f guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=237 ctermfg=fg gui=NONE guibg=#3f3f3f guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=NONE guibg=fg guifg=bg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=59 ctermfg=231 gui=italic guibg=bg guifg=fg
    CSAHi htmlBold term=NONE cterm=bold ctermbg=59 ctermfg=231 gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=59 ctermfg=224 gui=bold guibg=bg guifg=#dabfa5
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=138 ctermfg=255 gui=bold guibg=#736559 guifg=#f7f7f1
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#564d43 guifg=#f7f7f1
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#564d43 guifg=#f7f7f1
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#f7f7f1
    CSAHi Visual term=reverse cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=#5f5f5f guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=59 ctermfg=223 gui=bold,underline guibg=bg guifg=#c0aa94
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=59 ctermfg=217 gui=NONE guibg=bg guifg=#f07070
    CSAHi WildMenu term=NONE cterm=bold ctermbg=223 ctermfg=59 gui=bold guibg=#c0aa94 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=233 ctermfg=223 gui=NONE guibg=#101010 guifg=#c2b680
    CSAHi lCursor term=NONE cterm=NONE ctermbg=223 ctermfg=59 gui=NONE guibg=#c0aa94 guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#008b8b guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=59 ctermfg=223 gui=NONE guibg=bg guifg=#c2b680
    CSAHi Constant term=underline cterm=NONE ctermbg=59 ctermfg=193 gui=NONE guibg=bg guifg=#afe091
    CSAHi Special term=bold cterm=NONE ctermbg=59 ctermfg=222 gui=NONE guibg=bg guifg=#d4b064
    CSAHi Identifier term=underline cterm=NONE ctermbg=59 ctermfg=224 gui=NONE guibg=bg guifg=#dabfa5
    CSAHi Statement term=bold cterm=bold ctermbg=59 ctermfg=223 gui=bold guibg=bg guifg=#e0af91
    CSAHi PreProc term=underline cterm=NONE ctermbg=59 ctermfg=225 gui=NONE guibg=bg guifg=#c2aed0
    CSAHi Type term=underline cterm=bold ctermbg=59 ctermfg=224 gui=bold guibg=bg guifg=#dabfa5
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=59 ctermfg=223 gui=NONE guibg=bg guifg=#c2b680
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=34 ctermfg=231 gui=NONE guibg=#008b00 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=19 ctermfg=231 gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=#8b0000 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=21 ctermfg=231 gui=bold guibg=#0000cd guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=59 ctermfg=223 gui=NONE guibg=bg guifg=#c2b680
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=217 gui=undercurl guibg=bg guifg=fg guisp=#f07070
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=147 gui=undercurl guibg=bg guifg=fg guisp=#7070f0
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=219 gui=undercurl guibg=bg guifg=fg guisp=#f070f0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=159 gui=undercurl guibg=bg guifg=fg guisp=#70f0f0
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=188 gui=NONE guibg=#2a2a2a guifg=#dcdccc
    CSAHi Underlined term=underline cterm=underline ctermbg=235 ctermfg=179 gui=underline guibg=bg guifg=#d4b064
    CSAHi Ignore term=NONE cterm=NONE ctermbg=235 ctermfg=235 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=235 ctermfg=203 gui=NONE guibg=bg guifg=#f07070
    CSAHi Todo term=NONE cterm=NONE ctermbg=151 ctermfg=235 gui=NONE guibg=#aed0ae guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=235 ctermfg=179 gui=NONE guibg=bg guifg=#d4b064
    CSAHi NonText term=bold cterm=bold ctermbg=235 ctermfg=138 gui=bold guibg=bg guifg=#9f8f80
    CSAHi Directory term=bold cterm=NONE ctermbg=235 ctermfg=179 gui=NONE guibg=bg guifg=#d4b064
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=235 ctermfg=203 gui=bold guibg=bg guifg=#f07070
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=95 ctermfg=188 gui=NONE guibg=#866a4f guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=144 ctermfg=235 gui=NONE guibg=#c0aa94 guifg=bg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=235 ctermfg=181 gui=bold guibg=bg guifg=#dabfa5
    CSAHi ModeMsg term=bold cterm=bold ctermbg=235 ctermfg=188 gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=138 gui=NONE guibg=bg guifg=#9f8f80
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=235 ctermfg=188 gui=underline guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=235 ctermfg=188 gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=235 ctermfg=188 gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=235 ctermfg=188 gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=235 ctermfg=188 gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=137 ctermfg=16 gui=NONE guibg=#a78869 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=144 ctermfg=235 gui=NONE guibg=#c0aa94 guifg=bg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=144 ctermfg=188 gui=NONE guibg=#B99F86 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=NONE guibg=#f7f7f1 guifg=bg
    CSAHi TabLine term=underline cterm=underline ctermbg=59 ctermfg=231 gui=underline guibg=#564d43 guifg=#f7f7f1
    CSAHi TabLineSel term=bold cterm=bold ctermbg=235 ctermfg=231 gui=bold guibg=bg guifg=#f7f7f1
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=59 ctermfg=231 gui=underline guibg=#564d43 guifg=#f7f7f1
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=237 ctermfg=fg gui=NONE guibg=#3f3f3f guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=237 ctermfg=fg gui=NONE guibg=#3f3f3f guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=188 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=235 ctermfg=188 gui=italic guibg=bg guifg=fg
    CSAHi htmlBold term=NONE cterm=bold ctermbg=235 ctermfg=188 gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=235 ctermfg=181 gui=bold guibg=bg guifg=#dabfa5
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=59 ctermfg=231 gui=bold guibg=#736559 guifg=#f7f7f1
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#564d43 guifg=#f7f7f1
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#564d43 guifg=#f7f7f1
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f7f7f1
    CSAHi Visual term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#5f5f5f guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=235 ctermfg=144 gui=bold,underline guibg=bg guifg=#c0aa94
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=235 ctermfg=203 gui=NONE guibg=bg guifg=#f07070
    CSAHi WildMenu term=NONE cterm=bold ctermbg=144 ctermfg=235 gui=bold guibg=#c0aa94 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=233 ctermfg=144 gui=NONE guibg=#101010 guifg=#c2b680
    CSAHi lCursor term=NONE cterm=NONE ctermbg=144 ctermfg=235 gui=NONE guibg=#c0aa94 guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=30 ctermfg=fg gui=NONE guibg=#008b8b guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=235 ctermfg=144 gui=NONE guibg=bg guifg=#c2b680
    CSAHi Constant term=underline cterm=NONE ctermbg=235 ctermfg=150 gui=NONE guibg=bg guifg=#afe091
    CSAHi Special term=bold cterm=NONE ctermbg=235 ctermfg=179 gui=NONE guibg=bg guifg=#d4b064
    CSAHi Identifier term=underline cterm=NONE ctermbg=235 ctermfg=181 gui=NONE guibg=bg guifg=#dabfa5
    CSAHi Statement term=bold cterm=bold ctermbg=235 ctermfg=180 gui=bold guibg=bg guifg=#e0af91
    CSAHi PreProc term=underline cterm=NONE ctermbg=235 ctermfg=146 gui=NONE guibg=bg guifg=#c2aed0
    CSAHi Type term=underline cterm=bold ctermbg=235 ctermfg=181 gui=bold guibg=bg guifg=#dabfa5
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=235 ctermfg=144 gui=NONE guibg=bg guifg=#c2b680
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=28 ctermfg=188 gui=NONE guibg=#008b00 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=18 ctermfg=188 gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=88 ctermfg=188 gui=NONE guibg=#8b0000 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=20 ctermfg=188 gui=bold guibg=#0000cd guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=235 ctermfg=144 gui=NONE guibg=bg guifg=#c2b680
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=203 gui=undercurl guibg=bg guifg=fg guisp=#f07070
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=63 gui=undercurl guibg=bg guifg=fg guisp=#7070f0
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=207 gui=undercurl guibg=bg guifg=fg guisp=#f070f0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=87 gui=undercurl guibg=bg guifg=fg guisp=#70f0f0
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#2a2a2a guifg=#dcdccc
    CSAHi Underlined term=underline cterm=underline ctermbg=80 ctermfg=57 gui=underline guibg=bg guifg=#d4b064
    CSAHi Ignore term=NONE cterm=NONE ctermbg=80 ctermfg=80 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=80 ctermfg=69 gui=NONE guibg=bg guifg=#f07070
    CSAHi Todo term=NONE cterm=NONE ctermbg=58 ctermfg=80 gui=NONE guibg=#aed0ae guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=bg guifg=#d4b064
    CSAHi NonText term=bold cterm=bold ctermbg=80 ctermfg=37 gui=bold guibg=bg guifg=#9f8f80
    CSAHi Directory term=bold cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=bg guifg=#d4b064
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=80 ctermfg=69 gui=bold guibg=bg guifg=#f07070
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=37 ctermfg=58 gui=NONE guibg=#866a4f guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=53 ctermfg=80 gui=NONE guibg=#c0aa94 guifg=bg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=80 ctermfg=57 gui=bold guibg=bg guifg=#dabfa5
    CSAHi ModeMsg term=bold cterm=bold ctermbg=80 ctermfg=58 gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=bg guifg=#9f8f80
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=80 ctermfg=58 gui=underline guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=80 ctermfg=58 gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=80 ctermfg=58 gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=80 ctermfg=58 gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=80 ctermfg=58 gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=#a78869 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=53 ctermfg=80 gui=NONE guibg=#c0aa94 guifg=bg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=53 ctermfg=58 gui=NONE guibg=#B99F86 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=80 gui=NONE guibg=#f7f7f1 guifg=bg
    CSAHi TabLine term=underline cterm=underline ctermbg=36 ctermfg=79 gui=underline guibg=#564d43 guifg=#f7f7f1
    CSAHi TabLineSel term=bold cterm=bold ctermbg=80 ctermfg=79 gui=bold guibg=bg guifg=#f7f7f1
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=36 ctermfg=79 gui=underline guibg=#564d43 guifg=#f7f7f1
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#3f3f3f guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#3f3f3f guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=58 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=italic guibg=bg guifg=fg
    CSAHi htmlBold term=NONE cterm=bold ctermbg=80 ctermfg=58 gui=bold guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=80 ctermfg=57 gui=bold guibg=bg guifg=#dabfa5
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=37 ctermfg=79 gui=bold guibg=#736559 guifg=#f7f7f1
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=36 ctermfg=79 gui=NONE guibg=#564d43 guifg=#f7f7f1
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=36 ctermfg=79 gui=NONE guibg=#564d43 guifg=#f7f7f1
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#f7f7f1
    CSAHi Visual term=reverse cterm=NONE ctermbg=81 ctermfg=fg gui=NONE guibg=#5f5f5f guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=80 ctermfg=53 gui=bold,underline guibg=bg guifg=#c0aa94
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=80 ctermfg=69 gui=NONE guibg=bg guifg=#f07070
    CSAHi WildMenu term=NONE cterm=bold ctermbg=53 ctermfg=80 gui=bold guibg=#c0aa94 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=57 gui=NONE guibg=#101010 guifg=#c2b680
    CSAHi lCursor term=NONE cterm=NONE ctermbg=53 ctermfg=80 gui=NONE guibg=#c0aa94 guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=21 ctermfg=fg gui=NONE guibg=#008b8b guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=bg guifg=#c2b680
    CSAHi Constant term=underline cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=bg guifg=#afe091
    CSAHi Special term=bold cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=bg guifg=#d4b064
    CSAHi Identifier term=underline cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=bg guifg=#dabfa5
    CSAHi Statement term=bold cterm=bold ctermbg=80 ctermfg=57 gui=bold guibg=bg guifg=#e0af91
    CSAHi PreProc term=underline cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=bg guifg=#c2aed0
    CSAHi Type term=underline cterm=bold ctermbg=80 ctermfg=57 gui=bold guibg=bg guifg=#dabfa5
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=bg guifg=#c2b680
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=20 ctermfg=58 gui=NONE guibg=#008b00 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=58 gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=32 ctermfg=58 gui=NONE guibg=#8b0000 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=18 ctermfg=58 gui=bold guibg=#0000cd guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=bg guifg=#c2b680
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=69 gui=undercurl guibg=bg guifg=fg guisp=#f07070
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=39 gui=undercurl guibg=bg guifg=fg guisp=#7070f0
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=71 gui=undercurl guibg=bg guifg=fg guisp=#f070f0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=47 gui=undercurl guibg=bg guifg=fg guisp=#70f0f0
endif

if 1
    delcommand CSAHi
endif
