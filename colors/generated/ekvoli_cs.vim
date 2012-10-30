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
    CSAHi Normal term=NONE cterm=NONE ctermbg=17 ctermfg=231 gui=NONE guibg=#001535 guifg=white
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=104 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold,undercurl ctermbg=91 ctermfg=231 gui=bold,italic,undercurl guibg=#6000a0 guifg=White guisp=white
    CSAHi Todo term=NONE cterm=underline ctermbg=38 ctermfg=231 gui=underline guibg=#00a0d0 guifg=white
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=44 gui=NONE guibg=bg guifg=#00c0e0
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=#6590f0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=44 gui=NONE guibg=bg guifg=#00c0e0
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=69 ctermfg=231 gui=bold,italic guibg=#287eff guifg=white
    CSAHi IncSearch term=reverse cterm=bold ctermbg=103 ctermfg=231 gui=bold guibg=#667799 guifg=white
    CSAHi Search term=reverse cterm=bold ctermbg=103 ctermfg=231 gui=bold guibg=#667799 guifg=white
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=80 gui=bold guibg=bg guifg=#22cce2
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=80 gui=bold guibg=bg guifg=#22cce2
    CSAHi LineNr term=underline cterm=bold ctermbg=bg ctermfg=109 gui=bold guibg=bg guifg=#5080b0
    CSAHi vCursor term=NONE cterm=bold ctermbg=231 ctermfg=17 gui=reverse,bold guibg=bg guifg=white
    CSAHi nCursor term=NONE cterm=bold ctermbg=231 ctermfg=17 gui=reverse,bold guibg=bg guifg=white
    CSAHi otlTab0 term=NONE cterm=bold,underline ctermbg=bg ctermfg=231 gui=bold,underline guibg=bg guifg=#eeeeff
    CSAHi otlTab1 term=NONE cterm=bold,underline ctermbg=bg ctermfg=69 gui=bold,underline guibg=bg guifg=#3377ee
    CSAHi otlTab2 term=NONE cterm=bold,underline ctermbg=bg ctermfg=80 gui=bold,underline guibg=bg guifg=#22cae2
    CSAHi otlTab3 term=NONE cterm=bold,underline ctermbg=bg ctermfg=141 gui=bold,underline guibg=bg guifg=#9966ff
    CSAHi otlTab5 term=NONE cterm=bold,underline ctermbg=bg ctermfg=74 gui=bold,underline guibg=bg guifg=#22aae2
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=31 ctermfg=231 gui=NONE guibg=#005090 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=68 ctermfg=231 gui=NONE guibg=#3070c0 guifg=white
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=24 ctermfg=fg gui=NONE guibg=#05456f guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=24 ctermfg=fg gui=NONE guibg=#05456f guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=231 ctermfg=231 gui=reverse,bold guibg=fg guifg=white
    CSAHi rCursor term=NONE cterm=bold ctermbg=231 ctermfg=17 gui=reverse,bold guibg=bg guifg=white
    CSAHi iCursor term=NONE cterm=bold ctermbg=231 ctermfg=17 gui=reverse,bold guibg=bg guifg=white
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#22cce2
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=24 ctermfg=231 gui=bold guibg=#104075 guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=24 ctermfg=111 gui=NONE guibg=#104075 guifg=#65a0f0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=67 ctermfg=67 gui=NONE guibg=#305885 guifg=#305885
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#00a0f0
    CSAHi Visual term=reverse cterm=bold ctermbg=74 ctermfg=231 gui=bold guibg=#2080c0 guifg=white
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=109 ctermfg=231 gui=bold guibg=#6080a0 guifg=white
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=lightblue
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=38 ctermfg=231 gui=NONE guibg=#0080c0 guifg=white
    CSAHi Folded term=NONE cterm=NONE ctermbg=24 ctermfg=111 gui=italic guibg=#122555 guifg=#65b0f6
    CSAHi otlTab8 term=NONE cterm=bold,underline ctermbg=bg ctermfg=33 gui=bold,underline guibg=bg guifg=#1166ee
    CSAHi otlTab9 term=NONE cterm=bold,underline ctermbg=bg ctermfg=153 gui=bold,underline guibg=bg guifg=#99ddee
    CSAHi otlTodo term=NONE cterm=bold,underline ctermbg=38 ctermfg=231 gui=bold,underline guibg=#00a0d0 guifg=white
    CSAHi otlTagRef term=NONE cterm=NONE ctermbg=139 ctermfg=231 gui=NONE guibg=#8070a0 guifg=white
    CSAHi otlTagDef term=NONE cterm=NONE ctermbg=31 ctermfg=231 gui=NONE guibg=#005090 guifg=white
    CSAHi lCursor term=NONE cterm=bold ctermbg=231 ctermfg=231 gui=reverse,bold guibg=fg guifg=white
    CSAHi MatchParen term=reverse cterm=bold ctermbg=68 ctermfg=231 gui=bold guibg=#3070c0 guifg=white
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=146 gui=italic guibg=bg guifg=#9590d5
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=italic guibg=bg guifg=#87c6f0
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#50a0e0
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#7fe9ff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=white
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#3f8fff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#90bfd0
    CSAHi otlTab4 term=NONE cterm=bold,underline ctermbg=bg ctermfg=153 gui=bold,underline guibg=bg guifg=#92caf2
    CSAHi otlTab7 term=NONE cterm=bold,underline ctermbg=bg ctermfg=80 gui=bold,underline guibg=bg guifg=#22bae2
    CSAHi otlTab6 term=NONE cterm=bold,underline ctermbg=bg ctermfg=141 gui=bold,underline guibg=bg guifg=#8866ee
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=24 ctermfg=231 gui=NONE guibg=#103366 guifg=white
    CSAHi DiffAdd term=bold cterm=bold ctermbg=73 ctermfg=231 gui=bold guibg=#2080a0 guifg=white
    CSAHi DiffChange term=bold cterm=bold ctermbg=73 ctermfg=231 gui=bold guibg=#2080a0 guifg=white
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=67 ctermfg=231 gui=NONE guibg=#306080 guifg=white
    CSAHi DiffText term=reverse cterm=bold ctermbg=139 ctermfg=231 gui=bold guibg=#8070a0 guifg=white
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=117 gui=italic,undercurl guibg=bg guifg=fg guisp=#76daff
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=110 gui=undercurl guibg=bg guifg=fg guisp=#7ba2ba
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=147 gui=undercurl guibg=bg guifg=fg guisp=#8080f0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=188 gui=undercurl guibg=bg guifg=fg guisp=#c0c0e0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=17 ctermfg=255 gui=NONE guibg=#001535 guifg=white
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=105 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold,undercurl ctermbg=92 ctermfg=255 gui=bold,italic,undercurl guibg=#6000a0 guifg=White guisp=white
    CSAHi Todo term=NONE cterm=underline ctermbg=45 ctermfg=255 gui=underline guibg=#00a0d0 guifg=white
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00c0e0
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=#6590f0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00c0e0
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=75 ctermfg=255 gui=bold,italic guibg=#287eff guifg=white
    CSAHi IncSearch term=reverse cterm=bold ctermbg=110 ctermfg=255 gui=bold guibg=#667799 guifg=white
    CSAHi Search term=reverse cterm=bold ctermbg=110 ctermfg=255 gui=bold guibg=#667799 guifg=white
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=87 gui=bold guibg=bg guifg=#22cce2
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=87 gui=bold guibg=bg guifg=#22cce2
    CSAHi LineNr term=underline cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#5080b0
    CSAHi vCursor term=NONE cterm=bold ctermbg=255 ctermfg=17 gui=reverse,bold guibg=bg guifg=white
    CSAHi nCursor term=NONE cterm=bold ctermbg=255 ctermfg=17 gui=reverse,bold guibg=bg guifg=white
    CSAHi otlTab0 term=NONE cterm=bold,underline ctermbg=bg ctermfg=255 gui=bold,underline guibg=bg guifg=#eeeeff
    CSAHi otlTab1 term=NONE cterm=bold,underline ctermbg=bg ctermfg=75 gui=bold,underline guibg=bg guifg=#3377ee
    CSAHi otlTab2 term=NONE cterm=bold,underline ctermbg=bg ctermfg=87 gui=bold,underline guibg=bg guifg=#22cae2
    CSAHi otlTab3 term=NONE cterm=bold,underline ctermbg=bg ctermfg=177 gui=bold,underline guibg=bg guifg=#9966ff
    CSAHi otlTab5 term=NONE cterm=bold,underline ctermbg=bg ctermfg=81 gui=bold,underline guibg=bg guifg=#22aae2
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=31 ctermfg=255 gui=NONE guibg=#005090 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=75 ctermfg=255 gui=NONE guibg=#3070c0 guifg=white
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=#05456f guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=#05456f guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=255 ctermfg=255 gui=reverse,bold guibg=fg guifg=white
    CSAHi rCursor term=NONE cterm=bold ctermbg=255 ctermfg=17 gui=reverse,bold guibg=bg guifg=white
    CSAHi iCursor term=NONE cterm=bold ctermbg=255 ctermfg=17 gui=reverse,bold guibg=bg guifg=white
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#22cce2
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=31 ctermfg=255 gui=bold guibg=#104075 guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=31 ctermfg=117 gui=NONE guibg=#104075 guifg=#65a0f0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=67 ctermfg=67 gui=NONE guibg=#305885 guifg=#305885
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#00a0f0
    CSAHi Visual term=reverse cterm=bold ctermbg=75 ctermfg=255 gui=bold guibg=#2080c0 guifg=white
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=110 ctermfg=255 gui=bold guibg=#6080a0 guifg=white
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=lightblue
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=39 ctermfg=255 gui=NONE guibg=#0080c0 guifg=white
    CSAHi Folded term=NONE cterm=NONE ctermbg=24 ctermfg=117 gui=italic guibg=#122555 guifg=#65b0f6
    CSAHi otlTab8 term=NONE cterm=bold,underline ctermbg=bg ctermfg=33 gui=bold,underline guibg=bg guifg=#1166ee
    CSAHi otlTab9 term=NONE cterm=bold,underline ctermbg=bg ctermfg=195 gui=bold,underline guibg=bg guifg=#99ddee
    CSAHi otlTodo term=NONE cterm=bold,underline ctermbg=45 ctermfg=255 gui=bold,underline guibg=#00a0d0 guifg=white
    CSAHi otlTagRef term=NONE cterm=NONE ctermbg=146 ctermfg=255 gui=NONE guibg=#8070a0 guifg=white
    CSAHi otlTagDef term=NONE cterm=NONE ctermbg=31 ctermfg=255 gui=NONE guibg=#005090 guifg=white
    CSAHi lCursor term=NONE cterm=bold ctermbg=255 ctermfg=255 gui=reverse,bold guibg=fg guifg=white
    CSAHi MatchParen term=reverse cterm=bold ctermbg=75 ctermfg=255 gui=bold guibg=#3070c0 guifg=white
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=183 gui=italic guibg=bg guifg=#9590d5
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=italic guibg=bg guifg=#87c6f0
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=117 gui=bold guibg=bg guifg=#50a0e0
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#7fe9ff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=white
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#3f8fff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#90bfd0
    CSAHi otlTab4 term=NONE cterm=bold,underline ctermbg=bg ctermfg=159 gui=bold,underline guibg=bg guifg=#92caf2
    CSAHi otlTab7 term=NONE cterm=bold,underline ctermbg=bg ctermfg=81 gui=bold,underline guibg=bg guifg=#22bae2
    CSAHi otlTab6 term=NONE cterm=bold,underline ctermbg=bg ctermfg=141 gui=bold,underline guibg=bg guifg=#8866ee
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=24 ctermfg=255 gui=NONE guibg=#103366 guifg=white
    CSAHi DiffAdd term=bold cterm=bold ctermbg=74 ctermfg=255 gui=bold guibg=#2080a0 guifg=white
    CSAHi DiffChange term=bold cterm=bold ctermbg=74 ctermfg=255 gui=bold guibg=#2080a0 guifg=white
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=67 ctermfg=255 gui=NONE guibg=#306080 guifg=white
    CSAHi DiffText term=reverse cterm=bold ctermbg=146 ctermfg=255 gui=bold guibg=#8070a0 guifg=white
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=159 gui=italic,undercurl guibg=bg guifg=fg guisp=#76daff
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=152 gui=undercurl guibg=bg guifg=fg guisp=#7ba2ba
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=147 gui=undercurl guibg=bg guifg=fg guisp=#8080f0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=231 gui=undercurl guibg=bg guifg=fg guisp=#c0c0e0
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=17 ctermfg=231 gui=NONE guibg=#001535 guifg=white
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=62 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold,undercurl ctermbg=55 ctermfg=231 gui=bold,italic,undercurl guibg=#6000a0 guifg=White guisp=white
    CSAHi Todo term=NONE cterm=underline ctermbg=38 ctermfg=231 gui=underline guibg=#00a0d0 guifg=white
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#00c0e0
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=#6590f0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#00c0e0
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=33 ctermfg=231 gui=bold,italic guibg=#287eff guifg=white
    CSAHi IncSearch term=reverse cterm=bold ctermbg=66 ctermfg=231 gui=bold guibg=#667799 guifg=white
    CSAHi Search term=reverse cterm=bold ctermbg=66 ctermfg=231 gui=bold guibg=#667799 guifg=white
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=44 gui=bold guibg=bg guifg=#22cce2
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=44 gui=bold guibg=bg guifg=#22cce2
    CSAHi LineNr term=underline cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#5080b0
    CSAHi vCursor term=NONE cterm=bold ctermbg=231 ctermfg=17 gui=reverse,bold guibg=bg guifg=white
    CSAHi nCursor term=NONE cterm=bold ctermbg=231 ctermfg=17 gui=reverse,bold guibg=bg guifg=white
    CSAHi otlTab0 term=NONE cterm=bold,underline ctermbg=bg ctermfg=231 gui=bold,underline guibg=bg guifg=#eeeeff
    CSAHi otlTab1 term=NONE cterm=bold,underline ctermbg=bg ctermfg=69 gui=bold,underline guibg=bg guifg=#3377ee
    CSAHi otlTab2 term=NONE cterm=bold,underline ctermbg=bg ctermfg=44 gui=bold,underline guibg=bg guifg=#22cae2
    CSAHi otlTab3 term=NONE cterm=bold,underline ctermbg=bg ctermfg=99 gui=bold,underline guibg=bg guifg=#9966ff
    CSAHi otlTab5 term=NONE cterm=bold,underline ctermbg=bg ctermfg=38 gui=bold,underline guibg=bg guifg=#22aae2
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=24 ctermfg=231 gui=NONE guibg=#005090 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=61 ctermfg=231 gui=NONE guibg=#3070c0 guifg=white
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#05456f guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#05456f guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=231 ctermfg=231 gui=reverse,bold guibg=fg guifg=white
    CSAHi rCursor term=NONE cterm=bold ctermbg=231 ctermfg=17 gui=reverse,bold guibg=bg guifg=white
    CSAHi iCursor term=NONE cterm=bold ctermbg=231 ctermfg=17 gui=reverse,bold guibg=bg guifg=white
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=44 gui=NONE guibg=bg guifg=#22cce2
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=24 ctermfg=231 gui=bold guibg=#104075 guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=24 ctermfg=75 gui=NONE guibg=#104075 guifg=#65a0f0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=60 ctermfg=60 gui=NONE guibg=#305885 guifg=#305885
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#00a0f0
    CSAHi Visual term=reverse cterm=bold ctermbg=31 ctermfg=231 gui=bold guibg=#2080c0 guifg=white
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=67 ctermfg=231 gui=bold guibg=#6080a0 guifg=white
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=lightblue
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=31 ctermfg=231 gui=NONE guibg=#0080c0 guifg=white
    CSAHi Folded term=NONE cterm=NONE ctermbg=17 ctermfg=75 gui=italic guibg=#122555 guifg=#65b0f6
    CSAHi otlTab8 term=NONE cterm=bold,underline ctermbg=bg ctermfg=27 gui=bold,underline guibg=bg guifg=#1166ee
    CSAHi otlTab9 term=NONE cterm=bold,underline ctermbg=bg ctermfg=117 gui=bold,underline guibg=bg guifg=#99ddee
    CSAHi otlTodo term=NONE cterm=bold,underline ctermbg=38 ctermfg=231 gui=bold,underline guibg=#00a0d0 guifg=white
    CSAHi otlTagRef term=NONE cterm=NONE ctermbg=97 ctermfg=231 gui=NONE guibg=#8070a0 guifg=white
    CSAHi otlTagDef term=NONE cterm=NONE ctermbg=24 ctermfg=231 gui=NONE guibg=#005090 guifg=white
    CSAHi lCursor term=NONE cterm=bold ctermbg=231 ctermfg=231 gui=reverse,bold guibg=fg guifg=white
    CSAHi MatchParen term=reverse cterm=bold ctermbg=61 ctermfg=231 gui=bold guibg=#3070c0 guifg=white
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=104 gui=italic guibg=bg guifg=#9590d5
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=117 gui=italic guibg=bg guifg=#87c6f0
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#50a0e0
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#7fe9ff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=white
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#3f8fff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#90bfd0
    CSAHi otlTab4 term=NONE cterm=bold,underline ctermbg=bg ctermfg=117 gui=bold,underline guibg=bg guifg=#92caf2
    CSAHi otlTab7 term=NONE cterm=bold,underline ctermbg=bg ctermfg=38 gui=bold,underline guibg=bg guifg=#22bae2
    CSAHi otlTab6 term=NONE cterm=bold,underline ctermbg=bg ctermfg=99 gui=bold,underline guibg=bg guifg=#8866ee
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#103366 guifg=white
    CSAHi DiffAdd term=bold cterm=bold ctermbg=31 ctermfg=231 gui=bold guibg=#2080a0 guifg=white
    CSAHi DiffChange term=bold cterm=bold ctermbg=31 ctermfg=231 gui=bold guibg=#2080a0 guifg=white
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=60 ctermfg=231 gui=NONE guibg=#306080 guifg=white
    CSAHi DiffText term=reverse cterm=bold ctermbg=97 ctermfg=231 gui=bold guibg=#8070a0 guifg=white
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=117 gui=italic,undercurl guibg=bg guifg=fg guisp=#76daff
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=109 gui=undercurl guibg=bg guifg=fg guisp=#7ba2ba
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=105 gui=undercurl guibg=bg guifg=fg guisp=#8080f0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=146 gui=undercurl guibg=bg guifg=fg guisp=#c0c0e0
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#001535 guifg=white
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold,undercurl ctermbg=33 ctermfg=79 gui=bold,italic,undercurl guibg=#6000a0 guifg=White guisp=white
    CSAHi Todo term=NONE cterm=underline ctermbg=22 ctermfg=79 gui=underline guibg=#00a0d0 guifg=white
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#00c0e0
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=39 gui=bold guibg=bg guifg=#6590f0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#00c0e0
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=23 ctermfg=79 gui=bold,italic guibg=#287eff guifg=white
    CSAHi IncSearch term=reverse cterm=bold ctermbg=37 ctermfg=79 gui=bold guibg=#667799 guifg=white
    CSAHi Search term=reverse cterm=bold ctermbg=37 ctermfg=79 gui=bold guibg=#667799 guifg=white
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=26 gui=bold guibg=bg guifg=#22cce2
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=26 gui=bold guibg=bg guifg=#22cce2
    CSAHi LineNr term=underline cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#5080b0
    CSAHi vCursor term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=reverse,bold guibg=bg guifg=white
    CSAHi nCursor term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=reverse,bold guibg=bg guifg=white
    CSAHi otlTab0 term=NONE cterm=bold,underline ctermbg=bg ctermfg=79 gui=bold,underline guibg=bg guifg=#eeeeff
    CSAHi otlTab1 term=NONE cterm=bold,underline ctermbg=bg ctermfg=23 gui=bold,underline guibg=bg guifg=#3377ee
    CSAHi otlTab2 term=NONE cterm=bold,underline ctermbg=bg ctermfg=26 gui=bold,underline guibg=bg guifg=#22cae2
    CSAHi otlTab3 term=NONE cterm=bold,underline ctermbg=bg ctermfg=39 gui=bold,underline guibg=bg guifg=#9966ff
    CSAHi otlTab5 term=NONE cterm=bold,underline ctermbg=bg ctermfg=22 gui=bold,underline guibg=bg guifg=#22aae2
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#005090 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=22 ctermfg=79 gui=NONE guibg=#3070c0 guifg=white
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#05456f guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#05456f guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=79 ctermfg=79 gui=reverse,bold guibg=fg guifg=white
    CSAHi rCursor term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=reverse,bold guibg=bg guifg=white
    CSAHi iCursor term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=reverse,bold guibg=bg guifg=white
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#22cce2
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=17 ctermfg=79 gui=bold guibg=#104075 guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=17 ctermfg=39 gui=NONE guibg=#104075 guifg=#65a0f0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=21 ctermfg=21 gui=NONE guibg=#305885 guifg=#305885
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#00a0f0
    CSAHi Visual term=reverse cterm=bold ctermbg=22 ctermfg=79 gui=bold guibg=#2080c0 guifg=white
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=37 ctermfg=79 gui=bold guibg=#6080a0 guifg=white
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=lightblue
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=22 ctermfg=79 gui=NONE guibg=#0080c0 guifg=white
    CSAHi Folded term=NONE cterm=NONE ctermbg=17 ctermfg=43 gui=italic guibg=#122555 guifg=#65b0f6
    CSAHi otlTab8 term=NONE cterm=bold,underline ctermbg=bg ctermfg=23 gui=bold,underline guibg=bg guifg=#1166ee
    CSAHi otlTab9 term=NONE cterm=bold,underline ctermbg=bg ctermfg=43 gui=bold,underline guibg=bg guifg=#99ddee
    CSAHi otlTodo term=NONE cterm=bold,underline ctermbg=22 ctermfg=79 gui=bold,underline guibg=#00a0d0 guifg=white
    CSAHi otlTagRef term=NONE cterm=NONE ctermbg=37 ctermfg=79 gui=NONE guibg=#8070a0 guifg=white
    CSAHi otlTagDef term=NONE cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#005090 guifg=white
    CSAHi lCursor term=NONE cterm=bold ctermbg=79 ctermfg=79 gui=reverse,bold guibg=fg guifg=white
    CSAHi MatchParen term=reverse cterm=bold ctermbg=22 ctermfg=79 gui=bold guibg=#3070c0 guifg=white
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=italic guibg=bg guifg=#9590d5
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=43 gui=italic guibg=bg guifg=#87c6f0
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#50a0e0
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=47 gui=NONE guibg=bg guifg=#7fe9ff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=white
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#3f8fff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#90bfd0
    CSAHi otlTab4 term=NONE cterm=bold,underline ctermbg=bg ctermfg=43 gui=bold,underline guibg=bg guifg=#92caf2
    CSAHi otlTab7 term=NONE cterm=bold,underline ctermbg=bg ctermfg=26 gui=bold,underline guibg=bg guifg=#22bae2
    CSAHi otlTab6 term=NONE cterm=bold,underline ctermbg=bg ctermfg=39 gui=bold,underline guibg=bg guifg=#8866ee
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=#103366 guifg=white
    CSAHi DiffAdd term=bold cterm=bold ctermbg=21 ctermfg=79 gui=bold guibg=#2080a0 guifg=white
    CSAHi DiffChange term=bold cterm=bold ctermbg=21 ctermfg=79 gui=bold guibg=#2080a0 guifg=white
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#306080 guifg=white
    CSAHi DiffText term=reverse cterm=bold ctermbg=37 ctermfg=79 gui=bold guibg=#8070a0 guifg=white
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=43 gui=italic,undercurl guibg=bg guifg=fg guisp=#76daff
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=38 gui=undercurl guibg=bg guifg=fg guisp=#7ba2ba
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=39 gui=undercurl guibg=bg guifg=fg guisp=#8080f0
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=58 gui=undercurl guibg=bg guifg=fg guisp=#c0c0e0
endif

if 1
    delcommand CSAHi
endif
