" Maintainer:	Lars H. Nielsen (dengmao@gmail.com)
" Last Change:	January 22 2007

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "wombat"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=#2d2d2d
  hi CursorColumn guibg=#2d2d2d
  hi MatchParen guifg=#f6f3e8 guibg=#857b6f gui=bold
  hi Pmenu 		guifg=#f6f3e8 guibg=#444444
  hi PmenuSel 	guifg=#000000 guibg=#cae682
endif

" General colors
hi Cursor 		guifg=NONE    guibg=#656565 gui=none
hi Normal 		guifg=#f6f3e8 guibg=#000000 gui=none
hi NonText 		guifg=#808080 guibg=#303030 gui=none
hi LineNr 		guifg=#857b6f guibg=#242424 gui=none
hi StatusLine 	guifg=#f6f3e8 guibg=#444444 gui=italic
hi StatusLineNC guifg=#857b6f guibg=#444444 gui=none
hi VertSplit 	guifg=#444444 guibg=#444444 gui=none
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=none
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold
hi Visual		guifg=#f6f3e8 guibg=#444444 gui=none
hi SpecialKey	guifg=#808080 guibg=#343434 gui=none

" Syntax highlighting
hi Comment 		guifg=#adadad gui=italic
hi Todo 		guifg=#8f8f8f gui=italic
hi Constant 	guifg=#fe6666 gui=none
hi String 		guifg=#dcdc71 gui=italic
hi Identifier 	guifg=#ffffff gui=none
hi Function 	guifg=#78e083 gui=none
hi Type 		guifg=#78e083 gui=none
hi Statement 	guifg=#78e083 gui=none
hi Keyword		guifg=#78e083 gui=none
hi PreProc 		guifg=#78e083 gui=none
hi Number		guifg=#ffffff gui=none
hi Special		guifg=#78e083 gui=none
hi Normal     guifg=#fe6666 gui=italic

hi htmlTag 		guifg=#ffcd00 gui=italic
hi htmlEndTag 		guifg=#ffcd00 gui=italic
hi htmlTagName 		guifg=#ffcd00 gui=italic

hi javaScriptCommentSkip guifg=#ffffff gui=none
hi javaScriptBoolean guifg=#ffffff gui=none
hi javaScriptDotNotation guifg=#78e083 gui=none
hi javaScriptBlock guifg=#ffffff gui=none
hi javaScriptParen guifg=#ffffff gui=none
hi javaScriptBracket guifg=#ffffff gui=none
hi javaScriptFuncName guifg=#78e083 gui=none
hi javaScriptFuncBlock guifg=#ffffff gui=none
hi javaScriptCharacter guifg=#ffffff gui=none
hi javaScriptValue guifg=#ffffff gui=none

hi cssClassName 		guifg=#fe6666 gui=none
hi cssTagName 		guifg=#ffcd00 gui=none
hi cssCommonAttr guifg=#78e083 gui=none
hi cssFontAttr guifg=#78e083 gui=none
hi cssFontProp guifg=#ffffff gui=none
hi cssTextAttr guifg=#78e083 gui=none
hi cssTextProp guifg=#ffffff gui=none
hi cssFunctionName guifg=#ffffff gui=none
hi cssSelectorOp guifg=#ffffff gui=none
hi cssSelectorOp2 guifg=#ffffff gui=none
hi cssIdentifier guifg=#ffffff gui=none
hi cssFontDescriptor guifg=#ffffff gui=none
hi cssFontDescriptorAttr guifg=#78e083 gui=none
hi cssBoxProp guifg=#ffffff gui=none
hi cssBoxAttr guifg=#78e083 gui=none
hi cssColorProp guifg=#ffffff gui=none
hi cssColorAttr guifg=#78e083 gui=none
hi cssPagingProp guifg=#ffffff gui=none
hi cssPagingAttr guifg=#78e083 gui=none
hi cssUIProp guifg=#ffffff gui=none
hi cssUIAttr guifg=#78e083 gui=none
hi cssRenderProp guifg=#ffffff gui=none
hi cssRenderAttr guifg=#78e083 gui=none
hi cssAuralProp guifg=#ffffff gui=none
hi cssAuralAttr guifg=#78e083 gui=none
hi cssTableProp guifg=#ffffff gui=none
hi cssTableAttr guifg=#78e083 gui=none
hi cssLength guifg=#78e083 gui=none
hi cssString guifg=#78e083 gui=none
hi cssValueInteger guifg=#78e083 gui=none
hi cssValueNumber guifg=#78e083 gui=none
hi cssValueLength guifg=#78e083 gui=none
hi cssValueAngle guifg=#78e083 gui=none
hi cssValueTime guifg=#78e083 gui=none
hi cssValueFrequency guifg=#78e083 gui=none