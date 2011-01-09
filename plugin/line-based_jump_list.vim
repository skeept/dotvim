" ==============================================================================
"        File: line-based_jump_memory.vim
"     Summary: Allows to quickly return to the original position after a jump
"              on the line
" Description: It marks the current cursor position just before a line-based 
"              jump command is pressed (e.g. $, w, f, ;, <Home>, etc.).
"              Hitting CTRL-O (or `' or ``) will put the cursor back to its 
"              original position.
"              It works for both normal and insert mode line-based commands.
"      Author: Douglas A. Augusto (daaugusto at gmail dot com)
"     License: GNU GPL version 3 or later <http://www.gnu.org/licenses/gpl.html>
"     Version: 0.1.0
" ==============================================================================

" Installation
" ------------
" - Copy the line-based_jump_memory.vim file into Vim's plug-in directory 
"   (usually $HOME/.vim/plugin/ or something like that)
"
" Usage
" -----
" - Hit CTRL-O to return to the previous position after a jump on the line.
"
" Known bugs 
" ----------
" - No jump memory for the commands 'A', 'I', and 'gI' yet.

" ------------------------------------------------------------------------------
" Mapping for insert mode line-based jump commands
" ------------------------------------------------------------------------------
inoremap <silent> <End> <C-\><C-O>m'<End>
inoremap <silent> <Home> <C-\><C-O>m'<Home>
inoremap <silent> <S-Right> <C-\><C-O>m'<S-Right>
inoremap <silent> <C-Right> <C-\><C-O>m'<C-Right>
inoremap <silent> <S-Left> <C-\><C-O>m'<S-Left>
inoremap <silent> <C-Left> <C-\><C-O>m'<C-Left>
inoremap <silent> <LeftMouse> <C-\><C-O>m'<LeftMouse>
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Mapping for normal mode line-based jump commands
" ------------------------------------------------------------------------------
" TODO: Add full support for the normal mode commands 'A', 'I', and 'gI'. The
" following strategy doesn't support a 'count', so it will remain commented.
"nnoremap <silent> A :<C-U>call MarkAndExecute("A", 0)<CR>a
"nnoremap <silent> I :<C-U>call MarkAndExecute("I", 0)<CR>i
"nnoremap <silent> gI :<C-U>call MarkAndExecute("gI", 0)<CR>i

" ------------------------------------------------------------------------------
nnoremap <silent> $ :<C-U>call MarkAndExecute("$", 0)<CR>
nnoremap <silent> 0 :<C-U>call MarkAndExecute("0", 0)<CR>

nnoremap <silent> <End> :<C-U>call MarkAndExecute('\<lt>End>', 0)<CR>
nnoremap <silent> <Home> :<C-U>call MarkAndExecute('\<lt>Home>', 0)<CR>

nnoremap <silent> ^ :<C-U>call MarkAndExecute("^", 0)<CR>
nnoremap <silent> g_ :<C-U>call MarkAndExecute("g_", 0)<CR>
nnoremap <silent> g^ :<C-U>call MarkAndExecute("g^", 0)<CR>
nnoremap <silent> gm :<C-U>call MarkAndExecute("gm", 0)<CR>
nnoremap <silent> g$ :<C-U>call MarkAndExecute("g$", 0)<CR>

nnoremap <silent> g<End> :<C-U>call MarkAndExecute('g\<lt>End>', 0)<CR>
nnoremap <silent> g<Home> :<C-U>call MarkAndExecute('g\<lt>Home>', 0)<CR>

nnoremap <silent> f :<C-U>call MarkAndExecute("f", 1)<CR>
nnoremap <silent> F :<C-U>call MarkAndExecute("F", 1)<CR>
nnoremap <silent> t :<C-U>call MarkAndExecute("t", 1)<CR>
nnoremap <silent> T :<C-U>call MarkAndExecute("T", 1)<CR>
nnoremap <silent> ; :<C-U>call MarkAndExecute(";", 0)<CR>
nnoremap <silent> , :<C-U>call MarkAndExecute(",", 0)<CR>

nnoremap <silent> w :<C-U>call MarkAndExecute("w", 0)<CR>
nnoremap <silent> W :<C-U>call MarkAndExecute("W", 0)<CR>
nnoremap <silent> e :<C-U>call MarkAndExecute("e", 0)<CR>
nnoremap <silent> E :<C-U>call MarkAndExecute("E", 0)<CR>
nnoremap <silent> b :<C-U>call MarkAndExecute("b", 0)<CR>
nnoremap <silent> B :<C-U>call MarkAndExecute("B", 0)<CR>
nnoremap <silent> ge :<C-U>call MarkAndExecute("ge", 0)<CR>
nnoremap <silent> gE :<C-U>call MarkAndExecute("gE", 0)<CR>

nnoremap <silent> <S-Right> :<C-U>call MarkAndExecute("w", 0)<CR>
nnoremap <silent> <C-Right> :<C-U>call MarkAndExecute("W", 0)<CR>
nnoremap <silent> <S-Left> :<C-U>call MarkAndExecute("w", 0)<CR>
nnoremap <silent> <C-Left> :<C-U>call MarkAndExecute("W", 0)<CR>

nnoremap <silent> \| :<C-U>call MarkAndExecute("\|", 0)<CR>

" ------------------------------------------------------------------------------
" MarkAndExecute() function
" ------------------------------------------------------------------------------
" First the current position is memorized (in mark ') and then the given command
" 'cmd' is executed. A 'count' and 'argument' (if any) are taken into account.
" ------------------------------------------------------------------------------
function! MarkAndExecute(cmd, has_char_arg)
   let c = a:has_char_arg ? nr2char(getchar()) : ''
   let n = v:count ? v:count : ''
   " Put the current position into the jump list
   normal m'
   " Execute the wrapped command
   silent exec eval("\"normal! " . n . a:cmd . c . "\"")
endfunction
