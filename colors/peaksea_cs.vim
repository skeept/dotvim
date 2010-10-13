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
    CSAHi Normal term=NONE cterm=NONE ctermbg=254 ctermfg=16 gui=NONE guibg=#e0e0e0 guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=104 gui=underline guibg=bg guifg=#6a5acd
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=#c03000
    CSAHi Todo term=NONE cterm=NONE ctermbg=187 ctermfg=124 gui=NONE guibg=#e0e090 guifg=#800000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=136 gui=NONE guibg=bg guifg=#907000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#1050a0
    CSAHi NonText term=bold cterm=bold ctermbg=252 ctermfg=25 gui=bold guibg=#d0d0d0 guifg=#002090
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=133 gui=NONE guibg=bg guifg=#a030a0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=217 ctermfg=16 gui=NONE guibg=#f0b090 guifg=fg
    CSAHi IncSearch term=reverse cterm=bold ctermbg=138 ctermfg=255 gui=bold guibg=#806060 guifg=#f0f0f0
    CSAHi Search term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#f8f8f8 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=70 gui=bold guibg=bg guifg=#489000
    CSAHi ModeMsg term=bold cterm=bold ctermbg=146 ctermfg=16 gui=bold guibg=#b0b0e0 guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#686868
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=182 ctermfg=16 gui=NONE guibg=#e0b0e0 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=138 ctermfg=255 gui=NONE guibg=#806060 guifg=#f0f0f0
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#c0c0c0 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#c0e080 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=250 ctermfg=16 gui=underline guibg=#c0c0c0 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=250 ctermfg=16 gui=underline guibg=#c0c0c0 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=217 ctermfg=fg gui=NONE guibg=#f0b090 guifg=fg
    CSAHi CursorLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=34 ctermfg=255 gui=NONE guibg=#008000 guifg=#f0f0f0
    CSAHi Question term=NONE cterm=bold ctermbg=187 ctermfg=16 gui=bold guibg=#d0d090 guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#a6caf0 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=250 ctermfg=16 gui=bold guibg=#c0c0c0 guifg=fg
    CSAHi VertSplit term=reverse cterm=bold ctermbg=250 ctermfg=16 gui=bold guibg=#c0c0c0 guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=133 gui=bold guibg=bg guifg=#a030a0
    CSAHi Visual term=reverse cterm=bold ctermbg=153 ctermfg=fg gui=bold guibg=#a6caf0 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=146 ctermfg=16 gui=NONE guibg=#b0b0e0 guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=130 gui=NONE guibg=bg guifg=#b02000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#d0d090 guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=151 ctermfg=fg gui=NONE guibg=#b0e0b0 guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=187 ctermfg=fg gui=NONE guibg=#c0e080 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=100 gui=NONE guibg=bg guifg=#606000
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=30 gui=NONE guibg=bg guifg=#007068
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=136 gui=NONE guibg=bg guifg=#907000
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=133 gui=NONE guibg=bg guifg=#a030a0
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#2060a8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=35 gui=NONE guibg=bg guifg=#009030
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=31 gui=bold guibg=bg guifg=#0850a0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=151 ctermfg=16 gui=NONE guibg=#90e090 guifg=fg
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=146 ctermfg=fg gui=NONE guibg=#b0b0e0 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=182 ctermfg=fg gui=NONE guibg=#e0b0e0 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=252 ctermfg=25 gui=bold guibg=#d0d0d0 guifg=#002090
    CSAHi DiffText term=reverse cterm=bold ctermbg=187 ctermfg=fg gui=bold guibg=#c0e080 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=151 ctermfg=16 gui=NONE guibg=#90e090 guifg=fg
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=166 gui=undercurl guibg=bg guifg=fg guisp=#c03000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=#2060a8
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=133 gui=undercurl guibg=bg guifg=fg guisp=#a030a0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=#007068
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=254 ctermfg=16 gui=NONE guibg=#e0e0e0 guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=105 gui=underline guibg=bg guifg=#6a5acd
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=bg ctermfg=202 gui=NONE guibg=bg guifg=#c03000
    CSAHi Todo term=NONE cterm=NONE ctermbg=229 ctermfg=124 gui=NONE guibg=#e0e090 guifg=#800000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=142 gui=NONE guibg=bg guifg=#907000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#1050a0
    CSAHi NonText term=bold cterm=bold ctermbg=252 ctermfg=25 gui=bold guibg=#d0d0d0 guifg=#002090
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=170 gui=NONE guibg=bg guifg=#a030a0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=223 ctermfg=16 gui=NONE guibg=#f0b090 guifg=fg
    CSAHi IncSearch term=reverse cterm=bold ctermbg=138 ctermfg=255 gui=bold guibg=#806060 guifg=#f0f0f0
    CSAHi Search term=reverse cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#f8f8f8 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=106 gui=bold guibg=bg guifg=#489000
    CSAHi ModeMsg term=bold cterm=bold ctermbg=189 ctermfg=16 gui=bold guibg=#b0b0e0 guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=242 gui=NONE guibg=bg guifg=#686868
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=16 gui=NONE guibg=#e0b0e0 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=138 ctermfg=255 gui=NONE guibg=#806060 guifg=#f0f0f0
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#c0c0c0 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#c0e080 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=250 ctermfg=16 gui=underline guibg=#c0c0c0 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=250 ctermfg=16 gui=underline guibg=#c0c0c0 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=223 ctermfg=fg gui=NONE guibg=#f0b090 guifg=fg
    CSAHi CursorLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=34 ctermfg=255 gui=NONE guibg=#008000 guifg=#f0f0f0
    CSAHi Question term=NONE cterm=bold ctermbg=229 ctermfg=16 gui=bold guibg=#d0d090 guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=195 ctermfg=16 gui=bold guibg=#a6caf0 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=250 ctermfg=16 gui=bold guibg=#c0c0c0 guifg=fg
    CSAHi VertSplit term=reverse cterm=bold ctermbg=250 ctermfg=16 gui=bold guibg=#c0c0c0 guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=170 gui=bold guibg=bg guifg=#a030a0
    CSAHi Visual term=reverse cterm=bold ctermbg=195 ctermfg=fg gui=bold guibg=#a6caf0 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#b0b0e0 guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=#b02000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#d0d090 guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#b0e0b0 guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=229 ctermfg=fg gui=NONE guibg=#c0e080 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=100 gui=NONE guibg=bg guifg=#606000
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#007068
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=142 gui=NONE guibg=bg guifg=#907000
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=170 gui=NONE guibg=bg guifg=#a030a0
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=#2060a8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=35 gui=NONE guibg=bg guifg=#009030
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=32 gui=bold guibg=bg guifg=#0850a0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=157 ctermfg=16 gui=NONE guibg=#90e090 guifg=fg
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=189 ctermfg=fg gui=NONE guibg=#b0b0e0 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=#e0b0e0 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=252 ctermfg=25 gui=bold guibg=#d0d0d0 guifg=#002090
    CSAHi DiffText term=reverse cterm=bold ctermbg=229 ctermfg=fg gui=bold guibg=#c0e080 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=157 ctermfg=16 gui=NONE guibg=#90e090 guifg=fg
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=202 gui=undercurl guibg=bg guifg=fg guisp=#c03000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=68 gui=undercurl guibg=bg guifg=fg guisp=#2060a8
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=170 gui=undercurl guibg=bg guifg=fg guisp=#a030a0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=36 gui=undercurl guibg=bg guifg=fg guisp=#007068
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=254 ctermfg=16 gui=NONE guibg=#e0e0e0 guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=62 gui=underline guibg=bg guifg=#6a5acd
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=bg ctermfg=130 gui=NONE guibg=bg guifg=#c03000
    CSAHi Todo term=NONE cterm=NONE ctermbg=186 ctermfg=88 gui=NONE guibg=#e0e090 guifg=#800000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=94 gui=NONE guibg=bg guifg=#907000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=#1050a0
    CSAHi NonText term=bold cterm=bold ctermbg=252 ctermfg=18 gui=bold guibg=#d0d0d0 guifg=#002090
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=133 gui=NONE guibg=bg guifg=#a030a0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=216 ctermfg=16 gui=NONE guibg=#f0b090 guifg=fg
    CSAHi IncSearch term=reverse cterm=bold ctermbg=95 ctermfg=255 gui=bold guibg=#806060 guifg=#f0f0f0
    CSAHi Search term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#f8f8f8 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=64 gui=bold guibg=bg guifg=#489000
    CSAHi ModeMsg term=bold cterm=bold ctermbg=146 ctermfg=16 gui=bold guibg=#b0b0e0 guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=242 gui=NONE guibg=bg guifg=#686868
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=182 ctermfg=16 gui=NONE guibg=#e0b0e0 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=95 ctermfg=255 gui=NONE guibg=#806060 guifg=#f0f0f0
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#c0c0c0 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=150 ctermfg=16 gui=NONE guibg=#c0e080 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=250 ctermfg=16 gui=underline guibg=#c0c0c0 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=250 ctermfg=16 gui=underline guibg=#c0c0c0 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=216 ctermfg=fg gui=NONE guibg=#f0b090 guifg=fg
    CSAHi CursorLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=28 ctermfg=255 gui=NONE guibg=#008000 guifg=#f0f0f0
    CSAHi Question term=NONE cterm=bold ctermbg=186 ctermfg=16 gui=bold guibg=#d0d090 guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#a6caf0 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=250 ctermfg=16 gui=bold guibg=#c0c0c0 guifg=fg
    CSAHi VertSplit term=reverse cterm=bold ctermbg=250 ctermfg=16 gui=bold guibg=#c0c0c0 guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=133 gui=bold guibg=bg guifg=#a030a0
    CSAHi Visual term=reverse cterm=bold ctermbg=153 ctermfg=fg gui=bold guibg=#a6caf0 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=146 ctermfg=16 gui=NONE guibg=#b0b0e0 guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=#b02000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=186 ctermfg=16 gui=NONE guibg=#d0d090 guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=151 ctermfg=fg gui=NONE guibg=#b0e0b0 guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=150 ctermfg=fg gui=NONE guibg=#c0e080 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#606000
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#007068
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=94 gui=NONE guibg=bg guifg=#907000
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=133 gui=NONE guibg=bg guifg=#a030a0
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=25 gui=bold guibg=bg guifg=#2060a8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#009030
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=25 gui=bold guibg=bg guifg=#0850a0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=114 ctermfg=16 gui=NONE guibg=#90e090 guifg=fg
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=146 ctermfg=fg gui=NONE guibg=#b0b0e0 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=182 ctermfg=fg gui=NONE guibg=#e0b0e0 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=252 ctermfg=18 gui=bold guibg=#d0d0d0 guifg=#002090
    CSAHi DiffText term=reverse cterm=bold ctermbg=150 ctermfg=fg gui=bold guibg=#c0e080 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=114 ctermfg=16 gui=NONE guibg=#90e090 guifg=fg
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=130 gui=undercurl guibg=bg guifg=fg guisp=#c03000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=25 gui=undercurl guibg=bg guifg=fg guisp=#2060a8
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=133 gui=undercurl guibg=bg guifg=fg guisp=#a030a0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=23 gui=undercurl guibg=bg guifg=fg guisp=#007068
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=87 ctermfg=16 gui=NONE guibg=#e0e0e0 guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=#6a5acd
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=#c03000
    CSAHi Todo term=NONE cterm=NONE ctermbg=57 ctermfg=32 gui=NONE guibg=#e0e090 guifg=#800000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#907000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#1050a0
    CSAHi NonText term=bold cterm=bold ctermbg=86 ctermfg=17 gui=bold guibg=#d0d0d0 guifg=#002090
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#a030a0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=73 ctermfg=16 gui=NONE guibg=#f0b090 guifg=fg
    CSAHi IncSearch term=reverse cterm=bold ctermbg=37 ctermfg=87 gui=bold guibg=#806060 guifg=#f0f0f0
    CSAHi Search term=reverse cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=#f8f8f8 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=36 gui=bold guibg=bg guifg=#489000
    CSAHi ModeMsg term=bold cterm=bold ctermbg=58 ctermfg=16 gui=bold guibg=#b0b0e0 guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=82 gui=NONE guibg=bg guifg=#686868
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=58 ctermfg=16 gui=NONE guibg=#e0b0e0 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=37 ctermfg=87 gui=NONE guibg=#806060 guifg=#f0f0f0
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=16 gui=NONE guibg=#c0c0c0 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#c0e080 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=85 ctermfg=16 gui=underline guibg=#c0c0c0 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=85 ctermfg=16 gui=underline guibg=#c0c0c0 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=73 ctermfg=fg gui=NONE guibg=#f0b090 guifg=fg
    CSAHi CursorLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=20 ctermfg=87 gui=NONE guibg=#008000 guifg=#f0f0f0
    CSAHi Question term=NONE cterm=bold ctermbg=57 ctermfg=16 gui=bold guibg=#d0d090 guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=43 ctermfg=16 gui=bold guibg=#a6caf0 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=85 ctermfg=16 gui=bold guibg=#c0c0c0 guifg=fg
    CSAHi VertSplit term=reverse cterm=bold ctermbg=85 ctermfg=16 gui=bold guibg=#c0c0c0 guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=33 gui=bold guibg=bg guifg=#a030a0
    CSAHi Visual term=reverse cterm=bold ctermbg=43 ctermfg=fg gui=bold guibg=#a6caf0 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=58 ctermfg=16 gui=NONE guibg=#b0b0e0 guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=#b02000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#d0d090 guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#b0e0b0 guifg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=57 ctermfg=fg gui=NONE guibg=#c0e080 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#606000
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#007068
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#907000
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#a030a0
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#2060a8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=#009030
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#0850a0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=41 ctermfg=16 gui=NONE guibg=#90e090 guifg=fg
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#b0b0e0 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#e0b0e0 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=86 ctermfg=17 gui=bold guibg=#d0d0d0 guifg=#002090
    CSAHi DiffText term=reverse cterm=bold ctermbg=57 ctermfg=fg gui=bold guibg=#c0e080 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=41 ctermfg=16 gui=NONE guibg=#90e090 guifg=fg
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=48 gui=undercurl guibg=bg guifg=fg guisp=#c03000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#2060a8
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=33 gui=undercurl guibg=bg guifg=fg guisp=#a030a0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#007068
endif

if 1
    delcommand CSAHi
endif
