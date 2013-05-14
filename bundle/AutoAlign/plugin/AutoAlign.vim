" AutoAlign.vim: a ftplugin for C
" Author:	Charles E. Campbell, Jr.  <NdrOchip@ScampbellPfamily.AbizM>-NOSPAM
" Date:		Feb 11, 2011
" Version:	14i	ASTRO-ONLY
" GetLatestVimScripts: 884  1 :AutoInstall: AutoAlign.vim
" GetLatestVimScripts: 294  1 :AutoInstall: Align.vim
" GetLatestVimScripts: 1066 1 :AutoInstall: cecutil.vim
" ---------------------------------------------------------------------
"  Load Once: {{{1
if exists("b:didautoalign")
 finish
endif
let b:loaded_autoalign = "v14i"
let s:keepcpo          = &cpo
set cpo&vim

" ---------------------------------------------------------------------
" Debugging Support:
"if !exists("g:loaded_Decho") | runtime plugin/Decho.vim | endif
" DechoTabOn

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

  " AutoAlign uses b:autoalign_reqdpat{|i|} and b:autoalign_notpat{|i|}
  " A negative a:i means that a trigger character has been encountered,
  " but not to AutoAlign if the reqdpat isn't present.
  let i= (a:i < 0)? -a:i : a:i
  if exists("b:autoalign") && b:autoalign == 0
   call s:RestoreUserSettings()
"   call Dret("AutoAlign : case b:autoalign==0")
   return ""
  endif
"  call Decho("i=".i)

  " sanity check: must have a reqdpat
  if !exists("b:autoalign_reqdpat{i}")
   call s:RestoreUserSettings()
"   call Dret("AutoAlign : b:autoalign_reqdpat{".i."} doesn't exist")
   return ""
  endif
"  call Decho("has reqdpat".i."<".b:autoalign_reqdpat{i}.">")
"  call Decho("match(<".getline(".").">,reqdpat".i."<".b:autoalign_reqdpat{i}.">)=".match(getline("."),b:autoalign_reqdpat{i}).")")

  " set up some options for AutoAlign
  let lzkeep= &lz
  let vekeep= &ve
  set lz ve=all

  if match(getline("."),b:autoalign_reqdpat{i}) >= 0
"   call Decho("current line matches b:autoalign_reqdpat{".i."}<".b:autoalign_reqdpat{i}.">")
   let curline   = line(".")
   if v:version >= 700
    let curposn   = SaveWinPosn(0)
    let nopatline = search(b:autoalign_notpat{i},'bW')
    call RestoreWinPosn(curposn)
   else
    let nopatline = search(b:autoalign_notpat{i},'bWn')
   endif

"   call Decho("nopatline=".nopatline." (using autoalign_notpat<".b:autoalign_notpat{i}.">)")
"   call Decho("b:autoalign (".(exists("b:autoalign")? "exists" : "doesn't exist").")")
"   call Decho("line('a)=".line("'a")." b:autoalign=".(exists("b:autoalign")? b:autoalign : -1)." curline=".curline." nopatline=".nopatline)

   if exists("b:autoalign") && line("'a") == b:autoalign && b:autoalign < curline && nopatline < line("'a")
"    call Decho("autoalign multi : b:autoalign_cmd{".i."}<".b:autoalign_cmd{i}.">")
	" break undo sequence and start new change
	"    exe "norm! i\<c-g>u\<esc>"     " cec 08/10/07 -- not sure if this is needed anymore
	let curline= line(".")
    exe b:autoalign_cmd{i}
	exe "keepj ".curline."norm! $"
   else
    let b:autoalign= line(".")
    ka
"	call Decho("autoalign start")
   endif

  elseif exists("b:autoalign")
   " trigger character encountered, but reqdpat not present
"   call Decho("trigger char present, but doesn't match b:autoalign_reqdpat{".i."}<".b:autoalign_reqdpat{i}.">")
   if a:i > 0
    unlet b:autoalign
"    call Decho("autoalign suspend")
   endif

  elseif exists("b:autoalign_suspend{i}")
   " trigger character encounted, but reqdpat not present, but takes more than
   " one trigger
"   call Decho("trigger char present, doesn't match b:autoalign_reqdpat{".i."}<".b:autoalign_reqdpat{i}.">, takes more than one trigger")
   if match(getline("."),b:autoalign_suspend{i}) >= 0
	if exists("b:autoalign")
     unlet b:autoalign
	endif
"    call Decho("autoalign suspend: matches autoalign_suspend<".b:autoalign_suspend{i}.">")
   endif
"  else " Decho
"   call Decho("b:autoalign_reqdpat{".i."} doesn't match, b:autoalign doesn't exist, b:autoalign_suspend{".i."} doesn't exist")
  endif

"  call Decho("virtcol=".virtcol("."))
  let lasttrig= b:autoalign_trigger{i}[strlen(b:autoalign_trigger{i})-1]
  if col("$") == col(".")
   startinsert!
  else
"  call Decho("(resume) exe norm! lF".lasttrig."l")
   exe "norm! lF".lasttrig."l"
   startinsert
  endif
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
  let b:keep_lz   = &l:lz
  let b:keep_magic= &magic
  let b:keep_remap= &l:remap
  let b:keep_ve   = &l:ve
  setlocal magic lz ve=all remap
"  call Dret("SaveUserSettings")
endfun

" ---------------------------------------------------------------------
" RestoreUserSettings: {{{1
fun! s:RestoreUserSettings()
"  call Dfunc("RestoreUserSettings()")
  let &l:lz    = b:keep_lz
  let &magic   = b:keep_magic
  let &l:remap = b:keep_remap
  let &l:ve    = b:keep_ve
"  call Dret("RestoreUserSettings")
endfun

let &cpo= s:keepcpo
unlet s:keepcpo
" ---------------------------------------------------------------------
" vim: ts=4 fdm=marker
