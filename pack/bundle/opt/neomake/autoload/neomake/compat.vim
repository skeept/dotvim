" Function to wrap Compatibility across different (Neo)Vim versions.

if v:version >= 704
    function! neomake#compat#getbufvar(buf, key, def) abort
        return getbufvar(a:buf, a:key, a:def)
    endfunction
else
    function! neomake#compat#getbufvar(buf, key, def) abort
        return get(getbufvar(a:buf, ''), a:key, a:def)
    endfunction
endif

unlockvar neomake#compat#json_true
unlockvar neomake#compat#json_false
unlockvar neomake#compat#json_null
unlockvar neomake#compat#json_none

if exists('v:none')
    let neomake#compat#json_none = v:none
else
    function! s:json_none() abort
    endfunction
    let neomake#compat#json_none = [function('s:json_none')]
endif

if exists('*json_decode')
    let neomake#compat#json_true = v:true
    let neomake#compat#json_false = v:false
    let neomake#compat#json_null = v:null

    if has('nvim')
      function! neomake#compat#json_decode(json) abort
          if a:json is# ''
              " Prevent Neovim from throwing E474: Attempt to decode a blank string.
              return g:neomake#compat#json_none
          endif
          return json_decode(a:json)
      endfunction
    else
      function! neomake#compat#json_decode(json) abort
          return json_decode(a:json)
      endfunction
    endif
else
    let neomake#compat#json_true = 1
    let neomake#compat#json_false = 0
    function! s:json_null() abort
    endfunction
    let neomake#compat#json_null = [function('s:json_null')]

    " Via Syntastic (https://github.com/vim-syntastic/syntastic/blob/6fb14d624b6081459360fdbba743f82cf84c8f92/autoload/syntastic/preprocess.vim#L576-L607),
    " based on https://github.com/MarcWeber/vim-addon-json-encoding/blob/master/autoload/json_encoding.vim.
    " @vimlint(EVL102, 1, l:true)
    " @vimlint(EVL102, 1, l:false)
    " @vimlint(EVL102, 1, l:null)
    function! neomake#compat#json_decode(json) abort " {{{2
        if a:json ==# ''
            return g:neomake#compat#json_none
        endif

        " The following is inspired by https://github.com/MarcWeber/vim-addon-manager and
        " http://stackoverflow.com/questions/17751186/iterating-over-a-string-in-vimscript-or-parse-a-json-file/19105763#19105763
        " A hat tip to Marc Weber for this trick
        if substitute(a:json, '\v\"%(\\.|[^"\\])*\"|true|false|null|[+-]?\d+%(\.\d+%([Ee][+-]?\d+)?)?', '', 'g') !~# "[^,:{}[\\] \t]"
            " JSON artifacts
            let true = g:neomake#compat#json_true
            let false = g:neomake#compat#json_false
            let null = g:neomake#compat#json_null

            try
                let object = eval(a:json)
            catch
                " malformed JSON
                let object = ''
            endtry
        else
            let object = ''
        endif

        return object
    endfunction " }}}2
    " @vimlint(EVL102, 0, l:true)
    " @vimlint(EVL102, 0, l:false)
    " @vimlint(EVL102, 0, l:null)
endif

lockvar neomake#compat#json_true
lockvar neomake#compat#json_false
lockvar neomake#compat#json_null

if exists('*uniq')
    function! neomake#compat#uniq(l) abort
        return uniq(a:l)
    endfunction
else
    " From ingo#collections#UniqueSorted.
    function! neomake#compat#uniq(l) abort
        if len(a:l) < 2
            return a:l
        endif

        let l:previousItem = a:l[0]
        let l:result = [a:l[0]]
        for l:item in a:l[1:]
            if l:item !=# l:previousItem
                call add(l:result, l:item)
                let l:previousItem = l:item
            endif
        endfor
        return l:result
    endfunction
endif

if exists('*reltimefloat')
    function! neomake#compat#reltimefloat() abort
        return reltimefloat(reltime())
    endfunction
else
    function! neomake#compat#reltimefloat() abort
        let t = split(reltimestr(reltime()), '\V.')
        return str2float(t[0] . '.' . t[1])
    endfunction
endif

" Wrapper around systemlist() that supports a list for a:cmd.
" It returns an empty string on error.
" NOTE: Neovim before 0.2.0 would throw an error (which is caught), but it
" does not set v:shell_error!
function! neomake#compat#systemlist(cmd) abort
    if empty(a:cmd)
        return []
    endif
    if has('nvim') && exists('*systemlist')
        " @vimlint(EVL108, 1)
        if !has('nvim-0.2.0')
            try
                return systemlist(a:cmd)
            catch /^Vim\%((\a\+)\)\=:E902/
                return ''
            endtry
        endif
        " @vimlint(EVL108, 0)
        return systemlist(a:cmd)
    endif

    if type(a:cmd) == type([])
        let cmd = join(map(a:cmd, 'neomake#utils#shellescape(v:val)'))
    else
        let cmd = a:cmd
    endif
    if exists('*systemlist')
        return systemlist(cmd)
    endif
    return split(system(cmd), '\n')
