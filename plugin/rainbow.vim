"==========================================================
"Title: rainbow parentheses improved
"Version: 2.2
"Author: luochen1990
"Last Edited: 2012 Sep 3
"Vim Version: 7.3.46
"Simple Configuration:
"First, put "rainbow.vim" to dir vim73/plugin or vimfiles/plugin
"Second, add the follow sentence to your .vimrc or _vimrc :
"		au syntax * cal rainbow#activate()
"Third, restart your vim and enjoy coding.
"Advanced Configuration:
"* use rainbow#load(...) to load your setting:
"		a:1 means the kinds of parentheses to match
"			e.g. au syntax * cal rainbow#load([['(',')'],['\[','\]'],['{','}'],['begin','end']])
"* you can also change the colors by editting the value of s:guifgs or s:ctermfgs.
"* use command :RainbowToggle to toggle this plugin.


let s:guifgs = [ 
			\ 'DarkOrchid3', 'RoyalBlue3', 'SeaGreen3',
			\ 'orange', 'firebrick3', 
			\ ]

let s:ctermfgs = [
      \ 'darkgray', 'brown', 'Darkblue', 'darkgreen',
      \ 'darkmagenta', 'darkcyan', 'darkred', 'brown',
      \ 'darkmagenta', 'gray', 'black', 'Darkblue',
      \ 'darkred', 'darkgreen', 'darkcyan', 'red',
      \	]

let s:max = has('gui_running')? len(s:guifgs) : len(s:ctermfgs)

func rainbow#load(...)
	if exists('s:loaded')
		cal rainbow#clear()
	endif
	let s:loaded = (a:0 < 1) ? [['(',')'],['\[','\]'],['{','}']] : a:1
	let cmd = 'syn region %s matchgroup=%s start=/%s/ end=/%s/ containedin=%s contains=%s'
	let str = 'TOP'
	for each in range(1, s:max)
		let str .= ',lv'.each
	endfor
	for [left , right] in s:loaded
		for each in range(1, s:max - 1)
			exe printf(cmd, 'lv'.each, 'lv'.each.'c', left, right, 'lv'.(each+1) , str)
		endfor
		exe printf(cmd, 'lv'.s:max, 'lv'.s:max.'c', left, right, 'lv1' , str)
	endfor
	if (match(a:000 , 'later') == -1)
		cal rainbow#activate()
	endif
endfunc

func rainbow#clear()
	unlet s:loaded
	for each in range(1 , s:max)
		exe 'syn clear lv'.each
	endfor
endfunc

func rainbow#activate()
	if !exists('s:loaded')
		cal rainbow#load()
	endif
	for id in range(1 , s:max)
		let ctermfg = s:ctermfgs[(s:max - id) % len(s:ctermfgs)]
		let guifg = s:guifgs[(s:max - id) % len(s:guifgs)]
		exe 'hi default lv'.id.'c ctermfg='.ctermfg.' guifg='.guifg
	endfor
	let s:active = 'active'
endfunc

func rainbow#inactivate()
	if exists('s:active')
		for each in range(1, s:max)
			exe 'hi clear lv'.each.'c'
		endfor
		unlet s:active
	endif
endfunc

func rainbow#toggle()
	if exists('s:active')
		cal rainbow#inactivate()
	else
		cal rainbow#activate()
	endif
endfunc

command! RainbowToggle cal rainbow#toggle()
" vim:ts=2:sw=2:sts=2
