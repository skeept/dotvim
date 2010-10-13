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
    CSAHi Normal term=NONE cterm=NONE ctermbg=58 ctermfg=188 gui=NONE guibg=#333300 guifg=#D9D9C3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=black
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=white
    CSAHi Todo term=NONE cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=gold guifg=black
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=155 gui=NONE guibg=bg guifg=greenyellow
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=186 ctermfg=16 gui=NONE guibg=darkkhaki guifg=black
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=underline ctermbg=bg ctermfg=220 gui=underline guibg=bg guifg=gold
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=174 ctermfg=231 gui=NONE guibg=indianred guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=229 gui=reverse guibg=khaki guifg=black
    CSAHi Search term=reverse cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=khaki guifg=black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=155 gui=bold guibg=bg guifg=greenyellow
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=155 gui=bold guibg=bg guifg=greenyellow
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=gray80
    CSAHi VimError term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=red
    CSAHi VimOption term=NONE cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=gold
    CSAHi texSection term=NONE cterm=NONE ctermbg=bg ctermfg=155 gui=NONE guibg=bg guifg=greenyellow
    CSAHi texMatcher term=NONE cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi texMath term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=188 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=188 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi cIncluded term=NONE cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=gold
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=142 ctermfg=229 gui=NONE guibg=#808000 guifg=palegoldenrod
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=101 ctermfg=250 gui=NONE guibg=darkolivegreen guifg=gray
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=palegoldenrod
    CSAHi Visual term=reverse cterm=NONE ctermbg=186 ctermfg=16 gui=NONE guibg=darkkhaki guifg=black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=175 gui=NONE guibg=bg guifg=palevioletred
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=underline ctermbg=101 ctermfg=229 gui=underline guibg=darkolivegreen guifg=khaki
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=58 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=underline ctermbg=58 ctermfg=186 gui=underline guibg=#4C4C00 guifg=darkkhaki
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=navajowhite
    CSAHi Special term=bold cterm=underline ctermbg=bg ctermfg=223 gui=underline guibg=bg guifg=navajowhite
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=151 gui=bold guibg=bg guifg=darkseagreen
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=216 gui=bold guibg=bg guifg=sandybrown
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=179 gui=bold guibg=bg guifg=goldenrod
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=101 ctermfg=229 gui=NONE guibg=darkolivegreen guifg=khaki
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=58 ctermfg=231 gui=NONE guibg=#333300 guifg=#D9D9C3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=black
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=white
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=gold guifg=black
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=greenyellow
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=darkkhaki guifg=black
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=underline ctermbg=bg ctermfg=226 gui=underline guibg=bg guifg=gold
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=210 ctermfg=255 gui=NONE guibg=indianred guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=229 gui=reverse guibg=khaki guifg=black
    CSAHi Search term=reverse cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=khaki guifg=black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=191 gui=bold guibg=bg guifg=greenyellow
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=191 gui=bold guibg=bg guifg=greenyellow
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=gray80
    CSAHi VimError term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=red
    CSAHi VimOption term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=gold
    CSAHi texSection term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=greenyellow
    CSAHi texMatcher term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi texMath term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi cIncluded term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=gold
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=142 ctermfg=230 gui=NONE guibg=#808000 guifg=palegoldenrod
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=107 ctermfg=250 gui=NONE guibg=darkolivegreen guifg=gray
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=231 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=230 gui=bold guibg=bg guifg=palegoldenrod
    CSAHi Visual term=reverse cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=darkkhaki guifg=black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=palevioletred
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=underline ctermbg=107 ctermfg=229 gui=underline guibg=darkolivegreen guifg=khaki
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=58 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=underline ctermbg=100 ctermfg=187 gui=underline guibg=#4C4C00 guifg=darkkhaki
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=navajowhite
    CSAHi Special term=bold cterm=underline ctermbg=bg ctermfg=230 gui=underline guibg=bg guifg=navajowhite
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=151 gui=bold guibg=bg guifg=darkseagreen
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=222 gui=bold guibg=bg guifg=sandybrown
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=221 gui=bold guibg=bg guifg=goldenrod
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=107 ctermfg=229 gui=NONE guibg=darkolivegreen guifg=khaki
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=58 ctermfg=187 gui=NONE guibg=#333300 guifg=#D9D9C3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=black
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=white
    CSAHi Todo term=NONE cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=gold guifg=black
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=154 gui=NONE guibg=bg guifg=greenyellow
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=143 ctermfg=16 gui=NONE guibg=darkkhaki guifg=black
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=underline ctermbg=bg ctermfg=220 gui=underline guibg=bg guifg=gold
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=167 ctermfg=231 gui=NONE guibg=indianred guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=222 gui=reverse guibg=khaki guifg=black
    CSAHi Search term=reverse cterm=NONE ctermbg=222 ctermfg=16 gui=NONE guibg=khaki guifg=black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=154 gui=bold guibg=bg guifg=greenyellow
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=154 gui=bold guibg=bg guifg=greenyellow
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=252 gui=NONE guibg=bg guifg=gray80
    CSAHi VimError term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=red
    CSAHi VimOption term=NONE cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=gold
    CSAHi texSection term=NONE cterm=NONE ctermbg=bg ctermfg=154 gui=NONE guibg=bg guifg=greenyellow
    CSAHi texMatcher term=NONE cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi texMath term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=187 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=187 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi cIncluded term=NONE cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=gold
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=100 ctermfg=223 gui=NONE guibg=#808000 guifg=palegoldenrod
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=58 ctermfg=250 gui=NONE guibg=darkolivegreen guifg=gray
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=187 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=223 gui=bold guibg=bg guifg=palegoldenrod
    CSAHi Visual term=reverse cterm=NONE ctermbg=143 ctermfg=16 gui=NONE guibg=darkkhaki guifg=black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=168 gui=NONE guibg=bg guifg=palevioletred
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=underline ctermbg=58 ctermfg=222 gui=underline guibg=darkolivegreen guifg=khaki
    CSAHi lCursor term=NONE cterm=NONE ctermbg=187 ctermfg=58 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=underline ctermbg=58 ctermfg=143 gui=underline guibg=#4C4C00 guifg=darkkhaki
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=navajowhite
    CSAHi Special term=bold cterm=underline ctermbg=bg ctermfg=223 gui=underline guibg=bg guifg=navajowhite
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=108 gui=bold guibg=bg guifg=darkseagreen
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=215 gui=bold guibg=bg guifg=sandybrown
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=178 gui=bold guibg=bg guifg=goldenrod
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=58 ctermfg=222 gui=NONE guibg=darkolivegreen guifg=khaki
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=58 gui=NONE guibg=#333300 guifg=#D9D9C3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=black
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=white
    CSAHi Todo term=NONE cterm=NONE ctermbg=72 ctermfg=16 gui=NONE guibg=gold guifg=black
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=greenyellow
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=darkkhaki guifg=black
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=underline ctermbg=bg ctermfg=72 gui=underline guibg=bg guifg=gold
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=53 ctermfg=79 gui=NONE guibg=indianred guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=73 gui=reverse guibg=khaki guifg=black
    CSAHi Search term=reverse cterm=NONE ctermbg=73 ctermfg=16 gui=NONE guibg=khaki guifg=black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=60 gui=bold guibg=bg guifg=greenyellow
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=60 gui=bold guibg=bg guifg=greenyellow
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=gray80
    CSAHi VimError term=NONE cterm=bold ctermbg=bg ctermfg=64 gui=bold guibg=bg guifg=red
    CSAHi VimOption term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=gold
    CSAHi texSection term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=greenyellow
    CSAHi texMatcher term=NONE cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi texMath term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=58 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=58 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi cIncluded term=NONE cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=gold
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=green guifg=black
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=36 ctermfg=77 gui=NONE guibg=#808000 guifg=palegoldenrod
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=36 ctermfg=85 gui=NONE guibg=darkolivegreen guifg=gray
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=58 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=palegoldenrod
    CSAHi Visual term=reverse cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=darkkhaki guifg=black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=palevioletred
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=underline ctermbg=36 ctermfg=73 gui=underline guibg=darkolivegreen guifg=khaki
    CSAHi lCursor term=NONE cterm=NONE ctermbg=58 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=underline ctermbg=36 ctermfg=57 gui=underline guibg=#4C4C00 guifg=darkkhaki
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=navajowhite
    CSAHi Special term=bold cterm=underline ctermbg=bg ctermfg=74 gui=underline guibg=bg guifg=navajowhite
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=lightsteelblue
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=41 gui=bold guibg=bg guifg=darkseagreen
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=sandybrown
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=52 gui=bold guibg=bg guifg=goldenrod
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=36 ctermfg=73 gui=NONE guibg=darkolivegreen guifg=khaki
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
