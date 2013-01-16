" Vim color file
" Maintainer:       John Kaul
" Created On:       2013 Jan 16
" Last Change:      2013 Jan 16

" Notes:
" This is a "reverse" of my "faded-black" color scheme.
"
" White isn't quite white.
"
" NOTE: 
" I have not changed the terminal colors from the "faded-black" color
" scheme.

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "faded-white"


" Vim >= 7.0 specific colors
if version >= 700

hi CursorLine   ctermbg=236         ctermfg=NONE        guibg=#2d2d2d       guifg=NONE      term=NONE           gui=NONE
hi CursorColumn ctermbg=236         ctermfg=NONE        guibg=#2d2d2d       guifg=NONE      term=NONE           gui=NONE
hi MatchParen   ctermbg=237         ctermfg=157         guibg=#2f2f2f       guifg=#d0ffc0   term=bold           gui=bold
hi Pmenu        ctermbg=238         ctermfg=255         guibg=#444444       guifg=#ffffff   term=NONE           gui=NONE
hi PmenuSel     ctermbg=148         ctermfg=0           guibg=#b1d631       guifg=#000000   term=NONE           gui=NONE

endif

" //-- Stuff --//
hi Cursor       ctermbg=Red         ctermfg=NONE        guibg=#8b3a3a       guifg=#e3e3e3                       gui=NONE
hi Normal       ctermbg=NONE        ctermfg=LightGrey   guibg=#f7f5f3       guifg=#3d382e                       gui=NONE
hi NonText      ctermbg=NONE        ctermfg=Black       guibg=#f7f5f3       guifg=#000030                       gui=NONE
hi DiffDelete   ctermbg=DarkRed     ctermfg=White       guibg=DarkRed       guifg=White                         gui=NONE
hi DiffAdd      ctermbg=DarkGreen   ctermfg=White       guibg=DarkGreen     guifg=White                         gui=NONE
hi DiffText     ctermbg=LightCyan   ctermfg=Yellow      guibg=Lightblue     guifg=Yellow                        gui=NONE
hi DiffChange   ctermbg=LightBlue   ctermfg=White       guibg=LightBlue3    guifg=White                         gui=NONE
hi Constant     ctermbg=NONE        ctermfg=Red         guibg=NONE          guifg=#872e30                       gui=NONE
hi StatusLine   ctermbg=DarkGrey    ctermfg=Red         guibg=DarkGrey      guifg=LightRed                      gui=italic
hi StatusLineNC ctermbg=Darkgrey    ctermfg=black       guibg=DarkGrey      guifg=Black                         gui=NONE
hi VertSplit    ctermbg=NONE        ctermfg=NONE        guibg=NONE          guifg=Grey                          gui=NONE
hi Visual       ctermbg=DarkRed     ctermfg=Red         guibg=#6b6b6b       guifg=#431818  term=reverse
hi Search       ctermbg=NONE        ctermfg=LightGrey   guibg=#80363a       guifg=#a69c89                       gui=NONE
hi Label        ctermbg=NONE        ctermfg=NONE        guibg=NONE          guifg=#ffc0c0                       gui=NONE
hi LineNr       ctermbg=NONE        ctermfg=Red         guibg=NONE          guifg=#A39274                       gui=NONE

" //-- Messages --//
hi MoreMsg      ctermbg=NONE        ctermfg=DarkGreen   guibg=NONE          guifg=SeaGreen term=bold,italic     gui=bold
hi question     ctermbg=NONE        ctermfg=DarkGreen   guibg=NONE          guifg=SeaGreen term=standout        gui=bold

" //-- Syntax group --//
hi Comment      ctermbg=NONE        ctermfg=DarkGreen   guibg=NONE          guifg=#545f3a                      gui=italic
hi PreProc      ctermbg=NONE        ctermfg=NONE        guibg=NONE          guifg=#937bae                      gui=NONE
hi Statement    ctermbg=NONE        ctermfg=Yellow      guibg=NONE          guifg=#ab952b                      gui=NONE
hi Type         ctermbg=NONE        ctermfg=darkmagenta guibg=NONE          guifg=#663399                      gui=NONE
hi Identifier   ctermbg=NONE        ctermfg=Yellow      guibg=NONE          guifg=#5c6479                      gui=NONE
hi Special      ctermbg=NONE        ctermfg=Green       guibg=NONE          guifg=#5b5646                      gui=NONE
hi Todo         ctermbg=NONE        ctermfg=NONE        guibg=NONE          guifg=LightBlue                    gui=bold,italic
hi Number       ctermbg=NONE        ctermfg=NONE        guibg=NONE          guifg=#001a33                      gui=NONE
"
" //-- Fold --//
hi Folded       ctermbg=NONE        ctermfg=NONE        guibg=#a69c89       guifg=#001a33                      gui=italic
hi FoldColumn   ctermbg=NONE        ctermfg=Yellow      guibg=#6699CC       guifg=#0000EE                      gui=NONE
