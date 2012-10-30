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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#000000 guifg=#eeeeec
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=203 ctermfg=255 gui=NONE guibg=#ef2929 guifg=#eeeeec
    CSAHi Todo term=NONE cterm=bold ctermbg=106 ctermfg=149 gui=bold guibg=#4e9a06 guifg=#8ae234
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#729fcf
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=102 gui=NONE guibg=#000000 guifg=#555753
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=110 ctermfg=255 gui=reverse guibg=#eeeeec guifg=#729fcf
    CSAHi Search term=reverse cterm=NONE ctermbg=178 ctermfg=255 gui=NONE guibg=#c4a000 guifg=#eeeeec
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=131 gui=NONE guibg=bg guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#d3d7cf guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=106 ctermfg=255 gui=bold guibg=#4e9a06 guifg=#eeeeec
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=106 gui=reverse guibg=#4e9a06 guifg=#d3d7df
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=255 ctermfg=255 gui=reverse guibg=#eeeeec guifg=#eeeeec
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#eeeeec
    CSAHi Visual term=reverse cterm=NONE ctermbg=106 ctermfg=188 gui=NONE guibg=#4e9a06 guifg=#d3d7cf
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#75507b guifg=#eeeeec
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#d3d7cf guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=italic guibg=bg guifg=#06989a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=178 gui=NONE guibg=bg guifg=#c4a000
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#75507b
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=#8ae234
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=106 gui=bold guibg=bg guifg=#4e9a06
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=160 gui=NONE guibg=bg guifg=#cc0000
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=188 gui=bold guibg=bg guifg=#d3d7cf
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=67 ctermfg=255 gui=NONE guibg=#3465a4 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#555753 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=178 ctermfg=255 gui=NONE guibg=#c4a000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#000000 guifg=#eeeeec
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=203 ctermfg=255 gui=NONE guibg=#ef2929 guifg=#eeeeec
    CSAHi Todo term=NONE cterm=bold ctermbg=112 ctermfg=155 gui=bold guibg=#4e9a06 guifg=#8ae234
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#729fcf
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=102 gui=NONE guibg=#000000 guifg=#555753
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=153 ctermfg=255 gui=reverse guibg=#eeeeec guifg=#729fcf
    CSAHi Search term=reverse cterm=NONE ctermbg=220 ctermfg=255 gui=NONE guibg=#c4a000 guifg=#eeeeec
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#d3d7cf guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=112 ctermfg=255 gui=bold guibg=#4e9a06 guifg=#eeeeec
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=231 ctermfg=112 gui=reverse guibg=#4e9a06 guifg=#d3d7df
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=255 ctermfg=255 gui=reverse guibg=#eeeeec guifg=#eeeeec
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#eeeeec
    CSAHi Visual term=reverse cterm=NONE ctermbg=112 ctermfg=231 gui=NONE guibg=#4e9a06 guifg=#d3d7cf
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=139 ctermfg=255 gui=NONE guibg=#75507b guifg=#eeeeec
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#d3d7cf guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=44 gui=italic guibg=bg guifg=#06989a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=#c4a000
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=139 gui=NONE guibg=bg guifg=#75507b
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=155 gui=NONE guibg=bg guifg=#8ae234
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=112 gui=bold guibg=bg guifg=#4e9a06
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#cc0000
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#d3d7cf
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=68 ctermfg=255 gui=NONE guibg=#3465a4 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#555753 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=220 ctermfg=255 gui=NONE guibg=#c4a000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#000000 guifg=#eeeeec
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#ef2929 guifg=#eeeeec
    CSAHi Todo term=NONE cterm=bold ctermbg=64 ctermfg=113 gui=bold guibg=#4e9a06 guifg=#8ae234
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#729fcf
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=#000000 guifg=#555753
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=74 ctermfg=255 gui=reverse guibg=#eeeeec guifg=#729fcf
    CSAHi Search term=reverse cterm=NONE ctermbg=178 ctermfg=255 gui=NONE guibg=#c4a000 guifg=#eeeeec
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#d3d7cf guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=64 ctermfg=255 gui=bold guibg=#4e9a06 guifg=#eeeeec
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=64 gui=reverse guibg=#4e9a06 guifg=#d3d7df
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=255 ctermfg=255 gui=reverse guibg=#eeeeec guifg=#eeeeec
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#eeeeec
    CSAHi Visual term=reverse cterm=NONE ctermbg=64 ctermfg=188 gui=NONE guibg=#4e9a06 guifg=#d3d7cf
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=96 ctermfg=255 gui=NONE guibg=#75507b guifg=#eeeeec
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#d3d7cf guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=30 gui=italic guibg=bg guifg=#06989a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=178 gui=NONE guibg=bg guifg=#c4a000
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=96 gui=NONE guibg=bg guifg=#75507b
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=#8ae234
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=64 gui=bold guibg=bg guifg=#4e9a06
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=160 gui=NONE guibg=bg guifg=#cc0000
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=188 gui=bold guibg=bg guifg=#d3d7cf
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=61 ctermfg=255 gui=NONE guibg=#3465a4 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=255 gui=NONE guibg=#555753 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=178 ctermfg=255 gui=NONE guibg=#c4a000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=#000000 guifg=#eeeeec
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=87 gui=NONE guibg=#ef2929 guifg=#eeeeec
    CSAHi Todo term=NONE cterm=bold ctermbg=36 ctermfg=40 gui=bold guibg=#4e9a06 guifg=#8ae234
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#729fcf
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=81 gui=NONE guibg=#000000 guifg=#555753
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=38 ctermfg=87 gui=reverse guibg=#eeeeec guifg=#729fcf
    CSAHi Search term=reverse cterm=NONE ctermbg=52 ctermfg=87 gui=NONE guibg=#c4a000 guifg=#eeeeec
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=87 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=87 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=86 ctermfg=16 gui=NONE guibg=#d3d7cf guifg=bg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=36 ctermfg=87 gui=bold guibg=#4e9a06 guifg=#eeeeec
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=58 ctermfg=36 gui=reverse guibg=#4e9a06 guifg=#d3d7df
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=87 ctermfg=87 gui=reverse guibg=#eeeeec guifg=#eeeeec
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=87 gui=bold guibg=bg guifg=#eeeeec
    CSAHi Visual term=reverse cterm=NONE ctermbg=36 ctermfg=86 gui=NONE guibg=#4e9a06 guifg=#d3d7cf
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=37 ctermfg=87 gui=NONE guibg=#75507b guifg=#eeeeec
    CSAHi lCursor term=NONE cterm=NONE ctermbg=86 ctermfg=16 gui=NONE guibg=#d3d7cf guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=italic guibg=bg guifg=#06989a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#c4a000
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#75507b
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=#8ae234
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=36 gui=bold guibg=bg guifg=#4e9a06
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=#cc0000
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=86 gui=bold guibg=bg guifg=#d3d7cf
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=21 ctermfg=87 gui=NONE guibg=#3465a4 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=81 ctermfg=87 gui=NONE guibg=#555753 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=19 gui=bold guibg=bg guifg=Blue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=52 ctermfg=87 gui=NONE guibg=#c4a000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
