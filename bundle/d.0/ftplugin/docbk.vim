"=============================================================================
" 	     File: d:/srinath/vimfiles/ftplugin/docbk.vim
"      Author: Srinath Avadhanula
"=============================================================================

let b:verbatim = 'programlisting'

" For writing down all the <F9> and such keys in xml.
call IMAP("<>", '&lt;<++>&gt;<++>', 'docbk')
" Define various b:tag_{word} variables for special <C-_> expansion {{{
" the option thing is specific to latex-suite documentation.
let b:tag_option = 
	\ "<informaltable frame=\"all\">"."\<CR>".
    \ "<tgroup cols=\"2\">"."\<CR>".
    \ "<tbody>"."\<CR>".
    \ "<row><entry>Type</entry><entry><++></entry></row>"."\<CR>".
    \ "<row><entry>Default Value</entry> <entry><literal><++></literal></entry></row>"."\<CR>".
    \ "</tbody>"."\<CR>".
    \ "</tgroup>"."\<CR>".
    \ "</informaltable>\<CR>".
	\ "<para>\<CR>".
	\ "<++>\<CR>".
	\ "</para><++>"
let b:tag_opt = b:tag_option
let b:tag_table = 
	\ "<informaltable frame=\"all\">"."\<CR>".
    \ "<tgroup cols=\"<++>\">"."\<CR>".
    \ "<thead>"."\<CR>".
    \ "<row>\<CR><entry><++></entry><++>\<CR></row><++>\<CR>".
    \ "</thead>"."\<CR>".
    \ "<tbody>"."\<CR>".
    \ "<row>\<CR><entry><++></entry><++>\<CR></row><++>\<CR>".
    \ "</tbody>"."\<CR>".
    \ "</tgroup>"."\<CR>".
    \ "</informaltable>\<CR><++>"
let b:tag_tbody = 
    \ "<tbody>"."\<CR>".
    \ "<row>\<CR><entry><++></entry><++>\<CR></row><++>\<CR>".
    \ "</tbody>"."\<CR>"
let b:tag_thead = 
    \ "<thead>"."\<CR>".
    \ "<row>\<CR><entry><++></entry><++>\<CR></row><++>\<CR>".
    \ "</thead>"."\<CR>"
let b:tag_lit = '<literal><++></literal><++>'
let b:tag_tt = '<literal><++></literal><++>'
let b:tag_em = '<emphasis><++></emphasis><++>'
let b:tag_link = '<link linkend="<++>"><++></link><++>'
let b:tag_lnk = '<link linkend="<++>"><++></link><++>'
let b:tag_anchor = '<anchor id="<++>" /><++>'
let b:tag_anc = '<anchor id="<++>" /><++>'
let b:tag_ent = '<entry><++></entry><++>'
let b:tag_note = "<note>\<CR><para>\<CR><++>\<CR></para><++>\<CR></note><++>" 
let b:tag_row = "<row>\<CR><entry><++></entry><++>\<CR></row><++>"
let b:tag_prg = "<programlisting><++></programlisting><++>"
let b:tag_para = "<para>\<CR><++>\<CR></para><++>"
let b:tag_section = "<section id=\"<++>\">\<CR>\<title><++></title>\<CR><para>\<CR><++>\<CR></para><++>\<CR></section><++>"
let b:tag_sect = b:tag_section 
let b:tag_ol = "<orderedlist>\<CR><listitem><++></listitem><++>\<CR></orderedlist>"
let b:tag_ul = "<simplelist>\<CR><member><++></member><++>\<CR></simplelist>"
let b:tag_li = "<listitem><++></listitem><++>"
" }}}

nnoremap <leader>rf :set fdm=syntax<CR>:set fdm=manual<CR>

vmap <buffer> <silent> <leader>lit 		<C-_><C-u>literal<CR>
vmap <buffer> <silent> <leader>lnk 		<C-_><C-u>link<CR>?<link>?e<CR>i linkend=""<left>
vmap <buffer> <silent> <leader>prg 		<C-_><C-u>programlisting<CR>
vmap <buffer> <silent> <leader>prog 	<C-_><C-u>programlisting<CR>
vmap <buffer> <silent> <leader>par 		<C-_><C-u>para<CR>
vmap <buffer> <silent> <leader>tab 		<C-_><C-u>table<CR>
vmap <buffer> <silent> <leader>row 		<C-_><C-u>row<CR>
vmap <buffer> <silent> <leader>col 		<C-_><C-u>col<CR>

imap <C-c> <C-\><C-N>:call DB_SearchID()<CR>
" DB_SearchID: search for id='' and insert the id {{{
" Description: 
function! DB_SearchID()
	let s:position = line('.').' | normal! '.virtcol('.')
	let s:winnum = winnr()
	
	silent! grep! id= %
	cwindow
	if &ft != 'qf'
		return
	endif
	nnoremap <buffer> <CR> :call DB_InsertID()<CR>
endfunction " }}}
" DB_InsertID: inserts id tag {{{
" " Description: 
function! DB_InsertID()
	if !exists('s:winnum') || !exists('s:position') || &ft != 'qf'
		echomsg 'error calling DB_InsertID, quitting...'
		return
	endif
	let id = matchstr(getline('.'), 'id="\zs.\{-}\ze"')
	cclose
	
	exec s:winnum.' wincmd w'
	exec s:position
	exec "normal! a".id."\<C-\>\<C-n>"
	normal! l
	startinsert
endfunction " }}}

" DockBookFoldtextFunction: creates a meaningful fold-text for xml documents {{{
" Description: displays the first non-xml line along with the first line of
"              the fold.
function! DockBookFoldtextFunction(...)
	if a:0 > 0
		let start = a:1
	else
		let start = v:foldstart
	endif

	let foldtext = getline(start)
	let i = 0
	while 1
		if i > 5
			break
		endif
		if getline(start + i) =~ '>[^<> ]' || getline(start + i) =~ '^\s*[^<> ]'
			let g:err = g:err."\n".'getting something else = '.getline(start + i)
			let line = getline(start + i)
			let line = substitute(line, '<\/\?\a\+>', '', 'g')
			let line = substitute(line, '^\s*', '', '')
			let line = substitute(line, '^.\{50}\zs.*', '...', '')
			let foldtext = foldtext.' '.line
			break
		endif

		let i = i + 1
	endwhile

	return foldtext
endfunction " }}}
setlocal foldtext=DockBookFoldtextFunction()

" vim:fdm=marker
