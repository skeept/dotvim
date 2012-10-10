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
    CSAHi Normal term=NONE cterm=NONE ctermbg=66 ctermfg=231 gui=NONE guibg=#35536f guifg=White
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=51 ctermfg=16 gui=bold guibg=Cyan guifg=Black
    CSAHi Todo term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=NONE guibg=Blue guifg=Yellow
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#7f7f7f
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=51 ctermfg=16 gui=bold guibg=Cyan guifg=Black
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=66 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=Black guifg=Yellow
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=175 gui=bold guibg=bg guifg=#d174a8
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=244 ctermfg=231 gui=bold guibg=#7f7f7f guifg=White
    CSAHi User2 term=NONE cterm=bold ctermbg=66 ctermfg=228 gui=bold guibg=#45637f guifg=#e7e77f
    CSAHi User3 term=NONE cterm=bold ctermbg=66 ctermfg=16 gui=bold guibg=#45637f guifg=Black
    CSAHi User4 term=NONE cterm=bold ctermbg=66 ctermfg=79 gui=bold guibg=#45637f guifg=#33cc99
    CSAHi Cream_ShowMarksHL term=NONE cterm=bold ctermbg=150 ctermfg=16 gui=bold guibg=#aacc77 guifg=Black
    CSAHi BadWord term=NONE cterm=NONE ctermbg=23 ctermfg=217 gui=NONE guibg=#003333 guifg=#ff9999
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=66 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=66 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=189 ctermfg=16 gui=reverse guibg=Black guifg=#bfbfef
    CSAHi User1 term=NONE cterm=bold ctermbg=66 ctermfg=143 gui=bold guibg=#45637f guifg=#999933
    CSAHi Match term=reverse,bold cterm=bold ctermbg=21 ctermfg=226 gui=reverse,bold guibg=Yellow guifg=Blue
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=175 gui=bold guibg=bg guifg=#d174a8
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=White guifg=Black
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=245 ctermfg=30 gui=bold guibg=#8f8f8f guifg=#116f6f
    CSAHi VertSplit term=reverse cterm=bold ctermbg=245 ctermfg=16 gui=bold guibg=#8f8f8f guifg=Black
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=120 gui=bold guibg=bg guifg=#74ff74
    CSAHi Visual term=reverse cterm=bold ctermbg=150 ctermfg=16 gui=bold guibg=#aacc77 guifg=Black
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=238 ctermfg=16 gui=reverse guibg=Black guifg=#414141
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=Cyan
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=21 ctermfg=231 gui=NONE guibg=Blue guifg=White
    CSAHi Folded term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#afcfef
    CSAHi lCursor term=NONE cterm=NONE ctermbg=66 ctermfg=231 gui=NONE guibg=bg guifg=fg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#e7e77f
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#3fffa7
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#bfbfef
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ef9f9f
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=116 gui=bold guibg=bg guifg=#5ad5d5
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=#74ff74
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=175 gui=bold guibg=bg guifg=#d174a8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=237 ctermfg=228 gui=NONE guibg=#3f3f3f guifg=#ffff74
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=Black guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#124a32 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=17 ctermfg=94 gui=bold guibg=#09172f guifg=#522719
    CSAHi DiffText term=reverse cterm=bold ctermbg=31 ctermfg=fg gui=bold guibg=#007f9f guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=67 ctermfg=255 gui=NONE guibg=#35536f guifg=White
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=51 ctermfg=16 gui=bold guibg=Cyan guifg=Black
    CSAHi Todo term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=NONE guibg=Blue guifg=Yellow
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=145 gui=bold guibg=bg guifg=#7f7f7f
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=51 ctermfg=16 gui=bold guibg=Cyan guifg=Black
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=255 ctermfg=67 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=Black guifg=Yellow
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=218 gui=bold guibg=bg guifg=#d174a8
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=145 ctermfg=255 gui=bold guibg=#7f7f7f guifg=White
    CSAHi User2 term=NONE cterm=bold ctermbg=103 ctermfg=229 gui=bold guibg=#45637f guifg=#e7e77f
    CSAHi User3 term=NONE cterm=bold ctermbg=103 ctermfg=16 gui=bold guibg=#45637f guifg=Black
    CSAHi User4 term=NONE cterm=bold ctermbg=103 ctermfg=86 gui=bold guibg=#45637f guifg=#33cc99
    CSAHi Cream_ShowMarksHL term=NONE cterm=bold ctermbg=193 ctermfg=16 gui=bold guibg=#aacc77 guifg=Black
    CSAHi BadWord term=NONE cterm=NONE ctermbg=23 ctermfg=224 gui=NONE guibg=#003333 guifg=#ff9999
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=67 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=67 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=189 ctermfg=16 gui=reverse guibg=Black guifg=#bfbfef
    CSAHi User1 term=NONE cterm=bold ctermbg=103 ctermfg=185 gui=bold guibg=#45637f guifg=#999933
    CSAHi Match term=reverse,bold cterm=bold ctermbg=21 ctermfg=226 gui=reverse,bold guibg=Yellow guifg=Blue
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=218 gui=bold guibg=bg guifg=#d174a8
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=White guifg=Black
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=245 ctermfg=37 gui=bold guibg=#8f8f8f guifg=#116f6f
    CSAHi VertSplit term=reverse cterm=bold ctermbg=245 ctermfg=16 gui=bold guibg=#8f8f8f guifg=Black
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=157 gui=bold guibg=bg guifg=#74ff74
    CSAHi Visual term=reverse cterm=bold ctermbg=193 ctermfg=16 gui=bold guibg=#aacc77 guifg=Black
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=238 ctermfg=16 gui=reverse guibg=Black guifg=#414141
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=Cyan
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=21 ctermfg=255 gui=NONE guibg=Blue guifg=White
    CSAHi Folded term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#afcfef
    CSAHi lCursor term=NONE cterm=NONE ctermbg=67 ctermfg=255 gui=NONE guibg=bg guifg=fg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#e7e77f
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=#3fffa7
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#bfbfef
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=#ef9f9f
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=123 gui=bold guibg=bg guifg=#5ad5d5
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#74ff74
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=218 gui=bold guibg=bg guifg=#d174a8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=237 ctermfg=229 gui=NONE guibg=#3f3f3f guifg=#ffff74
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=Black guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=29 ctermfg=fg gui=NONE guibg=#124a32 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=23 ctermfg=95 gui=bold guibg=#09172f guifg=#522719
    CSAHi DiffText term=reverse cterm=bold ctermbg=38 ctermfg=fg gui=bold guibg=#007f9f guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#35536f guifg=White
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=51 ctermfg=16 gui=bold guibg=Cyan guifg=Black
    CSAHi Todo term=NONE cterm=NONE ctermbg=21 ctermfg=226 gui=NONE guibg=Blue guifg=Yellow
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#7f7f7f
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=Yellow
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=51 ctermfg=16 gui=bold guibg=Cyan guifg=Black
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=Black guifg=Yellow
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=175 gui=bold guibg=bg guifg=#d174a8
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=244 ctermfg=231 gui=bold guibg=#7f7f7f guifg=White
    CSAHi User2 term=NONE cterm=bold ctermbg=60 ctermfg=186 gui=bold guibg=#45637f guifg=#e7e77f
    CSAHi User3 term=NONE cterm=bold ctermbg=60 ctermfg=16 gui=bold guibg=#45637f guifg=Black
    CSAHi User4 term=NONE cterm=bold ctermbg=60 ctermfg=78 gui=bold guibg=#45637f guifg=#33cc99
    CSAHi Cream_ShowMarksHL term=NONE cterm=bold ctermbg=150 ctermfg=16 gui=bold guibg=#aacc77 guifg=Black
    CSAHi BadWord term=NONE cterm=NONE ctermbg=23 ctermfg=210 gui=NONE guibg=#003333 guifg=#ff9999
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=147 ctermfg=16 gui=reverse guibg=Black guifg=#bfbfef
    CSAHi User1 term=NONE cterm=bold ctermbg=60 ctermfg=101 gui=bold guibg=#45637f guifg=#999933
    CSAHi Match term=reverse,bold cterm=bold ctermbg=21 ctermfg=226 gui=reverse,bold guibg=Yellow guifg=Blue
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=175 gui=bold guibg=bg guifg=#d174a8
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=White guifg=Black
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=245 ctermfg=23 gui=bold guibg=#8f8f8f guifg=#116f6f
    CSAHi VertSplit term=reverse cterm=bold ctermbg=245 ctermfg=16 gui=bold guibg=#8f8f8f guifg=Black
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=120 gui=bold guibg=bg guifg=#74ff74
    CSAHi Visual term=reverse cterm=bold ctermbg=150 ctermfg=16 gui=bold guibg=#aacc77 guifg=Black
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=238 ctermfg=16 gui=reverse guibg=Black guifg=#414141
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=Cyan
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=21 ctermfg=231 gui=NONE guibg=Blue guifg=White
    CSAHi Folded term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#afcfef
    CSAHi lCursor term=NONE cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=bg guifg=fg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#e7e77f
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#3fffa7
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=147 gui=NONE guibg=bg guifg=#bfbfef
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ef9f9f
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=80 gui=bold guibg=bg guifg=#5ad5d5
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=#74ff74
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=175 gui=bold guibg=bg guifg=#d174a8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=237 ctermfg=228 gui=NONE guibg=#3f3f3f guifg=#ffff74
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=Black guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#124a32 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=52 gui=bold guibg=#09172f guifg=#522719
    CSAHi DiffText term=reverse cterm=bold ctermbg=31 ctermfg=fg gui=bold guibg=#007f9f guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#35536f guifg=White
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=31 ctermfg=16 gui=bold guibg=Cyan guifg=Black
    CSAHi Todo term=NONE cterm=NONE ctermbg=19 ctermfg=76 gui=NONE guibg=Blue guifg=Yellow
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=Yellow
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=82 gui=bold guibg=bg guifg=#7f7f7f
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=Yellow
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=31 ctermfg=16 gui=bold guibg=Cyan guifg=Black
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=79 ctermfg=21 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=16 ctermfg=76 gui=NONE guibg=Black guifg=Yellow
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=53 gui=bold guibg=bg guifg=#d174a8
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=82 ctermfg=79 gui=bold guibg=#7f7f7f guifg=White
    CSAHi User2 term=NONE cterm=bold ctermbg=21 ctermfg=77 gui=bold guibg=#45637f guifg=#e7e77f
    CSAHi User3 term=NONE cterm=bold ctermbg=21 ctermfg=16 gui=bold guibg=#45637f guifg=Black
    CSAHi User4 term=NONE cterm=bold ctermbg=21 ctermfg=25 gui=bold guibg=#45637f guifg=#33cc99
    CSAHi Cream_ShowMarksHL term=NONE cterm=bold ctermbg=41 ctermfg=16 gui=bold guibg=#aacc77 guifg=Black
    CSAHi BadWord term=NONE cterm=NONE ctermbg=16 ctermfg=69 gui=NONE guibg=#003333 guifg=#ff9999
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=21 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=79 ctermfg=21 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=59 ctermfg=16 gui=reverse guibg=Black guifg=#bfbfef
    CSAHi User1 term=NONE cterm=bold ctermbg=21 ctermfg=36 gui=bold guibg=#45637f guifg=#999933
    CSAHi Match term=reverse,bold cterm=bold ctermbg=19 ctermfg=76 gui=reverse,bold guibg=Yellow guifg=Blue
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=53 gui=bold guibg=bg guifg=#d174a8
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=White guifg=Black
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=83 ctermfg=21 gui=bold guibg=#8f8f8f guifg=#116f6f
    CSAHi VertSplit term=reverse cterm=bold ctermbg=83 ctermfg=16 gui=bold guibg=#8f8f8f guifg=Black
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=#74ff74
    CSAHi Visual term=reverse cterm=bold ctermbg=41 ctermfg=16 gui=bold guibg=#aacc77 guifg=Black
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=80 ctermfg=16 gui=reverse guibg=Black guifg=#414141
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=31 gui=bold guibg=bg guifg=Cyan
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=19 ctermfg=79 gui=NONE guibg=Blue guifg=White
    CSAHi Folded term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#afcfef
    CSAHi lCursor term=NONE cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=bg guifg=fg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#e7e77f
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#3fffa7
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#bfbfef
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ef9f9f
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=42 gui=bold guibg=bg guifg=#5ad5d5
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#74ff74
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=53 gui=bold guibg=bg guifg=#d174a8
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=80 ctermfg=77 gui=NONE guibg=#3f3f3f guifg=#ffff74
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=Black guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=20 ctermfg=fg gui=NONE guibg=#124a32 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=32 gui=bold guibg=#09172f guifg=#522719
    CSAHi DiffText term=reverse cterm=bold ctermbg=21 ctermfg=fg gui=bold guibg=#007f9f guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
