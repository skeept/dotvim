" tselectbuffer.vim -- A simplicistic buffer selector/switcher
" @Author:      Tom Link (micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    330
" GetLatestVimScripts: 1866 1 tselectbuffer.vim

if &cp || exists("loaded_tselectbuffer")
    finish
endif
if !exists('loaded_tlib') || loaded_tlib < 114
    echoerr 'tlib >= 1.14 is required'
    finish
endif
let loaded_tselectbuffer = 8


command! -count=0 -bang TSelectBuffer call tselectbuffer#Select(!empty("<bang>") || v:count)

