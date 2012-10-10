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
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=102 gui=NONE guibg=#f5f5f5 guifg=DimGray
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=145 gui=underline guibg=bg guifg=honeydew4
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#204050
    CSAHi Error term=reverse cterm=bold ctermbg=255 ctermfg=131 gui=bold guibg=bg guifg=FireBrick
    CSAHi Todo term=NONE cterm=NONE ctermbg=109 ctermfg=153 gui=NONE guibg=SlateGray guifg=LightSkyBlue
    CSAHi String term=NONE cterm=NONE ctermbg=255 ctermfg=115 gui=NONE guibg=bg guifg=MediumAquamarine
    CSAHi Number term=NONE cterm=NONE ctermbg=255 ctermfg=78 gui=NONE guibg=bg guifg=MediumSeaGreen
    CSAHi Boolean term=NONE cterm=NONE ctermbg=255 ctermfg=151 gui=NONE guibg=bg guifg=DarkSeaGreen
    CSAHi Function term=NONE cterm=NONE ctermbg=255 ctermfg=151 gui=NONE guibg=bg guifg=DarkSeaGreen
    CSAHi Macro term=NONE cterm=NONE ctermbg=255 ctermfg=152 gui=NONE guibg=bg guifg=LightSkyBlue3
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=255 ctermfg=153 gui=NONE guibg=bg guifg=LightSkyBlue2
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=252 ctermfg=109 gui=NONE guibg=LightGray guifg=CadetBlue
    CSAHi NonText term=bold cterm=NONE ctermbg=252 ctermfg=109 gui=NONE guibg=#d3d3d3 guifg=#5daf83
    CSAHi Directory term=bold cterm=NONE ctermbg=255 ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=255 ctermfg=131 gui=NONE guibg=bg guifg=FireBrick
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=102 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=189 ctermfg=fg gui=NONE guibg=SlateGray2 guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=255 ctermfg=109 gui=NONE guibg=bg guifg=CadetBlue
    CSAHi ModeMsg term=bold cterm=bold ctermbg=109 ctermfg=252 gui=bold guibg=CadetBlue guifg=LightGrey
    CSAHi LineNr term=underline cterm=NONE ctermbg=252 ctermfg=109 gui=NONE guibg=#d3d3d3 guifg=#5daf83
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=152 ctermfg=231 gui=NONE guibg=PaleTurquoise3 guifg=white
    CSAHi Define term=NONE cterm=NONE ctermbg=255 ctermfg=189 gui=NONE guibg=bg guifg=LightSteelBlue2
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=102 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=102 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=152 ctermfg=231 gui=NONE guibg=PaleTurquoise3 guifg=White
    CSAHi Conditional term=NONE cterm=NONE ctermbg=255 ctermfg=109 gui=NONE guibg=bg guifg=#5daf83
    CSAHi Repeat term=NONE cterm=NONE ctermbg=255 ctermfg=109 gui=NONE guibg=bg guifg=#5daf83
    CSAHi Operator term=NONE cterm=NONE ctermbg=255 ctermfg=141 gui=NONE guibg=bg guifg=LightSlateBlue
    CSAHi Keyword term=NONE cterm=NONE ctermbg=255 ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi Exception term=NONE cterm=NONE ctermbg=255 ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi Include term=NONE cterm=NONE ctermbg=255 ctermfg=74 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Question term=NONE cterm=NONE ctermbg=255 ctermfg=121 gui=NONE guibg=bg guifg=SeaGreen2
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=109 ctermfg=252 gui=NONE guibg=SlateGrey guifg=LightGrey
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=252 ctermfg=109 gui=NONE guibg=LightGrey guifg=SlateGrey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=grey60 guifg=black
    CSAHi Title term=bold cterm=NONE ctermbg=255 ctermfg=177 gui=NONE guibg=bg guifg=MediumOrchid1
    CSAHi Visual term=reverse cterm=NONE ctermbg=189 ctermfg=103 gui=reverse guibg=slategray4 guifg=SlateGray2
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=255 ctermfg=102 gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=255 ctermfg=203 gui=NONE guibg=bg guifg=FireBrick1
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=118 ctermfg=16 gui=NONE guibg=Chartreuse guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=152 ctermfg=74 gui=NONE guibg=LightSteelBlue guifg=SteelBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=LightSteelBlue
    CSAHi Constant term=underline cterm=NONE ctermbg=255 ctermfg=61 gui=NONE guibg=bg guifg=#483d8b
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=115 gui=NONE guibg=bg guifg=aquamarine3
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=CornflowerBlue
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=SkyBlue1
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=255 ctermfg=74 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Structure term=NONE cterm=NONE ctermbg=255 ctermfg=74 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Typedef term=NONE cterm=NONE ctermbg=255 ctermfg=74 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=152 ctermfg=74 gui=NONE guibg=LightSteelBLue guifg=SteelBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=252 ctermfg=74 gui=NONE guibg=LightGray guifg=SteelBlue
    CSAHi DiffChange term=bold cterm=NONE ctermbg=109 ctermfg=102 gui=NONE guibg=CadetBlue guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=74 ctermfg=252 gui=NONE guibg=SteelBlue guifg=LightGray
    CSAHi DiffText term=reverse cterm=NONE ctermbg=255 ctermfg=102 gui=NONE guibg=bg guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=242 gui=NONE guibg=#f5f5f5 guifg=DimGray
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=145 gui=underline guibg=bg guifg=honeydew4
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=#204050
    CSAHi Error term=reverse cterm=bold ctermbg=255 ctermfg=167 gui=bold guibg=bg guifg=FireBrick
    CSAHi Todo term=NONE cterm=NONE ctermbg=145 ctermfg=159 gui=NONE guibg=SlateGray guifg=LightSkyBlue
    CSAHi String term=NONE cterm=NONE ctermbg=255 ctermfg=122 gui=NONE guibg=bg guifg=MediumAquamarine
    CSAHi Number term=NONE cterm=NONE ctermbg=255 ctermfg=79 gui=NONE guibg=bg guifg=MediumSeaGreen
    CSAHi Boolean term=NONE cterm=NONE ctermbg=255 ctermfg=151 gui=NONE guibg=bg guifg=DarkSeaGreen
    CSAHi Function term=NONE cterm=NONE ctermbg=255 ctermfg=151 gui=NONE guibg=bg guifg=DarkSeaGreen
    CSAHi Macro term=NONE cterm=NONE ctermbg=255 ctermfg=153 gui=NONE guibg=bg guifg=LightSkyBlue3
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=255 ctermfg=195 gui=NONE guibg=bg guifg=LightSkyBlue2
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=231 ctermfg=116 gui=NONE guibg=LightGray guifg=CadetBlue
    CSAHi NonText term=bold cterm=NONE ctermbg=231 ctermfg=115 gui=NONE guibg=#d3d3d3 guifg=#5daf83
    CSAHi Directory term=bold cterm=NONE ctermbg=255 ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=255 ctermfg=167 gui=NONE guibg=bg guifg=FireBrick
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=242 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=SlateGray2 guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=255 ctermfg=116 gui=NONE guibg=bg guifg=CadetBlue
    CSAHi ModeMsg term=bold cterm=bold ctermbg=116 ctermfg=231 gui=bold guibg=CadetBlue guifg=LightGrey
    CSAHi LineNr term=underline cterm=NONE ctermbg=231 ctermfg=115 gui=NONE guibg=#d3d3d3 guifg=#5daf83
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=195 ctermfg=255 gui=NONE guibg=PaleTurquoise3 guifg=white
    CSAHi Define term=NONE cterm=NONE ctermbg=255 ctermfg=195 gui=NONE guibg=bg guifg=LightSteelBlue2
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=242 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=242 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=195 ctermfg=255 gui=NONE guibg=PaleTurquoise3 guifg=White
    CSAHi Conditional term=NONE cterm=NONE ctermbg=255 ctermfg=115 gui=NONE guibg=bg guifg=#5daf83
    CSAHi Repeat term=NONE cterm=NONE ctermbg=255 ctermfg=115 gui=NONE guibg=bg guifg=#5daf83
    CSAHi Operator term=NONE cterm=NONE ctermbg=255 ctermfg=147 gui=NONE guibg=bg guifg=LightSlateBlue
    CSAHi Keyword term=NONE cterm=NONE ctermbg=255 ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi Exception term=NONE cterm=NONE ctermbg=255 ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi Include term=NONE cterm=NONE ctermbg=255 ctermfg=110 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Question term=NONE cterm=NONE ctermbg=255 ctermfg=121 gui=NONE guibg=bg guifg=SeaGreen2
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=145 ctermfg=231 gui=NONE guibg=SlateGrey guifg=LightGrey
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=231 ctermfg=145 gui=NONE guibg=LightGrey guifg=SlateGrey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=grey60 guifg=black
    CSAHi Title term=bold cterm=NONE ctermbg=255 ctermfg=213 gui=NONE guibg=bg guifg=MediumOrchid1
    CSAHi Visual term=reverse cterm=NONE ctermbg=195 ctermfg=145 gui=reverse guibg=slategray4 guifg=SlateGray2
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=255 ctermfg=242 gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=255 ctermfg=203 gui=NONE guibg=bg guifg=FireBrick1
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=154 ctermfg=16 gui=NONE guibg=Chartreuse guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=195 ctermfg=110 gui=NONE guibg=LightSteelBlue guifg=SteelBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=242 ctermfg=255 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=LightSteelBlue
    CSAHi Constant term=underline cterm=NONE ctermbg=255 ctermfg=97 gui=NONE guibg=bg guifg=#483d8b
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=aquamarine3
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=CornflowerBlue
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=SkyBlue1
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=255 ctermfg=110 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Structure term=NONE cterm=NONE ctermbg=255 ctermfg=110 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Typedef term=NONE cterm=NONE ctermbg=255 ctermfg=110 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=195 ctermfg=110 gui=NONE guibg=LightSteelBLue guifg=SteelBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=231 ctermfg=110 gui=NONE guibg=LightGray guifg=SteelBlue
    CSAHi DiffChange term=bold cterm=NONE ctermbg=116 ctermfg=242 gui=NONE guibg=CadetBlue guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=110 ctermfg=231 gui=NONE guibg=SteelBlue guifg=LightGray
    CSAHi DiffText term=reverse cterm=NONE ctermbg=255 ctermfg=242 gui=NONE guibg=bg guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=242 gui=NONE guibg=#f5f5f5 guifg=DimGray
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=102 gui=underline guibg=bg guifg=honeydew4
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#204050
    CSAHi Error term=reverse cterm=bold ctermbg=255 ctermfg=124 gui=bold guibg=bg guifg=FireBrick
    CSAHi Todo term=NONE cterm=NONE ctermbg=66 ctermfg=117 gui=NONE guibg=SlateGray guifg=LightSkyBlue
    CSAHi String term=NONE cterm=NONE ctermbg=255 ctermfg=79 gui=NONE guibg=bg guifg=MediumAquamarine
    CSAHi Number term=NONE cterm=NONE ctermbg=255 ctermfg=71 gui=NONE guibg=bg guifg=MediumSeaGreen
    CSAHi Boolean term=NONE cterm=NONE ctermbg=255 ctermfg=108 gui=NONE guibg=bg guifg=DarkSeaGreen
    CSAHi Function term=NONE cterm=NONE ctermbg=255 ctermfg=108 gui=NONE guibg=bg guifg=DarkSeaGreen
    CSAHi Macro term=NONE cterm=NONE ctermbg=255 ctermfg=110 gui=NONE guibg=bg guifg=LightSkyBlue3
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=255 ctermfg=153 gui=NONE guibg=bg guifg=LightSkyBlue2
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=252 ctermfg=73 gui=NONE guibg=LightGray guifg=CadetBlue
    CSAHi NonText term=bold cterm=NONE ctermbg=252 ctermfg=72 gui=NONE guibg=#d3d3d3 guifg=#5daf83
    CSAHi Directory term=bold cterm=NONE ctermbg=255 ctermfg=29 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=255 ctermfg=124 gui=NONE guibg=bg guifg=FireBrick
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=242 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=153 ctermfg=fg gui=NONE guibg=SlateGray2 guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=255 ctermfg=73 gui=NONE guibg=bg guifg=CadetBlue
    CSAHi ModeMsg term=bold cterm=bold ctermbg=73 ctermfg=252 gui=bold guibg=CadetBlue guifg=LightGrey
    CSAHi LineNr term=underline cterm=NONE ctermbg=252 ctermfg=72 gui=NONE guibg=#d3d3d3 guifg=#5daf83
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=116 ctermfg=231 gui=NONE guibg=PaleTurquoise3 guifg=white
    CSAHi Define term=NONE cterm=NONE ctermbg=255 ctermfg=153 gui=NONE guibg=bg guifg=LightSteelBlue2
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=242 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=242 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=116 ctermfg=231 gui=NONE guibg=PaleTurquoise3 guifg=White
    CSAHi Conditional term=NONE cterm=NONE ctermbg=255 ctermfg=72 gui=NONE guibg=bg guifg=#5daf83
    CSAHi Repeat term=NONE cterm=NONE ctermbg=255 ctermfg=72 gui=NONE guibg=bg guifg=#5daf83
    CSAHi Operator term=NONE cterm=NONE ctermbg=255 ctermfg=99 gui=NONE guibg=bg guifg=LightSlateBlue
    CSAHi Keyword term=NONE cterm=NONE ctermbg=255 ctermfg=29 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi Exception term=NONE cterm=NONE ctermbg=255 ctermfg=29 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi Include term=NONE cterm=NONE ctermbg=255 ctermfg=67 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Question term=NONE cterm=NONE ctermbg=255 ctermfg=84 gui=NONE guibg=bg guifg=SeaGreen2
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=66 ctermfg=252 gui=NONE guibg=SlateGrey guifg=LightGrey
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=252 ctermfg=66 gui=NONE guibg=LightGrey guifg=SlateGrey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=grey60 guifg=black
    CSAHi Title term=bold cterm=NONE ctermbg=255 ctermfg=171 gui=NONE guibg=bg guifg=MediumOrchid1
    CSAHi Visual term=reverse cterm=NONE ctermbg=153 ctermfg=66 gui=reverse guibg=slategray4 guifg=SlateGray2
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=255 ctermfg=242 gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=255 ctermfg=203 gui=NONE guibg=bg guifg=FireBrick1
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=118 ctermfg=16 gui=NONE guibg=Chartreuse guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=152 ctermfg=67 gui=NONE guibg=LightSteelBlue guifg=SteelBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=242 ctermfg=255 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=LightSteelBlue
    CSAHi Constant term=underline cterm=NONE ctermbg=255 ctermfg=60 gui=NONE guibg=bg guifg=#483d8b
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=aquamarine3
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=CornflowerBlue
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=SkyBlue1
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=255 ctermfg=67 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Structure term=NONE cterm=NONE ctermbg=255 ctermfg=67 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Typedef term=NONE cterm=NONE ctermbg=255 ctermfg=67 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=152 ctermfg=67 gui=NONE guibg=LightSteelBLue guifg=SteelBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=252 ctermfg=67 gui=NONE guibg=LightGray guifg=SteelBlue
    CSAHi DiffChange term=bold cterm=NONE ctermbg=73 ctermfg=242 gui=NONE guibg=CadetBlue guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=67 ctermfg=252 gui=NONE guibg=SteelBlue guifg=LightGray
    CSAHi DiffText term=reverse cterm=NONE ctermbg=255 ctermfg=242 gui=NONE guibg=bg guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=79 ctermfg=82 gui=NONE guibg=#f5f5f5 guifg=DimGray
    CSAHi Underlined term=underline cterm=underline ctermbg=79 ctermfg=83 gui=underline guibg=bg guifg=honeydew4
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=#204050
    CSAHi Error term=reverse cterm=bold ctermbg=79 ctermfg=48 gui=bold guibg=bg guifg=FireBrick
    CSAHi Todo term=NONE cterm=NONE ctermbg=37 ctermfg=43 gui=NONE guibg=SlateGray guifg=LightSkyBlue
    CSAHi String term=NONE cterm=NONE ctermbg=79 ctermfg=41 gui=NONE guibg=bg guifg=MediumAquamarine
    CSAHi Number term=NONE cterm=NONE ctermbg=79 ctermfg=25 gui=NONE guibg=bg guifg=MediumSeaGreen
    CSAHi Boolean term=NONE cterm=NONE ctermbg=79 ctermfg=41 gui=NONE guibg=bg guifg=DarkSeaGreen
    CSAHi Function term=NONE cterm=NONE ctermbg=79 ctermfg=41 gui=NONE guibg=bg guifg=DarkSeaGreen
    CSAHi Macro term=NONE cterm=NONE ctermbg=79 ctermfg=42 gui=NONE guibg=bg guifg=LightSkyBlue3
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=79 ctermfg=43 gui=NONE guibg=bg guifg=LightSkyBlue2
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=86 ctermfg=37 gui=NONE guibg=LightGray guifg=CadetBlue
    CSAHi NonText term=bold cterm=NONE ctermbg=86 ctermfg=41 gui=NONE guibg=#d3d3d3 guifg=#5daf83
    CSAHi Directory term=bold cterm=NONE ctermbg=79 ctermfg=21 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=79 ctermfg=48 gui=NONE guibg=bg guifg=FireBrick
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=82 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=SlateGray2 guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=79 ctermfg=37 gui=NONE guibg=bg guifg=CadetBlue
    CSAHi ModeMsg term=bold cterm=bold ctermbg=37 ctermfg=86 gui=bold guibg=CadetBlue guifg=LightGrey
    CSAHi LineNr term=underline cterm=NONE ctermbg=86 ctermfg=41 gui=NONE guibg=#d3d3d3 guifg=#5daf83
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=42 ctermfg=79 gui=NONE guibg=PaleTurquoise3 guifg=white
    CSAHi Define term=NONE cterm=NONE ctermbg=79 ctermfg=59 gui=NONE guibg=bg guifg=LightSteelBlue2
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=82 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=82 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=42 ctermfg=79 gui=NONE guibg=PaleTurquoise3 guifg=White
    CSAHi Conditional term=NONE cterm=NONE ctermbg=79 ctermfg=41 gui=NONE guibg=bg guifg=#5daf83
    CSAHi Repeat term=NONE cterm=NONE ctermbg=79 ctermfg=41 gui=NONE guibg=bg guifg=#5daf83
    CSAHi Operator term=NONE cterm=NONE ctermbg=79 ctermfg=39 gui=NONE guibg=bg guifg=LightSlateBlue
    CSAHi Keyword term=NONE cterm=NONE ctermbg=79 ctermfg=21 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi Exception term=NONE cterm=NONE ctermbg=79 ctermfg=21 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi Include term=NONE cterm=NONE ctermbg=79 ctermfg=38 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Question term=NONE cterm=NONE ctermbg=79 ctermfg=45 gui=NONE guibg=bg guifg=SeaGreen2
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=37 ctermfg=86 gui=NONE guibg=SlateGrey guifg=LightGrey
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=86 ctermfg=37 gui=NONE guibg=LightGrey guifg=SlateGrey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=84 ctermfg=16 gui=NONE guibg=grey60 guifg=black
    CSAHi Title term=bold cterm=NONE ctermbg=79 ctermfg=55 gui=NONE guibg=bg guifg=MediumOrchid1
    CSAHi Visual term=reverse cterm=NONE ctermbg=59 ctermfg=37 gui=reverse guibg=slategray4 guifg=SlateGray2
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=79 ctermfg=82 gui=underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=79 ctermfg=64 gui=NONE guibg=bg guifg=FireBrick1
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=44 ctermfg=16 gui=NONE guibg=Chartreuse guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=58 ctermfg=38 gui=NONE guibg=LightSteelBlue guifg=SteelBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=82 ctermfg=79 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=LightSteelBlue
    CSAHi Constant term=underline cterm=NONE ctermbg=79 ctermfg=33 gui=NONE guibg=bg guifg=#483d8b
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=aquamarine3
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=CornflowerBlue
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=SkyBlue1
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=79 ctermfg=38 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Structure term=NONE cterm=NONE ctermbg=79 ctermfg=38 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi Typedef term=NONE cterm=NONE ctermbg=79 ctermfg=38 gui=NONE guibg=bg guifg=SteelBlue
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=58 ctermfg=38 gui=NONE guibg=LightSteelBLue guifg=SteelBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=86 ctermfg=38 gui=NONE guibg=LightGray guifg=SteelBlue
    CSAHi DiffChange term=bold cterm=NONE ctermbg=37 ctermfg=82 gui=NONE guibg=CadetBlue guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=38 ctermfg=86 gui=NONE guibg=SteelBlue guifg=LightGray
    CSAHi DiffText term=reverse cterm=NONE ctermbg=79 ctermfg=82 gui=NONE guibg=bg guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
