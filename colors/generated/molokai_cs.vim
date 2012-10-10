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
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=231 gui=NONE guibg=#1B1D1E guifg=#F8F8F2
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=244 gui=underline guibg=bg guifg=#808080
    CSAHi Ignore term=NONE cterm=NONE ctermbg=234 ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi Error term=reverse cterm=NONE ctermbg=52 ctermfg=126 gui=NONE guibg=#1E0010 guifg=#960050
    CSAHi Todo term=NONE cterm=bold ctermbg=234 ctermfg=231 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#E6DB74
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#E6DB74
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=147 gui=NONE guibg=bg guifg=#AE81FF
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=147 gui=NONE guibg=bg guifg=#AE81FF
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=147 gui=NONE guibg=bg guifg=#AE81FF
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=#A6E22E
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=italic guibg=bg guifg=#C4BE89
    CSAHi PreCondit term=NONE cterm=bold ctermbg=bg ctermfg=149 gui=bold guibg=bg guifg=#A6E22E
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=145 gui=italic guibg=bg guifg=#888A85
    CSAHi NonText term=bold cterm=bold ctermbg=235 ctermfg=250 gui=bold guibg=#232526 guifg=#BCBCBC
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=149 gui=bold guibg=bg guifg=#A6E22E
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=235 ctermfg=204 gui=bold guibg=#232526 guifg=#F92672
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=187 ctermfg=16 gui=reverse guibg=#000000 guifg=#C4BE89
    CSAHi Search term=reverse cterm=NONE ctermbg=66 ctermfg=231 gui=NONE guibg=#455354 guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=222 gui=bold guibg=bg guifg=#E6DB74
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=222 gui=bold guibg=bg guifg=#E6DB74
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=250 gui=NONE guibg=#232526 guifg=#BCBCBC
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=117 gui=NONE guibg=#000000 guifg=#66D9EF
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#080808 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=117 ctermfg=234 gui=reverse guibg=bg guifg=#66D9EF
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#293739 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#293739 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#F8F8F0 guifg=#000000
    CSAHi Debug term=NONE cterm=bold ctermbg=bg ctermfg=181 gui=bold guibg=bg guifg=#BCA3A3
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=204 gui=bold guibg=bg guifg=#F92672
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=204 gui=bold guibg=bg guifg=#F92672
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#E6DB74
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=204 gui=NONE guibg=bg guifg=#F92672
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=204 gui=bold guibg=bg guifg=#F92672
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=149 gui=bold guibg=bg guifg=#A6E22E
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=117 gui=bold guibg=bg guifg=#66D9EF
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=66 ctermfg=231 gui=reverse,bold guibg=fg guifg=#455354
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=244 ctermfg=232 gui=reverse guibg=#080808 guifg=#808080
    CSAHi VertSplit term=reverse cterm=bold ctermbg=232 ctermfg=244 gui=bold guibg=#080808 guifg=#808080
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=209 gui=bold guibg=bg guifg=#ef5939
    CSAHi Visual term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#403D3D guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=59 ctermfg=fg gui=bold,underline guibg=#403D3D guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=59 ctermfg=231 gui=bold guibg=#333333 guifg=#FFFFFF
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=117 gui=NONE guibg=#000000 guifg=#66D9EF
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=66 gui=NONE guibg=#000000 guifg=#465457
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=234 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=215 ctermfg=16 gui=bold guibg=#FD971F guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=#465457
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=147 gui=bold guibg=bg guifg=#AE81FF
    CSAHi Special term=bold cterm=NONE ctermbg=234 ctermfg=117 gui=italic guibg=bg guifg=#66D9EF
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#FD971F
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=204 gui=bold guibg=bg guifg=#F92672
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=#A6E22E
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=italic guibg=bg guifg=#FD971F
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=204 gui=italic guibg=bg guifg=#F92672
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=bg ctermfg=204 gui=bold guibg=bg guifg=#F92672
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8F8F8F
    CSAHi SpecialComment term=NONE cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#465457
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=66 gui=NONE guibg=#000000 guifg=#465457
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#13354A guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=144 gui=NONE guibg=#4C4745 guifg=#89807D
    CSAHi DiffDelete term=bold cterm=bold ctermbg=52 ctermfg=126 gui=bold guibg=#1E0010 guifg=#960050
    CSAHi DiffText term=reverse cterm=bold ctermbg=59 ctermfg=fg gui=bold,italic guibg=#4C4745 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=235 ctermfg=149 gui=NONE guibg=#232526 guifg=#A6E22E
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#FF0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=105 gui=undercurl guibg=bg guifg=fg guisp=#7070F0
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=231 gui=undercurl guibg=bg guifg=fg guisp=#FFFFFF
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=123 gui=undercurl guibg=bg guifg=fg guisp=#70F0F0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=255 gui=NONE guibg=#1B1D1E guifg=#F8F8F2
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=244 gui=underline guibg=bg guifg=#808080
    CSAHi Ignore term=NONE cterm=NONE ctermbg=234 ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi Error term=reverse cterm=NONE ctermbg=52 ctermfg=162 gui=NONE guibg=#1E0010 guifg=#960050
    CSAHi Todo term=NONE cterm=bold ctermbg=234 ctermfg=255 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#E6DB74
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#E6DB74
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=183 gui=NONE guibg=bg guifg=#AE81FF
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=183 gui=NONE guibg=bg guifg=#AE81FF
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=183 gui=NONE guibg=bg guifg=#AE81FF
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#A6E22E
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=italic guibg=bg guifg=#C4BE89
    CSAHi PreCondit term=NONE cterm=bold ctermbg=bg ctermfg=191 gui=bold guibg=bg guifg=#A6E22E
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=145 gui=italic guibg=bg guifg=#888A85
    CSAHi NonText term=bold cterm=bold ctermbg=235 ctermfg=250 gui=bold guibg=#232526 guifg=#BCBCBC
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=191 gui=bold guibg=bg guifg=#A6E22E
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=235 ctermfg=205 gui=bold guibg=#232526 guifg=#F92672
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=223 ctermfg=16 gui=reverse guibg=#000000 guifg=#C4BE89
    CSAHi Search term=reverse cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#455354 guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=#E6DB74
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=#E6DB74
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=250 gui=NONE guibg=#232526 guifg=#BCBCBC
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=123 gui=NONE guibg=#000000 guifg=#66D9EF
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#080808 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=123 ctermfg=234 gui=reverse guibg=bg guifg=#66D9EF
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#293739 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#293739 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#F8F8F0 guifg=#000000
    CSAHi Debug term=NONE cterm=bold ctermbg=bg ctermfg=188 gui=bold guibg=bg guifg=#BCA3A3
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=205 gui=bold guibg=bg guifg=#F92672
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=205 gui=bold guibg=bg guifg=#F92672
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#E6DB74
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=205 gui=NONE guibg=bg guifg=#F92672
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=205 gui=bold guibg=bg guifg=#F92672
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=191 gui=bold guibg=bg guifg=#A6E22E
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=123 gui=bold guibg=bg guifg=#66D9EF
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=102 ctermfg=255 gui=reverse,bold guibg=fg guifg=#455354
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=244 ctermfg=232 gui=reverse guibg=#080808 guifg=#808080
    CSAHi VertSplit term=reverse cterm=bold ctermbg=232 ctermfg=244 gui=bold guibg=#080808 guifg=#808080
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=209 gui=bold guibg=bg guifg=#ef5939
    CSAHi Visual term=reverse cterm=NONE ctermbg=95 ctermfg=fg gui=NONE guibg=#403D3D guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=95 ctermfg=fg gui=bold,underline guibg=#403D3D guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=236 ctermfg=255 gui=bold guibg=#333333 guifg=#FFFFFF
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=123 gui=NONE guibg=#000000 guifg=#66D9EF
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=102 gui=NONE guibg=#000000 guifg=#465457
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=234 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=221 ctermfg=16 gui=bold guibg=#FD971F guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#465457
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=183 gui=bold guibg=bg guifg=#AE81FF
    CSAHi Special term=bold cterm=NONE ctermbg=234 ctermfg=123 gui=italic guibg=bg guifg=#66D9EF
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#FD971F
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=205 gui=bold guibg=bg guifg=#F92672
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#A6E22E
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=italic guibg=bg guifg=#FD971F
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=205 gui=italic guibg=bg guifg=#F92672
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=bg ctermfg=205 gui=bold guibg=bg guifg=#F92672
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8F8F8F
    CSAHi SpecialComment term=NONE cterm=bold ctermbg=bg ctermfg=102 gui=bold guibg=bg guifg=#465457
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=102 gui=NONE guibg=#000000 guifg=#465457
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=24 ctermfg=fg gui=NONE guibg=#13354A guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=102 ctermfg=145 gui=NONE guibg=#4C4745 guifg=#89807D
    CSAHi DiffDelete term=bold cterm=bold ctermbg=52 ctermfg=162 gui=bold guibg=#1E0010 guifg=#960050
    CSAHi DiffText term=reverse cterm=bold ctermbg=102 ctermfg=fg gui=bold,italic guibg=#4C4745 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=235 ctermfg=191 gui=NONE guibg=#232526 guifg=#A6E22E
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#FF0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=147 gui=undercurl guibg=bg guifg=fg guisp=#7070F0
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=255 gui=undercurl guibg=bg guifg=fg guisp=#FFFFFF
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=159 gui=undercurl guibg=bg guifg=fg guisp=#70F0F0
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=231 gui=NONE guibg=#1B1D1E guifg=#F8F8F2
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=244 gui=underline guibg=bg guifg=#808080
    CSAHi Ignore term=NONE cterm=NONE ctermbg=234 ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=89 gui=NONE guibg=#1E0010 guifg=#960050
    CSAHi Todo term=NONE cterm=bold ctermbg=234 ctermfg=231 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#E6DB74
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#E6DB74
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=141 gui=NONE guibg=bg guifg=#AE81FF
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=141 gui=NONE guibg=bg guifg=#AE81FF
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=141 gui=NONE guibg=bg guifg=#AE81FF
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=148 gui=NONE guibg=bg guifg=#A6E22E
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=italic guibg=bg guifg=#C4BE89
    CSAHi PreCondit term=NONE cterm=bold ctermbg=bg ctermfg=148 gui=bold guibg=bg guifg=#A6E22E
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=italic guibg=bg guifg=#888A85
    CSAHi NonText term=bold cterm=bold ctermbg=235 ctermfg=250 gui=bold guibg=#232526 guifg=#BCBCBC
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=148 gui=bold guibg=bg guifg=#A6E22E
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=235 ctermfg=197 gui=bold guibg=#232526 guifg=#F92672
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=180 ctermfg=16 gui=reverse guibg=#000000 guifg=#C4BE89
    CSAHi Search term=reverse cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#455354 guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=186 gui=bold guibg=bg guifg=#E6DB74
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=186 gui=bold guibg=bg guifg=#E6DB74
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=250 gui=NONE guibg=#232526 guifg=#BCBCBC
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=81 gui=NONE guibg=#000000 guifg=#66D9EF
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=232 ctermfg=fg gui=NONE guibg=#080808 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=81 ctermfg=234 gui=reverse guibg=bg guifg=#66D9EF
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#293739 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#293739 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#F8F8F0 guifg=#000000
    CSAHi Debug term=NONE cterm=bold ctermbg=bg ctermfg=145 gui=bold guibg=bg guifg=#BCA3A3
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=197 gui=bold guibg=bg guifg=#F92672
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=197 gui=bold guibg=bg guifg=#F92672
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#E6DB74
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=197 gui=NONE guibg=bg guifg=#F92672
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=197 gui=bold guibg=bg guifg=#F92672
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=148 gui=bold guibg=bg guifg=#A6E22E
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=81 gui=bold guibg=bg guifg=#66D9EF
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=59 ctermfg=231 gui=reverse,bold guibg=fg guifg=#455354
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=244 ctermfg=232 gui=reverse guibg=#080808 guifg=#808080
    CSAHi VertSplit term=reverse cterm=bold ctermbg=232 ctermfg=244 gui=bold guibg=#080808 guifg=#808080
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=203 gui=bold guibg=bg guifg=#ef5939
    CSAHi Visual term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#403D3D guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=59 ctermfg=fg gui=bold,underline guibg=#403D3D guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=236 ctermfg=231 gui=bold guibg=#333333 guifg=#FFFFFF
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=81 gui=NONE guibg=#000000 guifg=#66D9EF
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=#000000 guifg=#465457
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=234 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=208 ctermfg=16 gui=bold guibg=#FD971F guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#465457
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=141 gui=bold guibg=bg guifg=#AE81FF
    CSAHi Special term=bold cterm=NONE ctermbg=234 ctermfg=81 gui=italic guibg=bg guifg=#66D9EF
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#FD971F
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=197 gui=bold guibg=bg guifg=#F92672
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=148 gui=NONE guibg=bg guifg=#A6E22E
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=208 gui=italic guibg=bg guifg=#FD971F
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=197 gui=italic guibg=bg guifg=#F92672
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=bg ctermfg=197 gui=bold guibg=bg guifg=#F92672
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8F8F8F
    CSAHi SpecialComment term=NONE cterm=bold ctermbg=bg ctermfg=59 gui=bold guibg=bg guifg=#465457
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=#000000 guifg=#465457
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#13354A guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#4C4745 guifg=#89807D
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=89 gui=bold guibg=#1E0010 guifg=#960050
    CSAHi DiffText term=reverse cterm=bold ctermbg=59 ctermfg=fg gui=bold,italic guibg=#4C4745 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=235 ctermfg=148 gui=NONE guibg=#232526 guifg=#A6E22E
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#FF0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=63 gui=undercurl guibg=bg guifg=fg guisp=#7070F0
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=231 gui=undercurl guibg=bg guifg=fg guisp=#FFFFFF
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=87 gui=undercurl guibg=bg guifg=fg guisp=#70F0F0
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#1B1D1E guifg=#F8F8F2
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=83 gui=underline guibg=bg guifg=#808080
    CSAHi Ignore term=NONE cterm=NONE ctermbg=80 ctermfg=83 gui=NONE guibg=bg guifg=#808080
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=33 gui=NONE guibg=#1E0010 guifg=#960050
    CSAHi Todo term=NONE cterm=bold ctermbg=80 ctermfg=79 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#E6DB74
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#E6DB74
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=55 gui=NONE guibg=bg guifg=#AE81FF
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=55 gui=NONE guibg=bg guifg=#AE81FF
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=55 gui=NONE guibg=bg guifg=#AE81FF
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=#A6E22E
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=italic guibg=bg guifg=#C4BE89
    CSAHi PreCondit term=NONE cterm=bold ctermbg=bg ctermfg=40 gui=bold guibg=bg guifg=#A6E22E
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=83 gui=italic guibg=bg guifg=#888A85
    CSAHi NonText term=bold cterm=bold ctermbg=80 ctermfg=85 gui=bold guibg=#232526 guifg=#BCBCBC
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=40 gui=bold guibg=bg guifg=#A6E22E
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=80 ctermfg=65 gui=bold guibg=#232526 guifg=#F92672
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=57 ctermfg=16 gui=reverse guibg=#000000 guifg=#C4BE89
    CSAHi Search term=reverse cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#455354 guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=57 gui=bold guibg=bg guifg=#E6DB74
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=57 gui=bold guibg=bg guifg=#E6DB74
    CSAHi LineNr term=underline cterm=NONE ctermbg=80 ctermfg=85 gui=NONE guibg=#232526 guifg=#BCBCBC
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=43 gui=NONE guibg=#000000 guifg=#66D9EF
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=83 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#080808 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=43 ctermfg=80 gui=reverse guibg=bg guifg=#66D9EF
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=79 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#293739 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#293739 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#F8F8F0 guifg=#000000
    CSAHi Debug term=NONE cterm=bold ctermbg=bg ctermfg=53 gui=bold guibg=bg guifg=#BCA3A3
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=65 gui=bold guibg=bg guifg=#F92672
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=65 gui=bold guibg=bg guifg=#F92672
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#E6DB74
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#F92672
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=65 gui=bold guibg=bg guifg=#F92672
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=40 gui=bold guibg=bg guifg=#A6E22E
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=43 gui=bold guibg=bg guifg=#66D9EF
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=21 ctermfg=79 gui=reverse,bold guibg=fg guifg=#455354
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=83 ctermfg=16 gui=reverse guibg=#080808 guifg=#808080
    CSAHi VertSplit term=reverse cterm=bold ctermbg=16 ctermfg=83 gui=bold guibg=#080808 guifg=#808080
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=#ef5939
    CSAHi Visual term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#403D3D guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=80 ctermfg=fg gui=bold,underline guibg=#403D3D guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=80 ctermfg=79 gui=bold guibg=#333333 guifg=#FFFFFF
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=43 gui=NONE guibg=#000000 guifg=#66D9EF
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=81 gui=NONE guibg=#000000 guifg=#465457
    CSAHi lCursor term=NONE cterm=NONE ctermbg=79 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=68 ctermfg=16 gui=bold guibg=#FD971F guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#465457
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=55 gui=bold guibg=bg guifg=#AE81FF
    CSAHi Special term=bold cterm=NONE ctermbg=80 ctermfg=43 gui=italic guibg=bg guifg=#66D9EF
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#FD971F
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=65 gui=bold guibg=bg guifg=#F92672
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=#A6E22E
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=italic guibg=bg guifg=#FD971F
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#66D9EF
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=65 gui=italic guibg=bg guifg=#F92672
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=bg ctermfg=65 gui=bold guibg=bg guifg=#F92672
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#8F8F8F
    CSAHi SpecialComment term=NONE cterm=bold ctermbg=bg ctermfg=81 gui=bold guibg=bg guifg=#465457
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=81 gui=NONE guibg=#000000 guifg=#465457
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#13354A guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=36 ctermfg=37 gui=NONE guibg=#4C4745 guifg=#89807D
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=33 gui=bold guibg=#1E0010 guifg=#960050
    CSAHi DiffText term=reverse cterm=bold ctermbg=36 ctermfg=fg gui=bold,italic guibg=#4C4745 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=80 ctermfg=40 gui=NONE guibg=#232526 guifg=#A6E22E
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#FF0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=39 gui=undercurl guibg=bg guifg=fg guisp=#7070F0
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=79 gui=undercurl guibg=bg guifg=fg guisp=#FFFFFF
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=47 gui=undercurl guibg=bg guifg=fg guisp=#70F0F0
endif

if 1
    delcommand CSAHi
endif
