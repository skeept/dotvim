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
    CSAHi Normal term=NONE cterm=NONE ctermbg=236 ctermfg=254 gui=NONE guibg=#303030 guifg=grey90
    CSAHi rightMargin term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#453030 guifg=fg
    CSAHi perlRepeat term=NONE cterm=NONE ctermbg=236 ctermfg=187 gui=NONE guibg=bg guifg=#c0b790
    CSAHi perlStatementInclude term=NONE cterm=NONE ctermbg=59 ctermfg=187 gui=NONE guibg=#3b4038 guifg=#c0c090
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=242 gui=underline guibg=bg guifg=#707070
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=236 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=129 ctermfg=231 gui=bold guibg=#8000ff guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=bg ctermfg=218 gui=bold guibg=bg guifg=#ff80d0
    CSAHi perlStatementSub term=NONE cterm=NONE ctermbg=236 ctermfg=187 gui=NONE guibg=bg guifg=#c0c090
    CSAHi perlStatementControl term=NONE cterm=NONE ctermbg=236 ctermfg=186 gui=NONE guibg=bg guifg=#dcdb6b
    CSAHi perlVarSimpleMember term=NONE cterm=NONE ctermbg=236 ctermfg=187 gui=NONE guibg=bg guifg=#c0c090
    CSAHi perlVarSimpleMemberName term=NONE cterm=NONE ctermbg=236 ctermfg=249 gui=NONE guibg=bg guifg=grey70
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=green
    CSAHi NonText term=bold cterm=bold ctermbg=237 ctermfg=242 gui=bold guibg=#383838 guifg=#707070
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=lightmagenta
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi IncSearch term=reverse cterm=underline ctermbg=32 ctermfg=159 gui=underline guibg=#0060c0 guifg=#80ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=145 ctermfg=236 gui=NONE guibg=grey60 guifg=bg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=236 ctermfg=224 gui=NONE guibg=bg guifg=lightred
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=242 gui=NONE guibg=bg guifg=#707070
    CSAHi perlOperator term=NONE cterm=NONE ctermbg=238 ctermfg=187 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi perlLabel term=NONE cterm=NONE ctermbg=238 ctermfg=187 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi htmlTagName term=NONE cterm=NONE ctermbg=236 ctermfg=249 gui=NONE guibg=bg guifg=grey70
    CSAHi MyTagListFileName term=NONE cterm=underline ctermbg=238 ctermfg=254 gui=underline guibg=grey25 guifg=fg
    CSAHi perlIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#90c0c0
    CSAHi perlStatement term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#c0c090
    CSAHi perlStatementHash term=NONE cterm=NONE ctermbg=238 ctermfg=187 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi perlStatementNew term=NONE cterm=NONE ctermbg=238 ctermfg=187 gui=NONE guibg=#424242 guifg=#c0c090
    CSAHi perlMatchStartEnd term=NONE cterm=NONE ctermbg=238 ctermfg=187 gui=NONE guibg=#424242 guifg=#c0c090
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=244 ctermfg=234 gui=NONE guibg=grey50 guifg=grey10
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=238 ctermfg=145 gui=NONE guibg=#404040 guifg=#abac84
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=grey20 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=239 ctermfg=236 gui=reverse guibg=bg guifg=grey30
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=254 ctermfg=236 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=gray25 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=238 gui=NONE guibg=green guifg=#424242
    CSAHi OverLength term=NONE cterm=NONE ctermbg=59 ctermfg=254 gui=NONE guibg=#353535 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=129 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=#909090 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=145 gui=NONE guibg=#404040 guifg=#abac84
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=238 ctermfg=145 gui=NONE guibg=#404040 guifg=#abac84
    CSAHi Title term=bold cterm=NONE ctermbg=236 ctermfg=37 gui=NONE guibg=bg guifg=darkcyan
    CSAHi Visual term=reverse cterm=NONE ctermbg=34 ctermfg=157 gui=NONE guibg=#008000 guifg=#b0ffb0
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=172 ctermfg=230 gui=NONE guibg=#c06800 guifg=#ffe8c8
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#abac84 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=31 ctermfg=87 gui=NONE guibg=#006090 guifg=#40f0f0
    CSAHi perlControl term=NONE cterm=NONE ctermbg=238 ctermfg=187 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi perlSharpBang term=NONE cterm=NONE ctermbg=239 ctermfg=187 gui=NONE guibg=#505050 guifg=#c0c090
    CSAHi perlPackageDecl term=NONE cterm=NONE ctermbg=238 ctermfg=144 gui=NONE guibg=#404040 guifg=#80ac7b
    CSAHi perlStatementFiledesc term=NONE cterm=NONE ctermbg=236 ctermfg=151 gui=NONE guibg=bg guifg=#a2c090
    CSAHi perlFunctionName term=NONE cterm=NONE ctermbg=236 ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi perlNumber term=NONE cterm=NONE ctermbg=236 ctermfg=144 gui=NONE guibg=bg guifg=#80ac7b
    CSAHi perlQQ term=NONE cterm=NONE ctermbg=237 ctermfg=254 gui=NONE guibg=#393939 guifg=fg
    CSAHi perlSpecialString term=NONE cterm=NONE ctermbg=236 ctermfg=180 gui=NONE guibg=bg guifg=#dc966b
    CSAHi perlSpecialMatch term=NONE cterm=NONE ctermbg=236 ctermfg=176 gui=NONE guibg=bg guifg=#c864c7
    CSAHi perlSpecialBEOM term=NONE cterm=NONE ctermbg=238 ctermfg=254 gui=NONE guibg=#404040 guifg=fg
    CSAHi perlStringStartEnd term=NONE cterm=NONE ctermbg=59 ctermfg=138 gui=NONE guibg=#353535 guifg=#b07050
    CSAHi lCursor term=NONE cterm=NONE ctermbg=129 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=104 gui=NONE guibg=bg guifg=#647bcf
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=138 gui=NONE guibg=bg guifg=#b07050
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#c090c0
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#90c0c0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#c0c090
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#c090c0
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=121 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi perlShellCommand term=NONE cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#424242 guifg=fg
    CSAHi perlVarPlain term=NONE cterm=NONE ctermbg=236 ctermfg=116 gui=NONE guibg=bg guifg=#74c5c6
    CSAHi perlVarNotInMatches term=NONE cterm=NONE ctermbg=236 ctermfg=138 gui=NONE guibg=bg guifg=#915555
    CSAHi perlVarPlain2 term=NONE cterm=NONE ctermbg=236 ctermfg=115 gui=NONE guibg=bg guifg=#74c6a8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=238 ctermfg=81 gui=NONE guibg=#404040 guifg=#40c0ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=25 ctermfg=153 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=89 ctermfg=168 gui=NONE guibg=#601830 guifg=#e03870
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=25 ctermfg=153 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=132 ctermfg=213 gui=NONE guibg=#a02860 guifg=#ff78f0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=236 ctermfg=184 gui=NONE guibg=bg guifg=darkyellow
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=236 ctermfg=254 gui=NONE guibg=#303030 guifg=grey90
    CSAHi rightMargin term=NONE cterm=NONE ctermbg=95 ctermfg=fg gui=NONE guibg=#453030 guifg=fg
    CSAHi perlRepeat term=NONE cterm=NONE ctermbg=236 ctermfg=223 gui=NONE guibg=bg guifg=#c0b790
    CSAHi perlStatementInclude term=NONE cterm=NONE ctermbg=65 ctermfg=229 gui=NONE guibg=#3b4038 guifg=#c0c090
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=242 gui=underline guibg=bg guifg=#707070
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=236 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=129 ctermfg=255 gui=bold guibg=#8000ff guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ff80d0
    CSAHi perlStatementSub term=NONE cterm=NONE ctermbg=236 ctermfg=229 gui=NONE guibg=bg guifg=#c0c090
    CSAHi perlStatementControl term=NONE cterm=NONE ctermbg=236 ctermfg=229 gui=NONE guibg=bg guifg=#dcdb6b
    CSAHi perlVarSimpleMember term=NONE cterm=NONE ctermbg=236 ctermfg=229 gui=NONE guibg=bg guifg=#c0c090
    CSAHi perlVarSimpleMemberName term=NONE cterm=NONE ctermbg=236 ctermfg=249 gui=NONE guibg=bg guifg=grey70
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=green
    CSAHi NonText term=bold cterm=bold ctermbg=237 ctermfg=242 gui=bold guibg=#383838 guifg=#707070
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=lightmagenta
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=225 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi IncSearch term=reverse cterm=underline ctermbg=33 ctermfg=159 gui=underline guibg=#0060c0 guifg=#80ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=246 ctermfg=236 gui=NONE guibg=grey60 guifg=bg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=236 ctermfg=224 gui=NONE guibg=bg guifg=lightred
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=242 gui=NONE guibg=bg guifg=#707070
    CSAHi perlOperator term=NONE cterm=NONE ctermbg=238 ctermfg=229 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi perlLabel term=NONE cterm=NONE ctermbg=238 ctermfg=229 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi htmlTagName term=NONE cterm=NONE ctermbg=236 ctermfg=249 gui=NONE guibg=bg guifg=grey70
    CSAHi MyTagListFileName term=NONE cterm=underline ctermbg=238 ctermfg=254 gui=underline guibg=grey25 guifg=fg
    CSAHi perlIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#90c0c0
    CSAHi perlStatement term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#c0c090
    CSAHi perlStatementHash term=NONE cterm=NONE ctermbg=238 ctermfg=229 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi perlStatementNew term=NONE cterm=NONE ctermbg=238 ctermfg=229 gui=NONE guibg=#424242 guifg=#c0c090
    CSAHi perlMatchStartEnd term=NONE cterm=NONE ctermbg=238 ctermfg=229 gui=NONE guibg=#424242 guifg=#c0c090
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=145 ctermfg=234 gui=NONE guibg=grey50 guifg=grey10
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=238 ctermfg=187 gui=NONE guibg=#404040 guifg=#abac84
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=grey20 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=239 ctermfg=236 gui=reverse guibg=bg guifg=grey30
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=254 ctermfg=236 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=gray25 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=238 gui=NONE guibg=green guifg=#424242
    CSAHi OverLength term=NONE cterm=NONE ctermbg=236 ctermfg=254 gui=NONE guibg=#353535 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=129 ctermfg=255 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=#909090 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=187 gui=NONE guibg=#404040 guifg=#abac84
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=238 ctermfg=187 gui=NONE guibg=#404040 guifg=#abac84
    CSAHi Title term=bold cterm=NONE ctermbg=236 ctermfg=37 gui=NONE guibg=bg guifg=darkcyan
    CSAHi Visual term=reverse cterm=NONE ctermbg=34 ctermfg=194 gui=NONE guibg=#008000 guifg=#b0ffb0
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=208 ctermfg=231 gui=NONE guibg=#c06800 guifg=#ffe8c8
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=225 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#abac84 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=31 ctermfg=123 gui=NONE guibg=#006090 guifg=#40f0f0
    CSAHi perlControl term=NONE cterm=NONE ctermbg=238 ctermfg=229 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi perlSharpBang term=NONE cterm=NONE ctermbg=239 ctermfg=229 gui=NONE guibg=#505050 guifg=#c0c090
    CSAHi perlPackageDecl term=NONE cterm=NONE ctermbg=238 ctermfg=151 gui=NONE guibg=#404040 guifg=#80ac7b
    CSAHi perlStatementFiledesc term=NONE cterm=NONE ctermbg=236 ctermfg=193 gui=NONE guibg=bg guifg=#a2c090
    CSAHi perlFunctionName term=NONE cterm=NONE ctermbg=236 ctermfg=255 gui=NONE guibg=bg guifg=white
    CSAHi perlNumber term=NONE cterm=NONE ctermbg=236 ctermfg=151 gui=NONE guibg=bg guifg=#80ac7b
    CSAHi perlQQ term=NONE cterm=NONE ctermbg=237 ctermfg=254 gui=NONE guibg=#393939 guifg=fg
    CSAHi perlSpecialString term=NONE cterm=NONE ctermbg=236 ctermfg=223 gui=NONE guibg=bg guifg=#dc966b
    CSAHi perlSpecialMatch term=NONE cterm=NONE ctermbg=236 ctermfg=213 gui=NONE guibg=bg guifg=#c864c7
    CSAHi perlSpecialBEOM term=NONE cterm=NONE ctermbg=238 ctermfg=254 gui=NONE guibg=#404040 guifg=fg
    CSAHi perlStringStartEnd term=NONE cterm=NONE ctermbg=236 ctermfg=180 gui=NONE guibg=#353535 guifg=#b07050
    CSAHi lCursor term=NONE cterm=NONE ctermbg=129 ctermfg=255 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#647bcf
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#b07050
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#c090c0
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#90c0c0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#c0c090
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#c090c0
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi perlShellCommand term=NONE cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#424242 guifg=fg
    CSAHi perlVarPlain term=NONE cterm=NONE ctermbg=236 ctermfg=159 gui=NONE guibg=bg guifg=#74c5c6
    CSAHi perlVarNotInMatches term=NONE cterm=NONE ctermbg=236 ctermfg=138 gui=NONE guibg=bg guifg=#915555
    CSAHi perlVarPlain2 term=NONE cterm=NONE ctermbg=236 ctermfg=158 gui=NONE guibg=bg guifg=#74c6a8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=238 ctermfg=123 gui=NONE guibg=#404040 guifg=#40c0ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=26 ctermfg=195 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=95 ctermfg=205 gui=NONE guibg=#601830 guifg=#e03870
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=26 ctermfg=195 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=168 ctermfg=219 gui=NONE guibg=#a02860 guifg=#ff78f0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=236 ctermfg=184 gui=NONE guibg=bg guifg=darkyellow
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=236 ctermfg=254 gui=NONE guibg=#303030 guifg=grey90
    CSAHi rightMargin term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#453030 guifg=fg
    CSAHi perlRepeat term=NONE cterm=NONE ctermbg=236 ctermfg=144 gui=NONE guibg=bg guifg=#c0b790
    CSAHi perlStatementInclude term=NONE cterm=NONE ctermbg=59 ctermfg=144 gui=NONE guibg=#3b4038 guifg=#c0c090
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=242 gui=underline guibg=bg guifg=#707070
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=236 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=93 ctermfg=231 gui=bold guibg=#8000ff guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=bg ctermfg=212 gui=bold guibg=bg guifg=#ff80d0
    CSAHi perlStatementSub term=NONE cterm=NONE ctermbg=236 ctermfg=144 gui=NONE guibg=bg guifg=#c0c090
    CSAHi perlStatementControl term=NONE cterm=NONE ctermbg=236 ctermfg=185 gui=NONE guibg=bg guifg=#dcdb6b
    CSAHi perlVarSimpleMember term=NONE cterm=NONE ctermbg=236 ctermfg=144 gui=NONE guibg=bg guifg=#c0c090
    CSAHi perlVarSimpleMemberName term=NONE cterm=NONE ctermbg=236 ctermfg=249 gui=NONE guibg=bg guifg=grey70
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=green
    CSAHi NonText term=bold cterm=bold ctermbg=237 ctermfg=242 gui=bold guibg=#383838 guifg=#707070
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=lightmagenta
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi IncSearch term=reverse cterm=underline ctermbg=25 ctermfg=123 gui=underline guibg=#0060c0 guifg=#80ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=246 ctermfg=236 gui=NONE guibg=grey60 guifg=bg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=236 ctermfg=217 gui=NONE guibg=bg guifg=lightred
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=242 gui=NONE guibg=bg guifg=#707070
    CSAHi perlOperator term=NONE cterm=NONE ctermbg=238 ctermfg=144 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi perlLabel term=NONE cterm=NONE ctermbg=238 ctermfg=144 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi htmlTagName term=NONE cterm=NONE ctermbg=236 ctermfg=249 gui=NONE guibg=bg guifg=grey70
    CSAHi MyTagListFileName term=NONE cterm=underline ctermbg=238 ctermfg=254 gui=underline guibg=grey25 guifg=fg
    CSAHi perlIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=109 gui=NONE guibg=bg guifg=#90c0c0
    CSAHi perlStatement term=NONE cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=#c0c090
    CSAHi perlStatementHash term=NONE cterm=NONE ctermbg=238 ctermfg=144 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi perlStatementNew term=NONE cterm=NONE ctermbg=238 ctermfg=144 gui=NONE guibg=#424242 guifg=#c0c090
    CSAHi perlMatchStartEnd term=NONE cterm=NONE ctermbg=238 ctermfg=144 gui=NONE guibg=#424242 guifg=#c0c090
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=244 ctermfg=234 gui=NONE guibg=grey50 guifg=grey10
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=238 ctermfg=144 gui=NONE guibg=#404040 guifg=#abac84
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=grey20 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=239 ctermfg=236 gui=reverse guibg=bg guifg=grey30
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=254 ctermfg=236 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=gray25 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=238 gui=NONE guibg=green guifg=#424242
    CSAHi OverLength term=NONE cterm=NONE ctermbg=236 ctermfg=254 gui=NONE guibg=#353535 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=184 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=#909090 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=144 gui=NONE guibg=#404040 guifg=#abac84
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=238 ctermfg=144 gui=NONE guibg=#404040 guifg=#abac84
    CSAHi Title term=bold cterm=NONE ctermbg=236 ctermfg=30 gui=NONE guibg=bg guifg=darkcyan
    CSAHi Visual term=reverse cterm=NONE ctermbg=28 ctermfg=157 gui=NONE guibg=#008000 guifg=#b0ffb0
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=130 ctermfg=224 gui=NONE guibg=#c06800 guifg=#ffe8c8
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=144 ctermfg=16 gui=NONE guibg=#abac84 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=24 ctermfg=87 gui=NONE guibg=#006090 guifg=#40f0f0
    CSAHi perlControl term=NONE cterm=NONE ctermbg=238 ctermfg=144 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi perlSharpBang term=NONE cterm=NONE ctermbg=239 ctermfg=144 gui=NONE guibg=#505050 guifg=#c0c090
    CSAHi perlPackageDecl term=NONE cterm=NONE ctermbg=238 ctermfg=108 gui=NONE guibg=#404040 guifg=#80ac7b
    CSAHi perlStatementFiledesc term=NONE cterm=NONE ctermbg=236 ctermfg=144 gui=NONE guibg=bg guifg=#a2c090
    CSAHi perlFunctionName term=NONE cterm=NONE ctermbg=236 ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi perlNumber term=NONE cterm=NONE ctermbg=236 ctermfg=108 gui=NONE guibg=bg guifg=#80ac7b
    CSAHi perlQQ term=NONE cterm=NONE ctermbg=237 ctermfg=254 gui=NONE guibg=#393939 guifg=fg
    CSAHi perlSpecialString term=NONE cterm=NONE ctermbg=236 ctermfg=173 gui=NONE guibg=bg guifg=#dc966b
    CSAHi perlSpecialMatch term=NONE cterm=NONE ctermbg=236 ctermfg=170 gui=NONE guibg=bg guifg=#c864c7
    CSAHi perlSpecialBEOM term=NONE cterm=NONE ctermbg=238 ctermfg=254 gui=NONE guibg=#404040 guifg=fg
    CSAHi perlStringStartEnd term=NONE cterm=NONE ctermbg=236 ctermfg=131 gui=NONE guibg=#353535 guifg=#b07050
    CSAHi lCursor term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#647bcf
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=131 gui=NONE guibg=bg guifg=#b07050
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=139 gui=NONE guibg=bg guifg=#c090c0
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=109 gui=NONE guibg=bg guifg=#90c0c0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=#c0c090
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=139 gui=NONE guibg=bg guifg=#c090c0
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi perlShellCommand term=NONE cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#424242 guifg=fg
    CSAHi perlVarPlain term=NONE cterm=NONE ctermbg=236 ctermfg=116 gui=NONE guibg=bg guifg=#74c5c6
    CSAHi perlVarNotInMatches term=NONE cterm=NONE ctermbg=236 ctermfg=95 gui=NONE guibg=bg guifg=#915555
    CSAHi perlVarPlain2 term=NONE cterm=NONE ctermbg=236 ctermfg=115 gui=NONE guibg=bg guifg=#74c6a8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=238 ctermfg=75 gui=NONE guibg=#404040 guifg=#40c0ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=153 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=53 ctermfg=167 gui=NONE guibg=#601830 guifg=#e03870
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=19 ctermfg=153 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=125 ctermfg=213 gui=NONE guibg=#a02860 guifg=#ff78f0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=236 ctermfg=142 gui=NONE guibg=bg guifg=darkyellow
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#303030 guifg=grey90
    CSAHi rightMargin term=NONE cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#453030 guifg=fg
    CSAHi perlRepeat term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=bg guifg=#c0b790
    CSAHi perlStatementInclude term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=#3b4038 guifg=#c0c090
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=82 gui=underline guibg=bg guifg=#707070
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=35 ctermfg=79 gui=bold guibg=#8000ff guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=bg ctermfg=70 gui=bold guibg=bg guifg=#ff80d0
    CSAHi perlStatementSub term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=bg guifg=#c0c090
    CSAHi perlStatementControl term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=bg guifg=#dcdb6b
    CSAHi perlVarSimpleMember term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=bg guifg=#c0c090
    CSAHi perlVarSimpleMemberName term=NONE cterm=NONE ctermbg=80 ctermfg=85 gui=NONE guibg=bg guifg=grey70
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=green
    CSAHi NonText term=bold cterm=bold ctermbg=80 ctermfg=82 gui=bold guibg=#383838 guifg=#707070
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=lightmagenta
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi IncSearch term=reverse cterm=underline ctermbg=22 ctermfg=47 gui=underline guibg=#0060c0 guifg=#80ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=84 ctermfg=80 gui=NONE guibg=grey60 guifg=bg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=80 ctermfg=74 gui=NONE guibg=bg guifg=lightred
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=43 gui=bold guibg=bg guifg=#a0d0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=82 gui=NONE guibg=bg guifg=#707070
    CSAHi perlOperator term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi perlLabel term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi htmlTagName term=NONE cterm=NONE ctermbg=80 ctermfg=85 gui=NONE guibg=bg guifg=grey70
    CSAHi MyTagListFileName term=NONE cterm=underline ctermbg=80 ctermfg=87 gui=underline guibg=grey25 guifg=fg
    CSAHi perlIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#90c0c0
    CSAHi perlStatement term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#c0c090
    CSAHi perlStatementHash term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi perlStatementNew term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=#424242 guifg=#c0c090
    CSAHi perlMatchStartEnd term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=#424242 guifg=#c0c090
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=82 ctermfg=80 gui=NONE guibg=grey50 guifg=grey10
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#404040 guifg=#abac84
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=grey20 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=81 ctermfg=80 gui=reverse guibg=bg guifg=grey30
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=87 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=gray25 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=28 ctermfg=80 gui=NONE guibg=green guifg=#424242
    CSAHi OverLength term=NONE cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#353535 guifg=fg
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=#e8e800
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=83 ctermfg=16 gui=NONE guibg=#909090 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#404040 guifg=#abac84
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#404040 guifg=#abac84
    CSAHi Title term=bold cterm=NONE ctermbg=80 ctermfg=21 gui=NONE guibg=bg guifg=darkcyan
    CSAHi Visual term=reverse cterm=NONE ctermbg=20 ctermfg=62 gui=NONE guibg=#008000 guifg=#b0ffb0
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=52 ctermfg=78 gui=NONE guibg=#c06800 guifg=#ffe8c8
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=#ffa0ff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=#abac84 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=21 ctermfg=31 gui=NONE guibg=#006090 guifg=#40f0f0
    CSAHi perlControl term=NONE cterm=NONE ctermbg=80 ctermfg=57 gui=NONE guibg=#404040 guifg=#c0c090
    CSAHi perlSharpBang term=NONE cterm=NONE ctermbg=81 ctermfg=57 gui=NONE guibg=#505050 guifg=#c0c090
    CSAHi perlPackageDecl term=NONE cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#404040 guifg=#80ac7b
    CSAHi perlStatementFiledesc term=NONE cterm=NONE ctermbg=80 ctermfg=41 gui=NONE guibg=bg guifg=#a2c090
    CSAHi perlFunctionName term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=bg guifg=white
    CSAHi perlNumber term=NONE cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=bg guifg=#80ac7b
    CSAHi perlQQ term=NONE cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#393939 guifg=fg
    CSAHi perlSpecialString term=NONE cterm=NONE ctermbg=80 ctermfg=53 gui=NONE guibg=bg guifg=#dc966b
    CSAHi perlSpecialMatch term=NONE cterm=NONE ctermbg=80 ctermfg=54 gui=NONE guibg=bg guifg=#c864c7
    CSAHi perlSpecialBEOM term=NONE cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#404040 guifg=fg
    CSAHi perlStringStartEnd term=NONE cterm=NONE ctermbg=80 ctermfg=53 gui=NONE guibg=#353535 guifg=#b07050
    CSAHi lCursor term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8800ff guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#647bcf
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#b07050
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=54 gui=NONE guibg=bg guifg=#c090c0
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#90c0c0
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#c0c090
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=54 gui=NONE guibg=bg guifg=#c090c0
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#60f0a8
    CSAHi perlShellCommand term=NONE cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#424242 guifg=fg
    CSAHi perlVarPlain term=NONE cterm=NONE ctermbg=80 ctermfg=42 gui=NONE guibg=bg guifg=#74c5c6
    CSAHi perlVarNotInMatches term=NONE cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=bg guifg=#915555
    CSAHi perlVarPlain2 term=NONE cterm=NONE ctermbg=80 ctermfg=41 gui=NONE guibg=bg guifg=#74c6a8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=80 ctermfg=27 gui=NONE guibg=#404040 guifg=#40c0ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=17 ctermfg=43 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=32 ctermfg=49 gui=NONE guibg=#601830 guifg=#e03870
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=17 ctermfg=43 gui=NONE guibg=#0020a0 guifg=#a0d0ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=33 ctermfg=71 gui=NONE guibg=#a02860 guifg=#ff78f0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=80 ctermfg=56 gui=NONE guibg=bg guifg=darkyellow
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
