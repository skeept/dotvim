" C Call-Tree Explorer (CCTree) <CCTree.vim>
"
"
" Script Info and Documentation 
"=============================================================================
"    Copyright: Copyright (C) August 2008 - 2011, Hari Rangarajan
"               Permission is hereby granted to use and distribute this code,
"               with or without modifications, provided that this copyright
"               notice is copied with it. Like anything else that's free,
"               cctree.vim is provided *as is* and comes with no
"               warranty of any kind, either expressed or implied. In no
"               event will the copyright holder be liable for any damamges
"               resulting from the use of this software.
"
" Name Of File: CCTree.vim
"  Description: C Call-Tree Explorer Vim Plugin
"   Maintainer: Hari Rangarajan <hari.rangarajan@gmail.com>
"          URL: http://vim.sourceforge.net/scripts/script.php?script_id=2368
"  Last Change: March 29, 2011
"      Version: 1.26 
"
"=============================================================================
" 
"  {{{ Description:
"       Plugin generates call-trees for any function or macro in real-time inside
"  Vim.
"  }}}
"  {{{ Requirements: 1) Vim 7.xx , 2) Cscope
"
"                Tested on Unix and the following Win32 versions:
"                + Cscope, mlcscope (WIN32)
"                       http://www.geocities.com/shankara_c/cscope.html
"                       http://www.bell-labs.com/project/wwexptools/packages.html
"
"                
"  }}}
"  {{{ Installation: 
"               Copy this file to ~/.vim/plugins/
"               or to /vimfiles/plugins/  (on Win32 platforms) 
" 
"               It might also be possible to load it as a filetype plugin
"               ~/.vim/ftplugin/c/
"
"               Need to set :filetype plugin on 
"           
"  }}}
"  {{{ Usage:
"           Build cscope database, for example:
"           > cscope -b -i cscope.files
"               [Tip: add -c option to build uncompressed databases for faster
"               load speeds]
"
"           Load database with command ":CCTreeLoadDB"
"           (Please note that it might take a while depending on the 
"           database size)
"
"           Append database with command ":CCTreeAppendDB"
"	    Allows multiple cscope files to be loaded and cross-referenced
"	    Illustration:
"	    :CCTreeAppendDB ./cscope.out
"	    :CCTreeAppendDB ./dir1/cscope.out
"	    :CCTreeAppendDB ./dir2/cscope.out
"
"           A database name, i.e., my_cscope.out, can be specified with 
"           the command. If not provided, a prompt will ask for the 
"           filename; default is cscope.out.
"
"           To show loaded databases, use command ":CCTreeShowLoadedDBs"
"
"           To unload all databases, use command ":CCTreeUnLoadDB"
"	    Note: There is no provision to unload databases individually
"
"           To save the current set of databases loaded in to memory onto disk
"           in native CCTree XRef format, use command ":CCTreeSaveXRefDB"
"
"           To load a saved native CCTree XRef format file, use 
"           command ":CCTreeLoadXRefDB"
"
"           Notes: No merging database support for CCTree native DB's [at present].
"
"
"	    To have multiple CCTree preview windows, use ":CCTreeWindowSaveCopy"
"	    Note: Once saved, only the depth of the preview window can be changed
"
"           Default Mappings:
"             Get reverse call tree for symbol  <C-\><
"             Get forward call tree for symbol  <C-\>>
"             Increase depth of tree and update <C-\>=
"             Decrease depth of tree and update <C-\>-
"
"             Open symbol in other window       <CR>
"             Preview symbol in other window    <Ctrl-P>
"
"	      Save copy of preview window       <C-\>y
"             Highlight current call-tree flow  <C-l>
"             Compress(Fold) call tree view     zs
"             (This is useful for viewing long
"              call trees which span across
"              multiple pages)
"
"           Custom user-mappings:
"           Users can custom-map the short-cut keys by 
"           overriding the following variables in their
"           Vim start-up configuration            
"
"            g:CCTreeKeyTraceForwardTree = '<C-\>>' 
"            g:CCTreeKeyTraceReverseTree = '<C-\><' 
"            g:CCTreeKeyHilightTree = '<C-l>'        " Static highlighting
"            g:CCTreeKeySaveWindow = '<C-\>y' 
"            g:CCTreeKeyToggleWindow = '<C-\>w' 
"            g:CCTreeKeyCompressTree = 'zs'     " Compress call-tree 
"            g:CCTreeKeyDepthPlus = '<C-\>=' 
"            g:CCTreeKeyDepthMinus = '<C-\>-'
"
"          Command List:
"             CCTreeLoadDB                <dbname>
"             CCTreeAppendDB              <dbname>
"             CCTreeLoadXRefDB            <dbname>
"             CCTreeSaveXRefDB            <dbname>
"
"             CCTreeUnLoadDB             
"	      CCTreeShowLoadedDBs
"
"             CCTreeTraceForward          <symbolname>
"             CCTreeTraceReverse          <symbolname>     
"             CCTreeRecurseDepthPlus     
"             CCTreeRecurseDepthMinus    
"	      CCTreeWindowSaveCopy
"
"          Only in preview window:
"             CCTreeWindowHiCallTree   (same as <C-l> shorcut)
"                   Highlight calling tree for keyword at cursor
"
"          Dynamic configuration:
"             CCTreeOptsEnable <option>    (<tab> for auto-complete)
"             CCTreeOptsDisable <option>   (<tab> for auto-complete)
"             CCTreeOptsToggle <option>   (<tab> for auto-complete)
"             Options:
"                   DynamicTreeHiLights: Control dynamic tree highlighting
"                   UseUnicodeSymbols: Use of UTF-8 special characters for
"                                      tree
"           
"                
"
"          Settings:
"               Customize behavior by changing the variable settings
"
"               UTF-8 usage:
"                   UTF-8 symbols should work fine on the majority of
"               X11 systems; however, some terminals might cause problems.
"
"               To use symbols for drawing the tree, this option can be enabled.
"                   g:CCTreeUseUTF8Symbols = 1 
"               The options interface (CCTreeOptsxxx) can be used to 
"               modify options on-the-fly.
"
"               Cscope database file, g:CCTreeCscopeDb = "cscope.out"
"               Maximum call levels,   g:CCTreeRecursiveDepth = 3
"               Maximum visible(unfolded) level, g:CCTreeMinVisibleDepth = 3
"               Orientation of window,  g:CCTreeOrientation = "topleft"
"                (standard vim options for split: [right|left][above|below])
"
"               Use Vertical window, g:CCTreeWindowVertical = 1
"                   Min width for window, g:CCTreeWindowMinWidth = 40
"                   g:CCTreeWindowWidth = -1, auto-select best width to fit
"
"               Horizontal window, g:CCTreeWindowHeight, default is -1
"
"
"               Display format, g:CCTreeDisplayMode, default 1
"
"               Values: 1 -- Ultra-compact (takes minimum screen width)
"                       2 -- Compact       (Takes little more space)
"                       3 -- Wide          (Takes copious amounts of space)
"
"               For vertical splits, 1 and 2 are good, while 3 is good for
"               horizontal displays
"   
"               NOTE: To get older behavior, add the following to your vimrc
"               let g:CCTreeDisplayMode = 3
"               let g:CCTreeWindowVertical = 0
"
"               Syntax Coloring:
"                    CCTreeSymbol is the symbol name
"                    CCTreeMarkers include  "|","+--->"
"
"                    CCTreeHiSymbol is the highlighted call tree functions
"                    CCTreeHiMarkers is the same as CCTreeMarkers except
"                           these denote the highlighted call-tree
"
"
"                    CCTreeHiXXXX allows dynamic highlighting of the call-tree.
"                    To observe the effect, move the cursor to the function to
"                    highlight the current call-tree. This option can be
"                    turned off using the setting, g:CCTreeHilightCallTree.
"                    For faster highlighting, the value of 'updatetime' can be
"                    changed.
"
"               Support for large database files:
"		 Vimscript does not have an API for reading files line-by-line. This
"		becomes a problem when parsing large databases. CCTree can overcome
"		the limitation using an external utility (i.e., GNU coreutils: split)
"		or VimScript's perl interpreter interface (:version must indicate +perl)
"
"		The following settings are tailored to suit GNU coreutils split; the default
"		settings should work with no changes on typical linux/unix distros 
"		(Monopoly OSes will require installation of unixutils or equivalent)
"
"		External command is setup with the following parameters:
"	        g:CCTreeSplitProgCmd = 'PROG_SPLIT SPLIT_OPT SPLIT_SIZE IN_FILE OUT_FILE_PREFIX'
"
"		Break-down of individual parameters:
"		The split utility is assumed to be on the path; otherwise, specify full path
"    			g:CCTreeSplitProg = 'split'
"
"		Option for splitting files (-C or -l)
"    			g:CCTreeSplitProgOption = '-C'
" 		If split program does not support -C, then this parameter must be set to 
" 		the number of lines in the split files
" 			g:CCTreeDbFileSplitLines = -1
"		Largest filesize Vimscript can handle; file sizes greater than this will
"		be temporarily split
"			g:CCTreeDbFileMaxSize  = 40000000 (40 Mbytes)
"
"		Sample system command:
"		Typical:
"			split -C 40000000 inputFile outputFilePrefix
"
"		 When g:CCTreeDbFileSplitLines is set to 10000 (-C options will be ignored)
"			split -l 10000 inputFile outputFilePrefix
"			
"
"		Using perl interface:
"			By default, perl usage is disabled. Set
"			g:CCTreeUsePerl = 1  to enable the perl interface.
"
"			Perl interface is typically faster than native Vimscript.
"			This option can be used independent of the file size
"	
"			For more info on setting up perl interface
"			:help perl-using or :help perl-dynamic
"
"               Writing large Xref Databases:
"                   CCTree can use external utilities to write extremely large files beyond
"               VimScripts capabilities. It requires the use of an external tool that can 
"               join text files (i.e., 'cat' in unix). This utility is triggered if the size
"               of the file being written exceeds g:CCTreeDbFileMaxSize (40 Mb or as configured)
"
"               The join utility command is configured by default as follows:
"               let CCTreeJoinProgCmd = 'PROG_JOIN JOIN_OPT IN_FILES > OUT_FILE'
"
"               let  g:CCTreeJoinProg = 'cat'           " PROG_JOIN
"               let  g:CCTreeJoinProgOpts = ""          " JOIN_OPT
"
"
"  }}}		
"  {{{ Limitations:
"           The accuracy of the call-tree will only be as good as the cscope 
"           database generation.
"           NOTE: Different flavors of Cscope have some known
"                 limitations due to the lexical analysis engine. This results
"                 in incorrectly identified function blocks, etc.
"  }}}
"  {{{ History:
"           Version 1.26: March 28, 2011
"                 1. Fix macro cross-referencing limitation
"                 2. Correct native xref file format
"           Version 1.21: March 21, 2011
"                 1. Support serialization of loaded 
"                           cscope databases (for faster loading)
"           Version 1.07: March 09, 2011
"                 1. Fix new keymaps incorrectly applied to buffer
"                 2. CCTreeOptsToggle command for toggling options
"
"           Version 1.04: March 06, 2011
"                 1. Customization for key mappings
"                 2. Dynamic configuration of UI variables
"                 3. Folding long call-trees to show current path dynamically
"
"           Version 1.01: March 04, 2011
"                 1. Make UTF-8 symbols for tree optional
"
"           Version 1.00: March 02, 2011
"                 1. Staging release for upcoming features
"                    - Complete refactoring of code to take 
"                           advantage of VimScript's OO features
"                 2. Faster decompression of symbols
"                 3. Display related changes
"                    - Use of unicode symbols for tree
"                 4. Bugfixes related to multi-database loading
"                          
"	    Version 0.90: February 18, 2011
"		  1. Support for large databases using external split utility or perl
"		     interface
"
"           Version 0.85: February 9, 2011
"                 1. Significant increase in database loading and decompression speeds
"
"           Version 0.80: February 4, 2011
"                 1. Reduce memory usage by removing unused xref symbols
"
"           Version 0.75: June 23, 2010
"           	  1. Support for saving CCTree preview window; multiple 
"			CCTree windows can now be open
"
"          Version 0.71: May 11, 2010
"           	  1. Fix script bug

