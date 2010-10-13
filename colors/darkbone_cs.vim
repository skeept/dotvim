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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=146 gui=NONE guibg=#000000 guifg=#a0a0c0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=146 gui=underline guibg=bg guifg=#a0a0c0
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=#000000 guifg=#ee1111
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=147 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=187 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi Number term=NONE cterm=NONE ctermbg=16 ctermfg=187 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi Boolean term=NONE cterm=NONE ctermbg=16 ctermfg=187 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#f0b040
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#404060
    CSAHi NonText term=bold cterm=NONE ctermbg=17 ctermfg=103 gui=NONE guibg=#101020 guifg=#606080
    CSAHi Directory term=bold cterm=bold ctermbg=16 ctermfg=189 gui=bold guibg=#000000 guifg=#e0e0ff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=#000000 guifg=#ee1111
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#c0c0ff guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#c0c0ff guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=146 gui=bold guibg=#000000 guifg=#a0a0c0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=146 gui=bold guibg=#000000 guifg=#a0a0c0
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=103 gui=NONE guibg=#000000 guifg=#606080
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#202040 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=61 ctermfg=146 gui=NONE guibg=#404080 guifg=#a0a0c0
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#202040 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=146 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=16 ctermfg=103 gui=underline guibg=black guifg=#606080
    CSAHi TabLineSel term=bold cterm=bold ctermbg=103 ctermfg=189 gui=bold guibg=#606080 guifg=#c0c0ff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=146 gui=NONE guibg=black guifg=#a0a0c0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#303050 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#303050 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=146 ctermfg=16 gui=NONE guibg=#a0a0c0 guifg=#000000
    CSAHi Char term=NONE cterm=NONE ctermbg=16 ctermfg=187 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=146 ctermfg=16 gui=NONE guibg=#a0a0c0 guifg=#000000
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=146 gui=bold guibg=#000000 guifg=#a0a0c0
    CSAHi StatusLine term=reverse,bold cterm=bold,underline ctermbg=16 ctermfg=189 gui=bold,underline guibg=#000000 guifg=#c0c0ff
    CSAHi StatusLineNC term=reverse cterm=bold,underline ctermbg=16 ctermfg=103 gui=bold,underline guibg=#000000 guifg=#606080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=103 ctermfg=103 gui=reverse guibg=#606080 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=16 ctermfg=189 gui=bold guibg=#000000 guifg=#c0c0ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=103 ctermfg=16 gui=NONE guibg=#707090 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=16 ctermfg=146 gui=bold,underline guibg=#000000 guifg=#a0a0c0
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=#000000 guifg=#ee1111
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#c0c0ff guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=146 gui=NONE guibg=#000000 guifg=#a0a0c0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=146 ctermfg=16 gui=NONE guibg=#a0a0c0 guifg=#000000
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=61 ctermfg=146 gui=NONE guibg=#404080 guifg=#a0a0c0
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=103 gui=NONE guibg=bg guifg=#606080
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=217 gui=NONE guibg=#000000 guifg=#f0a0b0
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=244 gui=NONE guibg=#000000 guifg=#808080
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=147 gui=NONE guibg=bg guifg=#8090f0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=147 gui=NONE guibg=bg guifg=#8090f0
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#e0e0ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#e0e0ff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=22 ctermfg=146 gui=NONE guibg=#102010 guifg=#a0a0c0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=147 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=147 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=147 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi DiffText term=reverse cterm=bold ctermbg=16 ctermfg=147 gui=bold guibg=#000000 guifg=#8090f0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=Cyan
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=189 gui=NONE guibg=#000000 guifg=#a0a0c0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=189 gui=underline guibg=bg guifg=#a0a0c0
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=#000000 guifg=#ee1111
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=147 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=229 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi Number term=NONE cterm=NONE ctermbg=16 ctermfg=229 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi Boolean term=NONE cterm=NONE ctermbg=16 ctermfg=229 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#f0b040
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#404060
    CSAHi NonText term=bold cterm=NONE ctermbg=17 ctermfg=103 gui=NONE guibg=#101020 guifg=#606080
    CSAHi Directory term=bold cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=#000000 guifg=#e0e0ff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=#000000 guifg=#ee1111
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#c0c0ff guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#c0c0ff guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=189 gui=bold guibg=#000000 guifg=#a0a0c0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=189 gui=bold guibg=#000000 guifg=#a0a0c0
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=103 gui=NONE guibg=#000000 guifg=#606080
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#202040 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=103 ctermfg=189 gui=NONE guibg=#404080 guifg=#a0a0c0
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#202040 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=189 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=16 ctermfg=103 gui=underline guibg=black guifg=#606080
    CSAHi TabLineSel term=bold cterm=bold ctermbg=103 ctermfg=231 gui=bold guibg=#606080 guifg=#c0c0ff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=189 gui=NONE guibg=black guifg=#a0a0c0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#303050 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#303050 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#a0a0c0 guifg=#000000
    CSAHi Char term=NONE cterm=NONE ctermbg=16 ctermfg=229 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#a0a0c0 guifg=#000000
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=189 gui=bold guibg=#000000 guifg=#a0a0c0
    CSAHi StatusLine term=reverse,bold cterm=bold,underline ctermbg=16 ctermfg=231 gui=bold,underline guibg=#000000 guifg=#c0c0ff
    CSAHi StatusLineNC term=reverse cterm=bold,underline ctermbg=16 ctermfg=103 gui=bold,underline guibg=#000000 guifg=#606080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=103 ctermfg=103 gui=reverse guibg=#606080 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=#000000 guifg=#c0c0ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#707090 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=16 ctermfg=189 gui=bold,underline guibg=#000000 guifg=#a0a0c0
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=#000000 guifg=#ee1111
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#c0c0ff guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=189 gui=NONE guibg=#000000 guifg=#a0a0c0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#a0a0c0 guifg=#000000
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=103 ctermfg=189 gui=NONE guibg=#404080 guifg=#a0a0c0
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=103 gui=NONE guibg=bg guifg=#606080
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=224 gui=NONE guibg=#000000 guifg=#f0a0b0
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=244 gui=NONE guibg=#000000 guifg=#808080
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=147 gui=NONE guibg=bg guifg=#8090f0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=147 gui=NONE guibg=bg guifg=#8090f0
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#e0e0ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#e0e0ff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=22 ctermfg=189 gui=NONE guibg=#102010 guifg=#a0a0c0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=147 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=147 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=147 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi DiffText term=reverse cterm=bold ctermbg=16 ctermfg=147 gui=bold guibg=#000000 guifg=#8090f0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=Cyan
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=145 gui=NONE guibg=#000000 guifg=#a0a0c0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=145 gui=underline guibg=bg guifg=#a0a0c0
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=#000000 guifg=#ee1111
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=105 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=186 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi Number term=NONE cterm=NONE ctermbg=16 ctermfg=186 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi Boolean term=NONE cterm=NONE ctermbg=16 ctermfg=186 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#f0b040
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#404060
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=60 gui=NONE guibg=#101020 guifg=#606080
    CSAHi Directory term=bold cterm=bold ctermbg=16 ctermfg=189 gui=bold guibg=#000000 guifg=#e0e0ff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=#000000 guifg=#ee1111
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=147 ctermfg=16 gui=NONE guibg=#c0c0ff guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=147 ctermfg=16 gui=NONE guibg=#c0c0ff guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=145 gui=bold guibg=#000000 guifg=#a0a0c0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=145 gui=bold guibg=#000000 guifg=#a0a0c0
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=60 gui=NONE guibg=#000000 guifg=#606080
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#202040 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=60 ctermfg=145 gui=NONE guibg=#404080 guifg=#a0a0c0
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#202040 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=16 ctermfg=60 gui=underline guibg=black guifg=#606080
    CSAHi TabLineSel term=bold cterm=bold ctermbg=60 ctermfg=147 gui=bold guibg=#606080 guifg=#c0c0ff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=145 gui=NONE guibg=black guifg=#a0a0c0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#303050 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#303050 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#a0a0c0 guifg=#000000
    CSAHi Char term=NONE cterm=NONE ctermbg=16 ctermfg=186 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#a0a0c0 guifg=#000000
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=145 gui=bold guibg=#000000 guifg=#a0a0c0
    CSAHi StatusLine term=reverse,bold cterm=bold,underline ctermbg=16 ctermfg=147 gui=bold,underline guibg=#000000 guifg=#c0c0ff
    CSAHi StatusLineNC term=reverse cterm=bold,underline ctermbg=16 ctermfg=60 gui=bold,underline guibg=#000000 guifg=#606080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=60 ctermfg=60 gui=reverse guibg=#606080 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=16 ctermfg=147 gui=bold guibg=#000000 guifg=#c0c0ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=60 ctermfg=16 gui=NONE guibg=#707090 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=16 ctermfg=145 gui=bold,underline guibg=#000000 guifg=#a0a0c0
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=#000000 guifg=#ee1111
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=147 ctermfg=16 gui=NONE guibg=#c0c0ff guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=145 gui=NONE guibg=#000000 guifg=#a0a0c0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#a0a0c0 guifg=#000000
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=60 ctermfg=145 gui=NONE guibg=#404080 guifg=#a0a0c0
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#606080
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=217 gui=NONE guibg=#000000 guifg=#f0a0b0
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=244 gui=NONE guibg=#000000 guifg=#808080
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=105 gui=NONE guibg=bg guifg=#8090f0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=105 gui=NONE guibg=bg guifg=#8090f0
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#e0e0ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#e0e0ff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=145 gui=NONE guibg=#102010 guifg=#a0a0c0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=105 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=105 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=105 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi DiffText term=reverse cterm=bold ctermbg=16 ctermfg=105 gui=bold guibg=#000000 guifg=#8090f0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=Cyan
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=38 gui=NONE guibg=#000000 guifg=#a0a0c0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=#a0a0c0
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=64 gui=NONE guibg=#000000 guifg=#ee1111
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=39 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=57 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi Number term=NONE cterm=NONE ctermbg=16 ctermfg=57 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi Boolean term=NONE cterm=NONE ctermbg=16 ctermfg=57 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#f0b040
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=#404060
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=#101020 guifg=#606080
    CSAHi Directory term=bold cterm=bold ctermbg=16 ctermfg=59 gui=bold guibg=#000000 guifg=#e0e0ff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=16 ctermfg=64 gui=NONE guibg=#000000 guifg=#ee1111
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=NONE guibg=#c0c0ff guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=NONE guibg=#c0c0ff guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=38 gui=bold guibg=#000000 guifg=#a0a0c0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=38 gui=bold guibg=#000000 guifg=#a0a0c0
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=#000000 guifg=#606080
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#202040 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=17 ctermfg=38 gui=NONE guibg=#404080 guifg=#a0a0c0
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#202040 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=38 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=16 ctermfg=37 gui=underline guibg=black guifg=#606080
    CSAHi TabLineSel term=bold cterm=bold ctermbg=37 ctermfg=59 gui=bold guibg=#606080 guifg=#c0c0ff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=38 gui=NONE guibg=black guifg=#a0a0c0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#303050 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#303050 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=38 ctermfg=16 gui=NONE guibg=#a0a0c0 guifg=#000000
    CSAHi Char term=NONE cterm=NONE ctermbg=16 ctermfg=57 gui=NONE guibg=#000000 guifg=#d0e080
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=38 ctermfg=16 gui=NONE guibg=#a0a0c0 guifg=#000000
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=38 gui=bold guibg=#000000 guifg=#a0a0c0
    CSAHi StatusLine term=reverse,bold cterm=bold,underline ctermbg=16 ctermfg=59 gui=bold,underline guibg=#000000 guifg=#c0c0ff
    CSAHi StatusLineNC term=reverse cterm=bold,underline ctermbg=16 ctermfg=37 gui=bold,underline guibg=#000000 guifg=#606080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=37 ctermfg=37 gui=reverse guibg=#606080 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=16 ctermfg=59 gui=bold guibg=#000000 guifg=#c0c0ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=#707090 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=16 ctermfg=38 gui=bold,underline guibg=#000000 guifg=#a0a0c0
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=64 gui=NONE guibg=#000000 guifg=#ee1111
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=59 ctermfg=16 gui=NONE guibg=#c0c0ff guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=38 gui=NONE guibg=#000000 guifg=#a0a0c0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=38 ctermfg=16 gui=NONE guibg=#a0a0c0 guifg=#000000
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=17 ctermfg=38 gui=NONE guibg=#404080 guifg=#a0a0c0
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#606080
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=70 gui=NONE guibg=#000000 guifg=#f0a0b0
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#000000 guifg=#808080
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#8090f0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#8090f0
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#e0e0ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#e0e0ff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=38 gui=NONE guibg=#102010 guifg=#a0a0c0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=39 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=39 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=39 gui=NONE guibg=#000000 guifg=#8090f0
    CSAHi DiffText term=reverse cterm=bold ctermbg=16 ctermfg=39 gui=bold guibg=#000000 guifg=#8090f0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=31 gui=NONE guibg=#000000 guifg=Cyan
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
