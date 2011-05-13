"=============================================================================
" 	     File: d:/srinath/vimfiles/ftplugin/xml.vim
"      Author: Srinath Avadhanula
"=============================================================================

setlocal fdm=manual

let b:Imap_PlaceHolderStart = "\xab"
let b:Imap_PlaceHolderEnd = "\xbb"

inoremap <buffer> <silent> <C-_> <C-r>=CompleteTag()<CR>
vnoremap <buffer> <silent> <C-_> <C-\><C-N>:call EncloseSelection()<CR>

" CompleteTag: makes a tag from last word {{{
" Description: 

let b:unaryTags = 'br,par'

function! CompleteTag()
	let line = strpart(getline('.'), 0, col('.')-1)
	
	let word = matchstr(line, '\w\+$')
	if word != ''
		let back = substitute(word, '.', "\<BS>", 'g')
		if exists('b:tag_'.word)
			return IMAP_PutTextWithMovement(back.b:tag_{word})
		elseif b:unaryTags =~ '\<'.word.'\>'
			return IMAP_PutTextWithMovement(back."<".word."/>")
		else
			return IMAP_PutTextWithMovement(back."<".word."><++></".word."><++>")
		endif
	else
		return ''
	endif
endfunction " }}}
" EncloseSelection: enclose visual selection in tags {{{
" Description: prompts for tag name

let s:lastVal = ''
function! EncloseSelection()
	let name = input('Enter tag name:', s:lastVal)
	let s:lastVal = name
	let startTag = '<'.name.'>'
	let endTag = '</'.name.'>'
	call VEnclose(startTag, endTag, startTag, endTag)
endfunction " }}}

" vim:fdm=marker