"           Version 0.70: May 8, 2010
"           	  1. Functionality to load multiple cscope databases
"
"           Version 0.65: July 12, 2009
"           	  1. Toggle preview window
"
"           Version 0.61: December 24, 2008
"                 1. Fixed bug when processing include files
"                 2. Remove 'set ruler' option
"
"           Version 0.60: November 26, 2008
"                 1. Added support for source-file dependency tree
"
"           Version 0.50: October 17, 2008
"                 1. Optimizations for compact memory foot-print and 
"                    improved compressed-database load speeds
"
"           Version 0.41: October 6, 2008
"                  1. Minor fix: Compressed cscope databases will load
"                  incorrectly if encoding is not 8-bit
"
"           Version 0.4: September 28, 2008
"                  1. Rewrite of "tree-display" code
"                  2. New syntax hightlighting
"                  3. Dynamic highlighting for call-trees
"                  4. Support for new window modes (vertical, horizontal)  
"                  5. New display format option for compact or wide call-trees
"                  NOTE: defaults for tree-orientation set to vertical
"
"           Version 0.3:
"               September 21, 2008
"                 1. Support compressed cscope databases
"                 2. Display window related bugs fixed
"                 3. More intuitive display and folding capabilities
"               
"           Version 0.2:
"               September 12, 2008
"               (Patches from Yegappan Lakshmanan, thanks!)
"                 1. Support for using the plugin in Vi-compatible mode.
"                 2. Filtering out unwanted lines before processing the db.
"                 3. Command-line completion for the commands.
"                 4. Using the cscope db from any directory.
"
"           Version 0.1:
"                August 31,2008
"                 1. Cross-referencing support for only functions and macros
"                    Functions inside macro definitions will be incorrectly
"                    attributed to the top level calling function
"
"   }}}
"   {{{ Thanks:
"
"    Frank Chang                    (ver 1.0x -- testing/UI enhancement ideas/bug fixes)
"    Arun Chaganty/Timo Tiefel	    (Ver 0.60 -- bug report)
"    Michael Wookey                 (Ver 0.4 -- Testing/bug report/patches)
"    Yegappan Lakshmanan            (Ver 0.2 -- Patches)
"
"    The Vim Community, ofcourse :)
"=============================================================================
"    }}}

" {{{ Init
if !exists('loaded_cctree') && v:version >= 700
  " First time loading the cctree plugin
  let loaded_cctree = 1
else
  finish 
endif

" Line continuation used here
let s:cpo_save = &cpoptions
set cpoptions&vim

" Trick to get the current script ID
map <SID>xx <SID>xx
let s:sid = substitute(maparg('<SID>xx'), '<SNR>\(\d\+_\)xx$', '\1', '')
unmap <SID>xx
"}}}
" {{{ Global variables; Modify in .vimrc to modify default behavior
" {{{General
if !exists('CCTreeCscopeDb')
    let CCTreeCscopeDb = "cscope.out"
endif
" revisit
if !exists('CCTreeDb')
    let CCTreeDb = "cctree.out"
endif
if !exists('CCTreeRecursiveDepth')
    let CCTreeRecursiveDepth = 3
endif
if !exists('CCTreeMinVisibleDepth')
    let CCTreeMinVisibleDepth = 3
endif
" }}}
" {{{ Custom user-key mappings
if !exists('CCTreeKeyTraceForwardTree')
    let g:CCTreeKeyTraceForwardTree = '<C-\>>' 
endif
if !exists('CCTreeKeyTraceReverseTree')
    let g:CCTreeKeyTraceReverseTree = '<C-\><' 
endif
if !exists('CCTreeKeyHilightTree')
    let g:CCTreeKeyHilightTree = '<C-l>'        " Static highlighting
endif
if !exists('CCTreeKeySaveWindow ')
    let g:CCTreeKeySaveWindow = '<C-\>y' 
endif
if !exists('CCTreeKeyToggleWindow ')
    let g:CCTreeKeyToggleWindow = '<C-\>w' 
endif
if !exists('CCTreeKeyCompressTree ')
    let g:CCTreeKeyCompressTree = 'zs'     " Compress call-tree 
endif
if !exists('CCTreeKeyDepthPlus')
    let g:CCTreeKeyDepthPlus = '<C-\>='     
endif
if !exists('CCTreeKeyDepthMinus')
    let g:CCTreeKeyDepthMinus = '<C-\>-'    
endif
" }}}
" {{{ CCTree UI settings
if !exists('CCTreeOrientation')
    let CCTreeOrientation = "topleft"
endif
if !exists('CCTreeWindowVertical')
    let CCTreeWindowVertical = 1
endif
if !exists('CCTreeWindowWidth')
    " -1 is auto select best width
    let CCTreeWindowWidth = -1
endif
if !exists('CCTreeWindowMinWidth')
    let CCTreeWindowMinWidth = 25
endif
if !exists('CCTreeWindowHeight')
    let CCTreeWindowHeight = -1
endif
if !exists('CCTreeDisplayMode')
    let CCTreeDisplayMode = 1
endif
if !exists('CCTreeHilightCallTree')
    let CCTreeHilightCallTree = 1
endif
" }}}
" {{{ Split prog
if !exists('CCTreeSplitProgCmd')
    let CCTreeSplitProgCmd = 'PROG_SPLIT SPLIT_OPT SPLIT_SIZE IN_FILE OUT_FILE_PREFIX'
endif

if !exists('CCTreeSplitProg')
    "PROG_SPLIT
    let CCTreeSplitProg = 'split'
endif

if !exists('CCTreeSplitProgOption')
    "SPLIT_OPT
    let CCTreeSplitProgOption = '-C'
endif

if !exists('CCTreeDbFileSplitLines')
    " if SPLIT_OPT is -l 
    " If split program does not support -C, then this parameter must be set to 
    " the number of lines in the split files
    let CCTreeDbFileSplitLines = -1
endif

if !exists('CCTreeSplitProgCmd')
    let CCTreeSplitProgCmd = 'PROG_SPLIT SPLIT_OPT SPLIT_SIZE IN_FILE OUT_FILE_PREFIX'
endif

if !exists('CCTreeDbFileMaxSize')
    " if SPLIT_OPT is -C 
    let CCTreeDbFileMaxSize = 40000000 "40 Mbytes
endif

" }}}
" {{{ Join/Cat prog
if !exists('CCTreeJoinProgCmd')
    let CCTreeJoinProgCmd = 'PROG_JOIN JOIN_OPT IN_FILES > OUT_FILE'
endif

if !exists('CCTreeJoinProg')
    "PROG_JOIN
    let CCTreeJoinProg = 'cat'
endif

if !exists('CCTreeJoinProgOpts')
    let CCTreeJoinProgOpts = ""
endif
" }}}
" {{{ Misc (perl)
if !exists('CCTreeUsePerl')
    " Disabled by default
    let CCTreeUsePerl = 0
