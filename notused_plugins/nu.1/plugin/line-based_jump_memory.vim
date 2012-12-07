" ==============================================================================
"         File: line-based_jump_memory.vim
"
"      Summary: Allows to quickly return to the original position after a jump
"               on the line
"
"  Description: It marks the current cursor position just before a line-based 
"               jump command is pressed (e.g. $, w, f, ;, <Home>, etc.).
"               Hitting CTRL-O (or `' or ``) will put the cursor back to its 
"               original position.
"               It works for both normal and insert mode line-based commands.
"
"       Author: Douglas A. Augusto (daaugusto AT gmail DOT com)
"
"      Version: 0.2.1
"
"  Last change: January 7, 2011
"
"      License: GNU GPL version 3 or later <www.gnu.org/licenses/gpl.html>
"
"          URL: http://www.vim.org/scripts/script.php?script_id=3391
 
" Installation: Copy the line-based_jump_memory.vim file into Vim's plug-in
"               directory (usually $HOME/.vim/plugin/ or something like that)
"
"        Usage: Hit CTRL-O to return to the previous position after a jump on
"               the line. The combinations `' and `` also work. 
"               Type :jump to see the jump list.
"
"   Known bugs: 
"   (1) No jump memory for the commands 'A', 'I', and 'gI' yet.
"
"   (2) The mapped keys currently do not work correctly under ':motion' when 
"       counts are given. This is not a bug in the plugin itself, and is 
"       expected to be fixed soon.
"       See https://groups.google.com/group/vim_dev/t/20d6721db3ff0b9f

" ==============================================================================
" Has this plugin already been loaded?
if exists('g:loaded_line_based_jump_memory')
  finish
endif
let g:loaded_line_based_jump_memory = 1

" ==============================================================================
" Parameters (can be changed by the user via .vimrc or within a Vim session)
" ------------------------------------------------------------------------------
if !exists('g:lbjmMinCharMotion')
  " The minimum character motion (distance) needed to produce a mark.
  let g:lbjmMinCharMotion = 2
endif
if !exists('g:lbjmIgnoreMarkOnLineChange')
  " When this variable is set, a jump that exits the current line is not marked.
  let g:lbjmIgnoreMarkOnLineChange = 0
endif


" ==============================================================================
" Mapping for insert mode line-based jump commands
" ------------------------------------------------------------------------------
inoremap <silent> <End> <C-\><C-O>:<C-U>call <SID>SavePos()<CR><End><C-\><C-O>:<C-U>call <SID>Mark()<CR>
inoremap <silent> <Home> <C-\><C-O>:<C-U>call <SID>SavePos()<CR><Home><C-\><C-O>:<C-U>call <SID>Mark()<CR>
inoremap <silent> <S-Right> <C-\><C-O>:<C-U>call <SID>SavePos()<CR><S-Right><C-\><C-O>:<C-U>call <SID>Mark()<CR>
inoremap <silent> <C-Right> <C-\><C-O>:<C-U>call <SID>SavePos()<CR><C-Right><C-\><C-O>:<C-U>call <SID>Mark()<CR>
inoremap <silent> <S-Left> <C-\><C-O>:<C-U>call <SID>SavePos()<CR><S-Left><C-\><C-O>:<C-U>call <SID>Mark()<CR>
inoremap <silent> <C-Left> <C-\><C-O>:<C-U>call <SID>SavePos()<CR><C-Left><C-\><C-O>:<C-U>call <SID>Mark()<CR>
inoremap <silent> <LeftMouse> <C-\><C-O>:<C-U>call <SID>SavePos()<CR><LeftMouse><C-\><C-O>:<C-U>call <SID>Mark()<CR>

" ------------------------------------------------------------------------------
" Mapping for normal mode line-based jump commands
" ------------------------------------------------------------------------------
nnoremap <silent> $ :<C-U>call <SID>Normal("$", 0)<CR>
nnoremap <silent> 0 :<C-U>call <SID>Normal("0", 0)<CR>

nnoremap <silent> <End> :<C-U>call <SID>Normal('\<lt>End>', 0)<CR>
nnoremap <silent> <Home> :<C-U>call <SID>Normal('\<lt>Home>', 0)<CR>

