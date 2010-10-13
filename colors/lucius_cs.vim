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
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=254 gui=NONE guibg=#202020 guifg=#e0e0e0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=254 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=59 ctermfg=174 gui=NONE guibg=#432323 guifg=#e37170
    CSAHi Todo term=NONE cterm=underline ctermbg=bg ctermfg=229 gui=underline guibg=bg guifg=#efef8f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#80c0d9
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#80c0d9
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#efaf7f
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#404040
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#404040
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#c0e0b0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ee0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=123 ctermfg=234 gui=reverse guibg=bg guifg=#66ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=215 ctermfg=16 gui=NONE guibg=#ffaa33 guifg=Black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#76d5f8
    CSAHi LineNr term=underline cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#363946 guifg=#818698
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=152 ctermfg=234 gui=NONE guibg=#96cdcd guifg=bg
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=59 ctermfg=254 gui=NONE guibg=#303840 guifg=#e0e0e0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=102 ctermfg=193 gui=NONE guibg=#505860 guifg=#cae682
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#505860 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=145 ctermfg=fg gui=NONE guibg=#808890 guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=59 ctermfg=187 gui=NONE guibg=#363946 guifg=#b6bf98
    CSAHi TabLineSel term=bold cterm=bold ctermbg=60 ctermfg=255 gui=bold guibg=#414658 guifg=#efefef
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=59 ctermfg=187 gui=NONE guibg=#363946 guifg=#cfcfaf
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#202438 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#202438 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=153 ctermfg=234 gui=NONE guibg=#a3e3ed guifg=bg
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=59 ctermfg=254 gui=bold guibg=#363946 guifg=#e0e0e0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=103 gui=NONE guibg=#363946 guifg=#767986
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=59 ctermfg=243 gui=NONE guibg=#363946 guifg=#777777
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=116 gui=NONE guibg=bg guifg=#62bdde
    CSAHi Visual term=reverse cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#364458 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=bg ctermfg=254 gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=174 gui=NONE guibg=bg guifg=#e5786d
    CSAHi WildMenu term=NONE cterm=bold,underline ctermbg=59 ctermfg=193 gui=bold,underline guibg=#363946 guifg=#cae682
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=153 gui=NONE guibg=#363946 guifg=#91d6f8
    CSAHi lCursor term=NONE cterm=NONE ctermbg=254 ctermfg=234 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=#00ff00
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=#606060
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#efaf7f
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=151 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=151 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=151 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=151 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=59 ctermfg=153 gui=NONE guibg=#363946 guifg=#91d6f8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#313c36 guifg=#80a090
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#4a343a guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#3c3631 guifg=#6c6661
    CSAHi DiffText term=reverse cterm=bold ctermbg=59 ctermfg=210 gui=bold guibg=#4a343a guifg=#f05060
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=234 ctermfg=145 gui=NONE guibg=#181818 guifg=#9fafaf
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ee0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=226 gui=undercurl guibg=bg guifg=fg guisp=#eeee00
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=214 gui=undercurl guibg=bg guifg=fg guisp=#ffa500
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=214 gui=undercurl guibg=bg guifg=fg guisp=#ffa500
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=254 gui=NONE guibg=#202020 guifg=#e0e0e0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=254 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=95 ctermfg=217 gui=NONE guibg=#432323 guifg=#e37170
    CSAHi Todo term=NONE cterm=underline ctermbg=bg ctermfg=229 gui=underline guibg=bg guifg=#efef8f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#80c0d9
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#80c0d9
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#efaf7f
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#404040
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#404040
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#c0e0b0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ee0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=123 ctermfg=234 gui=reverse guibg=bg guifg=#66ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=221 ctermfg=16 gui=NONE guibg=#ffaa33 guifg=Black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#76d5f8
    CSAHi LineNr term=underline cterm=NONE ctermbg=60 ctermfg=146 gui=NONE guibg=#363946 guifg=#818698
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=195 ctermfg=234 gui=NONE guibg=#96cdcd guifg=bg
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=60 ctermfg=254 gui=NONE guibg=#303840 guifg=#e0e0e0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=102 ctermfg=229 gui=NONE guibg=#505860 guifg=#cae682
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#505860 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=145 ctermfg=fg gui=NONE guibg=#808890 guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=60 ctermfg=188 gui=NONE guibg=#363946 guifg=#b6bf98
    CSAHi TabLineSel term=bold cterm=bold ctermbg=102 ctermfg=255 gui=bold guibg=#414658 guifg=#efefef
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=60 ctermfg=230 gui=NONE guibg=#363946 guifg=#cfcfaf
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#202438 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#202438 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=195 ctermfg=234 gui=NONE guibg=#a3e3ed guifg=bg
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=60 ctermfg=254 gui=bold guibg=#363946 guifg=#e0e0e0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=60 ctermfg=145 gui=NONE guibg=#363946 guifg=#767986
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=60 ctermfg=243 gui=NONE guibg=#363946 guifg=#777777
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#62bdde
    CSAHi Visual term=reverse cterm=NONE ctermbg=66 ctermfg=fg gui=NONE guibg=#364458 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=bg ctermfg=254 gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#e5786d
    CSAHi WildMenu term=NONE cterm=bold,underline ctermbg=60 ctermfg=229 gui=bold,underline guibg=#363946 guifg=#cae682
    CSAHi Folded term=NONE cterm=NONE ctermbg=60 ctermfg=159 gui=NONE guibg=#363946 guifg=#91d6f8
    CSAHi lCursor term=NONE cterm=NONE ctermbg=254 ctermfg=234 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=#00ff00
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=#606060
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#efaf7f
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=158 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=158 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=158 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=158 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=60 ctermfg=159 gui=NONE guibg=#363946 guifg=#91d6f8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=59 ctermfg=151 gui=NONE guibg=#313c36 guifg=#80a090
    CSAHi DiffChange term=bold cterm=NONE ctermbg=95 ctermfg=fg gui=NONE guibg=#4a343a guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=59 ctermfg=138 gui=NONE guibg=#3c3631 guifg=#6c6661
    CSAHi DiffText term=reverse cterm=bold ctermbg=95 ctermfg=210 gui=bold guibg=#4a343a guifg=#f05060
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=234 ctermfg=188 gui=NONE guibg=#181818 guifg=#9fafaf
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ee0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=226 gui=undercurl guibg=bg guifg=fg guisp=#eeee00
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=220 gui=undercurl guibg=bg guifg=fg guisp=#ffa500
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=220 gui=undercurl guibg=bg guifg=fg guisp=#ffa500
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=254 gui=NONE guibg=#202020 guifg=#e0e0e0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=254 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=52 ctermfg=167 gui=NONE guibg=#432323 guifg=#e37170
    CSAHi Todo term=NONE cterm=underline ctermbg=bg ctermfg=228 gui=underline guibg=bg guifg=#efef8f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#80c0d9
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#80c0d9
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=116 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=116 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=116 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#efaf7f
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#404040
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#404040
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=151 gui=NONE guibg=bg guifg=#c0e0b0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ee0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=87 ctermfg=234 gui=reverse guibg=bg guifg=#66ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=215 ctermfg=16 gui=NONE guibg=#ffaa33 guifg=Black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#76d5f8
    CSAHi LineNr term=underline cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#363946 guifg=#818698
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=116 ctermfg=234 gui=NONE guibg=#96cdcd guifg=bg
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=59 ctermfg=254 gui=NONE guibg=#303840 guifg=#e0e0e0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=59 ctermfg=186 gui=NONE guibg=#505860 guifg=#cae682
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#505860 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#808890 guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=59 ctermfg=144 gui=NONE guibg=#363946 guifg=#b6bf98
    CSAHi TabLineSel term=bold cterm=bold ctermbg=59 ctermfg=255 gui=bold guibg=#414658 guifg=#efefef
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=59 ctermfg=187 gui=NONE guibg=#363946 guifg=#cfcfaf
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#202438 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#202438 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=153 ctermfg=234 gui=NONE guibg=#a3e3ed guifg=bg
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=181 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=59 ctermfg=254 gui=bold guibg=#363946 guifg=#e0e0e0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#363946 guifg=#767986
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=59 ctermfg=243 gui=NONE guibg=#363946 guifg=#777777
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#62bdde
    CSAHi Visual term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#364458 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=bg ctermfg=254 gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#e5786d
    CSAHi WildMenu term=NONE cterm=bold,underline ctermbg=59 ctermfg=186 gui=bold,underline guibg=#363946 guifg=#cae682
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=117 gui=NONE guibg=#363946 guifg=#91d6f8
    CSAHi lCursor term=NONE cterm=NONE ctermbg=254 ctermfg=234 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=#00ff00
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#606060
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=116 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=181 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#efaf7f
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=115 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=115 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=115 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=115 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=181 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=181 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=181 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=bg ctermfg=181 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=59 ctermfg=117 gui=NONE guibg=#363946 guifg=#91d6f8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=59 ctermfg=108 gui=NONE guibg=#313c36 guifg=#80a090
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#4a343a guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=59 ctermfg=59 gui=NONE guibg=#3c3631 guifg=#6c6661
    CSAHi DiffText term=reverse cterm=bold ctermbg=59 ctermfg=203 gui=bold guibg=#4a343a guifg=#f05060
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=234 ctermfg=145 gui=NONE guibg=#181818 guifg=#9fafaf
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ee0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=226 gui=undercurl guibg=bg guifg=fg guisp=#eeee00
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=214 gui=undercurl guibg=bg guifg=fg guisp=#ffa500
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=214 gui=undercurl guibg=bg guifg=fg guisp=#ffa500
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#202020 guifg=#e0e0e0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=87 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=80 ctermfg=53 gui=NONE guibg=#432323 guifg=#e37170
    CSAHi Todo term=NONE cterm=underline ctermbg=bg ctermfg=77 gui=underline guibg=bg guifg=#efef8f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#80c0d9
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#80c0d9
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#efaf7f
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#404040
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#404040
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#c0e0b0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ee0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=47 ctermfg=80 gui=reverse guibg=bg guifg=#66ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=68 ctermfg=16 gui=NONE guibg=#ffaa33 guifg=Black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#76d5f8
    CSAHi LineNr term=underline cterm=NONE ctermbg=17 ctermfg=37 gui=NONE guibg=#363946 guifg=#818698
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=42 ctermfg=80 gui=NONE guibg=#96cdcd guifg=bg
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#303840 guifg=#e0e0e0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=81 ctermfg=57 gui=NONE guibg=#505860 guifg=#cae682
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=81 ctermfg=fg gui=NONE guibg=#505860 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=83 ctermfg=fg gui=NONE guibg=#808890 guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=17 ctermfg=57 gui=NONE guibg=#363946 guifg=#b6bf98
    CSAHi TabLineSel term=bold cterm=bold ctermbg=21 ctermfg=87 gui=bold guibg=#414658 guifg=#efefef
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=17 ctermfg=58 gui=NONE guibg=#363946 guifg=#cfcfaf
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#202438 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#202438 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=43 ctermfg=80 gui=NONE guibg=#a3e3ed guifg=bg
    CSAHi Debug term=NONE cterm=NONE ctermbg=bg ctermfg=54 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Label term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Exception term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=17 ctermfg=87 gui=bold guibg=#363946 guifg=#e0e0e0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=17 ctermfg=37 gui=NONE guibg=#363946 guifg=#767986
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=17 ctermfg=82 gui=NONE guibg=#363946 guifg=#777777
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#62bdde
    CSAHi Visual term=reverse cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#364458 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=bg ctermfg=87 gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#e5786d
    CSAHi WildMenu term=NONE cterm=bold,underline ctermbg=17 ctermfg=57 gui=bold,underline guibg=#363946 guifg=#cae682
    CSAHi Folded term=NONE cterm=NONE ctermbg=17 ctermfg=43 gui=NONE guibg=#363946 guifg=#91d6f8
    CSAHi lCursor term=NONE cterm=NONE ctermbg=87 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=#00ff00
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#606060
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#8cd0d3
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=54 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#efaf7f
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#b3d38c
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#f0dfaf
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#93d6a9
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=54 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=bg ctermfg=54 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=54 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=bg ctermfg=54 gui=NONE guibg=bg guifg=#cca3b3
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=17 ctermfg=43 gui=NONE guibg=#363946 guifg=#91d6f8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#313c36 guifg=#80a090
    CSAHi DiffChange term=bold cterm=NONE ctermbg=32 ctermfg=fg gui=NONE guibg=#4a343a guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#3c3631 guifg=#6c6661
    CSAHi DiffText term=reverse cterm=bold ctermbg=32 ctermfg=69 gui=bold guibg=#4a343a guifg=#f05060
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=80 ctermfg=42 gui=NONE guibg=#181818 guifg=#9fafaf
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ee0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=76 gui=undercurl guibg=bg guifg=fg guisp=#eeee00
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=68 gui=undercurl guibg=bg guifg=fg guisp=#ffa500
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=68 gui=undercurl guibg=bg guifg=fg guisp=#ffa500
endif

if 1
    delcommand CSAHi
endif
