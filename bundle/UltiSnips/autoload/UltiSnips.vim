if !exists('g:UltiSnips') | let g:UltiSnips = {} | endif | let s:c = g:UltiSnips

let s:did_setup = 0

" <sfile> does not work inside functions :(
let s:py_code = expand("<sfile>:h:h").'/py-code'

fun! UltiSnips#Setup()
  if !s:did_setup
    " Expand our path
    call s:c.Py("import vim, os, sys")
    call s:c.Py("sys.path.append(\"".escape(s:py_code,'"')."\")")
    call s:c.Py("from UltiSnips import UltiSnips_Manager")
    call s:c.Py("UltiSnips_Manager.expand_trigger = vim.eval('g:UltiSnipsExpandTrigger')")
    call s:c.Py("UltiSnips_Manager.forward_trigger = vim.eval('g:UltiSnipsJumpForwardTrigger')")
    call s:c.Py("UltiSnips_Manager.backward_trigger = vim.eval('g:UltiSnipsJumpBackwardTrigger')")

    " TODO: do this lazily - only when the user uses UltiSnip the first time
    au CursorMovedI * call g:UltiSnips.Py("UltiSnips_Manager.cursor_moved()")
    au CursorMoved * call g:UltiSnips.Py("UltiSnips_Manager.cursor_moved()")
    au BufLeave * call g:UltiSnips.Py("UltiSnips_Manager.leaving_buffer()")

    let s:did_setup = 1
  endif
endf

" lazily setup Ultisnip, then dispatch action to python's UltiSnips_Manager
" instance
" Allow calling CompensateForPUM for those actions requiring it
fun! UltiSnips#SetupM(c, s)
  call UltiSnips#Setup()
  if a:s == 'c'
    call CompensateForPUM()
  endif
  let s:c.pyResult = ""
  call s:c.Py("UltiSnips_Manager.".a:s)
  return ""
endf
" fun! UltiSnips#SetupV(fun, ...)
"   call UltiSnips#Setup()
"   return call('UltiSnips#'.a:fun, a:000)
" endf

" }}}

" editing snippets {{{

" craete a list of files which could be valid snippet files according to
" ft_filter. Its used by UltiSnips#ChooseSnippetFileToEditDefaultImplementation()
fun! UltiSnips#SnippetFilesByRuntimepathEditable(type_dir, filetype)
  let result = []

  let d = s:c[a:type_dir.type .'_ft_filter']
  let ft_filter = get(d, a:filetype, d.default)

  for r in map(split(&rtp, ","), 'v:val . "/'.(a:type_dir.dir).'"')
    if has_key(ft_filter, 'dir-regex') && !substitute(fnamemodify(r,':h'), "\\", "/", "g") =~ ft_filter['dir-regex']
      continue
    endif
    let filetypes = map(copy(get(ft_filter, 'filetypes', ['FILETYPE'])), 'substitute(v:val, "FILETYPE", &filetype,"g")')
    call extend(result, map(filetypes, 'r."/".v:val.".snippets"'))
  endfor
  return result
endf

" this requires tlib
fun! UltiSnips#ChooseSnippetFileToEditDefaultImplementation(filetype)
  try
          call tlib#input#List('mi', '', [])
  catch /.*/
          throw "you're missing tlib library"
  endtry

  let files = []
  for type_dir in [ {'type': 'UltiSnips', 'dir' : 'UltiSnips'}, {'type': 'snipmate', 'dir' : 'snippets'} ]
      call extend(files, UltiSnips#SnippetFilesByRuntimepathEditable(type_dir, a:filetype))
  endfor

  let exists = map(filter(copy(files), 'filereadable(v:val)'), '"exists:".v:val')
  let notExists = map(filter(copy(files), '!filereadable(v:val)'), '"does not exist yet:".v:val')

  let all = exists + notExists
  let select = tlib#input#List('mi', 'select files to be opened in splits', all)
  " TODO: honor EditSplit
  for idx in select
    exec 'sp '.fnameescape(substitute(all[idx - 1], '[^:]*:','',''))
  endfor
endf

" }}}


" default implementation finding snippets {{{1

fun! UltiSnips#SnippetFilesByRuntimepath(dir)
  let files = []
  for dir in split(&runtimepath,',')
    call extend(files, split(glob(dir.'/'.a:dir.'/*.snippets'),"\n"))
  endfor
  return files
endf

" default implementation. If you don't like it you can override it
" (or use your own python implemenation, see SnippetFilesForCurrentExpansion
" configuration option
" returns such:
" {'snipmate': [ 'foo.snippets', 'bar.snippets' ], 'UltiSnips' : ['z.snippets'] }
" depending on filetype and (snipmate|UltiSnips)_ft_filter configuration
" setting
fun! UltiSnips#SnippetFilesForCurrentExpansionDefaultImplementation(filetype)
  let result = {}
  for type_dir in [ {'type': 'UltiSnips', 'dir' : 'UltiSnips'}, {'type': 'snipmate', 'dir' : 'snippets'} ]
      let files = UltiSnips#SnippetFilesByRuntimepath(type_dir.dir)
      let d = s:c[type_dir.type .'_ft_filter']
      let ft_filter = get(d, a:filetype, d.default)

      let filetypes = map(copy(get(ft_filter, 'filetypes', ['FILETYPE'])), 'substitute(v:val, "FILETYPE", a:filetype,"g")')

      " filetype filter
      let files = filter(copy(files), 'index(filetypes, fnamemodify(v:val, ":t:r")) != -1')
      " directory filter
      if has_key(ft_filter, 'dir-regex')
        call filter(files, 'substitute(fnamemodify(v:val, ":h"), "\\", "/", "g") =~ ft_filter["dir-regex"]')
      endif
      let result[type_dir.type] = files
  endfor
  return result
endf

" }}}

fun! CompensateForPUM()
    """ The CursorMovedI event is not triggered while the popup-menu is visible,
    """ and it's by this event that UltiSnips updates its vim-state. The fix is
    """ to explicitly check for the presence of the popup menu, and update
    """ the vim-state accordingly.
    if pumvisible()
        call s:c.Py("UltiSnips_Manager.cursor_moved()")
    endif
endfunction

function! UltiSnips#FileTypeChanged()
    call s:c.Py("UltiSnips_Manager.reset_buffer_filetypes()")
    call s:c.Py("UltiSnips_Manager.add_buffer_filetypes('" . &ft . "')")
    return ""
endfunction

function! UltiSnips#AddSnippet(...)
    " Takes the same arguments as SnippetManager.add_snippet:
    " (trigger, value, descr, options, ft = "all", globals = None)
    call s:c.Py("UltiSnips_Manager.add_snippet(vim.eval('a:000'))")
    return ""
endfunction

function! UltiSnips#Anon(...)
    " Takes the same arguments as SnippetManager.expand_anon:
    " (value, trigger="", descr="", options="", globals = None)
    call s:c.Py("UltiSnips_Manager.expand_anon(vim.eval('a:000'))")
    return ""
endfunction
" }}}

fun! UltiSnips#CompleteSnippetTriggerFun(findstart, base)
  if a:findstart
      let g:a=787
    return col('.')
  else
      let g:x=787
    return s:c.completionItems
  endif
endf

fun! UltiSnips#ResetOmniFunc(s)
    let &l:omnifunc = a:s
    redraw
    return "\<c-n>\<c-p>"
endf

" vim: ts=8 sts=4 sw=4 expandtab
