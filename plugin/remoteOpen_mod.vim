" File: remoteOpen.vim
" Author: Srinath Avadhanula <srinath AT fastmail DOT fm>
" $Id: remoteOpen.vim 1080 2010-01-26 22:02:34Z tmaas $
"
" Description:
" Often times, an external program needs to open a file in gvim from the
" command line. However, it will not know if the file is already opened in a
" previous vim session. It is not sufficient to simply specify
"
" gvim --remote-silent <filename>
"
" because this simply opens up <filename> in the first remote gvim session it
" sees. This script provides a command RemoteOpen which is meant to be used
" from the command line as follows:
"
" gvim -c ":RemoteOpen +<lnum> <filename>"
"
" where <lnum> is the line-number you wish <filename> to open to.  What will
" happen is that a new gvim will start up and enquire from all previous
" sessions if <filename> is already open in any of them. If it is, then it
" will edit the file in that session and bring it to the foreground and itself
" quit. Otherwise, it will not quit and instead open up the file for editing
" at <lnum>.
"
" This was mainly created to be used with Yap (the dvi previewer in miktex),
" so you can specify the program for "inverse search" as specified above.
" This ensures that the inverse search uses the correct gvim each time.
"
" Ofcourse, this requires vim with +clientserver. If not, then RemoteOpen just
" opens in the present session.

" Enclose <args> in single quotes so it can be passed as a function argument.
com! -nargs=1 RemoteOpenMod :call RemoteOpenMod('<args>', 0, 0)
com! -nargs=1 RemoteOpenModN :call RemoteOpenMod('<args>', 1, 0)
com! -nargs=1 RemoteOpenModS :call RemoteOpenMod('<args>', 0, 1)
com! -nargs=1 RemoteOpenModT :call RemoteOpenMod('<args>', 0, 2)

" RemoteOpen: open a file remotely (if possible) {{{
" Description: checks all open vim windows to see if this file has been opened
"              anywhere and if so, opens it there instead of in this session.

"function! GetRemoteSession(arglist)
	"" check each file in the argument list is open in one remote vim session
	"" and use that session to open the other files there
"endfunction

function! RemoteOpenMod(arglist, new_window, split_mode)

	" First construct line number and filename from argument. a:arglist is of
	" the form:
	"    +10 c:\path\to\file
	" or just
	" 	 c:\path\to\file
	"
	" new_window means if the file has not been found in other running
	" windows, make it on it's own window
	"
	" split_mode: 0: current window 1: split 2: tab

	if a:arglist =~ '^\s*+\d\+'
		let linenum = matchstr(a:arglist, '^\s*+\zs\d\+\ze')
		let filename = matchstr(a:arglist, '^\s*+\d\+\s*\zs.*\ze')
	else
		let linenum = -1
		let filename = matchstr(a:arglist, '^\s*\zs.*\ze')
	endif
	let filename = escape(filename, ' ')

	" If there is no clientserver functionality, then just open in the present
	" session and return
	if !has('clientserver')
		exec "e ".filename
		if linenum >= 0
			exec linenum
		endif
		normal! zv
		return
	endif

	" Otherwise, loop through all available servers
	let servers = serverlist()
	" If there are no servers, open file locally.
	if servers == ''
		exec "e ".filename
		if linenum >= 0
			exec linenum
		endif
		normal! zv
		return
	endif

	let i = 1
	let server = s:Strntok(servers, "\n", i)
	let targetServer = v:servername
	let defaultServer = ''

	while server != ''

		if defaultServer == '' && server != v:servername
			let defaultServer = server
		endif

		" Ask each server if that file is being edited by them.
		let bufnum = remote_expr(server, "bufnr('".filename."')")
		" If it is...
		if bufnum != -1
			" ask the server to edit that file and come to the foreground.
			" session has at least one file opened via RemoteOpen
			let targetServer = server
			break
		end

		let i = i + 1
		let server = s:Strntok(servers, "\n", i)
	endwhile

	" If none of the servers have the file open, then open this file in the
	" first server. This has the advantage if yap tries to make vim open
	" multiple vims, then at least they will all be opened by the same gvim
	" server.

	let lineNumCmd =  ":" . linenum
	if linenum <= 0
		let lineNumCmd = ""
	endif

	if targetServer == v:servername && defaultServer != targetServer && defaultServer != '' && a:new_window == 0
		let targetServer = defaultServer
	endif

    let open_cmd = (a:split_mode == 0) ?
				\ ":drop " :
				\ (a:split_mode == 1) ?
				\ ":split " :
				\ ":tab split "

	call remote_send(targetServer,
		\ "\<C-\>\<C-n>".
		\ open_cmd . filename."\<CR>".
		\ lineNumCmd .
		\ "\<CR>zv"
		\ )

	call remote_foreground(targetServer)
	" quit this vim session
	if v:servername != targetServer
		silent quit!
	endif
endfunction " }}}

" Strntok: extract the n^th token from a list {{{
" example: Strntok('1,23,3', ',', 2) = 23
fun! <SID>Strntok(s, tok, n)
	return matchstr( a:s.a:tok[0], '\v(\zs([^'.a:tok.']*)\ze['.a:tok.']){'.a:n.'}')
endfun

" }}}

" vim:ft=vim:ts=4:sw=4:noet:fdm=marker:commentstring=\"\ %s:nowrap
