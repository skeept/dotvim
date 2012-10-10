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
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=252 gui=NONE guibg=#202020 guifg=#d0d0d0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Error term=reverse cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#f08060
    CSAHi Todo term=NONE cterm=NONE ctermbg=187 ctermfg=124 gui=NONE guibg=#d0d090 guifg=#800000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#e0c060
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#b0d0f0
    CSAHi NonText term=bold cterm=NONE ctermbg=233 ctermfg=111 gui=NONE guibg=#101010 guifg=#6080f0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#80c0e0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=187 gui=NONE guibg=#800000 guifg=#d0d090
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=252 ctermfg=16 gui=NONE guibg=#d0d0d0 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=124 ctermfg=fg gui=NONE guibg=#800000 guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#c0e080
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=19 ctermfg=252 gui=NONE guibg=#000080 guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=249 gui=NONE guibg=bg guifg=#b0b0b0
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=127 ctermfg=252 gui=NONE guibg=#800080 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=252 ctermfg=16 gui=NONE guibg=#d0d0d0 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=19 ctermfg=252 gui=NONE guibg=#000080 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=34 ctermfg=252 gui=NONE guibg=#008000 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=34 ctermfg=252 gui=underline guibg=#008000 guifg=fg
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=34 ctermfg=252 gui=underline guibg=#008000 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=124 ctermfg=fg gui=NONE guibg=#800000 guifg=fg
    CSAHi CursorLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=#00f000 guifg=#000000
    CSAHi Question term=NONE cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#d0d090 guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#a6caf0 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#c0c0c0 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#c0c0c0 guifg=#000000
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#f0c0f0
    CSAHi Visual term=reverse cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#a6caf0 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=19 ctermfg=252 gui=NONE guibg=#000080 guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#f08060
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#d0d090 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=#004000 guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=252 ctermfg=234 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#d0d090
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#80c0e0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#e0c060
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#f0c0f0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#c0d8f8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=121 gui=NONE guibg=bg guifg=#60f080
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#b0d0f0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=34 ctermfg=254 gui=NONE guibg=#008000 guifg=#e0e0e0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=#000080 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=234 ctermfg=111 gui=NONE guibg=#202020 guifg=#6080f0
    CSAHi DiffText term=reverse cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#c0e080 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=34 ctermfg=254 gui=NONE guibg=#008000 guifg=#e0e0e0
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=216 gui=undercurl guibg=bg guifg=fg guisp=#f08060
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=111 gui=undercurl guibg=bg guifg=fg guisp=#6080f0
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=225 gui=undercurl guibg=bg guifg=fg guisp=#f0c0f0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=189 gui=undercurl guibg=bg guifg=fg guisp=#c0d8f8
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=252 gui=NONE guibg=#202020 guifg=#d0d0d0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Error term=reverse cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#f08060
    CSAHi Todo term=NONE cterm=NONE ctermbg=229 ctermfg=124 gui=NONE guibg=#d0d090 guifg=#800000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#e0c060
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#b0d0f0
    CSAHi NonText term=bold cterm=NONE ctermbg=233 ctermfg=111 gui=NONE guibg=#101010 guifg=#6080f0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#80c0e0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=229 gui=NONE guibg=#800000 guifg=#d0d090
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=252 ctermfg=16 gui=NONE guibg=#d0d0d0 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=124 ctermfg=fg gui=NONE guibg=#800000 guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#c0e080
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=19 ctermfg=252 gui=NONE guibg=#000080 guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=249 gui=NONE guibg=bg guifg=#b0b0b0
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=127 ctermfg=252 gui=NONE guibg=#800080 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=252 ctermfg=16 gui=NONE guibg=#d0d0d0 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=19 ctermfg=252 gui=NONE guibg=#000080 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=34 ctermfg=252 gui=NONE guibg=#008000 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=34 ctermfg=252 gui=underline guibg=#008000 guifg=fg
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=34 ctermfg=252 gui=underline guibg=#008000 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=124 ctermfg=fg gui=NONE guibg=#800000 guifg=fg
    CSAHi CursorLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=#00f000 guifg=#000000
    CSAHi Question term=NONE cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#d0d090 guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=195 ctermfg=16 gui=NONE guibg=#a6caf0 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#c0c0c0 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#c0c0c0 guifg=#000000
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#f0c0f0
    CSAHi Visual term=reverse cterm=NONE ctermbg=195 ctermfg=16 gui=NONE guibg=#a6caf0 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=19 ctermfg=252 gui=NONE guibg=#000080 guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#f08060
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#d0d090 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=28 ctermfg=fg gui=NONE guibg=#004000 guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=252 ctermfg=234 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#d0d090
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#80c0e0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#e0c060
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#f0c0f0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#c0d8f8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=121 gui=NONE guibg=bg guifg=#60f080
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#b0d0f0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=34 ctermfg=254 gui=NONE guibg=#008000 guifg=#e0e0e0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=#000080 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=234 ctermfg=111 gui=NONE guibg=#202020 guifg=#6080f0
    CSAHi DiffText term=reverse cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#c0e080 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=34 ctermfg=254 gui=NONE guibg=#008000 guifg=#e0e0e0
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=216 gui=undercurl guibg=bg guifg=fg guisp=#f08060
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=111 gui=undercurl guibg=bg guifg=fg guisp=#6080f0
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=231 gui=undercurl guibg=bg guifg=fg guisp=#f0c0f0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=231 gui=undercurl guibg=bg guifg=fg guisp=#c0d8f8
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=252 gui=NONE guibg=#202020 guifg=#d0d0d0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Error term=reverse cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=#f08060
    CSAHi Todo term=NONE cterm=NONE ctermbg=186 ctermfg=88 gui=NONE guibg=#d0d090 guifg=#800000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#e0c060
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#b0d0f0
    CSAHi NonText term=bold cterm=NONE ctermbg=233 ctermfg=69 gui=NONE guibg=#101010 guifg=#6080f0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#80c0e0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=88 ctermfg=186 gui=NONE guibg=#800000 guifg=#d0d090
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=252 ctermfg=16 gui=NONE guibg=#d0d0d0 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=#800000 guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#c0e080
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=18 ctermfg=252 gui=NONE guibg=#000080 guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#b0b0b0
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=90 ctermfg=252 gui=NONE guibg=#800080 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=252 ctermfg=16 gui=NONE guibg=#d0d0d0 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=18 ctermfg=252 gui=NONE guibg=#000080 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=28 ctermfg=252 gui=NONE guibg=#008000 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=28 ctermfg=252 gui=underline guibg=#008000 guifg=fg
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=28 ctermfg=252 gui=underline guibg=#008000 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=#800000 guifg=fg
    CSAHi CursorLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=#00f000 guifg=#000000
    CSAHi Question term=NONE cterm=NONE ctermbg=186 ctermfg=16 gui=NONE guibg=#d0d090 guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#a6caf0 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#c0c0c0 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#c0c0c0 guifg=#000000
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#f0c0f0
    CSAHi Visual term=reverse cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#a6caf0 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=18 ctermfg=252 gui=NONE guibg=#000080 guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=#f08060
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=186 ctermfg=16 gui=NONE guibg=#d0d090 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=#004000 guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=252 ctermfg=234 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#d0d090
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#80c0e0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#e0c060
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#f0c0f0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#c0d8f8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#60f080
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#b0d0f0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=28 ctermfg=254 gui=NONE guibg=#008000 guifg=#e0e0e0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=18 ctermfg=fg gui=NONE guibg=#000080 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=234 ctermfg=69 gui=NONE guibg=#202020 guifg=#6080f0
    CSAHi DiffText term=reverse cterm=NONE ctermbg=150 ctermfg=16 gui=NONE guibg=#c0e080 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=28 ctermfg=254 gui=NONE guibg=#008000 guifg=#e0e0e0
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=209 gui=undercurl guibg=bg guifg=fg guisp=#f08060
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=69 gui=undercurl guibg=bg guifg=fg guisp=#6080f0
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=219 gui=undercurl guibg=bg guifg=fg guisp=#f0c0f0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=153 gui=undercurl guibg=bg guifg=fg guisp=#c0d8f8
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=86 gui=NONE guibg=#202020 guifg=#d0d0d0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Error term=reverse cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#f08060
    CSAHi Todo term=NONE cterm=NONE ctermbg=57 ctermfg=32 gui=NONE guibg=#d0d090 guifg=#800000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#e0c060
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#b0d0f0
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=39 gui=NONE guibg=#101010 guifg=#6080f0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#80c0e0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=32 ctermfg=57 gui=NONE guibg=#800000 guifg=#d0d090
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=86 ctermfg=16 gui=NONE guibg=#d0d0d0 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=32 ctermfg=fg gui=NONE guibg=#800000 guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#c0e080
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=17 ctermfg=86 gui=NONE guibg=#000080 guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#b0b0b0
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=33 ctermfg=86 gui=NONE guibg=#800080 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=86 ctermfg=16 gui=NONE guibg=#d0d0d0 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=17 ctermfg=86 gui=NONE guibg=#000080 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=20 ctermfg=86 gui=NONE guibg=#008000 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=20 ctermfg=86 gui=underline guibg=#008000 guifg=fg
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=20 ctermfg=86 gui=underline guibg=#008000 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=32 ctermfg=fg gui=NONE guibg=#800000 guifg=fg
    CSAHi CursorLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=#00f000 guifg=#000000
    CSAHi Question term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#d0d090 guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=43 ctermfg=16 gui=NONE guibg=#a6caf0 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=85 ctermfg=16 gui=NONE guibg=#c0c0c0 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=85 ctermfg=16 gui=NONE guibg=#c0c0c0 guifg=#000000
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#f0c0f0
    CSAHi Visual term=reverse cterm=NONE ctermbg=43 ctermfg=16 gui=NONE guibg=#a6caf0 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=17 ctermfg=86 gui=NONE guibg=#000080 guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#f08060
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#d0d090 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#004000 guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=86 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=33 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#d0d090
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#80c0e0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#e0c060
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#f0c0f0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#c0d8f8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#60f080
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#b0d0f0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=20 ctermfg=87 gui=NONE guibg=#008000 guifg=#e0e0e0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#000080 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=33 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=80 ctermfg=39 gui=NONE guibg=#202020 guifg=#6080f0
    CSAHi DiffText term=reverse cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#c0e080 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=20 ctermfg=87 gui=NONE guibg=#008000 guifg=#e0e0e0
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=69 gui=undercurl guibg=bg guifg=fg guisp=#f08060
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=39 gui=undercurl guibg=bg guifg=fg guisp=#6080f0
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=75 gui=undercurl guibg=bg guifg=fg guisp=#f0c0f0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=59 gui=undercurl guibg=bg guifg=fg guisp=#c0d8f8
endif

if 1
    delcommand CSAHi
endif
