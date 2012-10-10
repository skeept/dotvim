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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#00afff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=234 ctermfg=224 gui=NONE guibg=#1c1c1c guifg=#ffd7d7
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#ff875f
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=177 gui=NONE guibg=bg guifg=#d75fff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=233 ctermfg=245 gui=NONE guibg=#121212 guifg=#8a8a8a
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=#a8a8a8 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=229 gui=NONE guibg=#000000 guifg=#ffff87
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=33 gui=bold guibg=bg guifg=#005fff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=235 ctermfg=231 gui=NONE guibg=#262626 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=21 ctermfg=231 gui=NONE guibg=#0000ff guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=#ffffff
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#101010 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=154 gui=NONE guibg=bg guifg=#afff00
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=142 gui=NONE guibg=bg guifg=#afaf00
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#afffff
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=21 ctermfg=231 gui=reverse,bold guibg=#ffffff guifg=#0000ff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=18 ctermfg=252 gui=reverse guibg=#d0d0d0 guifg=#00005f
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=#EEEEEE guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=146 ctermfg=16 gui=NONE guibg=#87afd7 guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=248 gui=italic guibg=bg guifg=#a8a8a8
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Special term=bold cterm=NONE ctermbg=234 ctermfg=212 gui=NONE guibg=#1c1c1c guifg=#ff5fd7
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#0087ff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=#00d700
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#ff5f00
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#5fafff
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=19 gui=NONE guibg=#000000 guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=244 ctermfg=238 gui=bold guibg=#808080 guifg=#444444
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=Red guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=19 gui=NONE guibg=#000000 guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=45 gui=underline guibg=bg guifg=#00afff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=234 ctermfg=231 gui=NONE guibg=#1c1c1c guifg=#ffd7d7
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#ff875f
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=213 gui=NONE guibg=bg guifg=#d75fff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=233 ctermfg=245 gui=NONE guibg=#121212 guifg=#8a8a8a
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=#a8a8a8 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=229 gui=NONE guibg=#000000 guifg=#ffff87
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=33 gui=bold guibg=bg guifg=#005fff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=235 ctermfg=255 gui=NONE guibg=#262626 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=21 ctermfg=255 gui=NONE guibg=#0000ff guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=#ffffff
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#101010 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=190 gui=NONE guibg=bg guifg=#afff00
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#afaf00
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#afffff
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=21 ctermfg=255 gui=reverse,bold guibg=#ffffff guifg=#0000ff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=18 ctermfg=252 gui=reverse guibg=#d0d0d0 guifg=#00005f
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=#EEEEEE guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#87afd7 guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=248 gui=italic guibg=bg guifg=#a8a8a8
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Special term=bold cterm=NONE ctermbg=234 ctermfg=213 gui=NONE guibg=#1c1c1c guifg=#ff5fd7
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#0087ff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00d700
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#ff5f00
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#5fafff
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=19 gui=NONE guibg=#000000 guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=244 ctermfg=238 gui=bold guibg=#808080 guifg=#444444
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=255 gui=bold guibg=Red guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=19 gui=NONE guibg=#000000 guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#00afff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=234 ctermfg=224 gui=NONE guibg=#1c1c1c guifg=#ffd7d7
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=#ff875f
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=171 gui=NONE guibg=bg guifg=#d75fff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=233 ctermfg=245 gui=NONE guibg=#121212 guifg=#8a8a8a
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=#a8a8a8 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=228 gui=NONE guibg=#000000 guifg=#ffff87
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=27 gui=bold guibg=bg guifg=#005fff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=235 ctermfg=231 gui=NONE guibg=#262626 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=21 ctermfg=231 gui=NONE guibg=#0000ff guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=#ffffff
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=233 ctermfg=fg gui=NONE guibg=#101010 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=154 gui=NONE guibg=bg guifg=#afff00
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=142 gui=NONE guibg=bg guifg=#afaf00
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#afffff
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=21 ctermfg=231 gui=reverse,bold guibg=#ffffff guifg=#0000ff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=17 ctermfg=252 gui=reverse guibg=#d0d0d0 guifg=#00005f
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=#EEEEEE guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=110 ctermfg=16 gui=NONE guibg=#87afd7 guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=248 gui=italic guibg=bg guifg=#a8a8a8
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Special term=bold cterm=NONE ctermbg=234 ctermfg=206 gui=NONE guibg=#1c1c1c guifg=#ff5fd7
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#0087ff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=#00d700
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=202 gui=NONE guibg=bg guifg=#ff5f00
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#5fafff
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=18 gui=NONE guibg=#000000 guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=244 ctermfg=238 gui=bold guibg=#808080 guifg=#444444
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=Red guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=18 gui=NONE guibg=#000000 guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=27 gui=underline guibg=bg guifg=#00afff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=80 ctermfg=74 gui=NONE guibg=#1c1c1c guifg=#ffd7d7
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff875f
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=55 gui=NONE guibg=bg guifg=#d75fff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ff0000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#121212 guifg=#8a8a8a
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=84 ctermfg=16 gui=NONE guibg=#a8a8a8 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=#000000 guifg=#ffff87
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#005fff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#262626 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=19 ctermfg=79 gui=NONE guibg=#0000ff guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=#ffffff
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#101010 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#afff00
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=56 gui=NONE guibg=bg guifg=#afaf00
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=63 gui=NONE guibg=bg guifg=#afffff
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=19 ctermfg=79 gui=reverse,bold guibg=#ffffff guifg=#0000ff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=17 ctermfg=86 gui=reverse guibg=#d0d0d0 guifg=#00005f
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=87 gui=reverse guibg=#EEEEEE guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=86 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=42 ctermfg=16 gui=NONE guibg=#87afd7 guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=84 gui=italic guibg=bg guifg=#a8a8a8
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Special term=bold cterm=NONE ctermbg=80 ctermfg=70 gui=NONE guibg=#1c1c1c guifg=#ff5fd7
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#0087ff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=24 gui=NONE guibg=bg guifg=#00d700
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#ff5f00
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#5fafff
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ff0000
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=17 gui=NONE guibg=#000000 guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=83 ctermfg=80 gui=bold guibg=#808080 guifg=#444444
    CSAHi DiffText term=reverse cterm=bold ctermbg=64 ctermfg=79 gui=bold guibg=Red guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=17 gui=NONE guibg=#000000 guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
