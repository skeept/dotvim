source <sfile>:h:h:h/Matches.vim
let Powerline#Themes#parts#aurum#part=[
	\Pl#Theme#Buffer('ft_aurumstatus'
			\ , ['static_str.name', 'Status']
			\ , Pl#Segment#Truncate()
			\ , 'aurum:repository'
			\ , Pl#Segment#Split()
			\ , 'aurum:options'
	\),
	\
	\Pl#Theme#Buffer('ft_aurumannotate'
			\ , ['static_str.name', 'Ann']
			\ , Pl#Segment#Truncate()
			\ , Pl#Segment#Split()
			\ , 'aurum:options'
	\),
	\
	\Pl#Theme#Buffer('ft_aurumlog'
			\ , ['static_str.name', 'Log']
			\ , 'aurum:progress'
			\ , Pl#Segment#Truncate()
			\ , 'aurum:repository'
			\ , Pl#Segment#Split()
			\ , 'aurum:options'
			\ , 'scrollpercent'
	\),
	\
	\Pl#Theme#Buffer('ft_aurumcommit'
			\ , ['static_str.name', 'Commit']
			\ , 'paste_indicator'
			\ , 'mode_indicator'
			\ , 'aurum:branch'
			\ , Pl#Segment#Truncate()
			\ , 'aurum:repository'
			\ , Pl#Segment#Split()
			\ , 'aurum:options'
	\),
\]
" vim: ft=vim ts=4 sts=4 sw=4 noet
