if exists('s:loading')
	finish
endif
let s:loading=1
call extend(g:Powerline#Matches#matches, {
	\'ft_aurumstatus':   Pl#Match#Add('getwinvar(a:window, "&ft")', '^aurumstatus$'  ),
	\'ft_aurumannotate': Pl#Match#Add('getwinvar(a:window, "&ft")', '^aurumannotate$'),
	\'ft_aurumlog':      Pl#Match#Add('getwinvar(a:window, "&ft")', '^aurumlog$'     ),
	\'ft_aurumcommit':   Pl#Match#Add('getwinvar(a:window, "&ft")', '^aurumcommit$'  ),
	\'aurumdiff':        Pl#Match#Add('bufname(winbufnr(a:window))','^aurum://diff:' ),
	\'aurumfile':        Pl#Match#Add('bufname(winbufnr(a:window))','^aurum://file:' ),
\})
unlet s:loading
" vim: ft=vim ts=4 sts=4 sw=4 noet
