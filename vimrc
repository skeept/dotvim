" This must be first, because it changes other options as a side effect.
set nocompatible

" differentiate this from simple.vim (there it will be 1)
let g:is_vimrc_simple = 0

"default path for runtime files
"let g:p0 = split(&runtimepath, ',')[0]
let g:p0 = has("unix") ? "~/.vim" : "~/vimfiles"

" can I always use has('win32')?
let g:is_win = has('win32') || has('win64')

" put it at the start of vimrc but define function LocalSettingsEndingVimRC
" and call it at the end of vimrc
let g:read_localVimrc = 0
let s:local_settings = expand(g:p0 . "/local_settings.vim")
if filereadable(s:local_settings)
  execute "source " . s:local_settings
endif

" plan to use default package loading also
" decide on pathogen or vam (pathogen: 1, vam: 2, default package loading: 0)
if !exists('g:addon_manager')
  let g:addon_manager = 2
endif

"================== pathogen ================================================{{{
"we still use g:pathogen_disabled
let g:pathogen_disabled = []

if g:addon_manager == 1
  function! PathogenSetup()
    "call pathogen#helptags()
    "call pathogen#runtime_append_all_bundles()
    let g:pathogen_disabled += ['pyflakes', 'python-mode', 'PySmell']
    let g:pathogen_disabled += ['powerline', 'startify']
    let g:pathogen_disabled += ['hilinks']
    let g:pathogen_disabled += ['snipmate']
    let g:pathogen_disabled += ['lycosaexplorer'] "lycosa is to heavy
    let g:pathogen_disabled += ['Align', 'AutoAlign']
    "let g:pathogen_disabled += ['UltiSnips']
    if !has("python")
      let g:pathogen_disabled += ['lycosaexplorer', 'headlights']
      let g:pathogen_disabled += ['UltiSnips', 'pyflakes', 'python-mode']
    endif
    call pathogen#infect()
  endfunction

  call PathogenSetup()
endif
"==============================================================================}}}

