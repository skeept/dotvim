" AutoAlign.vim: a ftplugin for C
" Author:	Charles E. Campbell  <NdrOchip@ScampbellPfamily.AbizM>-NOSPAM
" Date:		Nov 25, 2013
" Version:	14
" GetLatestVimScripts: 884  1 :AutoInstall: AutoAlign.vim
" GetLatestVimScripts: 294  1 :AutoInstall: Align.vim
" GetLatestVimScripts: 1066 1 :AutoInstall: cecutil.vim
" ---------------------------------------------------------------------
"  Load Once: {{{1
if exists("b:didautoalign")
 finish
endif
let b:loaded_autoalign = "v14"
let s:keepcpo          = &cpo
set cpo&vim

" ---------------------------------------------------------------------
" Debugging Support:
"if !exists("g:loaded_Decho") | runtime plugin/Decho.vim | endif
"DechoTabOn

" ---------------------------------------------------------------------
"  Support Plugin Loading: {{{1
" insure that cecutil's SaveWinPosn/RestoreWinPosn has been loaded
if !exists("*SaveWinPosn")
 silent! runtime plugin/cecutil.vim
endif

" ---------------------------------------------------------------------
" Public Interface: AA toggles AutoAlign {{{1
com! -nargs=0 AA				let b:autoalign= exists("b:autoalign")? !b:autoalign : 0|echo "AutoAlign is ".(b:autoalign? "on" : "off")
com! -count -nargs=0 AAstart	call s:AutoAlignStartline(<count>)

" ---------------------------------------------------------------------
"  AutoAlign: decides when to use Align/AlignMap {{{1
"    |i| : use b:autoalign_reqdpat{|i|} (ie. the i'th required pattern)
"          and b:autoalign_notpat{|i|}  (ie. the i'th not-pattern)
"    i<0 : trigger character has been encountered, but don't AutoAlign
"          if the reqdpat isn't present
fun! AutoAlign(i)
"  call Dfunc("AutoAlign(i=".a:i.") virtcol=".virtcol("."))
  call s:SaveUserSettings()

"  call Decho("(AutoAlign) line#".line(".")."<".getline(".").">")

  " AutoAlign uses b:autoalign_reqdpat{|i|} and b:autoalign_notpat{|i|}
  "           -or- b:autoalign_start{|i|}   and b:autoalign_stop{|i|}
  " A negative a:i means that a trigger character has been encountered,
  " but not to AutoAlign if the reqdpat isn't present.
  let i= (a:i < 0)? -a:i : a:i
"  call Decho("i=".i.": trigger character encountered".((i < 0)? ", but don't AutoAlign if reqdpat not present" : ""))
"  call Decho("(AutoAlign) b:autoalign_reqdpat".i."<".(exists("b:autoalign_reqdpat".i)? b:autoalign_reqdpat{i} : "n/a").">")
"  call Decho("(AutoAlign) b:autoalign_notpat".i." <".(exists("b:autoalign_notpat".i)?  b:autoalign_notpat{i}  : "n/a").">")
"  call Decho("(AutoAlign) b:autoalign_start".i."  <".(exists("b:autoalign_start".i)?   b:autoalign_start{i}   : "n/a").">")
"  call Decho("(AutoAlign) b:autoalign_stop".i."   <".(exists("b:autoalign_stop".i)?    b:autoalign_stop{i}    : "n/a").">")

  if exists("b:autoalign".i) && b:autoalign{i} == 0
"   call Decho("(AutoAlign) line#".line(".")."<".getline(".").">")
   call s:RestoreUserSettings()
"   call Dret("AutoAlign : case b:autoalign".i."==0")
   return ""
  endif

  " sanity check: must have a reqdpat
  if !exists("b:autoalign_start{i}")
"   call Decho("b:autoalign_start".i." doesn't exist")
   if !exists("b:autoalign_reqdpat{i}")
"	call Decho("and b:autoalign_reqdpat".i." doesn't exist!")
"    call Decho("(AutoAlign) line#".line(".")."<".getline(".").">")
    call s:RestoreUserSettings()
"	call Dret("AutoAlign -: neither b:autoalign_start".i." nor b:autoalign_reqdpat".i." exist")
    return ""
   else
"	call Decho("b:autoalign_reqdpat".i."<".b:autoalign_reqdpat{i}."> exists")
"    call Decho("match(<".getline(".").">,reqdpat".i."<".b:autoalign_reqdpat{i}.">)=".match(getline("."),b:autoalign_reqdpat{i}))
   endif
  else