endfunction

function! neomake#compat#globpath_list(path, pattern, suf) abort
    if v:version >= 705 || (v:version == 704 && has('patch279'))
        return globpath(a:path, a:pattern, a:suf, 1)
    endif
    return split(globpath(a:path, a:pattern, a:suf), '\n')
endfunction

if has('nvim')
    if neomake#utils#IsRunningWindows()
        function! neomake#compat#get_argv(exe, args, args_is_list) abort
            if a:args_is_list
                " Convert it to a string to handle PATHEXT (e.g. .cmd files).
                " This might be skipped when `exepath(a:exe)[-4:] == '.exe'`,
                " but not worth it probably (and more fragile in the end?!).
                return join(map(copy([a:exe] + a:args), 'neomake#utils#shellescape(v:val)'))
            endif
            return a:exe . (empty(a:args) ? '' : ' '.a:args)
        endfunction
    else
        function! neomake#compat#get_argv(exe, args, args_is_list) abort
            if a:args_is_list
                return [a:exe] + a:args
            endif
            return a:exe . (empty(a:args) ? '' : ' '.a:args)
        endfunction
    endif
elseif neomake#has_async_support()  " Vim-async.
    if neomake#utils#IsRunningWindows()
        " Windows needs a shell to handle PATH/%PATHEXT% etc.
        function! neomake#compat#get_argv(exe, args, args_is_list) abort
            let prefix = &shell.' '.&shellcmdflag.' '
            if a:args_is_list
                if a:exe ==# &shell && get(a:args, 0) ==# &shellcmdflag
                    " Remove already existing &shell/&shellcmdflag from e.g. NeomakeSh.
                    let argv = join(map(copy(a:args[1:]), 'neomake#utils#shellescape(v:val)'))
                else
                    let argv = join(map(copy([a:exe] + a:args), 'neomake#utils#shellescape(v:val)'))
                endif
            else
                let argv = a:exe . (empty(a:args) ? '' : ' '.a:args)
                if argv[0:len(prefix)-1] ==# prefix
                    return argv
                endif
            endif
            return prefix.argv
        endfunction
    else
        function! neomake#compat#get_argv(exe, args, args_is_list) abort
            if a:args_is_list
                return [a:exe] + a:args
            endif
            " Use a shell to handle argv properly (Vim splits at spaces).
            let argv = a:exe . (empty(a:args) ? '' : ' '.a:args)
            return [&shell, &shellcmdflag, argv]
        endfunction
    endif
else
    " Vim (synchronously), via system().
    function! neomake#compat#get_argv(exe, args, args_is_list) abort
        if a:args_is_list
            return join(map(copy([a:exe] + a:args), 'neomake#utils#shellescape(v:val)'))
        endif
        return a:exe . (empty(a:args) ? '' : ' '.a:args)
    endfunction
endif

if v:version >= 704 || (v:version == 703 && has('patch831'))
    function! neomake#compat#gettabwinvar(t, w, v, d) abort
        return gettabwinvar(a:t, a:w, a:v, a:d)
    endfunction
else
    " Wrapper around gettabwinvar that has no default (older Vims).
    function! neomake#compat#gettabwinvar(t, w, v, d) abort
        let r = gettabwinvar(a:t, a:w, a:v)
        if r is# ''
            unlet r
            let r = a:d
        endif
        return r
    endfunction
endif

" Not really necessary for now, but allows to overwriting and extending.
if exists('*nvim_get_mode')
    function! neomake#compat#get_mode() abort
        let mode = nvim_get_mode()
        return mode.mode
    endfunction
else
    function! neomake#compat#get_mode() abort
        return mode(1)
    endfunction
endif

function! neomake#compat#in_completion() abort
    if pumvisible()
        return 1
    endif
    if has('patch-8.0.0283')
        let mode = mode(1)
        if mode[1] ==# 'c' || mode[1] ==# 'x'
            return 1
        endif
    endif
    return 0
endfunction

let s:prev_windows = []
if exists('*win_getid')
    function! neomake#compat#save_prev_windows() abort
        call add(s:prev_windows, [win_getid(winnr('#')), win_getid(winnr())])
    endfunction

    function! neomake#compat#restore_prev_windows() abort
        " Go back, maintaining the '#' window (CTRL-W_p).
        let [aw_id, pw_id] = remove(s:prev_windows, 0)
        let pw = win_id2win(pw_id)
        if pw && winnr() != pw
            let aw = win_id2win(aw_id)
            if aw
                exec aw . 'wincmd w'
            endif
            exec pw . 'wincmd w'
        endif
    endfunction
else
    function! neomake#compat#save_prev_windows() abort
        call add(s:prev_windows, [winnr('#'), winnr()])
    endfunction

    function! neomake#compat#restore_prev_windows() abort
        " Go back, maintaining the '#' window (CTRL-W_p).
        let [aw, pw] = remove(s:prev_windows, 0)
        if winnr() != pw
            if aw
                exec aw . 'wincmd w'
            endif
            exec pw . 'wincmd w'
        endif
    endfunction
endif