if 0	" Auto-detect perl interface (Experimental code)
    if has('perl)
perl << PERL_EOF
	VIM::DoCommand("let CCTreeUsePerl = 1");
PERL_EOF
    endif
endif
endif

if !exists('CCTreeUseUTF8Symbols')
    let CCTreeUseUTF8Symbols = 0
endif
" }}}
" }}}
" {{{ Plugin related local variables
let s:pluginname = 'CCTree'
let s:windowtitle = 'CCTree-View'
let s:windowsavetitle = 'CCTree-View-Copy'

let s:cscopeid = 'Cscope'
let s:cctreexref = 'CCTree XRef'

" }}}
" {{{ Turn on/off debugs
let s:tag_debug=0

" Use the Decho plugin for debugging
function! DBGecho(...)
    if s:tag_debug
        Decho(a:000)
    endif
endfunction

function! DBGredir(...)
    if s:tag_debug
        Decho(a:000)
    endif
endfunction

function! Pause()
    call input("sasasD", "asdads")
endfunction
" }}}
" {{{ Progress bar (generic, numeric, rolling)
let s:GenericProgressBar= {
                \ 'depth': 0,
                \ 'depthChar': '',
                \ 'currentChar': 0,
                \ 'updateTime': 0,
                \ 'rangeChars': [],
                \ 'formatStr' : '',
                \ 'units' : ''
                \ }

function! s:GenericProgressBar.mCreate(rangechars, depthchar, fmtStr) 
    let pbr = deepcopy(s:GenericProgressBar)
    unlet pbr.mCreate

    let pbr.rangeChars = a:rangechars
    let pbr.depthChar = a:depthchar
    let pbr.formatStr = a:fmtStr

    return pbr
endfunction

function! s:GenericProgressBar.mSetDepth(val) dict
    let self.depth = a:val
endfunction

function! s:GenericProgressBar.mUpdate() dict
    let staticchars = repeat(self.depthChar, self.depth)
    let displayStr = substitute(self.formatStr, "\@PROGRESS\@", 
                       \ staticchars . self.rangeChars[self.currentChar], "")
    call s:StatusLine.mSetExtraInfo(displayStr)
endfunction

function! s:GenericProgressBar.mDone()
        call s:StatusLine.mSetExtraInfo("")
endfunction

let s:ProgressBarRoll = {
                        \ 'updateTime' : 0,
                        \ 'curTime' : 0
                        \}

function! s:ProgressBarRoll.mCreate(rollchars, depthChar) dict
    let gpbr = s:GenericProgressBar.mCreate(a:rollchars, a:depthChar, "\@PROGRESS\@")
    let pbr = extend(gpbr, deepcopy(s:ProgressBarRoll))
    unlet pbr.mCreate
    
    let pbr.curTime = localtime()

    return pbr
endfunction

function! s:ProgressBarRoll.mTick(count) dict
    if (localtime() - self.curTime) > self.updateTime
        let self.currentChar += 1
        if self.currentChar == len(self.rangeChars)
            let self.currentChar = 0
        endif
        let self.curTime = localtime()
        call self.mUpdate()
    endif
endfunction

let s:ProgressBarNumeric = {
                \ 'progress1current' : 0,
                \ 'progressmax' : 0,
                \ 'progress1percent' : 0,
                \ 'progresspercent' : 0,
                \}

function! s:ProgressBarNumeric.mCreate(maxcount, unit) dict
        let gpbr = s:GenericProgressBar.mCreate(range(1,a:maxcount), '',
            \ "Processing \@PROGRESS\@\%, total ". a:maxcount . " " . a:unit) 
        let progressbar = extend(gpbr, deepcopy(s:ProgressBarNumeric))
        unlet progressbar.mCreate

        let progressbar.progressmax = a:maxcount
        let progressbar.progress1percent = a:maxcount/100

        let progressbar.units = a:unit

        return progressbar
endfunction


function! s:ProgressBarNumeric.mTick(count) dict
        let self.progress1current += a:count
        if self.progress1percent <= self.progress1current
            let tmp =  (self.progress1current/self.progress1percent)
            let self.progresspercent += tmp
            let self.progress1current -= tmp * self.progress1percent
            let self.currentChar += 1
            call self.mUpdate()
        endif
endfunction

" }}}
" {{{ Status line 
let s:StatusLine = {
                    \ 'symlastprogress' : 0,
                    \ 'symprogress' : 0,
                    \ 'cursym' : 0,
                    \ 'savedStatusLine' : '',
                    \ 'statusextra' : '',
                    \ 'local':0
                    \}

function! s:StatusLine.mInit() dict
    let self.savedStatusLine = &l:statusline
    setlocal statusline=%{CCTreeStatusLine()}
endfunction
        
function! s:StatusLine.mRestore() dict
    let self.currentstatus = ''
    let self.statusextra = ''

    let &l:statusline = s:StatusLine.savedStatusLine
    redrawstatus
endfunction

function! s:StatusLine.mSetInfo(msg) dict
    let s:StatusLine.currentstatus = a:msg
    redrawstatus
endfunction

function! s:StatusLine.mSetExtraInfo(msg) dict
    let s:StatusLine.statusextra = a:msg
    redrawstatus
endfunction

function! CCTreeStatusLine() 
    return   s:pluginname. " ". 
           \ s:StatusLine.currentstatus . " -- ". 
           \ s:StatusLine.statusextra
endfunction
"}}}
" {{{ Shell command interface

let s:ShellCmds = {}

function! s:ShellCmds.mSplit(inFile, outFile)
	let cmdEx = substitute(g:CCTreeSplitProgCmd, "PROG_SPLIT", g:CCTreeSplitProg,"")
	let cmdEx = substitute(cmdEx, "SPLIT_OPT", g:CCTreeSplitProgOption,"")
	if g:CCTreeDbFileSplitLines != -1
		let cmdEx = substitute(cmdEx, "SPLIT_SIZE", g:CCTreeDbFileSplitLines,"")
	else
		let cmdEx = substitute(cmdEx, "SPLIT_SIZE", g:CCTreeDbFileMaxSize,"")
	endif
	let cmdEx = substitute(cmdEx, "IN_FILE", a:inFile,"")
	let cmdEx = substitute(cmdEx, "OUT_FILE_PREFIX", a:outFile,"")

	return cmdEx
endfunction

function! s:ShellCmds.mJoin(inFileList, outFile)
	let cmdEx = substitute(g:CCTreeJoinProgCmd, "PROG_JOIN", g:CCTreeJoinProg,"")
	let cmdEx = substitute(cmdEx, "JOIN_OPT", g:CCTreeJoinProgOpts,"")
	let cmdEx = substitute(cmdEx, "IN_FILES", a:inFileList,"")
	let cmdEx = substitute(cmdEx, "OUT_FILE", a:outFile,"")

        return cmdEx
endfunction

function! s:ShellCmds.mExec(cmd)
    let cmdoutput = system(a:cmd)
    if cmdoutput != ''
         " Failed
         return s:CCTreeRC.Error
    endif
    return s:CCTreeRC.Success
endfunction

" }}}

" {{{ Virtual file interface
let s:vFile = {}

function! s:vFile.mCreate(fname, mode) 
    if a:mode == 'r'
        return s:vFileR.mCreate(a:fname)
    elseif a:mode == 'w'
        return s:vFileW.mCreate(a:fname)
    endif
    return -1
endfunction

let s:vFileW = {
	    \ 'splitfiles' : [],
	    \ 'totSplits' : 0,
	    \ 'lines' : [],
	    \ 'fileSize' : 0
            \}

function! s:vFileW.mCreate(fname)  dict
        let vfile =  deepcopy(s:vFileW)
        unlet vfile.mCreate
	let vfile.link = a:fname

        return vfile
endfunction

function! s:vFileW.mCreateSplit()  dict
    " first split, create name
    if self.totSplits == 0
        let self.tlink =  tempname()
    endif
    let fname = self.tlink .'_'. self.totSplits
    call writefile(self.lines, fname)
    call add(self.splitfiles, fname)
    let self.lines = []
    let self.totSplits += 1
endfunction

function! s:vFileW.mTestForSplit()  dict
    if self.fileSize > g:CCTreeDbFileMaxSize 
        call self.mCreateSplit()
    endif
endfunction

function! s:vFileW.mAddFileSize(size)  dict
    let self.fileSize += a:size
endfunction

function! s:vFileW.mWriteList(linelist)  dict
    call extend(self.lines, a:linelist)
    call self.mTestForSplit()
endfunction

function! s:vFileW.mWriteLine(line)  dict
    call add(self.lines, a:line)
    call self.mAddFileSize(len(a:line))
    call self.mTestForSplit()
endfunction

function! s:vFileW.mClose()  dict
    if self.totSplits == 0
        call writefile(self.lines, self.link)
    else
        " force remaining lines into a new split
        call self.mCreateSplit()
        " now join all of them
        let filelist = join(self.splitfiles, " ")
        let cmdEx = s:ShellCmds.mJoin(filelist, self.link)
        if s:ShellCmds.mExec(cmdEx) != s:CCTreeRC.Success
             call s:CCTreeUtils.mWarningMsg("Shell command: ".cmdEx. " failed!")
        endif
    endif
    for afile in self.splitfiles
       call delete(afile)
    endfor
    return 0
endfunction

let s:vFileR = {
	    \ 'splitfiles' : [],
	    \ 'currentSplitIdx' : 0,
	    \ 'totSplits' : 0,
	    \ 'lines' : [],
            \ 'valid' : 0,
            \ 'mode' : ""
            \}


function! s:vFileR.mIsLargeFile()  dict
	if (getfsize(self.link) > g:CCTreeDbFileMaxSize)
		return 1
	endif
	return 0
endfunction

function! s:vFileR.mCreate(fname)  dict
        let vfile =  deepcopy(s:vFileR)
        unlet vfile.mCreate
	let vfile.link = a:fname
        let vfile.valid = filereadable(a:fname)
	let vfile.size = getfsize(a:fname)

	return vfile
endfunction

function! s:vFileR.mOpen()  dict
        if self.mode == 'w'
            " no need to do anything
            return 0
        endif

	if self.mIsLargeFile() == 0
		"little trick to keep interface uniform when we don't split
		call add(self.splitfiles, self.link)
		let self.totSplits = 1
	else
		let tmpDb = tempname()
		let cmdEx = s:ShellCmds.mSplit(self.link, tmpDb)

                if s:ShellCmds.mExec(cmdEx) != s:CCTreeRC.Success
		     call s:CCTreeUtils.mWarningMsg("Shell command: ".cmdEx. " failed!")
		     return -1
		else
		     let self.splitfiles = split(expand(tmpDb."*"), "\n")
		endif
		if empty(self.splitfiles)
		     return -1
		endif
	endif
	let self.totSplits = len(self.splitfiles)
	return 0
endfunction



function! s:vFileR.mRead()  dict
	if (self.currentSplitIdx >= len(self.splitfiles))
		" out of bounds
		return -1
	endif
	let self.lines = readfile(self.splitfiles[self.currentSplitIdx])
	let self.currentSplitIdx += 1
	return 0
endfunction

function! s:vFileR.mReset()  dict
	let self.currentSplitIdx = 0
	let self.lines = []
endfunction


function! s:vFileR.mClose()  dict
	if self.totSplits == 1
	    return 
	endif
	for afile in self.splitfiles
           call delete(afile)
	endfor
endfunction
"}}}
" {{{Stop watch
let s:StopWatch = {
			\ 'text' : "(no reltime feature)",
		  	\}

function! s:StopWatch.mCreate()	dict
    let stopWatch = deepcopy(s:StopWatch)
    unlet stopWatch.mCreate

    call stopWatch.mReset()
    return stopWatch
endfunction

function! s:StopWatch.mReset()	dict
    if has('reltime') 
        let self.startRTime = reltime()
    else
        let self.startRTime = localtime()
    endif
endfunction

function! s:StopWatch.mSnapElapsed()  dict
    if has('reltime')
	let self.text = reltimestr(reltime(self.startRTime))
    else
        let self.text = localtime() - self.startRTime
    endif
endfunction

function! s:StopWatch.mGetText()   dict
	return self.text
endfunction
"}}}
" {{{ Digraph character compression/decompression routines

let s:CharMaps = {
                    \'savedEncoding' : ''
                    \}

" The encoding needs to be changed to 8-bit, otherwise we can't swap special 
" 8-bit characters; restore after done
function! s:CharMaps.mInitTranslator() dict
    	let self.savedEncoding = &encoding
	let &encoding="latin1"
endfunction

function! s:CharMaps.mDoneTranslator() dict
        let &encoding=self.savedEncoding
endfunction

function! s:CharMaps.CrossProduct(seq1, seq2) dict
    let cpSeq = []
    for dc1 in range(strlen(a:seq1))
        for dc2 in range(strlen(a:seq2))
           call add(cpSeq, a:seq1[dc1].a:seq2[dc2])
        endfor
    endfor
    return cpSeq
endfunction

let s:TranslateMap = {}

function! s:TranslateMap.mCreate (srcsym, destsym, regex) dict
    let dicttable = extend(deepcopy(s:CharMaps), deepcopy(s:TranslateMap))
    unlet dicttable.CrossProduct

    let dicttable.mappings = {}
    
    " map lower
    let maxsym = min([len(a:srcsym),len (a:destsym)])
    
    let index = 0
    while (index < maxsym) 
	let dicttable.mappings[a:srcsym[index]] =  a:destsym[index]
	let index += 1
    endwhile
    " Need mapping lens, we assume it's constant across the board
    let dicttable.mapsrclen = len(a:srcsym[0])
    let dicttable.regex = a:regex

    return dicttable
endfunction


function! s:TranslateMap.mTranslate (value) dict
    let index = 0
    let retval = ""

    while index < strlen(a:value)
	let dichar = strpart(a:value, index, self.mapsrclen)
	if !empty(dichar) && has_key(self.mappings, dichar)
		let newmap = self.mappings[dichar]
                let index += strlen(dichar)-1
        else 
                " take only the first character
		let newmap = dichar[0]
	endif
        let retval .= newmap
	let index += 1
    endwhile
    return retval
endfunction

function! s:TranslateMap.mTranslateFast(value) dict
    let retval = substitute(a:value, self.regex, '\=self.mappings[submatch(1)]', "g")
    return retval
endfunction

function! s:CCTreeGetXRefDbMaps(maptype)
	let dichar1 = ",0123456789"	
	let dichar2 = ",0123456789"
        
        return s:CCTreeCreateGenericMaps(a:maptype, dichar1, dichar2)
endfunction

function! s:CCTreeGetCscopeMaps(maptype)
	let dichar1 = " teisaprnl(of)=c"	
	let dichar2 = " tnerpla"

        return s:CCTreeCreateGenericMaps(a:maptype, dichar1, dichar2)
endfunction

function! s:CCTreeCreateGenericMaps(maptype, dichar1, dichar2)
        call s:CharMaps.mInitTranslator()
        let ab = map(range(128,255), 'nr2char(v:val)')
        let ac =  s:CharMaps.CrossProduct(a:dichar1, a:dichar2) 
	if a:maptype == 'Compress'
		let maps = s:TranslateMap.mCreate(ac, ab, 
                                \'\(['.a:dichar1.']['.a:dichar2.']\)')
	elseif a:maptype == 'Uncompress'
		let maps = s:TranslateMap.mCreate(ab, ac,
                                \'\([\d128-\d255]\)')
	endif
        call s:CharMaps.mDoneTranslator()
        return maps
endfunction
" }}}
" {{{ Unique list filter object

let s:UniqList = {}

function! s:UniqList.mFilterEntries(lstval) dict
        let valdict = {}
        for aval in a:lstval
            let valdict[aval] = ''
        endfor
        return join(keys(valdict),",")
endfunction

let s:CCTreeUniqListFilter = deepcopy(s:UniqList)
function! s:CCTreeMakeCommaListUnique(clist)
	let entries = split(a:clist, ",")
        if len(entries) > 0
            return s:CCTreeUniqListFilter.mFilterEntries(entries)
        endif
        return ""
endfunction
" }}}
" {{{ Buffer/Window
func! s:FindOpenBuffer(filename)
    let bnrHigh = bufnr("$")
    "tabpagebuflist(tabpagenr())

    for bufnrs in range(1, bnrHigh)
        if (bufexists(bufnrs) == 1 && bufname(bufnrs) == a:filename && bufloaded(bufnrs) != 0 )
            return bufnrs
        endif
    endfor
    " Could not find the buffer
    return 0
endfunction

func! s:FindOpenWindow(filename)
    let bufnr = s:FindOpenBuffer(a:filename)
    if (bufnr > 0)
       let newWinnr = bufwinnr(bufnr)
       if newWinnr != -1 
	       exec newWinnr.'wincmd w'
	       return 1
       endif 
    endif
    " Could not find the buffer
    return 0
endfunction
" }}}
" {{{ Utils library

let s:Utils = {}

" Use this function to determine the correct "g" flag
" for substitution
function! s:Utils.mGetSearchFlag(gvalue)
    let ret = (!a:gvalue)* (&gdefault) + (!&gdefault)*(a:gvalue)
    if ret == 1
        return 'g'
    endif
    return ''
endfunc
        
" Strlen works for multibyte characters
function! s:Utils.mStrlenEx(val)
    return strlen(substitute(a:val, ".", "x", "g"))
endfunc
" }}}
" {{{ Generic db loader interface
let s:GenericDbLdr = {
        \ 'fDBName' : '',
        \ 'class' : 'Generic',
        \ }

function! s:GenericDbLdr.mCreate(fname) dict
    let gdb = deepcopy(s:GenericDbLdr)
    unlet gdb.mCreate
    let gdb.fDBName = a:fname
    
    if !filereadable(a:fname) 
        return s:CCTreeRC.Error
    endif

    return gdb
endfunction

if has('perl') && g:CCTreeUsePerl == 1
" Perl function
function! s:GenericDbLdr.mLoadFileIntoXRefDb(xRefDb, gRdr)  dict
    call a:gRdr.mProcessingStateInit()
    call s:StatusLine.mSetInfo('(PERL) Loading database')
    echomsg a:gRdr.perl_opts
    let pBar = s:ProgressBarNumeric.mCreate(getfsize(self.fDBName), "bytes")
perl << PERL_EOF
    #use strict;
    #use warnings FATAL => 'all';
    #use warnings NONFATAL => 'redefine';

    my $filebytes = 0;
    my $filterpat = VIM::Eval("a:gRdr.perl_opts");

    open (CSCOPEDB, VIM::Eval("self.fDBName")) or die "File trouble!";
    VIM::DoCommand("echomsg '".$filterpat."'");

    while (<CSCOPEDB>) {
	$filebytes += length($_);
        chomp($_);

        if ($_ !~ $filterpat) {
                next;	
        }
        VIM::DoCommand("call pBar.mTick(".$filebytes.")");
        $filebytes = 0;
        VIM::DoCommand("call a:gRdr.mProcessSymbol(a:xRefDb, '".$_."')");
    }
    VIM::DoCommand("call pBar.mDone()");
    close(CSCOPEDB);
PERL_EOF
    call a:gRdr.mProcessingStateDone()
endfunction
else
" Native Vim function
function! s:GenericDbLdr.mLoadFileIntoXRefDb(xRefDb, gRdr) dict
	let vDbFile = s:vFile.mCreate(self.fDBName, "r")
        if vDbFile.valid == 0
            return -1
        endif
	if vDbFile.mIsLargeFile() == 1
		call s:StatusLine.mSetExtraInfo('Database '
			\.' >'.g:CCTreeDbFileMaxSize .' bytes. Splitting '.
			\'into smaller chunks... (this may take some time)')
	endif
	try
		if vDbFile.mOpen() == 0
			call self.mReadFileIntoXRefDb(vDbFile,
                                                \ a:xRefDb,
                                                \ a:gRdr)
		endif
	finally
		call vDbFile.mClose()
	endtry
endfunction
endif

function! s:GenericDbLdr.mReadFileIntoXRefDb(vDbFile, xrefdb, gRdr)
    call a:gRdr.mProcessingStateInit()
    while 1 == 1
	if a:vDbFile.mRead() == -1
	    break
	endif
	let idxstr = '('.a:vDbFile.currentSplitIdx.'/'.a:vDbFile.totSplits.') '
	call s:StatusLine.mSetInfo('Reading database chunk '.idxstr)
	" Filter-out lines that doesn't have relevant information
	let plist = a:gRdr.mReadLinesFromFile(a:vDbFile, a:gRdr.opts)
	let pBar = s:ProgressBarNumeric.mCreate(len(plist), "items")
	call s:StatusLine.mSetInfo('Analyzing database chunk '.idxstr)
	call self.mProcessListIntoXrefDb(plist, a:gRdr, a:xrefdb, pBar)
	call pBar.mDone()
        " clean-up memory
        call garbagecollect()
    endwhile
    call a:gRdr.mProcessingStateDone()
endfunction

function! s:GenericDbLdr.mProcessListIntoXrefDb(symbols, rdr, xrefdb, pbar)
    for a in a:symbols
        call a:pbar.mTick(1)
        call a:rdr.mProcessSymbol(a:xrefdb, a)
    endfor
endfunction
    
function! s:GenericDbLdr.mParseDbHeader(gRdr)
    let header = readfile(self.fDBName, "", a:gRdr.headerLines)
    return a:gRdr.mParseDbHeader(header)
endfunction
    
" }}}

" {{{ TagFile utils
let s:CCTreeTagDbRdr = {'class': 'CCTreeXrefDb',
                    \ 'headerLines' : 4,
                    \ 'compressed' : 0,
                    \ 'opts': ['v:val !~ "^[\!]"'],
                    \ 'perl_opts': "^[^\!]",
                    \ 'mapPreKeys': {'c':'','p':''},
                    \ 'mapPostKeys': {'c':'','p':''}
                    \ }

function! s:CCTreeTagDbRdr.mCreate(fname) dict
    let cctxdbrdr = deepcopy(s:CCTreeTagDbRdr)
    unlet cctxdbrdr.mCreate
    
    return cctxdbrdr
endfunction

function! s:CCTreeTagDbRdr.mRequirePreProcessing() dict
    return s:CCTreeRC.False
endfunction

function! s:CCTreeTagDbRdr.mRequirePostProcessing() dict
    return s:CCTreeRC.True 
endfunction

function! s:CCTreeTagDbRdr.mRequireCleanup() dict
    " Clean-up all symbols [never]
    return s:CCTreeRC.False
endfunction

function! s:CCTreeTagDbRdr.mGetPreProcessingMaps() dict
    return s:CCTreeGetXRefDbMaps('Compress')
endfunction

function! s:CCTreeTagDbRdr.mGetPostProcessingMaps() dict
    return s:CCTreeGetXRefDbMaps('Uncompress')
endfunction


function! s:CCTreeTagDbRdr.mParseDbHeader(hdr) dict
    " just check line 3 for sanity
    if a:hdr[2] =~ "CCTree"
        return s:CCTreeRC.Success
    endif
    return s:CCTreeRC.Error
endfunction

function! s:CCTreeTagDbRdr.mProcessingStateInit() dict
endfunction

function! s:CCTreeTagDbRdr.mProcessingStateDone() dict
endfunction

function! s:CCTreeTagDbRdr.mReadLinesFromFile(vdbFile, filtercmds) dict
    " Hard-coded assumptions here about format for performance
    if empty(get(a:vdbFile.lines, 0)) != 1 && a:vdbFile.lines[0][0] == "!"
    " filter out the first few lines starting with "!"
        call remove(a:vdbFile.lines, 0, self.headerLines-1)
    endif
    return a:vdbFile.lines
endfunction

function! s:CCTreeTagDbRdr.mProcessSymbol(xrefdb, aline) dict
    let cctreesym = self.mDecodeTagLine(a:aline)
    call a:xrefdb.mInsertSym(cctreesym.idx, cctreesym)
    " we really don't need idx any longer
    unlet cctreesym.idx
endfunction

function! s:CCTreeTagDbRdr.mDecodeTagLine(tagline) dict

	let items = split(a:tagline, "\t")
        let newsym = s:CCTreeSym.mCreate("")
        try 
            let [newsym.idx, newsym.n] = split(items[0], '#')
        catch
            echomsg "problem decoding ". a:tagline
        endtry

        "let newsym.idx = strpart(items[0], 0, idxBr)
        "let newsym.n =  items[0][ idxBr+1 : -2] "strpart(items[0], idxBr+1, strlen(items[0])-1)
        if empty(get(items, 3)) != 1
            let newsym.c = items[3][2:]
        endif
        if empty(get(items, 4)) != 1
            let newsym.p = items[4][2:]
        endif
        return newsym
endfunction

" }}}
" {{{ Generic Db Serializer
let s:GenericDbSerializer = {}

function! s:GenericDbSerializer.mCreate(xrefdb) dict
    let gDbSerializer = deepcopy(s:GenericDbSerializer)
    let gDbSerializer.xrefdb = a:xrefdb
    return gDbSerializer
endfunction

function! s:GenericDbSerializer.mWriteXRefDbToFile(fname, 
                                            \ gWriter) dict
    call s:StatusLine.mInit()
    try
        call s:StatusLine.mSetInfo('Writing XRefDb')
        let vDbFile = s:vFile.mCreate(a:fname, "w")
        call vDbFile.mWriteList(a:gWriter.mBuildHeader())
        call self.mWriteSymsToFile(vDbFile, a:gWriter)
    finally
        call vDbFile.mClose()
        call s:StatusLine.mRestore()
    endtry
endfunction

function! s:GenericDbSerializer.mWriteSymsToFile(dstVFile,
                                            \ gWriter) dict
    let pBar = s:ProgressBarNumeric.mCreate(self.xrefdb.mGetSymbolCount(),
                                                    \ "items")
    call a:gWriter.mInitWriting()
    " write syms
    for asymid in sort(self.xrefdb.mGetSymbolIds())
        let  acctreesym = self.xrefdb.mGetSymbolFromId(asymid)
	call a:dstVFile.mWriteLine(a:gWriter.mBuildTagLine(acctreesym, 
                        \ asymid))
        call pBar.mTick(1)
    endfor
    call pBar.mDone()
    call a:gWriter.mDoneWriting()
endfunction
" }}}
" {{{ CCTreeTagDb Writer
let s:CCTreeTagDbWriter = {}

function! s:CCTreeTagDbWriter.mCreate(tmaps) dict
    let dbwriter = deepcopy(s:CCTreeTagDbWriter)
    unlet dbwriter.mCreate

    let dbwriter.tmaps = a:tmaps
    return dbwriter
endfunction 

function! s:CCTreeTagDbWriter.mInitWriting() dict
    call self.tmaps.mInitTranslator()
endfunction 

function! s:CCTreeTagDbWriter.mDoneWriting() dict
    call self.tmaps.mDoneTranslator()
endfunction 

function! s:CCTreeTagDbWriter.mBuildHeader() dict
    let hdr = []
    call add(hdr, "!_TAG_FILE_FORMAT\t2	/extended format; --format=1 will not append ;\" to lines/")
    call add(hdr, "!_TAG_FILE_SORTED\t1	/0=unsorted, 1=sorted, 2=foldcase/")
    call add(hdr, "!_TAG_PROGRAM_NAME\t\tCCTree (Vim plugin)//")
    call add(hdr, "!_TAG_PROGRAM_URL\thttp://vim.sourceforge.net/scripts/script.php?script_id=2368\t/site/")
    return hdr
endfunction

function! s:CCTreeTagDbWriter.mBuildTagLine(sym, symid) dict
	let basetag = a:symid .'#'. a:sym.n."\t"."\t"."/^\$/".";\""
        let basetag .= "\tc:". self.tmaps.mTranslateFast(a:sym.c)
        let basetag .= "\tp:". self.tmaps.mTranslateFast(a:sym.p)

	return basetag
endfunction
" }}}
" {{{ CCTree constants
let s:CCTreeRC = {
                    \ 'Error' : -1,
                    \ 'True' : 1,
                    \ 'False' : 0,
                    \ 'Success' : 2
                    \ }
"}}}
" {{{ CCTree DB Obj
" Symbol definition

let s:CCTreeSym = {
                    \'n': "",
                    \'c': "",
                    \'p': ""
                    \}

function! s:CCTreeSym.mCreate(name)
    let sym = deepcopy(s:CCTreeSym)
    unlet sym.mCreate
    let sym.n = a:name
    return sym
endfunction


" }}}
" {{{ GenericXref, XrefDb
let s:GenericXRef = {}

function! s:GenericXRef.mCreate(filedb) dict
       let gxref = deepcopy(s:GenericXRef)
       return gxref
endfunction 

function! s:GenericXRef.mInitState() dict
endfunction 

function! s:GenericXRef.mRestoreState() dict
endfunction 
" {{{ XRef Database object
let s:xRefMemDb = {
	\ 'symuniqid': 0,
	\ 'symidhash' : {},
	\ 'symnamehash' : {}
        \}


function s:xRefMemDb.mCreate()   dict
	let dbObj = deepcopy(s:xRefMemDb)
        unlet dbObj.mCreate

	return dbObj
endfunction

function s:xRefMemDb.mClear()   dict
    let self.symidhash = {}
    let self.symnamehash = {}
    let self.symuniqid = 0
endfunction

function! s:xRefMemDb.mInsertSym(idx, cctreesym)  dict
    let self.symuniqid = max([self.symuniqid, a:idx])
    let self.symidhash[a:idx] = a:cctreesym
    let self.symnamehash[a:cctreesym.n] = a:idx
endfunction

function! s:xRefMemDb.mRemoveSymById(symidx)  dict
    call self.mRemoveSymByName(acctreesym.n)
    call remove(self.symidhash, a:symidx)
endfunction

function! s:xRefMemDb.mRemoveSymByName(symname)  dict
    call remove(self.symnamehash, a:symname)
endfunction

function! s:xRefMemDb.mAddSym(name)    dict
    if !has_key(self.symnamehash, a:name)
        let self.symnamehash[a:name] = self.symuniqid
        let self.symidhash[self.symuniqid] = s:CCTreeSym.mCreate(a:name)
        let self.symuniqid += 1
    endif
    return self.symnamehash[a:name]
endfunction

function! s:xRefMemDb.mMarkXRefSyms(funcentryidx, newfuncidx) dict
        let self.symidhash[a:funcentryidx]['c'] .= (",". a:newfuncidx)
        let self.symidhash[a:newfuncidx]['p'] .= (",". a:funcentryidx)
endfunction

function! s:xRefMemDb.mGetSymbolFromName(symname) dict
    return self.symidhash[self.symnamehash[a:symname]]
endfunction

function! s:xRefMemDb.mGetSymbolIdFromName(symname) dict
    return self.symnamehash[a:symname]
endfunction

function! s:xRefMemDb.mGetSymbolFromId(symid) dict
    return self.symidhash[a:symid]
endfunction

function! s:xRefMemDb.mGetSymbolIds() dict
    return keys(self.symidhash)
endfunction

function! s:xRefMemDb.mGetSymbolNames() dict
    return keys(self.symnamehash)
endfunction

function! s:xRefMemDb.mGetSymbolCount() dict
    return len(self.symnamehash)
endfunction

function! s:xRefMemDb.mTranslateSymbols(map, tkeys) dict
    call a:map.mInitTranslator()
    let pBar = s:ProgressBarNumeric.mCreate(len(self.symnamehash), "items")

    for asym in keys(self.symnamehash)
        let idx = self.symnamehash[asym]
	let val = self.symidhash[idx]
        if has_key(a:tkeys, 'n')
            let uncmpname = a:map.mTranslateFast(asym)
            if (asym != uncmpname)
                "Set up new entry
                let self.symnamehash[uncmpname] = idx
                " free the old entry
                call remove(self.symnamehash, asym)
                " Set uncompressed name
                let val.n = uncmpname
            endif
        endif
        if has_key(a:tkeys, 'p')
            let val.p = a:map.mTranslateFast(val.p)
        endif
        if has_key(a:tkeys, 'c')
            let val.c = a:map.mTranslateFast(val.c)
        endif
        call pBar.mTick(1)
    endfor
    call pBar.mDone()
    call a:map.mDoneTranslator()
endfunction

function! s:xRefMemDb.mCleanSymbols () dict
    let pBar = s:ProgressBarNumeric.mCreate(len(self.symnamehash), "items")
    for asym in keys(self.symnamehash)
        let idx = self.symnamehash[asym]
	let val = self.symidhash[idx]
	if empty(val.p) && empty(val.c)
	    call remove(self.symnamehash, asym)
	    call remove(self.symidhash, idx)
        else
            let val.p = s:CCTreeMakeCommaListUnique(val.p)
            let val.c = s:CCTreeMakeCommaListUnique(val.c)
        endif
        call pBar.mTick(1)
    endfor
    call pBar.mDone()
endfunction
"}}}
"}}} End of Xref
" {{{ Tracer
let s:CallTree = {
                    \ 'symbol' : ""
                    \ }
function! s:CallTree.mCreate(name) dict
    let ct = deepcopy(s:CallTree)
    unlet ct.mCreate

    let ct.symbol = a:name

    return ct
endfunction

function! s:CallTree.mAddChildLink(childTree) dict
    if !has_key(self, 'childlinks')
        let self.childlinks = []
    endif
    call add(self.childlinks, a:childTree)
endfunction

let s:XRefTracer = {
                    \}

function! s:XRefTracer.mCreate(xrefdb) dict
    let xreftracer = deepcopy(s:XRefTracer)
    let xreftracer.xrefdb = a:xrefdb

    return xreftracer
endfunction

function! s:XRefTracer.mInitTracing() dict
    call self.xrefdb.mInitState()
endfunction

function! s:XRefTracer.mDoneTracing() dict
    call self.xrefdb.mRestoreState()
endfunction

function! s:XRefTracer.mGetSymbolIdXRef(symid, direction) dict
    let acctreesym = self.xrefdb.mGetSymbolFromId(a:symid)
    let symidslist = split(acctreesym[a:direction], ",")

if 0
    try
        for asymid in symidslist
            let xrefs[self.xrefdb.mGetSymbolFromId(asymid)['n']] = 1
        endfor
    catch
        echomsg 'Failed lookup for '.a:symname. ' key: '.asymid
    endtry
endif
    return symidslist
endfunction

function! s:XRefTracer.mBuildForSymbol(symid, curdepth, maxdepth, 
                                      \ direction, pbar) dict
    if (a:curdepth > a:maxdepth) 
        return {}
    endif

    call a:pbar.mSetDepth(a:curdepth)
    let asym = self.xrefdb.mGetSymbolFromId(a:symid)
    " revisit
    if empty(asym)
        return {}            
    endif

    let rtree = s:CallTree.mCreate(asym['n'])

    for entry in self.mGetSymbolIdXRef(a:symid, a:direction)
        call a:pbar.mTick(1)
        let ctree = 
                \self.mBuildForSymbol(entry, a:curdepth+1, a:maxdepth, 
                                            \a:direction, a:pbar)
        call rtree.mAddChildLink(ctree)
    endfor
    return rtree
endfunction
" }}}

" {{{ Cscope Reader


let s:CscopeDbRdrState = {
    \'curfuncidx': -1,
    \'curfileidx': -1,
    \'curmacroidx': -1,
    \ }

function! s:CscopeDbRdrState.mCreate() dict
    return deepcopy(s:CscopeDbRdrState)
endfunction

let s:CscopeDbRdr = { 
                    \ 'class': 'Cscope',
                    \ 'headerLines' : 1,
                    \ 'compressed' : 0,
                    \ 'opts': ['v:val =~ "^\t[#`$}@\~\)]"'],
                    \ 'perl_opts': '^\t[\`\#\$\}\@\~\)]',
                    \ 'mapPreKeys': {'n':''},
                    \ 'mapPostKeys': {'n':''}
                    \}

function! s:CscopeDbRdr.mCreate(fname) dict
    let csdbrdr = deepcopy(s:CscopeDbRdr)
    unlet csdbrdr.mCreate
    
    return csdbrdr
endfunction

function! s:CscopeDbRdr.mProcessingStateInit() dict
    let self.iState = s:CscopeDbRdrState.mCreate()
endfunction

function! s:CscopeDbRdr.mProcessingStateDone() dict
    " discard state
    unlet self.iState
endfunction

function! s:CscopeDbRdr.mReadLinesFromFile(vDbFile, filtercmds) dict
    return s:CCTreeUtils.mFilter(a:vDbFile.lines, a:filtercmds)
endfunction

function! s:CscopeDbRdr.mParseDbHeader(dbHeader) dict
    if a:dbHeader[0] =~ "cscope"
        if (a:dbHeader[0] !~ "cscope.*\-c")
            let self.compressed =  s:CCTreeRC.True
        else
            let self.compressed =  s:CCTreeRC.False
        endif
        return s:CCTreeRC.Success
    endif
    return s:CCTreeRC.Error
endfunction

function! s:CscopeDbRdr.mRequirePreProcessing() dict
    return (self.compressed == 1)? s:CCTreeRC.True : s:CCTreeRC.False
endfunction

function! s:CscopeDbRdr.mRequirePostProcessing() dict
    return (self.compressed == 1)? s:CCTreeRC.True : s:CCTreeRC.False
endfunction

function! s:CscopeDbRdr.mRequireCleanup() dict
    " Clean-up all symbols [always]
    return s:CCTreeRC.True
endfunction

function! s:CscopeDbRdr.mGetPreProcessingMaps() dict
    return s:CCTreeGetCscopeMaps('Compress')
endfunction

function! s:CscopeDbRdr.mGetPostProcessingMaps() dict
    return s:CCTreeGetCscopeMaps('Uncompress')
endfunction

function! s:CscopeDbRdr.mProcessSymbol(xrefdb, symbol) dict
	return self.mProcessTaggedSymbol(a:xrefdb, a:symbol)
endfunction

function! s:CscopeDbRdr.mProcessTaggedSymbol(xrefdb, symbol) dict
        if self.iState.curmacroidx != -1
            if a:symbol[1] == "`"
                call a:xrefdb.mMarkXRefSyms(self.iState.curmacroidx,
                                \ a:xrefdb.mAddSym(a:symbol[2:]))
            elseif a:symbol[1] == ')'
                let self.iState.curmacroidx = -1
            endif
        elseif self.iState.curfuncidx != -1
            " inside function
            if a:symbol[1] == "`"
                call a:xrefdb.mMarkXRefSyms(self.iState.curfuncidx,
                                \ a:xrefdb.mAddSym(a:symbol[2:]))
            elseif a:symbol[1] == "}"
               let self.iState.curfuncidx = -1
            elseif a:symbol[1] == "#"
                let self.iState.curmacroidx = a:xrefdb.mAddSym(a:symbol[2:])
            endif
        elseif a:symbol[1] == "$"
            let self.iState.curfuncidx = a:xrefdb.mAddSym(a:symbol[2:])
        elseif a:symbol[1] == "#"
           let self.iState.curmacroidx = a:xrefdb.mAddSym(a:symbol[2:])
        elseif a:symbol[1] == "~"
            call a:xrefdb.mMarkXRefSyms(self.iState.curfileidx,
                                       \a:xrefdb.mAddSym(a:symbol[3:]))
        elseif a:symbol[1] == "@"
	    if a:symbol[2] != ""
                let self.iState.curfileidx = 
                                    \a:xrefdb.mAddSym(a:symbol[2:])
	    endif
        endif
endfunction

" }}}
" {{{ CCTree helper library
let s:CCTreeUtils = {}

function! s:CCTreeUtils.mDetectDB(class)
    if a:class == s:cctreexref
        if filereadable(g:CCTreeDb)
        return g:CCTreeDb
        endif
    elseif a:class == s:cscopeid
        if filereadable(g:CCTreeCscopeDb)
            return g:CCTreeCscopeDb
        endif
    endif
    return ''
endfunction

function! s:CCTreeUtils.mFilter(lines, filtercmds) dict
	let retlst = []
	let progr = len(a:lines)/100
	let pBar = s:ProgressBarNumeric.mCreate(len(a:lines), "items")
	while len(a:lines) > 0
		if progr <= len(a:lines)
			let tmplist = remove(a:lines, 0, progr)
		else
			let tmplist = remove(a:lines, 0, len(a:lines)-1)
		endif
		for acmd in a:filtercmds
			call filter(tmplist, acmd)
		endfor
		call pBar.mTick(progr)
		call extend(retlst, tmplist)
	endwhile
	call pBar.mDone()
	return retlst
endfunction

function! s:CCTreeUtils.mWarningMsg(msg) dict
    echohl WarningMsg
    echomsg s:pluginname. ": ". a:msg
    echohl None
endfunction

function! s:CCTreeUtils.mInfoMsg(msg) dict
    echohl Title
    echomsg s:pluginname. ": ". a:msg
    echohl None
endfunction

function! s:CCTreeUtils.mWrite(msg) dict
    echo s:pluginname. ": ". a:msg
endfunction

" }}}
" {{{  CCTree DB management
let s:CCTreeXrefDb = {
                     \  'type': '',
                     \  'fname' : '',
                     \  'fsize' : 0,
                     \  'fdate' : 0
                     \}

let s:CCTreeDBList = {
                        \'loadedDBs' : []
                        \ }

function! s:CCTreeDBList.mCreate() dict
    let dbList = deepcopy(s:CCTreeDBList)
    unlet dbList.mCreate

    return dbList
endfunction

function! s:CCTreeDBList.mShowLoaded() dict
    let i = 1
    call s:CCTreeUtils.mWrite(s:pluginname.": List of loaded cscope databases")
    call s:CCTreeUtils.mWrite("---------------------------------------")
   for aDB in self.loadedDBs
	call s:CCTreeUtils.mWrite(i." ".aDB)
	let i = i + 1
   endfor
endfunction

function! s:CCTreeDBList.mClearAll() dict
    let self.loadedDBs = []
endfunction

function! s:CCTreeDBList.mIsEmpty() dict
    if empty(self.loadedDBs) 
        return s:CCTreeRC.True
    endif
    return s:CCTreeRC.False
endfunction

" Load the cscope db into the global cctree xref db
function! s:CCTreeDBList.mCreateDbLoaderAndReader(dbName, class) dict
    let dbUser = s:CCTreeCmdLine.mInputDBName('Load', a:dbName, a:class)
    if dbUser == ''
        call s:CCTreeUtils.mWarningMsg('Filename required')
        "User cancel, do nothing
        return
    endif
     
    " Create generic Db loader object
    let gDbLdr = s:GenericDbLdr.mCreate(dbUser)
    
    if type(gDbLdr) != type({})
        call s:CCTreeUtils.mWarningMsg(a:class.' database ' . a:dbName . 
            \ ' not found.')
        return s:CCTreeRC.Error
    endif

    " Create new DB reader object
    if a:class == s:cscopeid
        let gDbRdr = s:CscopeDbRdr.mCreate(dbUser)
    elseif a:class == s:cctreexref
        let gDbRdr = s:CCTreeTagDbRdr.mCreate(dbUser)
    else
        return s:CCTreeRC.Error
    endif

    if gDbLdr.mParseDbHeader(gDbRdr) == s:CCTreeRC.Error
        call s:CCTreeUtils.mWarningMsg(gDbRdr.class.' database ' . a:dbName . 
            \ ' format is not parseable.')
        return s:CCTreeRC.Error
    endif

    return {'loader': gDbLdr, 'reader': gDbRdr}
endfunction
            
function! s:CCTreeDBList.mAddDbToList(dbName)
    let dbFullPath = simplify(getcwd().'/'.a:dbName)." ".getfsize(a:dbName).
                        \ " bytes ".strftime("%c", getftime(a:dbName))
    call add(self.loadedDBs, dbFullPath)
endfunction

" Merge the cscope db into the global cctree xref db
function! s:CCTreeDBList.mMerge(dbName, xRefDb, class)
    " Create db loader, reader
    let gObjs = self.mCreateDbLoaderAndReader(a:dbName, a:class)

    if type(gObjs) == type({})
        " if Db is compressed, then we need to compress our symbols first
        if self.mLoadDB(gObjs.loader, a:xRefDb, 
                            \ gObjs.reader) != s:CCTreeRC.Error
            call self.mAddDbToList(gObjs.loader.fDBName)
        endif
        " Load will auto decompress the symbols
    endif
endfunction

" Load the cscope db into the global cctree xref db
function! s:CCTreeDBList.mAddNew(dbName, xRefDb, class)
    " Create db loader, reader
    let gObjs = self.mCreateDbLoaderAndReader(a:dbName, a:class)

    if type(gObjs) == type({})
        if self.mLoadDB(gObjs.loader, a:xRefDb, 
                            \ gObjs.reader) != s:CCTreeRC.Error
            call self.mAddDbToList(gObjs.loader.fDBName)
        endif
    endif
endfunction

function! s:CCTreeDBList.mLoadDB(gDbLdr, xRefDb, gRdr)
    let rc = s:CCTreeRC.Success
    try
        let swatch = s:StopWatch.mCreate()
        call s:StatusLine.mInit()
        " if compression, then we need to compress our symbols first
        if a:gRdr.mRequirePreProcessing() == s:CCTreeRC.True
            call s:StatusLine.mSetInfo('Pre-processing existing symbols')
            call a:xRefDb.mTranslateSymbols(a:gRdr.mGetPreProcessingMaps(), 
                                            \ a:gRdr.mapPreKeys)
        endif
        call s:StatusLine.mSetInfo('Loading database')
        call a:gDbLdr.mLoadFileIntoXRefDb(a:xRefDb, a:gRdr)   
        if a:gRdr.mRequireCleanup() == s:CCTreeRC.True
            call s:StatusLine.mSetInfo('Symbol clean-up')
            call a:xRefDb.mCleanSymbols()
        endif
        if a:gRdr.mRequirePostProcessing() == s:CCTreeRC.True
            call s:StatusLine.mSetInfo('Post-processing loaded symbols')
            call a:xRefDb.mTranslateSymbols(a:gRdr.mGetPostProcessingMaps(),
                                                \ a:gRdr.mapPostKeys)
        endif
        call swatch.mSnapElapsed()
        " restore normalcy
        call garbagecollect()
        redraw

        let msg = "Done loading database. xRef Symbol Count: "
                                     \.len(a:xRefDb.symnamehash)
                                     \.". Time taken: ".swatch.mGetText()." secs"
        call s:CCTreeUtils.mInfoMsg(msg)

    catch /^Vim:Interrupt$/	" catch interrupts (CTRL-C)
        call s:CCTreeUtils.mWarningMsg('Loading aborted.')
        let rc = s:CCTreeRC.Error
    finally
        call s:StatusLine.mRestore()
    endtry
    return rc
endfunction
"}}}
" {{{ UI Input related
let s:CCTreeUI = {}


function! s:CCTreeUI.mInputDBName(dbName, class, action)
    let dbUser = a:dbName
    let dbUser = input(a:action. ' database ('. a:class. '): ', a:dbName, 'file')
    return dbUser
endfunction
" }}}
" {{{ CCTree Markers
let s:TreeMarkers_UTF8 = {
                            \ 'splitT' : nr2char(0x251c),
                            \ 'arrowF' : nr2char(0x25c0),
                            \ 'arrowR' : nr2char(0x25B6),
                            \ 'extV' : nr2char(0x2502),
                            \ 'extH': nr2char(0x2500),
                            \ 'depth': nr2char(0x25BC)
                            \}

let s:TreeMarkers_Text = {
                            \ 'splitT' : '+',
                            \ 'arrowF' : '>',
                            \ 'arrowR' : '<',
                            \ 'extV' : '|',
                            \ 'extH': '-',
                            \ 'depth': 'depth:'
                            \}

let s:CCTreeMarkers = {
                        \ 'icons':{}
                        \ }
function! s:CCTreeMarkers.mCreate() dict
    let treeMarkers = deepcopy(s:CCTreeMarkers)

    if &encoding == 'utf-8' && g:CCTreeUseUTF8Symbols == 1
        let treeMarkers.icons = deepcopy(s:TreeMarkers_UTF8)
    else
        " default choice
        let treeMarkers.icons = deepcopy(s:TreeMarkers_Text)
    endif

    let treeMarkers.icons.arrowSyms = treeMarkers.icons.arrowF . treeMarkers.icons.arrowR
    let treeMarkers.icons.vertSyms = treeMarkers.icons.splitT . treeMarkers.icons.extV

    return treeMarkers
endfunction

function! s:CCTreeMarkers.mGetArrow(direction) dict
    if a:direction == 'p'
        return self.icons.arrowR
    elseif a:direction == 'c'
        return self.icons.arrowF
    endif
    return '?'
endfunction
" }}}
" {{{ User key mappings 
let s:CCTreeKeyMappings = {
                    \ 'CTreeF': g:CCTreeKeyTraceForwardTree,
                    \ 'CTreeR': g:CCTreeKeyTraceReverseTree,
                    \ 'CTreeHilight': g:CCTreeKeyHilightTree,
                    \ 'CTreeWSave': g:CCTreeKeySaveWindow,
                    \ 'CTreeWToggle': g:CCTreeKeyToggleWindow,
                    \ 'CTreeCompress': g:CCTreeKeyCompressTree,
                    \ 'CTreeDepthMinus': g:CCTreeKeyDepthMinus,
                    \ 'CTreeDepthPlus': g:CCTreeKeyDepthPlus
                    \}
" }}}
" {{{ CCTreeWindow
let s:CCTreeWindow =  {
                        \ 'hiKeyword': '',
                        \ 'hiKeywordLine':'',
                        \ 'lastbufname':'',
                        \ 'treeMarkers': s:CCTreeMarkers.mCreate()}

function! s:CCTreeWindow.mCreate() dict
    let win = deepcopy(s:CCTreeWindow)
    unlet win.mCreate

    return win
endfunction

function! s:CCTreeWindow.mLeave()
    call s:FindOpenWindow(self.lastbufname)
endfunction


" Definition of a keyword...
let s:CCTreeKeywordRegEx = '[A-Za-z0-9_\\\.\/]\+'

function! s:CCTreeWindow.mGetKeywordAtCursor() dict
    let curline = line(".")
    let self.hiKeyword = ''
    if foldclosed(curline) == -1
        let curkeyword = matchstr(getline("."), s:CCTreeKeywordRegEx)
        if curkeyword != ''
            if curkeyword != self.hiKeyword || curline != self.hiKeywordLine
                let self.hiKeyword = curkeyword
                let self.hiKeywordLine = line(".")
                return s:CCTreeRC.Success
            endif
        else
            return s:CCTreeRC.Error
        endif 
    endif  
    if self.hiKeyword == ''
        return s:CCTreeRC.Error
    endif
    return s:CCTreeRC.Success
endfunction

function! s:CCTreeWindow.mBuildStatusLine(pState, title, items)
    let needcomma = 0
    let rtitle = a:title. ' ('. a:pState.keyword 
    let rtitle .= '['
    if has_key(a:items, "depth")
        let rtitle .= self.treeMarkers.icons.depth
        let rtitle .= a:pState.depth
        let needcomma = 1
    endif
    if has_key(a:items, "direction")
        if needcomma == 1
            let rtitle .= ','
        endif

        let rtitle .= self.treeMarkers.mGetArrow(a:pState.direction)
    endif
    let rtitle .= '])'

    return rtitle
endfunction

function! CCTreeWindowPreviewStatusLine() 
    " get global
    " this is a hack
    let pState = s:CCTreeGlobals.PreviewState
    let tMarkers = s:CCTreeGlobals.Window.treeMarkers

    return  s:CCTreeGlobals.Window.mBuildStatusLine(
                \ s:CCTreeGlobals.PreviewState,
                \ s:windowtitle,
                \ {'depth':''}
                \)
endfunction

function! s:CCTreeWindow.mPreviewSave(savetitle) dict
    if s:FindOpenWindow(s:windowtitle) == 1
        setlocal modifiable
        call self.mClearMarks()
        setlocal nomodifiable
     	setlocal statusline=%-F
       	silent! exec ":f ". a:savetitle
        return s:CCTreeRC.Success
    endif
    return s:CCTreeRC.Error
endfunction
    
function! s:CCTreeWindow.mIsOpen() dict
    if s:FindOpenBuffer(s:windowtitle) > 0
        return s:CCTreeRC.True
    endif
    return s:CCTreeRC.False
endfunction

function! s:CCTreeWindow.mClose() dict
    if s:FindOpenWindow(s:windowtitle) == 1
        silent! q!
    endif
endfunction

function! s:CCTreeWindow.mDisplayToggle() dict
    if s:FindOpenWindow(s:windowtitle) == 1
        silent! hide
    else 
	let winbufnr = s:FindOpenBuffer(s:windowtitle)
	if winbufnr > 0 
	   call self.mEnter()
	   silent! exec "buf ".winbufnr
	   call self.mResize()
           silent! wincmd p
	else
	   call s:CCTreeUtils.mWarningMsg(" No active window found.")
	endif
    endif
endfunction

function! s:CCTreeWindow.mResize() dict
    if g:CCTreeWindowVertical == 1
        if g:CCTreeWindowWidth == -1
            exec "vertical resize ". b:maxwindowlen
        else
            exec "vertical resize ". g:CCTreeWindowWidth
        endif
    else
        if g:CCTreeWindowHeight != -1
            let &winminheight = g:CCTreeWindowHeight
           exec "resize".g:CCTreeWindowHeight
        endif
    endif
endfunction

function! s:CCTreeWindow.mDisplayTree(atree, direction) dict
    let incctreewin = 1
    if (bufname('%') != s:windowtitle) 
        let incctreewin = self.mEnter()
    endif

    setlocal modifiable
    silent 1,$d
    let b:maxwindowlen = g:CCTreeWindowMinWidth
    let b:displayTree = s:DisplayTree.mCreate(a:atree,
                    \ a:direction, self.treeMarkers)
    call s:CCTreeDisplay.mPopulateTreeInCurrentBuffer(b:displayTree)
    exec "normal gg"

    " Need to force this again
    let &l:foldlevel=g:CCTreeMinVisibleDepth
    setlocal nomodifiable
    call self.mResize()
    if (incctreewin == 0)
        call s:CCTreeWindow.mLeave()
    endif
endfunction

function! s:CCTreeWindow.mExtractTreeSymbols(dtree)
    let symlist = {}
    for aentry in a:dtree.entries
        let symlist[aentry.symbol] = 0
    endfor
    return symlist
endfunction

function! s:CCTreeWindow.mEnter() dict
    let self.lastbufname = bufname("%")
    let foundWindow = s:FindOpenWindow(s:windowtitle)
    if foundWindow == 0
        if g:CCTreeWindowVertical == 1
            exec  g:CCTreeOrientation." vsplit ". s:windowtitle
            set winfixwidth
        else
            exec  g:CCTreeOrientation." split ". s:windowtitle
            set winfixheight
        endif

        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal noswapfile
        setlocal nonumber
        setlocal nowrap
        setlocal nobuflisted

        setlocal statusline=%=%{CCTreeWindowPreviewStatusLine()}

        call self.mInitSyntax(self.treeMarkers.icons)
        let cpo_save = &cpoptions
        set cpoptions&vim

        call s:CCTreeBufferKeyMappingsCreate(s:CCTreeKeyMappings) 
     
        command! -buffer -nargs=0 CCTreeWindowHiCallTree 
                                \ call s:CCTreeGlobals.mCursorHoldHandleEvent()
     
        exec 'nnoremap <buffer> <silent> '.s:CCTreeKeyMappings.CTreeHilight.
                                                 \' :CCTreeWindowHiCallTree<CR>'
        exec 'nnoremap <buffer> <silent> '.s:CCTreeKeyMappings.CTreeCompress.
                                                 \ ' :2,.foldclose!<CR>zv'
	
        nnoremap <buffer> <silent> <C-p>  :CCTreePreviewBufferUsingTag<CR>
        nnoremap <buffer> <silent> <CR>  :CCTreeLoadBufferUsingTag<CR>
        nnoremap <buffer> <silent> <2-LeftMouse> :CCTreeLoadBufferUsingTag<CR>

        let &cpoptions = cpo_save
    endif
    setlocal foldmethod=expr
    setlocal foldexpr=CCTreeFoldExpr(getline(v:lnum))
    setlocal foldtext=CCTreeFoldText()
    let &l:foldlevel=g:CCTreeMinVisibleDepth

    return foundWindow
endfunction   
" }}}
" {{{ Dynamic call-tree highlighting using 
" syntax highlight tricks 
"
" There are 3 types of lines, marked with the start character [\s, !, #]
" Also @ is used to mark the path that is going up

function! s:CCTreeWindow.mMarkCallTree(treelst, keyword) dict
    let declevel = -1

    for idx in range(line("."), 1, -1)
        " Find our keyword
        if declevel == -1  
            if a:treelst[idx-1].symbol == a:keyword
                let declevel = a:treelst[idx-1].level
            endif
        endif

        " Skip folds
        if declevel != -1 && foldclosed(idx) == -1
            let curline = getline(idx)
            if declevel == a:treelst[idx-1].level
                let linemarker = '!'
                let declevel -= 1
            else
                let linemarker = '#'
            endif
            let pos = match(curline, '['.self.treeMarkers.icons.vertSyms.']', 
                            \ 0, declevel+1)
            " Unconventional change char
            let curline = linemarker.strpart(curline, 1, pos-2).'@'.
                        \ strpart(curline, pos, 1). strpart(curline, pos+1)
            call setline(idx, curline)
        endif
    endfor
endfunction

function! s:CCTreeWindow.mClearMarks() dict
   let windict = winsaveview()
   silent! exec "1,$s/[!#@]/ /e".s:Utils.mGetSearchFlag(1)
   call winrestview(windict)
endfunction

function! s:CCTreeWindow.mInitSyntax(markers) dict
        "syntax match CCTreePathMark /\s[|+]/ contained
        exec 'syntax match CCTreePathMark /\s['. a:markers.vertSyms . ']/ contained'
        "syntax match CCTreeArrow  /-*[<>]/ contained
        exec 'syntax match CCTreeArrow  /'.a:markers.extH.'*['. a:markers.arrowSyms .']/ contained'

        syntax match CCTreeSymbol  / [A-Za-z0-9_\.\\\/]\+/  contained
        syntax region CCTreeSymbolLine start="^\s" end="$" contains=CCTreeArrow,CCTreePathMark,CCTreeSymbol oneline

        "syntax match CCTreeHiArrow  /-*[<>]/ contained
        exec 'syntax match CCTreeHiArrow  /'. a:markers.extH .'*['. a:markers.arrowSyms .']/ contained'
        syntax match CCTreeHiSymbol  / [A-Za-z0-9_\.\\\/]\+/  contained
        
        "syntax match CCTreeHiPathMark /\s[|+]/ contained
        exec 'syntax match CCTreeHiPathMark /\s[' . a:markers.vertSyms . ']/ contained'
        
        syntax match CCTreeMarkExcl  /^[!#]/ contained
        syntax match CCTreeMarkTilde /@/  contained
        "syntax region CCTreeUpArrowBlock start="@"  end=/[|+]/  contains=CCTreeMarkTilde contained oneline
        exec 'syntax region CCTreeUpArrowBlock start="@"  end=/['. a:markers.vertSyms .']/  contains=CCTreeMarkTilde contained oneline'

        syntax region CCTreeHiSymbolLine start="!" end="$" contains=CCTreeMarkExcl, 
                \ CCTreeUpArrowBlock,
                \ CCTreeHiSymbol,CCTreeHiArrow,CCTreeHiPathMark oneline

        syntax region CCTreeMarkedSymbolLine start="#" end="$" contains=CCTreeMarkExcl,
                        \ CCTreeMarkTilde,CCTreePathMark,
                        \ CCTreeArrow,CCTreeSymbol,CCTreeUpArrowBlock oneline
endfunction


" }}}
" {{{ CCTreeDisplay

let s:CCTreeDisplay = {}

function! s:CCTreeDisplay.mPopulateTreeInCurrentBuffer(dtree)
    let linelist = []
    for aentry in a:dtree.entries
        let aline = a:dtree.lvlNotationTxt[aentry.level]. aentry.symbol
        let len = s:Utils.mStrlenEx(aline)
        let b:maxwindowlen = max([len+1, b:maxwindowlen])
        call add(linelist, aline)
    endfor
    call setline(".", linelist)
endfunction



" }}}
" {{{ CCTree command line interface
let s:CCTreeCmdLine = {}

" Unload current db's and load new one
" There is no selective unloading
function! s:CCTreeCmdLine.mLoadDB(db_name, class) dict
        call s:CCTreeGlobals.mSetupEncodingChangeAutoCmd(0)
        call s:CCTreeGlobals.mUnLoadDBs()
	call s:CCTreeGlobals.DbList.mAddNew(a:db_name, 
                                \ s:CCTreeGlobals.XRefDb, a:class)
        call s:CCTreeGlobals.mSetupAutoCmds()
endfunction

function! s:CCTreeCmdLine.mInputDBName(action, dbName, class) dict
    if a:dbName == ''
        let dbUser = s:CCTreeUI.mInputDBName(
                            \ s:CCTreeUtils.mDetectDB(a:class), 
                            \ a:class, a:action)
    else
        let dbUser = a:dbName
    endif
    return dbUser
endfunction
    
function! s:CCTreeCmdLine.mSaveDB(dbName, class) dict
    let dbUser = self.mInputDBName('Save', a:dbName, a:class)
    if dbUser == ''
        call s:CCTreeUtils.mWarningMsg('Filename required')
        return
    endif
    call s:CCTreeGlobals.Window.mClose()
    call s:CCTreeGlobals.mSetupEncodingChangeAutoCmd(0)
    call s:CCTreeGlobals.mWriteXRefDbToFile(dbUser)
    call s:CCTreeGlobals.mSetupAutoCmds()
    call s:CCTreeGlobals.mUpdateForCurrentSymbol()
endfunction

" Merge current db with new one
function! s:CCTreeCmdLine.mMergeDB(db_name, class) dict
        "call s:CCTreeGlobals.Window.mClose()
	call s:CCTreeGlobals.DbList.mMerge(a:db_name, s:CCTreeGlobals.XRefDb, a:class)
endfunction


" }}}
" {{{ CCTree Buffer mappings
function! s:CCTreeWindowGetHiKeyword()
    let keyw = expand("<cword>")
    let keyf = expand("<cfile>")

    let syms = s:CCTreeGlobals.mGetPreviewTreeSymbols()

    if keyw != keyf 
        if has_key(syms, keyf)
            return keyf
        elseif has_key(syms, keyw)
            return keyw
        endif
    else
        return keyw
    endif
    return ''
endfunction


" Keymappings used common to source files and CCTree window
function! s:CCTreeBufferKeyMappingsCreate(kmaps)
     let func_expr = '<SNR>'.s:sid.'CCTreeWindowGetHiKeyword()'
     exec 'nnoremap <buffer> <silent> '.a:kmaps.CTreeR.' :CCTreeTraceReverse <C-R>='.
                                                  \ func_expr.'<CR><CR>'
     exec 'nnoremap <buffer> <silent> '.a:kmaps.CTreeF.' :CCTreeTraceForward <C-R>='
                                                \ .func_expr.'<CR><CR>'

     exec 'nnoremap <silent> '.a:kmaps.CTreeWSave. ' :CCTreeWindowSaveCopy<CR>'
     exec 'nnoremap <silent> '.a:kmaps.CTreeWToggle. ' :CCTreeWindowToggle<CR>'

     exec 'nnoremap <buffer> <silent> '.a:kmaps.CTreeDepthPlus.
                                    \ ' :CCTreeRecurseDepthPlus<CR>'
     exec 'nnoremap <buffer> <silent> '.a:kmaps.CTreeDepthMinus.
                                    \ ' :CCTreeRecurseDepthMinus<CR>'
endfunction

augroup CCTreeMaps
au!
" Header files get detected as cpp?
" This is a bug in Vim 7.2, a patch needs to be applied to the runtime c
" syntax files
" For now, use this hack to make *.h files work
autocmd FileType *   if &ft == 'c'|| &ft == 'cpp' |
                   \ call s:CCTreeBufferKeyMappingsCreate(s:CCTreeKeyMappings)|
                   \ endif
augroup END


" }}}
" {{{ Tree building

let s:DisplayTreeEntry = {
                     \ 'symbol': "",
                     \ 'level': -1
                     \ }

function! s:DisplayTreeEntry.mCreate(sym, level) dict
    let te = deepcopy(s:DisplayTreeEntry)
    let te.symbol = a:sym
    let te.level = a:level
    unlet te.mCreate

    return te
endfunction

let s:calltreemaxdepth = 10
let s:DisplayTree = {
                    \ 'entries': [],
                    \ 'levelMaxLen': repeat([255], s:calltreemaxdepth),
                    \ 'lvlNotationTxt': repeat([" "], s:calltreemaxdepth)
                    \ }

function! s:DisplayTree.mCreate(calltree, direction, markers) dict
    let dt = deepcopy(s:DisplayTree)
    call dt.mBuildTreeForLevel(a:calltree, 0)
    call dt.mBuildNotationalTxt(a:direction, a:markers.icons)

    unlet dt.mBuildTreeForLevel
    unlet dt.mCreate

    return dt
endfunction

function! s:DisplayTree.mBuildTreeForLevel(ctree, level)
    if !has_key(a:ctree, 'symbol')
        return
    endif
    
    if g:CCTreeDisplayMode == 1 
       let curlevellen = 1
    elseif g:CCTreeDisplayMode == 2
       let curlevellen = a:level + 2
    elseif g:CCTreeDisplayMode == 3
       let curlevellen = strlen(a:ctree.symbol) + a:level + 2
    endif    
    
    let self.levelMaxLen[a:level] = min([self.levelMaxLen[a:level],
                                        \ curlevellen])

    let aentry = s:DisplayTreeEntry.mCreate(a:ctree.symbol, a:level)
    call add(self.entries, aentry)
    
    if has_key(a:ctree, 'childlinks')
        for alink in a:ctree['childlinks']
            call self.mBuildTreeForLevel(alink, a:level+1)
        endfor
    endif
endfunction


function! s:DisplayTree.mBuildNotationalTxt(direction, markerSyms) dict 
    let pptxt = "  "

   " REVISIT
   if a:direction == 'p' 
        let directiontxt = a:markerSyms.arrowR . " "
    elseif a:direction == 'c'
        let directiontxt = a:markerSyms.arrowF . " "
   endif
   
    let self.lvlNotationTxt[0] = pptxt . a:markerSyms.splitT . directiontxt

    for idx in range(1, s:calltreemaxdepth-1)
        if self.levelMaxLen[idx] != 255
            let pptxt .= repeat(" ", self.levelMaxLen[idx-1])
            let self.lvlNotationTxt[idx] = pptxt . a:markerSyms.splitT

            if g:CCTreeDisplayMode == 1 
                let arrows = a:markerSyms.extH
            elseif g:CCTreeDisplayMode >= 2
                let arrows = repeat(a:markerSyms.extH, idx)
            endif

            let self.lvlNotationTxt[idx] = pptxt. a:markerSyms.splitT . arrows . directiontxt
            let pptxt .= a:markerSyms.extV
        endif
    endfor
endfunction

"}}}
" {{{ Preview window Folding
function! CCTreeFoldExpr(line)
    if !exists('b:displayTree') || v:lnum > len(b:displayTree.entries)
        return 0
    endif

    let lvl = b:displayTree.entries[v:lnum-1].level
    if lvl == 0
        let lvl = 1
    endif
    return '>'.lvl
endfunction


function! CCTreeFoldText()
    let line = substitute(getline(v:foldstart), '[!@#]', ' ' , 'g')
    return line. " (+". (v:foldend - v:foldstart). 
                \  ')'. repeat(" ", winwidth(0))
endfunction
" }}}
" {{{ Syntax coloring definitions
"Standard display
highlight default link CCTreeSymbol  Function
highlight default link CCTreeMarkers LineNr
highlight default link CCTreeArrow CCTreeMarkers
highlight default link CCTreePathMark CCTreeArrow
highlight default link CCTreeHiPathMark CCTreePathMark

" highlighted display
highlight default link CCTreeHiSymbol  TODO
highlight default link CCTreeHiMarkers NonText
highlight default link CCTreeHiArrow  CCTreeHiMarkers
highlight default link CCTreeUpArrowBlock CCTreeHiArrow

highlight default link CCTreeMarkExcl Ignore
highlight default link CCTreeMarkTilde Ignore
"}}}
" {{{  CCTree global state

let s:CCTreePreviewState = {
                    \ 'keyword':'',
                    \ 'direction': '',
                    \ 'depth' : ''
                    \}

function! s:CCTreePreviewState.mCreate()
    let state = deepcopy(s:CCTreePreviewState)
    unlet state.mCreate

    return state
endfunction

function! s:CCTreePreviewState.mStore(symbol, direction)
    let self.keyword = a:symbol
    let self.direction = a:direction
endfunction
" }}}
" {{{ CCTree global objects

let s:CCTreeGlobals = {
                        \ 'XRefDb': s:xRefMemDb.mCreate(),
                        \ 'DbList': s:CCTreeDBList.mCreate(),
                        \ 'PreviewState': s:CCTreePreviewState.mCreate(),
                        \ 'Window': s:CCTreeWindow.mCreate()
                        \}

let g:CCTreeGlobals = s:CCTreeGlobals

function! s:CCTreeGlobals.mEnable(opt) dict
    if (has_key(s:CCTreeOptions, a:opt))
        call s:CCTreeOptions[a:opt](1)
    else
        call s:CCTreeUtils.mWarningMsg('Invalid option')
    endif
endfunction

function! s:CCTreeGlobals.mDisable(opt) dict
    if (has_key(s:CCTreeOptions, a:opt))
        call s:CCTreeOptions[a:opt](0)
    else
        call s:CCTreeUtils.mWarningMsg('Invalid option')
    endif
endfunction

function! s:CCTreeGlobals.mToggle(opt) dict
    if (has_key(s:CCTreeOptions, a:opt))
        call s:CCTreeOptions[a:opt](-1)
    else
        call s:CCTreeUtils.mWarningMsg('Invalid option')
    endif
endfunction

function! s:CCTreeGlobals.mGetSymNames() dict
    return self.XRefDb.mGetSymbolNames()
endfunction


function! s:CCTreeGlobals.mGetCallsForSymbol(name, depth, direction) dict
    let pbar = s:ProgressBarRoll.mCreate(['-','\','|','/'], '*')
    call s:StatusLine.mSetInfo('Building ')
    " Create tracer
    let xtracer = s:XRefTracer.mCreate(self.XRefDb)
    let symid = self.XRefDb.mGetSymbolIdFromName(a:name)
    let xrefs = xtracer.mBuildForSymbol(symid, 
                      \ a:depth, self.PreviewState.depth, a:direction, pbar)
    return xrefs
endfunction

function! s:CCTreeGlobals.mShowLoadedDBs() dict
    call self.DbList.mShowLoaded()
endfunction

function! s:CCTreeGlobals.mUnLoadDBs() dict
    call s:CCTreeGlobals.Window.mClose()
    call s:CCTreeGlobals.XRefDb.mClear()
    call s:CCTreeGlobals.DbList.mClearAll()
endfunction

function! s:CCTreeGlobals.mSetPreviewState(name, depth, direction) dict
    let self.PreviewState.keyword = a:name
    let self.PreviewState.direction = a:direction
    let self.PreviewState.depth = a:depth
endfunction

function! s:CCTreeGlobals.mUpdateForCurrentSymbol() dict
    if self.DbList.mIsEmpty() == s:CCTreeRC.True
        return s:CCTreeRC.Error
    endif
    if self.PreviewState.keyword != ''
        let swatch = s:StopWatch.mCreate()
        " Move this function to globals? 
        call s:StatusLine.mInit()
        let atree = self.mGetCallsForSymbol(self.PreviewState.keyword, 
                        \ 0, 
                        \ self.PreviewState.direction)
        call s:StatusLine.mRestore()
        call self.Window.mDisplayTree(atree, self.PreviewState.direction)

        call swatch.mSnapElapsed()
    endif
endfunction


function! s:CCTreeGlobals.mGetPreviewTreeSymbols()
        " REVIST
        if exists('b:displayTree')
            return self.Window.mExtractTreeSymbols(b:displayTree)
        end
        return {}
endfunction

function! s:CCTreeGlobals.mSanitizeCallDepth() dict
    let error = 0
    if self.PreviewState.depth >= s:calltreemaxdepth
        self.PreviewState.depth = s:calltreemaxdepth
        let error = 1
    elseif self.PreviewState.depth < 1 
        let self.PreviewState.depth = 1
        let error = 1
    endif

    if error == 1
        call s:CCTreeUtils.mWarningMsg('Depth out of bounds')
    endif
    return error
endfunction

function! s:CCTreeGlobals.mRecursiveDepthIncrease() dict
    let self.PreviewState.depth += 1
    if self.mSanitizeCallDepth() == 0
        call self.mUpdateForCurrentSymbol()
    endif
endfunction

function! s:CCTreeGlobals.mRecursiveDepthDecrease() dict
    let self.PreviewState.depth -= 1
    if self.mSanitizeCallDepth() == 0
        call self.mUpdateForCurrentSymbol()
    endif
endfunction

function! s:CCTreeGlobals.mDisplayToggle() dict
    call self.Window.mDisplayToggle()
endfunction

function! s:CCTreeGlobals.mSetupAutoCmds() dict
    augroup CCTreeGeneral
        au!
    augroup END
    call s:CCTreeGlobals.mSetupCursorMoveAutoCmd(g:CCTreeHilightCallTree)
    call s:CCTreeGlobals.mSetupEncodingChangeAutoCmd(g:CCTreeUseUTF8Symbols)
endfunction

function! s:CCTreeGlobals.mSetupCursorMoveAutoCmd(enable) dict
        if a:enable == 1
            exec 'autocmd CCTreeGeneral CursorMoved '.s:windowtitle.' call s:CCTreeGlobals.mCursorHoldHandleEvent()'
        else
            exec 'autocmd! CCTreeGeneral CursorMoved '.s:windowtitle
        endif
endfunction

function! s:CCTreeGlobals.mSetupEncodingChangeAutoCmd(enable) dict
        return
        if a:enable == 1
            autocmd CCTreeGeneral EncodingChanged * call s:CCTreeGlobals.mEncodingChangedHandleEvent()
        else
            autocmd! CCTreeGeneral EncodingChanged * 
        endif
endfunction

function! s:CCTreeGlobals.mPreviewSave() dict
    let rtitle = s:CCTreeGlobals.Window.mBuildStatusLine(
                \ s:CCTreeGlobals.PreviewState,
                \ s:windowsavetitle,
                \ {'depth':'', 'direction':''}
                \)

    if self.Window.mPreviewSave(rtitle) == s:CCTreeRC.Success
        call s:CCTreeUtils.mInfoMsg('Window saved as '. rtitle .
                    \ '. New window will be opened on next usage.')
    else
        call s:CCTreeUtils.mWarningMsg('No active window found to be saved.')
    endif
endfunction

function! s:CCTreeGlobals.mWriteXRefDbToFile(fname) dict
    " create db serializer and writer
    let gDbSz = s:GenericDbSerializer.mCreate(self.XRefDb)
    let gDbWriter = s:CCTreeTagDbWriter.mCreate(s:CCTreeGetXRefDbMaps('Compress'))
    call gDbSz.mWriteXRefDbToFile(a:fname, gDbWriter)
endfunction

function! s:CCTreeGlobals.mReadToXRefDb(fname) dict
    call s:StatusLine.mInit()
    call s:StatusLine.mSetInfo('Reading XRefDb')
    let vDbFile = s:vFile.mCreate(a:fname, "r")
    if vDbFile.mIsLargeFile() == 1
            call s:StatusLine.mSetExtraInfo('Xref DB '
                    \.' >'.g:CCTreeDbFileMaxSize .' bytes. Splitting '.
                    \'into smaller chunks... (this may take some time)')
    endif
    try
        if vDbFile.mOpen() == 0
            call s:TagFile.mReadToXRefDb(self.XRefDb, vDbFile)
        endif
    finally
        call vDbFile.mClose()
        call s:StatusLine.mRestore()
        call self.DbList.mAddDbToList(a:fname)
    endtry
endfunction

function! s:CCTreeGlobals.mCursorHoldHandleEvent() dict
    if self.Window.mGetKeywordAtCursor() != s:CCTreeRC.Error
       setlocal modifiable
       call self.Window.mClearMarks()
       call self.Window.mMarkCallTree(b:displayTree.entries,
                            \ self.Window.hiKeyword)
       setlocal nomodifiable
    endif
endfunction

function! s:CCTreeGlobals.mEncodingChangedHandleEvent() dict
    let self.Window.treeMarkers = s:CCTreeMarkers.mCreate()
    if self.Window.mIsOpen() == s:CCTreeRC.True
        call self.Window.mClose()
        call self.mUpdateForCurrentSymbol()
    endif
endfunction


function! s:CCTreeGlobals.mInit() dict
    call self.mSetupAutoCmds()
endfunction

" }}}
" {{{ CCTree options
function! s:CCTreeSetUseCallTreeHiLights(val) 
    if a:val == -1 
        let g:CCTreeHilightCallTree = !g:CCTreeHilightCallTree
    else
        let g:CCTreeHilightCallTree = a:val
    endif
    call s:CCTreeGlobals.mSetupAutoCmds()
endfunction

function! s:CCTreeSetUseUtf8Symbols(val) 
    if a:val == -1 
        let g:CCTreeUseUTF8Symbols = !g:CCTreeUseUTF8Symbols
    else
        let g:CCTreeUseUTF8Symbols = a:val
    endif
    call s:CCTreeGlobals.mEncodingChangedHandleEvent()
endfunction

function! s:CCTreeOptionsList(arglead, cmdline, cursorpos) 
    let opts = keys(s:CCTreeOptions)
    if a:arglead == ''
        return opts
    else
        return filter(opts, 'v:val =~? a:arglead')
    endif
endfunction

let s:CCTreeOptions = {'UseUnicodeSymbols': function('s:CCTreeSetUseUtf8Symbols'),
            \ 'DynamicTreeHiLights': function('s:CCTreeSetUseCallTreeHiLights')
            \}

" }}}
" {{{ Vim tags interface

" CCTreeCompleteKwd
" Command line completion function to return names from the db
function! s:CCTreeCompleteKwd(arglead, cmdline, cursorpos) 
    let syms = s:CCTreeGlobals.mGetSymNames()
    if a:arglead == ''
        return syms
    else
        return filter(syms, 'v:val =~? a:arglead')
    endif
endfunction

function! s:CCTreeTraceTreeForSymbol(sym_arg, direction) 
    if s:CCTreeGlobals.DbList.mIsEmpty() == s:CCTreeRC.True
        call s:CCTreeUtils.mWarningMsg('No database loaded')
        return
    endif

    let symbol = a:sym_arg
    if symbol == ''
        let symbol = input('Trace symbol: ', expand('<cword>'),
                    \ 'customlist,<SNR>' . s:sid . 'CCTreeCompleteKwd')
        if symbol == ''
            return
        else
        endif
    endif

    if index(s:CCTreeGlobals.mGetSymNames(), symbol) != -1
        call s:CCTreeGlobals.mSetPreviewState(symbol,
                                            \ g:CCTreeRecursiveDepth,
                                            \ a:direction)
        call s:CCTreeGlobals.mUpdateForCurrentSymbol()
    else
        call s:CCTreeUtils.mWarningMsg('Symbol not found')
    endif
endfunction



 
function! s:CCTreeGlobals.mLoadBufferFromKeyword()
    " REVISIT
    if s:CCTreeGlobals.Window.mGetKeywordAtCursor() == s:CCTreeRC.Error
        call s:CCTreeUtils.mWarningMsg('No keyword at cursor')
        return
    endif

    let hiKeyword = s:CCTreeGlobals.Window.hiKeyword
    try 
        wincmd p
    catch
        call s:CCTreeUtils.mWarningMsg('No buffer to load file')
    finally
        if (cscope_connection() > 0)
            try 
                exec "cs find g ". hiKeyword
            catch
                " cheap hack
                exec "cs find f ". hiKeyword
            endtry
        else
            try
                " Ctags is smart enough to figure the path
                exec "tag ".fnamemodify(hiKeyword, ":t")
            catch /^Vim\%((\a\+)\)\=:E433/
                call s:CCTreeUtils.mWarningMsg('Tag file not found')
            catch /^Vim\%((\a\+)\)\=:E426/
                call s:CCTreeUtils.mWarningMsg('Tag '. hiKeyword .' not found')
                wincmd p
            endtry
        endif
    endtry
endfunction
    
function! s:CCTreeGlobals.mPreviewBufferFromKeyword() 
    if self.Window.mGetKeywordAtCursor() == s:CCTreeRC.Error
        call s:CCTreeUtils.mWarningMsg('No keyword found')
        return
    endif

    let hiKeyword = s:CCTreeGlobals.Window.hiKeyword
    silent! wincmd P
    if !&previewwindow 
        wincmd p
    endif
    try
        exec "ptag ". hiKeyword
    catch
        call s:CCTreeUtils.mWarningMsg('Tag '.hiKeyword. ' not found')
    endtry
endfunction

" }}}
" {{{ Define commands
command! -nargs=? -complete=file CCTreeLoadDB  call s:CCTreeCmdLine.mLoadDB(<q-args>, s:cscopeid)
command! -nargs=? -complete=file CCTreeLoadXRefDB  call s:CCTreeCmdLine.mLoadDB(<q-args>, s:cctreexref)
command! -nargs=? -complete=file CCTreeSaveXRefDB  call s:CCTreeCmdLine.mSaveDB(<q-args>, s:cctreexref)
command! -nargs=? -complete=file CCTreeAppendDB  call s:CCTreeCmdLine.mMergeDB(<q-args>, s:cscopeid)
command! -nargs=0 CCTreeUnLoadDB               call s:CCTreeGlobals.mUnLoadDBs()
command! -nargs=0 CCTreeShowLoadedDBs          call s:CCTreeGlobals.mShowLoadedDBs()
command! -nargs=? -complete=customlist,s:CCTreeCompleteKwd
        \ CCTreeTraceForward call s:CCTreeTraceTreeForSymbol(<q-args>, 'c')
command! -nargs=? -complete=customlist,s:CCTreeCompleteKwd CCTreeTraceReverse  
            \ call s:CCTreeTraceTreeForSymbol(<q-args>, 'p')
command! -nargs=0 CCTreeLoadBufferUsingTag call s:CCTreeGlobals.mLoadBufferFromKeyword()
command! -nargs=0 CCTreePreviewBufferUsingTag call s:CCTreeGlobals.mPreviewBufferFromKeyword()
command! -nargs=0 CCTreeRecurseDepthPlus call s:CCTreeGlobals.mRecursiveDepthIncrease()
command! -nargs=0 CCTreeRecurseDepthMinus call s:CCTreeGlobals.mRecursiveDepthDecrease()
" Preview Window
command! -nargs=0 CCTreeWindowToggle 	call s:CCTreeGlobals.mDisplayToggle()
command! -nargs=0 CCTreeWindowSaveCopy call s:CCTreeGlobals.mPreviewSave()
" Run-time dynamic options
command! -nargs=1 -complete=customlist,s:CCTreeOptionsList CCTreeOptsEnable call s:CCTreeGlobals.mEnable(<q-args>)
command! -nargs=1 -complete=customlist,s:CCTreeOptionsList CCTreeOptsDisable call s:CCTreeGlobals.mDisable(<q-args>)
command! -nargs=1 -complete=customlist,s:CCTreeOptionsList CCTreeOptsToggle call s:CCTreeGlobals.mToggle(<q-args>)
"}}}
" {{{ finish (and init)
call s:CCTreeGlobals.mInit()
" restore 'cpo'
let &cpoptions = s:cpo_save
unlet s:cpo_save
" vim: ts=8 sw=4 sts=4 et foldenable foldmethod=marker foldcolumn=1
" }}}