"================== vim-addon-manager========================================{{{
if g:addon_manager == 2
function! SetupVAM()
  let g:active_addons = []
  command! -nargs=* -bar VAMAddToActiveAddons let g:active_addons += [<f-args>]

  let g:vim_addon_manager = {}
  let vam_install_path = escape(g:p0 . '/bundle/vam', ' \')
  exec 'set rtp+='. vam_install_path
  let g:vim_addon_manager.additional_addon_dirs = [
        \ escape(g:p0 . '/notused_plugins', ' \'),
        \ escape(g:p0 . '/local_plugins', ' \'),
        \ escape(g:p0 . '/notused_plugins/Infrequent', ' \'),
        \ ]

  VAMAddToActiveAddons ctrlp TaskList Supertab
  VAMAddToActiveAddons delimitMate CountJump
  VAMAddToActiveAddons vimproc vimfiler tlib NrrwRgn
  VAMAddToActiveAddons neocomplete
  "VAMAddToActiveAddons startify
  VAMAddToActiveAddons fzf fzf-vim
  "VAMAddToActiveAddons argumentative projectionist
  "VAMAddToActiveAddons Syntastic
  VAMAddToActiveAddons ale
  "VAMAddToActiveAddons neomake
  VAMAddToActiveAddons ps1 fugitive
  "VAMAddToActiveAddons gitv targets
  VAMAddToActiveAddons junkfile
  VAMAddToActiveAddons nerdcommenter
  VAMAddToActiveAddons unite-outline unite-qf
  VAMAddToActiveAddons vim-diff-enhanced
  VAMAddToActiveAddons magit fuzzysearch grepper
  VAMAddToActiveAddons FastFold
  "VAMAddToActiveAddons lightline
  VAMAddToActiveAddons leader-guide
  VAMAddToActiveAddons SmartusLine
  VAMAddToActiveAddons gv
  VAMAddToActiveAddons neoyank
  VAMAddToActiveAddons rsi
  VAMAddToActiveAddons vinegar
  VAMAddToActiveAddons vim-qf
  "VAMAddToActiveAddons peekaboo
  VAMAddToActiveAddons unite-session neomru
  VAMAddToActiveAddons textobj-entire textobj-python textobj-user
  VAMAddToActiveAddons ferret
  VAMAddToActiveAddons exchange
  VAMAddToActiveAddons gina
  "VAMAddToActiveAddons airline
  "VAMAddToActiveAddons obsession
  "VAMAddToActiveAddons LaTeX-Box vlatex SpellCheck LanguageTool
  "VAMAddToActiveAddons SnippetCompleteSnipMate SnippetComplete
  "VAMAddToActiveAddons yankstack
  if has("python3")
    VAMAddToActiveAddons UltiSnips
    VAMAddToActiveAddons denite
  endif

  call vam#ActivateAddons(g:active_addons, {'auto_install' : 0})

  command! -nargs=* -bar -complete=customlist,vam#install#InstalledAddonCompletion AA
        \ :call vam#ActivateAddons([<f-args>], {'auto_install' : 0, 'force_loading_plugins_now': 1})
endfunction
call SetupVAM()
endif
"==============================================================================}}}

"================== GetIsAddonActive =========================================={{{
function! GetIsAddonActive(addon)
  if !exists("g:addon_manager") || g:addon_manager == 0 "how can we know?
    return 0
  endif
  if g:addon_manager == 1 "Pathogen"
    return index(g:pathogen_disabled, a:addon) == -1
  else "vam-addon-manager
    return index(g:active_addons, a:addon) >= 0
  endif
endfunction
"==============================================================================}}}

"
" this is where all vimrc and simple settings go
" should I just move it to plugins folder?
" does this contain settings that should be read by packages? Leave it like
" this for now
"
execute "source " . g:p0 . "/common.vim"

execute "source " . g:p0 . "/denite.rc.vim"

"================== PreciseJump ==============================================={{{
"nnoremap ,f :call PreciseJumpF(-2, -1, 0)<CR>
nnoremap ,f :call PreciseJumpF(-1, -1, 0)<CR>
vnoremap ,f <ESC>:call PreciseJumpF(-1, -1, 1)<CR>
onoremap ,f :call PreciseJumpF(-1, -1, 0)<CR>
"==============================================================================}}}

"================== LibClang =================================================={{{
let g:clang_use_library = 1
"note, this does not work when the first file is loaded. Just reload the first
"file (:e!) and chill out

augroup ft_cpp_clang
  autocmd!
  autocmd FileType c,cpp call jraf#loadClangComplete()
augroup END
"==============================================================================}}}

"================== Bufstop ==================================================={{{
nnoremap <Leader>b :<C-U>call jraf#myBuffStopCall()<CR>
"==============================================================================}}}

"================== Statusline ================================================{{{
"set statusline=%-3.3n%t\ \ \ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%-3.3n%t\ \ %h%m%r\ %y%=%l/%L\ %3c\ \ \ %P
"set statusline=%-3.3n%t\ \ \ %h%m%r\ %y%=%{strftime(\"[%H:%M%p]\")}\ \ \ \ \ %l/%L\ \ %3c\ \ \ %P
"
"set statusline=%<%f%m\ \[%{&ff}:%{&fenc}:%Y]
"set statusline+=\ %{getcwd()}\ \ \[%{strftime('%Y/%b/%d\ %a\ %I:%M\ %p')}\]
"set statusline+=\ %=\ Line:%l\/%L\ Column:%c%V\ %P
"
"set statusline=%-3.3n%t\ \ \ %h%m%r%=[%{&ft}\,
"set statusline+=%{&ff}]\ \ \ %{strftime(\"[%H:%M%p]\")}
"set statusline+=\ \ \ \ \ %l/%L\ \ %3c\ \ \ %P
"
"set statusline=%2.2n\ %t\ %h%m%r%=[%{&ft}\,%{&ff}]
set statusline=%2.2n\ %t
set statusline+=\ %h%#Modified#%m%r%*%=
"set statusline+=%{XgetTagbarFunc()}
"set statusline+=%{GetWindowNR()}
set statusline+=%{GetNumTabsStr()}
set statusline+=%{CondDispFtFf()}
set statusline+=%{DispLTXCF()}
"set statusline+=\ %h%m%r%=%{CondDispFtFf()}
"set statusline+=%{tagbar#currenttag('[%s] ', '')}
"set statusline+=\ %{strftime(\"[%H:%M%p]\")} "do we want to show time?
set statusline+=\ %l/%L\ %2c\ %P

"=============================== smartusline =================================={{{
"%-3.3n%t   %h%m%r%=[%{&ft},%{&ff}]   %{strftime("[%H:%M%p]")}     %l/%L  %3c   %P
hi Modified guifg=black guibg=#FFA500
let g:smartusline_string_to_highlight = '%2.2n %t %h'
"let smartusline_deep_eval = 1
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"==============================================================================}}}
"==============================================================================}}}

"================== Python Settings ==========================================={{{
"some pylint settings
let g:pylint_onwrite = 0

"mapping for running python code
"nmap <F9> :SingleCompileRun<CR>

"================== python_mode (plugin) ======================================{{{
"some python mode configuration. Don't always use but for now disable some
"settings when used
let g:pymode_lint = 0
let g:pymode_rope = 0
let g:pymode_options_indent = 0
let g:pymode_breakpoint = 0
"==============================================================================}}}

"==============================================================================}}}

"================== Other commands/mappings/settings =========================={{{

"source explorer
let g:SrcExpl_isUpdateTags = 0

"don't enable showmarks, use \mt to toogle it
let g:showmarks_enable=0

"================== snipmate =================================================={{{
let g:snippets_dir = g:p0 . "/bundle/snipmate/snippets"
"==============================================================================}}}

"================== localvim =================================================={{{
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
"==============================================================================}}}

"================== yankRing / yankstack ======================================{{{
let g:yankring_paste_using_g = 0 "I want gp to select the pasted text
let g:yankring_history_file = '.yankring_history'
let g:yankring_history_dir = g:p0

if GetIsAddonActive('yankstack')
  nmap ,y <Plug>yankstack_substitute_older_paste
  nmap ,Y <Plug>yankstack_substitute_newer_paste
endif
"==============================================================================}}}

"================== autocomplpop (acp) ========================================{{{
if 0
"don't want to start this completion thing before x chars
let g:acp_behaviorKeywordLength = 12
let g:acp_completeOption = '.,w,b,k,t'

"fuction to toogle behaviour of autocomplpop
let g:is_acp_disabled = 0
function! ToggleAcpDisable()
  if g:is_acp_disabled == 0
    AcpLock
    let g:is_acp_disabled = 1
  else
    AcpUnlock
    let g:is_acp_disabled = 0
  endif
endfunction

"noremap <f11> :call ToggleAcpDisable()<CR>
"inoremap <f11> <ESC>:call ToggleAcpDisable()<CR>a
endif
"==============================================================================}}}

"================== ManPageView ==============================================={{{
let g:manpageview_winopen = "hsplit="
augroup manpageview
  autocmd!
  autocmd FileType man setlocal norelativenumber nonumber
augroup END
"also created a file in bundle/manpageview/ftplugin/man.vim with map q to quit
"==============================================================================}}}

"================== LanguageTool =============================================={{{
let g:languagetool_disable_rules = "WHITESPACE_RULE,EN_QUOTES,CURRENCY," .
      \ "COMMA_PARENTHESIS_WHITESPACE,EN_UNPAIRED_BRACKETS"
"==============================================================================}}}

"================== LustyExplorer and Juggler ================================={{{
"nmap <silent> ,lf :LustyFilesystemExplorer<CR>
"nmap <silent> ,lr :LustyFilesystemExplorerFromHere<CR>
"nmap <silent> ,lb :LustyBufferExplorer<CR>
"nmap <silent> ,lg :LustyBufferGrep<CR>
"nmap <silent> ,lj :LustyJuggler<CR>

"lusty juggler
let g:LustyJugglerShowKeys = 'a'
"==============================================================================}}}

"================== vim-pipe commands ========================================={{{
augroup vim_pipe
  autocmd!
  autocmd FileType python let b:vimpipe_command="python"
  autocmd FileType perl let b:vimpipe_command="perl"
  autocmd FileType tex let b:vimpipe_command="latexmk"
augroup END
"==============================================================================}}}

"================== ConqueTerm ================================================{{{
let g:ConqueTerm_ReadUnfocused = 1
"==============================================================================}}}

"================== Tasklist =================================================={{{
"useful for managing a todo list
noremap <leader>t_ <Plug>TaskList
noremap <leader>td :TaskList<CR>
"==============================================================================}}}

"================== LycosaExplorer ============================================{{{
if GetIsAddonActive('lycosaexplorer')
  call jrar#setupLycosa()
endif
"==============================================================================}}}

"some plugins don't work well with some enviroments, just try to adjust them
let g:LustyExplorerSuppressRubyWarning = 1
if !has("python")
  let g:loaded_gundo = 1
  let loaded_gundo = 1
endif

"don't load plugins in that cause errors for previous versions
if v:version < 702
  let g:loaded_ZoomWinPlugin = 1
  let g:loaded_tagbar = 1
endif
if v:version < 703
  let g:loaded_autoload_l9 = 1
endif

"load cscope in two levels up
noremap <Leader>csa :cs add ../../cscope.out ../..<CR>

"==============================================================================}}}

"================== delimitmate ==============================================={{{
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
"==============================================================================}}}

"================== fugitive =================================================={{{
nnoremap ,gcf :<C-U>Gcommit -v %<CR>
nnoremap ,gca :<C-U>Gcommit -v -a<CR>
nnoremap ,gp :<C-U>Git push<CR>
nnoremap ,gdf :<C-U>Git diff<CR>
"==============================================================================}}}

"================== Thesis Specific Settings =================================={{{
command! -complete=file -nargs=* Mtorig call jraf#myThesisEnv(<f-args>)
"==============================================================================}}}

"================== neocomplete ============================================={{{
if g:load_neocomplete
  call SetupNeocomplete()
endif
"==============================================================================}}}

"================== Syntastic ================================================={{{
"let g:syntastic_python_checkers=['flake8']
"==============================================================================}}}


if g:is_win
  let Grep_Path = 'C:\cygwin\bin\grep'
endif

if g:read_localVimrc == 1
  call LocalSettingsEndingVimRC()
endif


" vim: foldmethod=marker