"   call Decho("has b:autoalign_start".i."=".b:autoalign_start{i})
"   call Decho("has b:autoalign_stop".i." =".b:autoalign_stop{i})
  endif

  " set up some options for AutoAlign
  let lzkeep= &lz
  let vekeep= &ve
  set lz ve=all

  let linebased = exists("b:autoalign_start{i}") && exists("b:autoalign_stop{i}") && b:autoalign_start{i} <= line(".") && line(".") <= b:autoalign_stop{i}
  let patbased  = exists("b:autoalign_reqdpat{i}") && match(getline("."),b:autoalign_reqdpat{i}) >= 0
"  call Decho("for linebased: b:autoalign_start".i.(exists("b:autoalign_start{i}")?     "=".b:autoalign_start{i}   : " does not exist"))
"  call Decho("for linebased: b:autoalign_stop".i." ".(exists("b:autoalign_stop{i}")?   "=".b:autoalign_stop{i}    : " does not exist"))
"  call Decho("for patbased : b:autoalign_reqdpat".i.(exists("b:autoalign_reqdpat{i}")? "=".b:autoalign_reqdpat{i} : " does not exist"))
"  call Decho("for patbased : b:autoalign_notpat".i.(exists("b:autoalign_notpat{i}")?   "=".b:autoalign_notpat{i}  : " does not exist"))
"  call Decho("linebased=".linebased." patbased=".patbased)
  if linebased || patbased
"   call Decho("handling using ".(linebased? "linebased" : "patbased"))
   let curline   = line(".")
   if linebased
    let nopatline= b:autoalign_start{i} - 1
   elseif v:version >= 700
    let nopatline = search(b:autoalign_notpat{i},'bWn')
   else
    let curposn   = SaveWinPosn(0)
	let nopatline = search(b:autoalign_notpat{i},'bW')
    call RestoreWinPosn(curposn)
   endif

