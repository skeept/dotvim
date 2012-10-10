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
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=224 gui=NONE guibg=grey15 guifg=bisque
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=174 gui=underline guibg=bg guifg=IndianRed
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=239 gui=NONE guibg=bg guifg=grey30
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=224 gui=NONE guibg=red guifg=bisque
    CSAHi Todo term=NONE cterm=NONE ctermbg=224 ctermfg=196 gui=NONE guibg=bisque guifg=red
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=moccasin
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=chocolate
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=chocolate
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=OliveDrab3
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=chocolate
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=107 gui=NONE guibg=bg guifg=OliveDrab4
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki2
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=khaki3
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=235 ctermfg=226 gui=NONE guibg=grey15 guifg=yellow
    CSAHi NonText term=bold cterm=bold ctermbg=234 ctermfg=216 gui=bold guibg=grey10 guifg=DarkSalmon
    CSAHi Directory term=bold cterm=NONE ctermbg=235 ctermfg=107 gui=NONE guibg=grey15 guifg=OliveDrab4
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=red guifg=snow
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=224 ctermfg=196 gui=reverse guibg=red guifg=bisque
    CSAHi Search term=reverse cterm=NONE ctermbg=235 ctermfg=216 gui=NONE guibg=grey15 guifg=DarkSalmon
    CSAHi MoreMsg term=bold cterm=bold ctermbg=235 ctermfg=186 gui=bold guibg=grey15 guifg=khaki3
    CSAHi ModeMsg term=bold cterm=bold ctermbg=235 ctermfg=186 gui=bold guibg=grey15 guifg=khaki3
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=107 gui=NONE guibg=grey15 guifg=OliveDrab4
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=224 ctermfg=107 gui=NONE guibg=bisque guifg=OliveDrab4
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki1
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=224 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=224 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=187 ctermfg=231 gui=NONE guibg=bisque3 guifg=snow
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=131 gui=NONE guibg=bg guifg=brown
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=DarkKhaki
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=DarkKhaki
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=khaki4
    CSAHi Question term=NONE cterm=bold ctermbg=234 ctermfg=174 gui=bold guibg=grey10 guifg=IndianRed
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=138 ctermfg=192 gui=reverse,bold guibg=DarkOliveGreen1 guifg=bisque4
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=138 ctermfg=150 gui=reverse guibg=DarkOliveGreen3 guifg=bisque4
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=138 ctermfg=192 gui=reverse guibg=DarkOliveGreen1 guifg=bisque4
    CSAHi Title term=bold cterm=bold ctermbg=235 ctermfg=174 gui=bold guibg=grey15 guifg=IndianRed
    CSAHi Visual term=reverse cterm=NONE ctermbg=224 ctermfg=107 gui=NONE guibg=bisque1 guifg=OliveDrab4
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=196 ctermfg=224 gui=NONE guibg=red guifg=bisque
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=128 ctermfg=153 gui=NONE guibg=DarkViolet guifg=LightBlue
    CSAHi Folded term=NONE cterm=NONE ctermbg=239 ctermfg=192 gui=NONE guibg=grey30 guifg=DarkOliveGreen2
    CSAHi lCursor term=NONE cterm=NONE ctermbg=224 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=tan
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=174 gui=NONE guibg=bg guifg=IndianRed
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=khaki4
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=khaki
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=khaki4
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=186 gui=bold guibg=bg guifg=khaki3
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=tan
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=178 gui=NONE guibg=bg guifg=DarkGoldenrod
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=khaki3
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=DarkKhaki
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=178 gui=NONE guibg=bg guifg=DarkGoldenrod
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=178 gui=NONE guibg=bg guifg=DarkGoldenrod
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=cornsilk
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=239 ctermfg=192 gui=NONE guibg=grey30 guifg=DarkOliveGreen2
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=235 ctermfg=192 gui=NONE guibg=grey15 guifg=DarkOliveGreen1
    CSAHi DiffChange term=bold cterm=NONE ctermbg=235 ctermfg=157 gui=NONE guibg=grey15 guifg=PaleGreen
    CSAHi DiffDelete term=bold cterm=bold ctermbg=235 ctermfg=196 gui=bold guibg=grey15 guifg=red
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=235 gui=bold guibg=red guifg=grey15
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=231 gui=NONE guibg=grey15 guifg=bisque
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=210 gui=underline guibg=bg guifg=IndianRed
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=239 gui=NONE guibg=bg guifg=grey30
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=red guifg=bisque
    CSAHi Todo term=NONE cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=bisque guifg=red
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=moccasin
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=chocolate
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=chocolate
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=OliveDrab3
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=chocolate
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=107 gui=NONE guibg=bg guifg=OliveDrab4
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki2
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki3
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=235 ctermfg=226 gui=NONE guibg=grey15 guifg=yellow
    CSAHi NonText term=bold cterm=bold ctermbg=234 ctermfg=223 gui=bold guibg=grey10 guifg=DarkSalmon
    CSAHi Directory term=bold cterm=NONE ctermbg=235 ctermfg=107 gui=NONE guibg=grey15 guifg=OliveDrab4
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=red guifg=snow
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=196 gui=reverse guibg=red guifg=bisque
    CSAHi Search term=reverse cterm=NONE ctermbg=235 ctermfg=223 gui=NONE guibg=grey15 guifg=DarkSalmon
    CSAHi MoreMsg term=bold cterm=bold ctermbg=235 ctermfg=229 gui=bold guibg=grey15 guifg=khaki3
    CSAHi ModeMsg term=bold cterm=bold ctermbg=235 ctermfg=229 gui=bold guibg=grey15 guifg=khaki3
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=107 gui=NONE guibg=grey15 guifg=OliveDrab4
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=231 ctermfg=107 gui=NONE guibg=bisque guifg=OliveDrab4
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki1
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=224 ctermfg=255 gui=NONE guibg=bisque3 guifg=snow
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=brown
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=DarkKhaki
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=DarkKhaki
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=khaki4
    CSAHi Question term=NONE cterm=bold ctermbg=234 ctermfg=210 gui=bold guibg=grey10 guifg=IndianRed
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=145 ctermfg=229 gui=reverse,bold guibg=DarkOliveGreen1 guifg=bisque4
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=145 ctermfg=192 gui=reverse guibg=DarkOliveGreen3 guifg=bisque4
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=145 ctermfg=229 gui=reverse guibg=DarkOliveGreen1 guifg=bisque4
    CSAHi Title term=bold cterm=bold ctermbg=235 ctermfg=210 gui=bold guibg=grey15 guifg=IndianRed
    CSAHi Visual term=reverse cterm=NONE ctermbg=231 ctermfg=107 gui=NONE guibg=bisque1 guifg=OliveDrab4
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=red guifg=bisque
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=129 ctermfg=195 gui=NONE guibg=DarkViolet guifg=LightBlue
    CSAHi Folded term=NONE cterm=NONE ctermbg=239 ctermfg=192 gui=NONE guibg=grey30 guifg=DarkOliveGreen2
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=tan
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=IndianRed
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=khaki4
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=khaki
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=khaki4
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=khaki3
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=tan
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=178 gui=NONE guibg=bg guifg=DarkGoldenrod
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=khaki3
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=DarkKhaki
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=178 gui=NONE guibg=bg guifg=DarkGoldenrod
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=178 gui=NONE guibg=bg guifg=DarkGoldenrod
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=cornsilk
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=239 ctermfg=192 gui=NONE guibg=grey30 guifg=DarkOliveGreen2
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=235 ctermfg=229 gui=NONE guibg=grey15 guifg=DarkOliveGreen1
    CSAHi DiffChange term=bold cterm=NONE ctermbg=235 ctermfg=194 gui=NONE guibg=grey15 guifg=PaleGreen
    CSAHi DiffDelete term=bold cterm=bold ctermbg=235 ctermfg=196 gui=bold guibg=grey15 guifg=red
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=235 gui=bold guibg=red guifg=grey15
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=224 gui=NONE guibg=grey15 guifg=bisque
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=167 gui=underline guibg=bg guifg=IndianRed
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=239 gui=NONE guibg=bg guifg=grey30
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=224 gui=NONE guibg=red guifg=bisque
    CSAHi Todo term=NONE cterm=NONE ctermbg=224 ctermfg=196 gui=NONE guibg=bisque guifg=red
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=moccasin
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=chocolate
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=chocolate
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=OliveDrab3
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=chocolate
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=OliveDrab4
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=khaki2
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=185 gui=NONE guibg=bg guifg=khaki3
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=235 ctermfg=226 gui=NONE guibg=grey15 guifg=yellow
    CSAHi NonText term=bold cterm=bold ctermbg=234 ctermfg=174 gui=bold guibg=grey10 guifg=DarkSalmon
    CSAHi Directory term=bold cterm=NONE ctermbg=235 ctermfg=64 gui=NONE guibg=grey15 guifg=OliveDrab4
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=red guifg=snow
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=224 ctermfg=196 gui=reverse guibg=red guifg=bisque
    CSAHi Search term=reverse cterm=NONE ctermbg=235 ctermfg=174 gui=NONE guibg=grey15 guifg=DarkSalmon
    CSAHi MoreMsg term=bold cterm=bold ctermbg=235 ctermfg=185 gui=bold guibg=grey15 guifg=khaki3
    CSAHi ModeMsg term=bold cterm=bold ctermbg=235 ctermfg=185 gui=bold guibg=grey15 guifg=khaki3
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=64 gui=NONE guibg=grey15 guifg=OliveDrab4
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=224 ctermfg=64 gui=NONE guibg=bisque guifg=OliveDrab4
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=khaki1
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=224 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=224 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=181 ctermfg=231 gui=NONE guibg=bisque3 guifg=snow
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=brown
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=khaki
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=khaki
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=khaki
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=DarkKhaki
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=DarkKhaki
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=khaki
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=101 gui=NONE guibg=bg guifg=khaki4
    CSAHi Question term=NONE cterm=bold ctermbg=234 ctermfg=167 gui=bold guibg=grey10 guifg=IndianRed
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=101 ctermfg=191 gui=reverse,bold guibg=DarkOliveGreen1 guifg=bisque4
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=101 ctermfg=149 gui=reverse guibg=DarkOliveGreen3 guifg=bisque4
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=101 ctermfg=191 gui=reverse guibg=DarkOliveGreen1 guifg=bisque4
    CSAHi Title term=bold cterm=bold ctermbg=235 ctermfg=167 gui=bold guibg=grey15 guifg=IndianRed
    CSAHi Visual term=reverse cterm=NONE ctermbg=224 ctermfg=64 gui=NONE guibg=bisque1 guifg=OliveDrab4
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=196 ctermfg=224 gui=NONE guibg=red guifg=bisque
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=92 ctermfg=152 gui=NONE guibg=DarkViolet guifg=LightBlue
    CSAHi Folded term=NONE cterm=NONE ctermbg=239 ctermfg=155 gui=NONE guibg=grey30 guifg=DarkOliveGreen2
    CSAHi lCursor term=NONE cterm=NONE ctermbg=224 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=tan
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=khaki
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=IndianRed
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=101 gui=NONE guibg=bg guifg=khaki4
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=222 gui=bold guibg=bg guifg=khaki
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=101 gui=NONE guibg=bg guifg=khaki4
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=185 gui=bold guibg=bg guifg=khaki3
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=tan
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=136 gui=NONE guibg=bg guifg=DarkGoldenrod
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=185 gui=NONE guibg=bg guifg=khaki3
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=DarkKhaki
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=136 gui=NONE guibg=bg guifg=DarkGoldenrod
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=136 gui=NONE guibg=bg guifg=DarkGoldenrod
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=cornsilk
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=239 ctermfg=155 gui=NONE guibg=grey30 guifg=DarkOliveGreen2
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=235 ctermfg=191 gui=NONE guibg=grey15 guifg=DarkOliveGreen1
    CSAHi DiffChange term=bold cterm=NONE ctermbg=235 ctermfg=120 gui=NONE guibg=grey15 guifg=PaleGreen
    CSAHi DiffDelete term=bold cterm=bold ctermbg=235 ctermfg=196 gui=bold guibg=grey15 guifg=red
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=235 gui=bold guibg=red guifg=grey15
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=74 gui=NONE guibg=grey15 guifg=bisque
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=53 gui=underline guibg=bg guifg=IndianRed
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=grey30
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=74 gui=NONE guibg=red guifg=bisque
    CSAHi Todo term=NONE cterm=NONE ctermbg=74 ctermfg=64 gui=NONE guibg=bisque guifg=red
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=moccasin
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=chocolate
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=chocolate
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=OliveDrab3
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=chocolate
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=OliveDrab4
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=khaki2
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=khaki3
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=80 ctermfg=76 gui=NONE guibg=grey15 guifg=yellow
    CSAHi NonText term=bold cterm=bold ctermbg=80 ctermfg=69 gui=bold guibg=grey10 guifg=DarkSalmon
    CSAHi Directory term=bold cterm=NONE ctermbg=80 ctermfg=36 gui=NONE guibg=grey15 guifg=OliveDrab4
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=red guifg=snow
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=74 ctermfg=64 gui=reverse guibg=red guifg=bisque
    CSAHi Search term=reverse cterm=NONE ctermbg=80 ctermfg=69 gui=NONE guibg=grey15 guifg=DarkSalmon
    CSAHi MoreMsg term=bold cterm=bold ctermbg=80 ctermfg=57 gui=bold guibg=grey15 guifg=khaki3
    CSAHi ModeMsg term=bold cterm=bold ctermbg=80 ctermfg=57 gui=bold guibg=grey15 guifg=khaki3
    CSAHi LineNr term=underline cterm=NONE ctermbg=80 ctermfg=36 gui=NONE guibg=grey15 guifg=OliveDrab4
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=74 ctermfg=36 gui=NONE guibg=bisque guifg=OliveDrab4
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=khaki1
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=74 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=74 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=57 ctermfg=79 gui=NONE guibg=bisque3 guifg=snow
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=brown
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=khaki
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=khaki
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=khaki
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=DarkKhaki
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=DarkKhaki
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=khaki
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=khaki4
    CSAHi Question term=NONE cterm=bold ctermbg=80 ctermfg=53 gui=bold guibg=grey10 guifg=IndianRed
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=37 ctermfg=61 gui=reverse,bold guibg=DarkOliveGreen1 guifg=bisque4
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=37 ctermfg=41 gui=reverse guibg=DarkOliveGreen3 guifg=bisque4
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=37 ctermfg=61 gui=reverse guibg=DarkOliveGreen1 guifg=bisque4
    CSAHi Title term=bold cterm=bold ctermbg=80 ctermfg=53 gui=bold guibg=grey15 guifg=IndianRed
    CSAHi Visual term=reverse cterm=NONE ctermbg=74 ctermfg=36 gui=NONE guibg=bisque1 guifg=OliveDrab4
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=64 ctermfg=74 gui=NONE guibg=red guifg=bisque
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=34 ctermfg=58 gui=NONE guibg=DarkViolet guifg=LightBlue
    CSAHi Folded term=NONE cterm=NONE ctermbg=81 ctermfg=61 gui=NONE guibg=grey30 guifg=DarkOliveGreen2
    CSAHi lCursor term=NONE cterm=NONE ctermbg=74 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=tan
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=khaki
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=IndianRed
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=khaki4
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=73 gui=bold guibg=bg guifg=khaki
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=khaki4
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=57 gui=bold guibg=bg guifg=khaki3
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=tan
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=DarkGoldenrod
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=khaki3
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=DarkKhaki
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=DarkGoldenrod
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=DarkGoldenrod
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=cornsilk
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=81 ctermfg=61 gui=NONE guibg=grey30 guifg=DarkOliveGreen2
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=80 ctermfg=61 gui=NONE guibg=grey15 guifg=DarkOliveGreen1
    CSAHi DiffChange term=bold cterm=NONE ctermbg=80 ctermfg=45 gui=NONE guibg=grey15 guifg=PaleGreen
    CSAHi DiffDelete term=bold cterm=bold ctermbg=80 ctermfg=64 gui=bold guibg=grey15 guifg=red
    CSAHi DiffText term=reverse cterm=bold ctermbg=64 ctermfg=80 gui=bold guibg=red guifg=grey15
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