nnoremap <silent> ^ :<C-U>call <SID>Normal("^", 0)<CR>
nnoremap <silent> g_ :<C-U>call <SID>Normal("g_", 0)<CR>
nnoremap <silent> g^ :<C-U>call <SID>Normal("g^", 0)<CR>
nnoremap <silent> gm :<C-U>call <SID>Normal("gm", 0)<CR>
nnoremap <silent> g$ :<C-U>call <SID>Normal("g$", 0)<CR>

nnoremap <silent> g<End> :<C-U>call <SID>Normal('g\<lt>End>', 0)<CR>
nnoremap <silent> g<Home> :<C-U>call <SID>Normal('g\<lt>Home>', 0)<CR>

nnoremap <silent> f :<C-U>call <SID>Normal("f", 1)<CR>
nnoremap <silent> F :<C-U>call <SID>Normal("F", 1)<CR>
nnoremap <silent> t :<C-U>call <SID>Normal("t", 1)<CR>
nnoremap <silent> T :<C-U>call <SID>Normal("T", 1)<CR>
nnoremap <silent> ; :<C-U>call <SID>Normal(";", 0)<CR>
nnoremap <silent> , :<C-U>call <SID>Normal(",", 0)<CR>

nnoremap <silent> w :<C-U>call <SID>Normal("w", 0)<CR>
nnoremap <silent> W :<C-U>call <SID>Normal("W", 0)<CR>
nnoremap <silent> e :<C-U>call <SID>Normal("e", 0)<CR>
nnoremap <silent> E :<C-U>call <SID>Normal("E", 0)<CR>
nnoremap <silent> b :<C-U>call <SID>Normal("b", 0)<CR>
nnoremap <silent> B :<C-U>call <SID>Normal("B", 0)<CR>
nnoremap <silent> ge :<C-U>call <SID>Normal("ge", 0)<CR>
nnoremap <silent> gE :<C-U>call <SID>Normal("gE", 0)<CR>

nnoremap <silent> <S-Right> :<C-U>call <SID>Normal("w", 0)<CR>
nnoremap <silent> <C-Right> :<C-U>call <SID>Normal("W", 0)<CR>
nnoremap <silent> <S-Left> :<C-U>call <SID>Normal("w", 0)<CR>
nnoremap <silent> <C-Left> :<C-U>call <SID>Normal("W", 0)<CR>

nnoremap <silent> \| :<C-U>call <SID>Normal("\|", 0)<CR>

nnoremap <silent> <LeftMouse> :<C-U>call <SID>Normal('\<lt>LeftMouse>', 0)<CR>

" ==============================================================================
" Functions
" ------------------------------------------------------------------------------

" Save temporarily the current position, execute the command (passing the user-
" given arguments) and memorize the pre-jump position (put in the jump list).
function! <SID>Normal(cmd, has_char_arg)
   let c = a:has_char_arg ? nr2char(getchar()) : ''
   let n = v:count ? v:count : ''

   call <SID>SavePos()
   silent exec "normal! " . n . eval("\"".a:cmd."\"") . c
   call <SID>Mark()
endfunction

" Save temporarily the current cursor position
function! <SID>SavePos()
   let s:old = getpos('.') " s:old[1] -> line; s:old[2] -> column
endfunction

" Mark the pre-jump position if certain requirements are met 
function! <SID>Mark()
   let new = getpos('.') " new[1] -> line; new[2] -> column

   if new[1] == s:old[1] " motion has occurred within the current line
      if abs(s:old[2] - new[2]) >= g:lbjmMinCharMotion " a significant motion?
         call <SID>SetMark( s:old, new ) " memorize the pre-jump position
      endif
   elseif !g:lbjmIgnoreMarkOnLineChange
      call <SID>SetMark( s:old, new )    " memorize the pre-jump position
   endif
endfunction

" Actually set the jump mark
function! <SID>SetMark( old, new )
      "call setpos("'`", a:old) " unfortunately, this doesn't seem to work as expected
      call setpos(".", a:old)
      normal! m'
      call setpos(".", a:new)
endfunction
