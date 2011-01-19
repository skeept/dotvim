"  Name        - markHL.vim
"  Description - Vim simple global plugin for easy line marking and jumping
"  Last Change - 8 Jan 2011
"  Creator     - Nacho <pkbrister@gmail.com>
"
"  Inspired by Kate 'bookmarks' and other scripts herein, I devised a convenient way to mark lines and highlight mark lines.
"  The idea is to mark lines and then jump from one to the other, in an easier way than the one Vim provides.
"  Lines with markers are highlighted, which is convenient to visually spot where the mark is. 
"  One does not need to remember which markers are already in use and which are free anymore, just add marks and remove 
"  marks, and the script will manage where to store them or free them.
"  
"  USAGE:
"  <F1>		Turn on highlighting for all lines with markers on them
"  <F2>		Turn off the highlighting for marked lines
"  <SHIFT-F2>	Erase all markers [a-z]
"  <F5>		Add a mark on the current line (and highlight)
"  <SHIFT-F5>	Remove the mark on the current line
"
"  Then, just jump from one mark to the next using the classic [' and ]' jumps
"  
"  Try it! it's nice!
"  
"  NOTE:
"  Of course, the highlight group I define ("Marks") should be tweaked to one's taste, 
"  and the same applies to the keyboard mappings.
"  
"  NOTE-UPDATE:
"  The classic marking method (ie. typing 'ma', 'mb', 'mc'...) can be used in
"  combination with this one, but one has to be careful not to overwrite an
"  existing mark. Check with the :marks command. HINT: the code marks from the
"  'a' to the 'z', so if there are not too many marks, one can safely assume
"  that the last ones ('z 'x 'y 'w ...) are safe to use.
"
"  Enjoy...

hi Marks term=reverse ctermfg=0 ctermbg=4 guibg=Grey40

function! HLMarks(group)
	call clearmatches()
	let index = char2nr('a')
	while index < char2nr('z')
		call matchadd( a:group, '\%'.line( "'".nr2char(index)).'l')
		let index = index + 1
	endwhile
endfunction


function! AddHLMark(group)
	let index = char2nr('a')
	while getpos("'".nr2char(index))[2] != 0
		let index = index + 1
	endwhile
	if index != char2nr('z')
		exe 'normal m'.nr2char(index)
		call HLMarks(a:group)
	endif
endfunction


function! DelHLMark(group)
	let index = char2nr('a')
	while index < char2nr('z')
		if line(".") == line("'".nr2char(index))
			exe 'delmarks '.nr2char(index)
			call HLMarks(a:group)
			let index = char2nr('z')
		endif
		let index = index + 1
	endwhile
endfunction

nmap <F1> :call HLMarks("Marks")<CR>
nmap <F2> :call clearmatches()<CR>
nmap <S-F2> :call clearmatches()\|:delmarks a-z<CR>
nmap <F5> :call AddHLMark("Marks")<CR>
nmap <S-F5> :call DelHLMark("Marks")<CR>
