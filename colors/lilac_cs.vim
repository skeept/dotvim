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
    CSAHi Normal term=NONE cterm=NONE ctermbg=95 ctermfg=255 gui=NONE guibg=#503040 guifg=#f0f0f0
    CSAHi Underlined term=underline cterm=underline ctermbg=95 ctermfg=153 gui=underline guibg=#503040 guifg=#b0d0f0
    CSAHi Ignore term=NONE cterm=NONE ctermbg=95 ctermfg=95 gui=NONE guibg=#503040 guifg=#503040
    CSAHi Error term=reverse cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi Todo term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=NONE guibg=#0000f0 guifg=#f0f000
    CSAHi String term=NONE cterm=NONE ctermbg=95 ctermfg=49 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Character term=NONE cterm=NONE ctermbg=95 ctermfg=49 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Number term=NONE cterm=NONE ctermbg=95 ctermfg=49 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Boolean term=NONE cterm=NONE ctermbg=95 ctermfg=49 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Float term=NONE cterm=NONE ctermbg=95 ctermfg=49 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Function term=NONE cterm=NONE ctermbg=95 ctermfg=216 gui=NONE guibg=#503040 guifg=#f0a070
    CSAHi Macro term=NONE cterm=NONE ctermbg=95 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=95 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=95 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi NonText term=bold cterm=bold ctermbg=95 ctermfg=250 gui=bold guibg=#503040 guifg=#c0c0c0
    CSAHi Directory term=bold cterm=underline ctermbg=95 ctermfg=226 gui=underline guibg=#503040 guifg=#f0f000
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi IncSearch term=reverse cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi Search term=reverse cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=95 ctermfg=211 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=95 ctermfg=255 gui=bold guibg=#503040 guifg=#f0f0f0
    CSAHi LineNr term=underline cterm=bold ctermbg=138 ctermfg=250 gui=bold guibg=#805070 guifg=#c0c0c0
    CSAHi Define term=NONE cterm=NONE ctermbg=95 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=95 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=95 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#f0f000 guifg=#000000
    CSAHi Debug term=NONE cterm=NONE ctermbg=95 ctermfg=153 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi Conditional term=NONE cterm=bold ctermbg=95 ctermfg=116 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Repeat term=NONE cterm=bold ctermbg=95 ctermfg=116 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Label term=NONE cterm=bold ctermbg=95 ctermfg=116 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Operator term=NONE cterm=bold ctermbg=95 ctermfg=116 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Keyword term=NONE cterm=bold ctermbg=95 ctermfg=116 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Exception term=NONE cterm=bold ctermbg=95 ctermfg=116 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Include term=NONE cterm=NONE ctermbg=95 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi Question term=NONE cterm=bold ctermbg=95 ctermfg=211 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=#f0f0f0 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=138 ctermfg=250 gui=bold guibg=#805070 guifg=#c0c0c0
    CSAHi VertSplit term=reverse cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=95 ctermfg=49 gui=bold guibg=#503040 guifg=#00f080
    CSAHi Visual term=reverse cterm=underline ctermbg=153 ctermfg=16 gui=underline guibg=#b0d0f0 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=95 ctermfg=255 gui=underline guibg=#503040 guifg=#f0f0f0
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=21 ctermfg=255 gui=NONE guibg=#0000f0 guifg=#f0f0f0
    CSAHi Folded term=NONE cterm=bold ctermbg=138 ctermfg=153 gui=bold guibg=#805070 guifg=#b0d0f0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=95 ctermfg=255 gui=NONE guibg=#503040 guifg=#f0f0f0
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=underline ctermbg=95 ctermfg=250 gui=underline guibg=#503040 guifg=#c0c0c0
    CSAHi Constant term=underline cterm=NONE ctermbg=95 ctermfg=49 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Special term=bold cterm=NONE ctermbg=95 ctermfg=153 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi Identifier term=underline cterm=NONE ctermbg=95 ctermfg=216 gui=NONE guibg=#503040 guifg=#f0a070
    CSAHi Statement term=bold cterm=bold ctermbg=95 ctermfg=116 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi PreProc term=underline cterm=NONE ctermbg=95 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi Type term=underline cterm=bold ctermbg=95 ctermfg=211 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi StorageClass term=NONE cterm=bold ctermbg=95 ctermfg=211 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi Structure term=NONE cterm=bold ctermbg=95 ctermfg=211 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi Typedef term=NONE cterm=bold ctermbg=95 ctermfg=211 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi Tag term=NONE cterm=NONE ctermbg=95 ctermfg=153 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=95 ctermfg=153 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=95 ctermfg=153 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=95 ctermfg=153 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=138 ctermfg=153 gui=bold guibg=#805070 guifg=#b0d0f0
    CSAHi DiffAdd term=bold cterm=bold ctermbg=138 ctermfg=226 gui=bold guibg=#805070 guifg=#f0f000
    CSAHi DiffChange term=bold cterm=NONE ctermbg=138 ctermfg=255 gui=NONE guibg=#805070 guifg=#f0f0f0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=138 ctermfg=95 gui=NONE guibg=#805070 guifg=#503040
    CSAHi DiffText term=reverse cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=#f0f000 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=96 ctermfg=255 gui=NONE guibg=#503040 guifg=#f0f0f0
    CSAHi Underlined term=underline cterm=underline ctermbg=96 ctermfg=195 gui=underline guibg=#503040 guifg=#b0d0f0
    CSAHi Ignore term=NONE cterm=NONE ctermbg=96 ctermfg=96 gui=NONE guibg=#503040 guifg=#503040
    CSAHi Error term=reverse cterm=bold ctermbg=195 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi Todo term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=NONE guibg=#0000f0 guifg=#f0f000
    CSAHi String term=NONE cterm=NONE ctermbg=96 ctermfg=49 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Character term=NONE cterm=NONE ctermbg=96 ctermfg=49 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Number term=NONE cterm=NONE ctermbg=96 ctermfg=49 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Boolean term=NONE cterm=NONE ctermbg=96 ctermfg=49 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Float term=NONE cterm=NONE ctermbg=96 ctermfg=49 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Function term=NONE cterm=NONE ctermbg=96 ctermfg=223 gui=NONE guibg=#503040 guifg=#f0a070
    CSAHi Macro term=NONE cterm=NONE ctermbg=96 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=96 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=96 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi NonText term=bold cterm=bold ctermbg=96 ctermfg=250 gui=bold guibg=#503040 guifg=#c0c0c0
    CSAHi Directory term=bold cterm=underline ctermbg=96 ctermfg=226 gui=underline guibg=#503040 guifg=#f0f000
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=195 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi IncSearch term=reverse cterm=bold ctermbg=195 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi Search term=reverse cterm=bold ctermbg=195 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=96 ctermfg=218 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=96 ctermfg=255 gui=bold guibg=#503040 guifg=#f0f0f0
    CSAHi LineNr term=underline cterm=bold ctermbg=139 ctermfg=250 gui=bold guibg=#805070 guifg=#c0c0c0
    CSAHi Define term=NONE cterm=NONE ctermbg=96 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=96 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=96 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#f0f000 guifg=#000000
    CSAHi Debug term=NONE cterm=NONE ctermbg=96 ctermfg=195 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi Conditional term=NONE cterm=bold ctermbg=96 ctermfg=123 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Repeat term=NONE cterm=bold ctermbg=96 ctermfg=123 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Label term=NONE cterm=bold ctermbg=96 ctermfg=123 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Operator term=NONE cterm=bold ctermbg=96 ctermfg=123 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Keyword term=NONE cterm=bold ctermbg=96 ctermfg=123 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Exception term=NONE cterm=bold ctermbg=96 ctermfg=123 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Include term=NONE cterm=NONE ctermbg=96 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi Question term=NONE cterm=bold ctermbg=96 ctermfg=218 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=#f0f0f0 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=139 ctermfg=250 gui=bold guibg=#805070 guifg=#c0c0c0
    CSAHi VertSplit term=reverse cterm=bold ctermbg=195 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=96 ctermfg=49 gui=bold guibg=#503040 guifg=#00f080
    CSAHi Visual term=reverse cterm=underline ctermbg=195 ctermfg=16 gui=underline guibg=#b0d0f0 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=96 ctermfg=255 gui=underline guibg=#503040 guifg=#f0f0f0
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=195 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=21 ctermfg=255 gui=NONE guibg=#0000f0 guifg=#f0f0f0
    CSAHi Folded term=NONE cterm=bold ctermbg=139 ctermfg=195 gui=bold guibg=#805070 guifg=#b0d0f0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=96 ctermfg=255 gui=NONE guibg=#503040 guifg=#f0f0f0
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=underline ctermbg=96 ctermfg=250 gui=underline guibg=#503040 guifg=#c0c0c0
    CSAHi Constant term=underline cterm=NONE ctermbg=96 ctermfg=49 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Special term=bold cterm=NONE ctermbg=96 ctermfg=195 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi Identifier term=underline cterm=NONE ctermbg=96 ctermfg=223 gui=NONE guibg=#503040 guifg=#f0a070
    CSAHi Statement term=bold cterm=bold ctermbg=96 ctermfg=123 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi PreProc term=underline cterm=NONE ctermbg=96 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi Type term=underline cterm=bold ctermbg=96 ctermfg=218 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi StorageClass term=NONE cterm=bold ctermbg=96 ctermfg=218 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi Structure term=NONE cterm=bold ctermbg=96 ctermfg=218 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi Typedef term=NONE cterm=bold ctermbg=96 ctermfg=218 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi Tag term=NONE cterm=NONE ctermbg=96 ctermfg=195 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=96 ctermfg=195 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=96 ctermfg=195 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=96 ctermfg=195 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=139 ctermfg=195 gui=bold guibg=#805070 guifg=#b0d0f0
    CSAHi DiffAdd term=bold cterm=bold ctermbg=139 ctermfg=226 gui=bold guibg=#805070 guifg=#f0f000
    CSAHi DiffChange term=bold cterm=NONE ctermbg=139 ctermfg=255 gui=NONE guibg=#805070 guifg=#f0f0f0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=139 ctermfg=96 gui=NONE guibg=#805070 guifg=#503040
    CSAHi DiffText term=reverse cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=#f0f000 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=255 gui=NONE guibg=#503040 guifg=#f0f0f0
    CSAHi Underlined term=underline cterm=underline ctermbg=59 ctermfg=153 gui=underline guibg=#503040 guifg=#b0d0f0
    CSAHi Ignore term=NONE cterm=NONE ctermbg=59 ctermfg=59 gui=NONE guibg=#503040 guifg=#503040
    CSAHi Error term=reverse cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi Todo term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=NONE guibg=#0000f0 guifg=#f0f000
    CSAHi String term=NONE cterm=NONE ctermbg=59 ctermfg=48 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Character term=NONE cterm=NONE ctermbg=59 ctermfg=48 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Number term=NONE cterm=NONE ctermbg=59 ctermfg=48 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Boolean term=NONE cterm=NONE ctermbg=59 ctermfg=48 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Float term=NONE cterm=NONE ctermbg=59 ctermfg=48 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Function term=NONE cterm=NONE ctermbg=59 ctermfg=215 gui=NONE guibg=#503040 guifg=#f0a070
    CSAHi Macro term=NONE cterm=NONE ctermbg=59 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=59 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=59 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi NonText term=bold cterm=bold ctermbg=59 ctermfg=250 gui=bold guibg=#503040 guifg=#c0c0c0
    CSAHi Directory term=bold cterm=underline ctermbg=59 ctermfg=226 gui=underline guibg=#503040 guifg=#f0f000
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi IncSearch term=reverse cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi Search term=reverse cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=59 ctermfg=205 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=59 ctermfg=255 gui=bold guibg=#503040 guifg=#f0f0f0
    CSAHi LineNr term=underline cterm=bold ctermbg=95 ctermfg=250 gui=bold guibg=#805070 guifg=#c0c0c0
    CSAHi Define term=NONE cterm=NONE ctermbg=59 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#f0f000 guifg=#000000
    CSAHi Debug term=NONE cterm=NONE ctermbg=59 ctermfg=153 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi Conditional term=NONE cterm=bold ctermbg=59 ctermfg=80 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Repeat term=NONE cterm=bold ctermbg=59 ctermfg=80 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Label term=NONE cterm=bold ctermbg=59 ctermfg=80 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Operator term=NONE cterm=bold ctermbg=59 ctermfg=80 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Keyword term=NONE cterm=bold ctermbg=59 ctermfg=80 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Exception term=NONE cterm=bold ctermbg=59 ctermfg=80 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Include term=NONE cterm=NONE ctermbg=59 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi Question term=NONE cterm=bold ctermbg=59 ctermfg=205 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=#f0f0f0 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=95 ctermfg=250 gui=bold guibg=#805070 guifg=#c0c0c0
    CSAHi VertSplit term=reverse cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=59 ctermfg=48 gui=bold guibg=#503040 guifg=#00f080
    CSAHi Visual term=reverse cterm=underline ctermbg=153 ctermfg=16 gui=underline guibg=#b0d0f0 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=59 ctermfg=255 gui=underline guibg=#503040 guifg=#f0f0f0
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=21 ctermfg=255 gui=NONE guibg=#0000f0 guifg=#f0f0f0
    CSAHi Folded term=NONE cterm=bold ctermbg=95 ctermfg=153 gui=bold guibg=#805070 guifg=#b0d0f0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=59 ctermfg=255 gui=NONE guibg=#503040 guifg=#f0f0f0
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=underline ctermbg=59 ctermfg=250 gui=underline guibg=#503040 guifg=#c0c0c0
    CSAHi Constant term=underline cterm=NONE ctermbg=59 ctermfg=48 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Special term=bold cterm=NONE ctermbg=59 ctermfg=153 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi Identifier term=underline cterm=NONE ctermbg=59 ctermfg=215 gui=NONE guibg=#503040 guifg=#f0a070
    CSAHi Statement term=bold cterm=bold ctermbg=59 ctermfg=80 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi PreProc term=underline cterm=NONE ctermbg=59 ctermfg=226 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi Type term=underline cterm=bold ctermbg=59 ctermfg=205 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi StorageClass term=NONE cterm=bold ctermbg=59 ctermfg=205 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi Structure term=NONE cterm=bold ctermbg=59 ctermfg=205 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi Typedef term=NONE cterm=bold ctermbg=59 ctermfg=205 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi Tag term=NONE cterm=NONE ctermbg=59 ctermfg=153 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=59 ctermfg=153 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=59 ctermfg=153 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=59 ctermfg=153 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=95 ctermfg=153 gui=bold guibg=#805070 guifg=#b0d0f0
    CSAHi DiffAdd term=bold cterm=bold ctermbg=95 ctermfg=226 gui=bold guibg=#805070 guifg=#f0f000
    CSAHi DiffChange term=bold cterm=NONE ctermbg=95 ctermfg=255 gui=NONE guibg=#805070 guifg=#f0f0f0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=95 ctermfg=59 gui=NONE guibg=#805070 guifg=#503040
    CSAHi DiffText term=reverse cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=#f0f000 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=32 ctermfg=87 gui=NONE guibg=#503040 guifg=#f0f0f0
    CSAHi Underlined term=underline cterm=underline ctermbg=32 ctermfg=59 gui=underline guibg=#503040 guifg=#b0d0f0
    CSAHi Ignore term=NONE cterm=NONE ctermbg=32 ctermfg=32 gui=NONE guibg=#503040 guifg=#503040
    CSAHi Error term=reverse cterm=bold ctermbg=59 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi Todo term=NONE cterm=NONE ctermbg=19 ctermfg=76 gui=NONE guibg=#0000f0 guifg=#f0f000
    CSAHi String term=NONE cterm=NONE ctermbg=32 ctermfg=29 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Character term=NONE cterm=NONE ctermbg=32 ctermfg=29 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Number term=NONE cterm=NONE ctermbg=32 ctermfg=29 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Boolean term=NONE cterm=NONE ctermbg=32 ctermfg=29 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Float term=NONE cterm=NONE ctermbg=32 ctermfg=29 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Function term=NONE cterm=NONE ctermbg=32 ctermfg=69 gui=NONE guibg=#503040 guifg=#f0a070
    CSAHi Macro term=NONE cterm=NONE ctermbg=32 ctermfg=76 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=32 ctermfg=76 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=32 ctermfg=76 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi NonText term=bold cterm=bold ctermbg=32 ctermfg=85 gui=bold guibg=#503040 guifg=#c0c0c0
    CSAHi Directory term=bold cterm=underline ctermbg=32 ctermfg=76 gui=underline guibg=#503040 guifg=#f0f000
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=59 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi IncSearch term=reverse cterm=bold ctermbg=59 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi Search term=reverse cterm=bold ctermbg=59 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=32 ctermfg=69 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi ModeMsg term=bold cterm=bold ctermbg=32 ctermfg=87 gui=bold guibg=#503040 guifg=#f0f0f0
    CSAHi LineNr term=underline cterm=bold ctermbg=37 ctermfg=85 gui=bold guibg=#805070 guifg=#c0c0c0
    CSAHi Define term=NONE cterm=NONE ctermbg=32 ctermfg=76 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=87 ctermfg=32 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=87 ctermfg=32 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#f0f000 guifg=#000000
    CSAHi Debug term=NONE cterm=NONE ctermbg=32 ctermfg=59 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi Conditional term=NONE cterm=bold ctermbg=32 ctermfg=42 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Repeat term=NONE cterm=bold ctermbg=32 ctermfg=42 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Label term=NONE cterm=bold ctermbg=32 ctermfg=42 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Operator term=NONE cterm=bold ctermbg=32 ctermfg=42 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Keyword term=NONE cterm=bold ctermbg=32 ctermfg=42 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Exception term=NONE cterm=bold ctermbg=32 ctermfg=42 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi Include term=NONE cterm=NONE ctermbg=32 ctermfg=76 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi Question term=NONE cterm=bold ctermbg=32 ctermfg=69 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=87 ctermfg=16 gui=bold guibg=#f0f0f0 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=37 ctermfg=85 gui=bold guibg=#805070 guifg=#c0c0c0
    CSAHi VertSplit term=reverse cterm=bold ctermbg=59 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=32 ctermfg=29 gui=bold guibg=#503040 guifg=#00f080
    CSAHi Visual term=reverse cterm=underline ctermbg=59 ctermfg=16 gui=underline guibg=#b0d0f0 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=32 ctermfg=87 gui=underline guibg=#503040 guifg=#f0f0f0
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=59 ctermfg=16 gui=bold guibg=#b0d0f0 guifg=#000000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=19 ctermfg=87 gui=NONE guibg=#0000f0 guifg=#f0f0f0
    CSAHi Folded term=NONE cterm=bold ctermbg=37 ctermfg=59 gui=bold guibg=#805070 guifg=#b0d0f0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=32 ctermfg=87 gui=NONE guibg=#503040 guifg=#f0f0f0
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=underline ctermbg=32 ctermfg=85 gui=underline guibg=#503040 guifg=#c0c0c0
    CSAHi Constant term=underline cterm=NONE ctermbg=32 ctermfg=29 gui=NONE guibg=#503040 guifg=#00f080
    CSAHi Special term=bold cterm=NONE ctermbg=32 ctermfg=59 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi Identifier term=underline cterm=NONE ctermbg=32 ctermfg=69 gui=NONE guibg=#503040 guifg=#f0a070
    CSAHi Statement term=bold cterm=bold ctermbg=32 ctermfg=42 gui=bold guibg=#503040 guifg=#60d0d0
    CSAHi PreProc term=underline cterm=NONE ctermbg=32 ctermfg=76 gui=NONE guibg=#503040 guifg=#f0f000
    CSAHi Type term=underline cterm=bold ctermbg=32 ctermfg=69 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi StorageClass term=NONE cterm=bold ctermbg=32 ctermfg=69 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi Structure term=NONE cterm=bold ctermbg=32 ctermfg=69 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi Typedef term=NONE cterm=bold ctermbg=32 ctermfg=69 gui=bold guibg=#503040 guifg=#f070a0
    CSAHi Tag term=NONE cterm=NONE ctermbg=32 ctermfg=59 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=32 ctermfg=59 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=32 ctermfg=59 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=32 ctermfg=59 gui=NONE guibg=#503040 guifg=#b0d0f0
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=37 ctermfg=59 gui=bold guibg=#805070 guifg=#b0d0f0
    CSAHi DiffAdd term=bold cterm=bold ctermbg=37 ctermfg=76 gui=bold guibg=#805070 guifg=#f0f000
    CSAHi DiffChange term=bold cterm=NONE ctermbg=37 ctermfg=87 gui=NONE guibg=#805070 guifg=#f0f0f0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=37 ctermfg=32 gui=NONE guibg=#805070 guifg=#503040
    CSAHi DiffText term=reverse cterm=bold ctermbg=76 ctermfg=16 gui=bold guibg=#f0f000 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
