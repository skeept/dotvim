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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=black guifg=#f6f3e8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=undercurl ctermbg=bg ctermfg=210 gui=undercurl guibg=bg guifg=fg guisp=#FF6C60
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8f8f8f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=156 gui=NONE guibg=bg guifg=#A8FF60
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=213 gui=NONE guibg=bg guifg=#FF73FD
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#FFD2A7
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=59 ctermfg=244 gui=NONE guibg=#343434 guifg=#808080
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=232 gui=NONE guibg=black guifg=#070707
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=210 ctermfg=231 gui=bold guibg=#FF6C60 guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=189 ctermfg=16 gui=bold guibg=#C6C5FE guifg=black
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=237 gui=NONE guibg=black guifg=#3D3D3D
    CSAHi rubyEscape term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi rubyInterpolationDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00A0A0
    CSAHi rubyControl term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#6699CC
    CSAHi rubyStringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#336633
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#444444 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=193 ctermfg=16 gui=NONE guibg=#cae682 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#121212 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#121212 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi rubyRegexpDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=#FF8000
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#6699CC
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#96CBFE
    CSAHi rubyRegexp term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#B18A3D
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=234 ctermfg=188 gui=italic guibg=#202020 guifg=#CCCCCC
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=234 ctermfg=16 gui=NONE guibg=#202020 guifg=black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=234 ctermfg=234 gui=NONE guibg=#202020 guifg=#202020
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f6f3e8
    CSAHi Visual term=reverse cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#262D51 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=210 ctermfg=231 gui=bold guibg=#FF6C60 guifg=white
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=46 gui=NONE guibg=yellow guifg=green
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#CCCCCC
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=138 ctermfg=231 gui=bold guibg=#857b6f guifg=#f6f3e8
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#7C7C7C
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=151 gui=NONE guibg=bg guifg=#99CC99
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#E18964
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#C6C5FE
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#6699CC
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#96CBFE
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#FFFFB6
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00A0A0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=153 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=195 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=black guifg=#f6f3e8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=undercurl ctermbg=bg ctermfg=216 gui=undercurl guibg=bg guifg=fg guisp=#FF6C60
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8f8f8f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=192 gui=NONE guibg=bg guifg=#A8FF60
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#FF73FD
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#FFD2A7
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=236 ctermfg=244 gui=NONE guibg=#343434 guifg=#808080
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=232 gui=NONE guibg=black guifg=#070707
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=216 ctermfg=255 gui=bold guibg=#FF6C60 guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=#C6C5FE guifg=black
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=237 gui=NONE guibg=black guifg=#3D3D3D
    CSAHi rubyEscape term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=white
    CSAHi rubyInterpolationDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=44 gui=NONE guibg=bg guifg=#00A0A0
    CSAHi rubyControl term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#6699CC
    CSAHi rubyStringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#336633
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#444444 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#cae682 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#121212 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#121212 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi rubyRegexpDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=#FF8000
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#6699CC
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=white
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#96CBFE
    CSAHi rubyRegexp term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#B18A3D
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=234 ctermfg=252 gui=italic guibg=#202020 guifg=#CCCCCC
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=234 ctermfg=16 gui=NONE guibg=#202020 guifg=black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=234 ctermfg=234 gui=NONE guibg=#202020 guifg=#202020
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f6f3e8
    CSAHi Visual term=reverse cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#262D51 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=216 ctermfg=255 gui=bold guibg=#FF6C60 guifg=white
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=46 gui=NONE guibg=yellow guifg=green
    CSAHi Folded term=NONE cterm=NONE ctermbg=66 ctermfg=188 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#CCCCCC
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=145 ctermfg=231 gui=bold guibg=#857b6f guifg=#f6f3e8
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#7C7C7C
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#99CC99
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#E18964
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#C6C5FE
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#6699CC
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#96CBFE
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#FFFFB6
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=44 gui=NONE guibg=bg guifg=#00A0A0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=231 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=230 gui=NONE guibg=black guifg=#f6f3e8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=undercurl ctermbg=bg ctermfg=203 gui=undercurl guibg=bg guifg=fg guisp=#FF6C60
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8f8f8f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=155 gui=NONE guibg=bg guifg=#A8FF60
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=207 gui=NONE guibg=bg guifg=#FF73FD
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#FFD2A7
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=236 ctermfg=244 gui=NONE guibg=#343434 guifg=#808080
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=232 gui=NONE guibg=black guifg=#070707
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=203 ctermfg=231 gui=bold guibg=#FF6C60 guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=230 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=189 ctermfg=16 gui=bold guibg=#C6C5FE guifg=black
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=237 gui=NONE guibg=black guifg=#3D3D3D
    CSAHi rubyEscape term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi rubyInterpolationDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00A0A0
    CSAHi rubyControl term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#6699CC
    CSAHi rubyStringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#336633
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=238 ctermfg=230 gui=NONE guibg=#444444 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=186 ctermfg=16 gui=NONE guibg=#cae682 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=230 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=230 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#121212 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#121212 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi rubyRegexpDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#FF8000
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#6699CC
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#96CBFE
    CSAHi rubyRegexp term=NONE cterm=NONE ctermbg=bg ctermfg=137 gui=NONE guibg=bg guifg=#B18A3D
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=234 ctermfg=252 gui=italic guibg=#202020 guifg=#CCCCCC
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=234 ctermfg=16 gui=NONE guibg=#202020 guifg=black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=234 ctermfg=234 gui=NONE guibg=#202020 guifg=#202020
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=230 gui=bold guibg=bg guifg=#f6f3e8
    CSAHi Visual term=reverse cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#262D51 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=203 ctermfg=231 gui=bold guibg=#FF6C60 guifg=white
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=46 gui=NONE guibg=yellow guifg=green
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=#CCCCCC
    CSAHi lCursor term=NONE cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=101 ctermfg=230 gui=bold guibg=#857b6f guifg=#f6f3e8
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#7C7C7C
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=114 gui=NONE guibg=bg guifg=#99CC99
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#E18964
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#C6C5FE
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#6699CC
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#96CBFE
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#FFFFB6
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00A0A0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=152 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=195 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=black guifg=#f6f3e8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=undercurl ctermbg=bg ctermfg=69 gui=undercurl guibg=bg guifg=fg guisp=#FF6C60
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#8f8f8f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#A8FF60
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#FF73FD
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#FFD2A7
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=80 ctermfg=83 gui=NONE guibg=#343434 guifg=#808080
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=black guifg=#070707
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=69 ctermfg=79 gui=bold guibg=#FF6C60 guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=59 ctermfg=16 gui=bold guibg=#C6C5FE guifg=black
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=80 gui=NONE guibg=black guifg=#3D3D3D
    CSAHi rubyEscape term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=white
    CSAHi rubyInterpolationDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#00A0A0
    CSAHi rubyControl term=NONE cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#6699CC
    CSAHi rubyStringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=#336633
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#444444 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#cae682 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#121212 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#121212 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi rubyRegexpDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#FF8000
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#6699CC
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=white
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#96CBFE
    CSAHi rubyRegexp term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#B18A3D
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=80 ctermfg=58 gui=italic guibg=#202020 guifg=#CCCCCC
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=80 ctermfg=16 gui=NONE guibg=#202020 guifg=black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=80 ctermfg=80 gui=NONE guibg=#202020 guifg=#202020
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#f6f3e8
    CSAHi Visual term=reverse cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#262D51 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=69 ctermfg=79 gui=bold guibg=#FF6C60 guifg=white
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=28 gui=NONE guibg=yellow guifg=green
    CSAHi Folded term=NONE cterm=NONE ctermbg=17 ctermfg=38 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi javaDocSeeTag term=NONE cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#CCCCCC
    CSAHi lCursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=37 ctermfg=79 gui=bold guibg=#857b6f guifg=#f6f3e8
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=82 gui=NONE guibg=bg guifg=#7C7C7C
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#99CC99
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#E18964
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#C6C5FE
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#6699CC
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#96CBFE
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=#FFFFB6
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#00A0A0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=63 ctermfg=19 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=64 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
