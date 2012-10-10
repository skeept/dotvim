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
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=188 gui=NONE guibg=#1e2426 guifg=#babdb6
    CSAHi cssUIProp term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#d3d7cf
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=160 ctermfg=255 gui=NONE guibg=#cc0000 guifg=#eeeeec
    CSAHi Todo term=NONE cterm=NONE ctermbg=59 ctermfg=215 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=#8ae234
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi cssSelectorOp term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#ef2929
    CSAHi NonText term=bold cterm=NONE ctermbg=59 ctermfg=59 gui=NONE guibg=#2c3032 guifg=#2c3032
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=215 ctermfg=59 gui=reverse guibg=#2e3436 guifg=#fcaf3e
    CSAHi Search term=reverse cterm=NONE ctermbg=215 ctermfg=59 gui=NONE guibg=#fcaf3e guifg=#2e3436
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#729fcf
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=60 gui=NONE guibg=#000000 guifg=#3f4b4d
    CSAHi htmlArg term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#d3d7cf
    CSAHi htmlTitle term=NONE cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=#8ae234
    CSAHi phpPropertySelector term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpPropertySelectorInString term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpOperator term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpArrayPair term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpAssignByRef term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpRelation term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpMemberSelector term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=59 ctermfg=255 gui=NONE guibg=#2e3436 guifg=#eeeeec
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=NONE guibg=#ffffff guifg=#1e2426
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#555753 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=#ffffff
    CSAHi TabLine term=underline cterm=underline ctermbg=16 ctermfg=145 gui=underline guibg=#0a1012 guifg=#888a85
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#555753 guifg=#eeeeec
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=59 gui=reverse guibg=bg guifg=#0a1012
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=#babdb6 guifg=bg
    CSAHi phpRegionDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=139 gui=NONE guibg=bg guifg=#ad7fa8
    CSAHi cssBraces term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi cssTagName term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi ICursor term=NONE cterm=NONE ctermbg=188 ctermfg=fg gui=NONE guibg=#babdb6 guifg=fg
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=#8ae234
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=#babdb6 guifg=#2e3436
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=145 ctermfg=59 gui=NONE guibg=#888a85 guifg=#2e3436
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=145 ctermfg=102 gui=NONE guibg=#888a85 guifg=#555753
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=215 gui=bold guibg=bg guifg=#fcaf3e
    CSAHi Visual term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=#0e1416 guifg=#eeeeec
    CSAHi Folded term=NONE cterm=NONE ctermbg=61 ctermfg=188 gui=NONE guibg=#204a87 guifg=#d3d7cf
    CSAHi phpFunctions term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#d3d7cf
    CSAHi phpParent term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi javaScriptBraces term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi javaScriptOperator term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi htmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi htmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi htmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#babdb6
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=215 ctermfg=59 gui=NONE guibg=#fcaf3e guifg=#2e3436
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#656763
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=#8ae234
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#729fcf
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#e3e7df
    CSAHi htmlSpecialTagName term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#babdb6
    CSAHi phpUnknownSelector term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpVarSelector term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#babdb6
    CSAHi phpSemicolon term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=67 gui=NONE guibg=#000000 guifg=#3465a4
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#1f2b2d guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#2e3436 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=233 ctermfg=59 gui=bold guibg=#0e1416 guifg=#2e3436
    CSAHi DiffText term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=59 ctermfg=51 gui=NONE guibg=#1e2426 guifg=Cyan
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=188 gui=NONE guibg=#1e2426 guifg=#babdb6
    CSAHi cssUIProp term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#d3d7cf
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#cc0000 guifg=#eeeeec
    CSAHi Todo term=NONE cterm=NONE ctermbg=59 ctermfg=221 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=155 gui=NONE guibg=bg guifg=#8ae234
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi cssSelectorOp term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#ef2929
    CSAHi NonText term=bold cterm=NONE ctermbg=59 ctermfg=59 gui=NONE guibg=#2c3032 guifg=#2c3032
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#ffffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=221 ctermfg=59 gui=reverse guibg=#2e3436 guifg=#fcaf3e
    CSAHi Search term=reverse cterm=NONE ctermbg=221 ctermfg=59 gui=NONE guibg=#fcaf3e guifg=#2e3436
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#729fcf
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=66 gui=NONE guibg=#000000 guifg=#3f4b4d
    CSAHi htmlArg term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#d3d7cf
    CSAHi htmlTitle term=NONE cterm=NONE ctermbg=bg ctermfg=155 gui=NONE guibg=bg guifg=#8ae234
    CSAHi phpPropertySelector term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpPropertySelectorInString term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpOperator term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpArrayPair term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpAssignByRef term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpRelation term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpMemberSelector term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=59 ctermfg=255 gui=NONE guibg=#2e3436 guifg=#eeeeec
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=255 ctermfg=59 gui=NONE guibg=#ffffff guifg=#1e2426
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#555753 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=59 gui=reverse guibg=bg guifg=#ffffff
    CSAHi TabLine term=underline cterm=underline ctermbg=16 ctermfg=145 gui=underline guibg=#0a1012 guifg=#888a85
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#555753 guifg=#eeeeec
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=59 gui=reverse guibg=bg guifg=#0a1012
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=#babdb6 guifg=bg
    CSAHi phpRegionDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#ad7fa8
    CSAHi cssBraces term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi cssTagName term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi ICursor term=NONE cterm=NONE ctermbg=188 ctermfg=fg gui=NONE guibg=#babdb6 guifg=fg
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=155 gui=NONE guibg=bg guifg=#8ae234
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=#babdb6 guifg=#2e3436
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=145 ctermfg=59 gui=NONE guibg=#888a85 guifg=#2e3436
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=145 ctermfg=102 gui=NONE guibg=#888a85 guifg=#555753
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=221 gui=bold guibg=bg guifg=#fcaf3e
    CSAHi Visual term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=#0e1416 guifg=#eeeeec
    CSAHi Folded term=NONE cterm=NONE ctermbg=67 ctermfg=231 gui=NONE guibg=#204a87 guifg=#d3d7cf
    CSAHi phpFunctions term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#d3d7cf
    CSAHi phpParent term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi javaScriptBraces term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi javaScriptOperator term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi htmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi htmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi htmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#babdb6
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=221 ctermfg=59 gui=NONE guibg=#fcaf3e guifg=#2e3436
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=#656763
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=155 gui=NONE guibg=bg guifg=#8ae234
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#729fcf
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#e3e7df
    CSAHi htmlSpecialTagName term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#babdb6
    CSAHi phpUnknownSelector term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpVarSelector term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#babdb6
    CSAHi phpSemicolon term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#888a85
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=68 gui=NONE guibg=#000000 guifg=#3465a4
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#1f2b2d guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#2e3436 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=233 ctermfg=59 gui=bold guibg=#0e1416 guifg=#2e3436
    CSAHi DiffText term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=59 ctermfg=51 gui=NONE guibg=#1e2426 guifg=Cyan
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=145 gui=NONE guibg=#1e2426 guifg=#babdb6
    CSAHi cssUIProp term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#d3d7cf
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=160 ctermfg=255 gui=NONE guibg=#cc0000 guifg=#eeeeec
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=215 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=#8ae234
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi cssSelectorOp term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ef2929
    CSAHi NonText term=bold cterm=NONE ctermbg=236 ctermfg=236 gui=NONE guibg=#2c3032 guifg=#2c3032
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=215 ctermfg=23 gui=reverse guibg=#2e3436 guifg=#fcaf3e
    CSAHi Search term=reverse cterm=NONE ctermbg=215 ctermfg=23 gui=NONE guibg=#fcaf3e guifg=#2e3436
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#729fcf
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=#000000 guifg=#3f4b4d
    CSAHi htmlArg term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#d3d7cf
    CSAHi htmlTitle term=NONE cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=#8ae234
    CSAHi phpPropertySelector term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpPropertySelectorInString term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpOperator term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpArrayPair term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpAssignByRef term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpRelation term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpMemberSelector term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=23 ctermfg=255 gui=NONE guibg=#2e3436 guifg=#eeeeec
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#ffffff guifg=#1e2426
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#555753 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=#ffffff
    CSAHi TabLine term=underline cterm=underline ctermbg=16 ctermfg=102 gui=underline guibg=#0a1012 guifg=#888a85
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=59 ctermfg=255 gui=NONE guibg=#555753 guifg=#eeeeec
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=16 gui=reverse guibg=bg guifg=#0a1012
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#babdb6 guifg=bg
    CSAHi phpRegionDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=139 gui=NONE guibg=bg guifg=#ad7fa8
    CSAHi cssBraces term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi cssTagName term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi ICursor term=NONE cterm=NONE ctermbg=145 ctermfg=fg gui=NONE guibg=#babdb6 guifg=fg
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=#8ae234
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=145 ctermfg=23 gui=NONE guibg=#babdb6 guifg=#2e3436
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=102 ctermfg=23 gui=NONE guibg=#888a85 guifg=#2e3436
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=102 ctermfg=59 gui=NONE guibg=#888a85 guifg=#555753
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=215 gui=bold guibg=bg guifg=#fcaf3e
    CSAHi Visual term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=#0e1416 guifg=#eeeeec
    CSAHi Folded term=NONE cterm=NONE ctermbg=24 ctermfg=188 gui=NONE guibg=#204a87 guifg=#d3d7cf
    CSAHi phpFunctions term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#d3d7cf
    CSAHi phpParent term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi javaScriptBraces term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi javaScriptOperator term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi htmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi htmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi htmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#babdb6
    CSAHi lCursor term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=215 ctermfg=23 gui=NONE guibg=#fcaf3e guifg=#2e3436
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=#656763
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=#8ae234
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#729fcf
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#e3e7df
    CSAHi htmlSpecialTagName term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#babdb6
    CSAHi phpUnknownSelector term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpVarSelector term=NONE cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#babdb6
    CSAHi phpSemicolon term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888a85
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=61 gui=NONE guibg=#000000 guifg=#3465a4
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#1f2b2d guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#2e3436 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=233 ctermfg=23 gui=bold guibg=#0e1416 guifg=#2e3436
    CSAHi DiffText term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#1e2426 guifg=Cyan
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=85 gui=NONE guibg=#1e2426 guifg=#babdb6
    CSAHi cssUIProp term=NONE cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=#d3d7cf
    CSAHi cssPseudoClassId term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=48 ctermfg=87 gui=NONE guibg=#cc0000 guifg=#eeeeec
    CSAHi Todo term=NONE cterm=NONE ctermbg=80 ctermfg=72 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=#8ae234
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi cssSelectorOp term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ef2929
    CSAHi NonText term=bold cterm=NONE ctermbg=80 ctermfg=80 gui=NONE guibg=#2c3032 guifg=#2c3032
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=72 ctermfg=80 gui=reverse guibg=#2e3436 guifg=#fcaf3e
    CSAHi Search term=reverse cterm=NONE ctermbg=72 ctermfg=80 gui=NONE guibg=#fcaf3e guifg=#2e3436
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#729fcf
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=#000000 guifg=#3f4b4d
    CSAHi htmlArg term=NONE cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=#d3d7cf
    CSAHi htmlTitle term=NONE cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=#8ae234
    CSAHi phpPropertySelector term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpPropertySelectorInString term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpOperator term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpArrayPair term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpAssignByRef term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpRelation term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpMemberSelector term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#2e3436 guifg=#eeeeec
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=79 ctermfg=80 gui=NONE guibg=#ffffff guifg=#1e2426
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=81 ctermfg=fg gui=NONE guibg=#555753 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=80 gui=reverse guibg=bg guifg=#ffffff
    CSAHi TabLine term=underline cterm=underline ctermbg=16 ctermfg=83 gui=underline guibg=#0a1012 guifg=#888a85
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=81 ctermfg=87 gui=NONE guibg=#555753 guifg=#eeeeec
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=80 gui=reverse guibg=bg guifg=#0a1012
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=85 ctermfg=80 gui=NONE guibg=#babdb6 guifg=bg
    CSAHi phpRegionDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#ad7fa8
    CSAHi cssBraces term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi cssIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi cssTagName term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi ICursor term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=#babdb6 guifg=fg
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=#8ae234
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=85 ctermfg=80 gui=NONE guibg=#babdb6 guifg=#2e3436
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=83 ctermfg=80 gui=NONE guibg=#888a85 guifg=#2e3436
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=83 ctermfg=81 gui=NONE guibg=#888a85 guifg=#555753
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#fcaf3e
    CSAHi Visual term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=#0e1416 guifg=#eeeeec
    CSAHi Folded term=NONE cterm=NONE ctermbg=21 ctermfg=86 gui=NONE guibg=#204a87 guifg=#d3d7cf
    CSAHi phpFunctions term=NONE cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=#d3d7cf
    CSAHi phpParent term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi javaScriptBraces term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi javaScriptOperator term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi htmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi htmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi htmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#babdb6
    CSAHi lCursor term=NONE cterm=NONE ctermbg=85 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=72 ctermfg=80 gui=NONE guibg=#fcaf3e guifg=#2e3436
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#656763
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=#8ae234
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#729fcf
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#e3e7df
    CSAHi htmlSpecialTagName term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#babdb6
    CSAHi phpUnknownSelector term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi phpVarSelector term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#babdb6
    CSAHi phpSemicolon term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888a85
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=#000000 guifg=#3465a4
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#1f2b2d guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#2e3436 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=80 gui=bold guibg=#0e1416 guifg=#2e3436
    CSAHi DiffText term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=80 ctermfg=31 gui=NONE guibg=#1e2426 guifg=Cyan
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