"   call Decho("nopatline=".nopatline)
"   call Decho("b:autoalign".i." (".(exists("b:autoalign{i}")? "exists (=".b:autoalign{i}.")" : "doesn't exist").")")
"   call Decho("line('a)=".line("'a")." b:autoalign".i."=".(exists("b:autoalign{i}")? b:autoalign{i} : -1)." curline=".curline." nopatline=".nopatline)

   if linebased
"	call Decho("case autoalign linebased : b:autoalign_cmd{".i."}<".b:autoalign_cmd{i}.">")
    let curposn   = SaveWinPosn(0)
    exe b:autoalign_cmd{i}
    call RestoreWinPosn(curposn)

   elseif exists("b:autoalign{i}") && line("'a") == b:autoalign{i} && b:autoalign{i} < curline && nopatline < line("'a")
"    call Decho("case autoalign multi : b:autoalign_cmd{".i."}<".b:autoalign_cmd{i}.">")
	let curline= line(".")
"	call Decho("(AutoAlign) exe ".b:autoalign_cmd{i}." ('a: ".line("'a")." curline#".line(".").")")
    exe b:autoalign_cmd{i}
"	call Decho("exe keepj ".curline."norm! $")
	exe "keepj ".curline."norm! $"

   else
"	call Decho("case autoalign start: ".
	  \ (!exists("b:autoalign{i}")?                                  "b:autoalign".i." doesn't exist"                              : "").
	  \ ((exists("b:autoalign{i}") && line("'a") != b:autoalign{i})? "line('a)=".line("'a").", b:autoalign=".b:autoalign{i}        : "").
	  \ ((exists("b:autoalign{i}") && b:autoalign{i} >= curline)?    "[b:autoalign".i."=".b:autoalign{i}."]≮[curline=".curline."]" : "").
	  \ ((nopatline >= line("'a"))?                                  "[nopatline=".nopatline."]≮[line('a)=".line("'a")."]"         : ""))
	let b:autoalign{i}= line(".")
    ka
   endif

  elseif exists("b:autoalign")
   " trigger character encountered but both linebased and patbased are false
"   call Decho("case trigger char encountered, but both linebased and patbased are false")
   if a:i > 0 && exists("b:autoalign{i}")
	unlet b:autoalign{i}
"	call Decho("b:autoalign".i." suspended")
   endif

  elseif exists("b:autoalign_suspend{i}")
   " trigger character encounted, but linebased and patbased are false,
   " and it takes more than one trigger
"   call Decho("case trigger char present, linebased=patbased=false, and it takes more than one trigger")
   if match(getline("."),b:autoalign_suspend{i}) >= 0
	if exists("b:autoalign{i}")
	 unlet b:autoalign{i}
	endif
"    call Decho("autoalign suspend: matches autoalign_suspend<".b:autoalign_suspend{i}.">")
   endif
"  else " Decho
"   call Decho("case b:autoalign_reqdpat{".i."} doesn't match, b:autoalign doesn't exist, b:autoalign_suspend{".i."} doesn't exist")
  endif
"  call Decho("b:autoalign (".(exists("b:autoalign{i}")? "exists=".b:autoalign{i} : "doesn't exist").")")

  " Handle AutoAlign funcrefs (if any)
  if exists("g:AutoAlign_funcref".i)
"   call Decho("(AutoAlign) handle optional Funcrefs; g;AutoAlign_funcref".i." exists")
   if type(g:AutoAlign_funcref{i}) == 2
"    call Decho("(AutoAlign) handling a g:AutoAlign_funcref")
	keepj call g:AutoAlign_funcref{i}()
   elseif type(g:AutoAlign_funcref{i}) == 3
"	call Decho("(AutoAlign) handling a list of g:AutoAlign_funcref".i."s")
	for Fncref in g:AutoAlign_funcref{i}
     if type(FncRef) == 2
      keepj call FncRef()
     endif
    endfor
   endif
  endif

  let lasttrig= b:autoalign_trigger{i}[strlen(b:autoalign_trigger{i})-1]
  let atkeep= @@
  norm! lvyh
  let nxtchar = strpart(@@,0,1)
  let @@      = atkeep
"  call Decho("virtcol=".virtcol(".")." virtcol($)=".virtcol("$"))
"  call Decho("col($) =".col("$")."     col(.)=".col("."))
"  call Decho("lasttrig<".lasttrig."> nxtchar<".nxtchar.">")
  if col("$") == col(".")
"   call Decho("case [col($)=".col("$")."]==[col(.)=".col('.')."]: use startinsert!")
   startinsert!
  elseif nxtchar == lasttrig
"   call Decho("case  [col($)=".col("$")."]!=[col(.)=".col('.')."] AND nxtchar<".nxtchar."> == lasttrig: use norm! f".lasttrig." then startinsert!")
   exe "norm! f".lasttrig
   startinsert!
  else
"   call Decho("case [col($)=".col("$")."]!=[col(.)=".col('.')."] AND nxtchar<".nxtchar.">!=lasttrig<".lasttrig.">: use norm! lF".lasttrig."l, then startinsert (resume)")
   exe "norm! lF".lasttrig."l"
   startinsert
  endif

"  call Decho("(AutoAlign) b:autoalign_reqdpat".i."<".(exists("b:autoalign_reqdpat".i)? b:autoalign_reqdpat{i} : "n/a").">")
"  call Decho("(AutoAlign) b:autoalign_notpat".i." <".(exists("b:autoalign_notpat".i)?  b:autoalign_notpat{i}  : "n/a").">")
"  call Decho("(AutoAlign) b:autoalign_start".i."  <".(exists("b:autoalign_start".i)?   b:autoalign_start{i}   : "n/a").">")
"  call Decho("(AutoAlign) b:autoalign_stop".i."   <".(exists("b:autoalign_stop".i)?    b:autoalign_stop{i}    : "n/a").">")
"  call Decho("(AutoAlign) line#".line(".")."<".getline(".").">")
  call s:RestoreUserSettings()

"  call Dret("AutoAlign : @.<".@..">")
  return ""
endfun

" ---------------------------------------------------------------------
" s:AutoAlignStartline: {{{2
fun! s:AutoAlignStartline(sl)
"  call Dfunc("s:AutoAlignStartline(sl=".a:sl.")")
  if a:sl == 0
   let b:autoalign= line(".")
   ka
  elseif a:sl > line("$")
   let b:autoalign= line("$")
   exe line("$")."ka"
  else
   let b:autoalign= a:sl
   exe a:sl."ka"
  endif
"  call Dret("s:AutoAlignStartline")
endfun

" ---------------------------------------------------------------------
" SaveUserSettings: {{{1
fun! s:SaveUserSettings()
"  call Dfunc("SaveUserSettings()")
  let b:autoalign_keep_cedit= &cedit
  let b:autoalign_keep_lz   = &l:lz
  let b:autoalign_keep_magic= &magic
  let b:autoalign_keep_remap= &l:remap
  let b:autoalign_keep_ve   = &l:ve
  setlocal magic lz ve=all remap cedit&
"  call Dret("SaveUserSettings")
endfun

" ---------------------------------------------------------------------
" RestoreUserSettings: {{{1
fun! s:RestoreUserSettings()
"  call Dfunc("RestoreUserSettings()")
  let &l:cedit = b:autoalign_keep_cedit|unlet b:autoalign_keep_cedit
  let &l:lz    = b:autoalign_keep_lz   |unlet b:autoalign_keep_lz
  let &l:remap = b:autoalign_keep_remap|unlet b:autoalign_keep_remap
  let &l:ve    = b:autoalign_keep_ve   |unlet b:autoalign_keep_ve
  let &magic   = b:autoalign_keep_magic|unlet b:autoalign_keep_magic
"  call Dret("RestoreUserSettings")
endfun

let &cpo= s:keepcpo
unlet s:keepcpo
" ---------------------------------------------------------------------
" vim: ts=4 fdm=marker
