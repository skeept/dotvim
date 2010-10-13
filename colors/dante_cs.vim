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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=181 gui=NONE guibg=black guifg=peachpuff3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=104 gui=underline guibg=bg guifg=slateblue
    CSAHi Ignore term=bold cterm=NONE ctermbg=bg ctermfg=243 gui=NONE guibg=bg guifg=gray45
    CSAHi Error term=reverse cterm=NONE ctermbg=160 ctermfg=250 gui=NONE guibg=red3 guifg=gray
    CSAHi Todo term=NONE cterm=bold ctermbg=142 ctermfg=234 gui=bold guibg=yellow4 guifg=gray10
    CSAHi Number term=underline cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red2
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=239 gui=NONE guibg=bg guifg=gray30
    CSAHi NonText term=bold cterm=bold ctermbg=232 ctermfg=59 gui=bold guibg=gray3 guifg=gray20
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=royalblue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=red3 guifg=white
    CSAHi IncSearch term=reverse cterm=bold ctermbg=214 ctermfg=16 gui=reverse,bold guibg=bg guifg=darkgoldenrod2
    CSAHi Search term=reverse cterm=NONE ctermbg=220 ctermfg=234 gui=NONE guibg=gold2 guifg=gray10
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=191 gui=bold guibg=bg guifg=olivedrab1
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=232 ctermfg=145 gui=NONE guibg=gray4 guifg=ivory4
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=181 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=181 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=181 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=191 gui=bold guibg=bg guifg=olivedrab1
    CSAHi StatusLine term=reverse cterm=NONE ctermbg=145 ctermfg=16 gui=reverse guibg=bg guifg=gray60
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=102 ctermfg=16 gui=reverse guibg=bg guifg=gray40
    CSAHi VertSplit term=reverse cterm=bold ctermbg=102 ctermfg=16 gui=reverse,bold guibg=bg guifg=gray40
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=122 gui=bold guibg=bg guifg=aquamarine
    CSAHi Visual term=reverse,bold cterm=bold ctermbg=102 ctermfg=16 gui=reverse,bold guibg=black guifg=gray40
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=160 gui=bold guibg=bg guifg=red3
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=gold2 guifg=black
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=69 gui=NONE guibg=white guifg=royalblue1
    CSAHi lCursor term=NONE cterm=NONE ctermbg=181 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=cyan4
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=firebrick3
    CSAHi Special term=underline cterm=NONE ctermbg=bg ctermfg=137 gui=NONE guibg=bg guifg=sienna
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=107 gui=NONE guibg=bg guifg=darkolivegreen4
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=178 gui=NONE guibg=bg guifg=gold3
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=dodgerblue4
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=112 gui=NONE guibg=bg guifg=chartreuse3
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=231 ctermfg=68 gui=NONE guibg=white guifg=royalblue3
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=69 ctermfg=fg gui=NONE guibg=royalblue2 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=132 ctermfg=fg gui=NONE guibg=maroon guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=153 gui=bold guibg=cyan4 guifg=lightblue
    CSAHi DiffText term=reverse cterm=bold ctermbg=160 ctermfg=fg gui=bold guibg=red3 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=224 gui=NONE guibg=black guifg=peachpuff3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=105 gui=underline guibg=bg guifg=slateblue
    CSAHi Ignore term=bold cterm=NONE ctermbg=bg ctermfg=243 gui=NONE guibg=bg guifg=gray45
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=250 gui=NONE guibg=red3 guifg=gray
    CSAHi Todo term=NONE cterm=bold ctermbg=142 ctermfg=234 gui=bold guibg=yellow4 guifg=gray10
    CSAHi Number term=underline cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red2
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=239 gui=NONE guibg=bg guifg=gray30
    CSAHi NonText term=bold cterm=bold ctermbg=232 ctermfg=236 gui=bold guibg=gray3 guifg=gray20
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=105 gui=NONE guibg=bg guifg=royalblue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=red3 guifg=white
    CSAHi IncSearch term=reverse cterm=bold ctermbg=220 ctermfg=16 gui=reverse,bold guibg=bg guifg=darkgoldenrod2
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=234 gui=NONE guibg=gold2 guifg=gray10
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=227 gui=bold guibg=bg guifg=olivedrab1
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=232 ctermfg=145 gui=NONE guibg=gray4 guifg=ivory4
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=224 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=224 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=224 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=227 gui=bold guibg=bg guifg=olivedrab1
    CSAHi StatusLine term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=reverse guibg=bg guifg=gray60
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=241 ctermfg=16 gui=reverse guibg=bg guifg=gray40
    CSAHi VertSplit term=reverse cterm=bold ctermbg=241 ctermfg=16 gui=reverse,bold guibg=bg guifg=gray40
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=159 gui=bold guibg=bg guifg=aquamarine
    CSAHi Visual term=reverse,bold cterm=bold ctermbg=241 ctermfg=16 gui=reverse,bold guibg=black guifg=gray40
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=red3
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=gold2 guifg=black
    CSAHi Folded term=NONE cterm=NONE ctermbg=255 ctermfg=111 gui=NONE guibg=white guifg=royalblue1
    CSAHi lCursor term=NONE cterm=NONE ctermbg=224 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=cyan4
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=firebrick3
    CSAHi Special term=underline cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=sienna
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=darkolivegreen4
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=gold3
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=dodgerblue4
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=118 gui=NONE guibg=bg guifg=chartreuse3
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=69 gui=NONE guibg=white guifg=royalblue3
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=111 ctermfg=fg gui=NONE guibg=royalblue2 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=168 ctermfg=fg gui=NONE guibg=maroon guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=195 gui=bold guibg=cyan4 guifg=lightblue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=red3 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=180 gui=NONE guibg=black guifg=peachpuff3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=62 gui=underline guibg=bg guifg=slateblue
    CSAHi Ignore term=bold cterm=NONE ctermbg=bg ctermfg=243 gui=NONE guibg=bg guifg=gray45
    CSAHi Error term=reverse cterm=NONE ctermbg=160 ctermfg=250 gui=NONE guibg=red3 guifg=gray
    CSAHi Todo term=NONE cterm=bold ctermbg=100 ctermfg=234 gui=bold guibg=yellow4 guifg=gray10
    CSAHi Number term=underline cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red2
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=239 gui=NONE guibg=bg guifg=gray30
    CSAHi NonText term=bold cterm=bold ctermbg=232 ctermfg=236 gui=bold guibg=gray3 guifg=gray20
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=62 gui=NONE guibg=bg guifg=royalblue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=red3 guifg=white
    CSAHi IncSearch term=reverse cterm=bold ctermbg=214 ctermfg=16 gui=reverse,bold guibg=bg guifg=darkgoldenrod2
    CSAHi Search term=reverse cterm=NONE ctermbg=220 ctermfg=234 gui=NONE guibg=gold2 guifg=gray10
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=155 gui=bold guibg=bg guifg=olivedrab1
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=232 ctermfg=102 gui=NONE guibg=gray4 guifg=ivory4
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=180 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=180 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=180 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=155 gui=bold guibg=bg guifg=olivedrab1
    CSAHi StatusLine term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=reverse guibg=bg guifg=gray60
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=241 ctermfg=16 gui=reverse guibg=bg guifg=gray40
    CSAHi VertSplit term=reverse cterm=bold ctermbg=241 ctermfg=16 gui=reverse,bold guibg=bg guifg=gray40
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=122 gui=bold guibg=bg guifg=aquamarine
    CSAHi Visual term=reverse,bold cterm=bold ctermbg=241 ctermfg=16 gui=reverse,bold guibg=black guifg=gray40
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=160 gui=bold guibg=bg guifg=red3
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=gold2 guifg=black
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=69 gui=NONE guibg=white guifg=royalblue1
    CSAHi lCursor term=NONE cterm=NONE ctermbg=180 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=30 gui=NONE guibg=bg guifg=cyan4
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=160 gui=NONE guibg=bg guifg=firebrick3
    CSAHi Special term=underline cterm=NONE ctermbg=bg ctermfg=130 gui=NONE guibg=bg guifg=sienna
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=darkolivegreen4
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=178 gui=NONE guibg=bg guifg=gold3
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=24 gui=NONE guibg=bg guifg=dodgerblue4
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=chartreuse3
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=231 ctermfg=62 gui=NONE guibg=white guifg=royalblue3
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=63 ctermfg=fg gui=NONE guibg=royalblue2 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=131 ctermfg=fg gui=NONE guibg=maroon guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=30 ctermfg=152 gui=bold guibg=cyan4 guifg=lightblue
    CSAHi DiffText term=reverse cterm=bold ctermbg=160 ctermfg=fg gui=bold guibg=red3 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=57 gui=NONE guibg=black guifg=peachpuff3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=slateblue
    CSAHi Ignore term=bold cterm=NONE ctermbg=bg ctermfg=82 gui=NONE guibg=bg guifg=gray45
    CSAHi Error term=reverse cterm=NONE ctermbg=48 ctermfg=85 gui=NONE guibg=red3 guifg=gray
    CSAHi Todo term=NONE cterm=bold ctermbg=36 ctermfg=80 gui=bold guibg=yellow4 guifg=gray10
    CSAHi Number term=underline cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=red2
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=gray30
    CSAHi NonText term=bold cterm=bold ctermbg=16 ctermfg=80 gui=bold guibg=gray3 guifg=gray20
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=royalblue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=48 ctermfg=79 gui=NONE guibg=red3 guifg=white
    CSAHi IncSearch term=reverse cterm=bold ctermbg=72 ctermfg=16 gui=reverse,bold guibg=bg guifg=darkgoldenrod2
    CSAHi Search term=reverse cterm=NONE ctermbg=72 ctermfg=80 gui=NONE guibg=gold2 guifg=gray10
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=60 gui=bold guibg=bg guifg=olivedrab1
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=gray4 guifg=ivory4
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=57 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=60 gui=bold guibg=bg guifg=olivedrab1
    CSAHi StatusLine term=reverse cterm=NONE ctermbg=84 ctermfg=16 gui=reverse guibg=bg guifg=gray60
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=81 ctermfg=16 gui=reverse guibg=bg guifg=gray40
    CSAHi VertSplit term=reverse cterm=bold ctermbg=81 ctermfg=16 gui=reverse,bold guibg=bg guifg=gray40
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=aquamarine
    CSAHi Visual term=reverse,bold cterm=bold ctermbg=81 ctermfg=16 gui=reverse,bold guibg=black guifg=gray40
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=48 gui=bold guibg=bg guifg=red3
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=72 ctermfg=16 gui=NONE guibg=gold2 guifg=black
    CSAHi Folded term=NONE cterm=NONE ctermbg=79 ctermfg=39 gui=NONE guibg=white guifg=royalblue1
    CSAHi lCursor term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=cyan4
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=firebrick3
    CSAHi Special term=underline cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=sienna
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=darkolivegreen4
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=56 gui=NONE guibg=bg guifg=gold3
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=dodgerblue4
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=chartreuse3
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=79 ctermfg=22 gui=NONE guibg=white guifg=royalblue3
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=royalblue2 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=49 ctermfg=fg gui=NONE guibg=maroon guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=21 ctermfg=58 gui=bold guibg=cyan4 guifg=lightblue
    CSAHi DiffText term=reverse cterm=bold ctermbg=48 ctermfg=fg gui=bold guibg=red3 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
