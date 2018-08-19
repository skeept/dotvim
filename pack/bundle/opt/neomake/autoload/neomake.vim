" vim: ts=4 sw=4 et
scriptencoding utf-8

if !exists('s:make_id')
    let s:make_id = 0
endif
" A map of make_id to options, e.g. cwd when jobs where started.
if !exists('s:make_info')
    let s:make_info = {}
endif
if !exists('s:job_id')
    let s:job_id = 1
endif
if !exists('s:jobs')
    let s:jobs = {}
endif
if !exists('s:map_job_ids')
    let s:map_job_ids = {}
endif
if !exists('s:action_queue')
    let s:action_queue = []
endif
if !exists('s:action_queue_registered_events')
    let s:action_queue_registered_events = []
endif
let s:action_queue_timer_timeouts = get(g:, 'neomake_action_queue_timeouts', {1: 100, 2: 200, 3: 500})

" Errors by [maker_type][bufnr][lnum]
let s:current_errors = {'project': {}, 'file': {}}
" List of pending outputs by job ID.
let s:pending_outputs = {}

if !has('nvim')
    let s:kill_vim_timers = {}
endif

" A list of references to keep when profiling.
" Workaround for https://github.com/vim/vim/issues/2350, where
" https://github.com/blueyed/vader.vim/commit/e66d91dea is not enough.
let s:hack_keep_refs_for_profiling = []

" Can Neovim buffer output?
let s:nvim_can_buffer_output = has('nvim-0.3.0') ? 1 : 0

" Private function to access script-local variables during tests.
function! neomake#_get_s() abort
    return s:
endfunction

" Sentinels.
let s:unset_list = []
let s:unset_dict = {}
let s:unset = {}

let s:can_use_env_in_job_opts = has('patch-8.0.0902') && has('patch-8.0.1832')

let s:is_testing = exists('g:neomake_test_messages')

let s:async = has('nvim')
            \ || has('channel') && has('job') && has('patch-8.0.0027')
function! neomake#has_async_support() abort
    return s:async
endfunction

function! s:sort_jobs(a, b) abort
    return a:a.id - a:b.id
endfunction

function! neomake#GetJobs(...) abort
    if empty(s:jobs)
        return []
    endif
    let jobs = copy(values(s:jobs))
    if a:0
        call filter(jobs, 'index(a:1, v:val.id) != -1')
    endif
    return sort(jobs, function('s:sort_jobs'))
endfunction

function! neomake#GetJob(job_id) abort
    return s:jobs[a:job_id]
endfunction

" Not documented, only used in tests for now.
function! neomake#GetStatus() abort
    return {
                \ 'last_make_id': s:make_id,
                \ 'make_info': s:make_info,
                \ 'action_queue': s:action_queue,
                \ }
endfunction

" neomake#GetMakeOptions: not documented, only used internally for now.
" More lax when not being used in tests to avoid errors, but fail during tests.
if s:is_testing
    function! neomake#GetMakeOptions(...) abort
        let make_id = a:0 ? a:1 : s:make_id
        try
            let r = s:make_info[make_id]
        catch
            let msg = printf('GetMakeOptions failed: %s (in %s)', v:exception, v:throwpoint)
            call vader#log(msg)
            let g:neomake_test_errors += [msg]
            return {'verbosity': 3}
        endtry
        return r
    endfunction
else
    function! neomake#GetMakeOptions(...) abort
        let make_id = a:0 ? a:1 : s:make_id
        if !has_key(s:make_info, make_id)
            call neomake#log#warning('warning: missing make_info key: '.make_id.'.')
            return {'verbosity': get(g:, 'neomake_verbose', 1)}
        endif
        return s:make_info[make_id]
    endfunction
endif

function! neomake#ListJobs() abort
    if !s:async
        echom 'This Vim version has no support for jobs.'
        return
    endif
    let jobs = neomake#GetJobs()
    if empty(jobs)
        return
    endif
    echom 'make_id | job_id | name/maker'
    for jobinfo in jobs
        let desc = !empty(jobinfo.maker.name) && jobinfo.name != jobinfo.maker.name
                    \ ? jobinfo.name. ' ('.jobinfo.maker.name.')'
                    \ : jobinfo.name
        echom printf('%7d | %6d | %s', jobinfo.make_id, jobinfo.id, desc)
    endfor
endfunction

function! neomake#CancelMake(make_id, ...) abort
    if !has_key(s:make_info, a:make_id)
        call neomake#log#error('CancelMake: make not found: '.a:make_id.'.')
        return 0
    endif
    let make_info = s:make_info[a:make_id]
    let make_info.canceled = 1
    call neomake#log#debug('Cancelling make.', make_info)
    let bang = a:0 ? a:1 : 0
    let jobs = filter(copy(values(s:jobs)), 'v:val.make_id == a:make_id')
    for job in jobs
        call neomake#CancelJob(job.id, bang)
    endfor
    call s:clean_action_queue(make_info)
    " Ensure that make gets cleaned really, e.g. if there were no jobs yet.
    if has_key(s:make_info, a:make_id)
        call s:clean_make_info(make_info, bang)
    endif
    return 1
endfunction

function! neomake#CancelAllMakes(...) abort
    let bang = a:0 ? a:1 : 0
    for make_id in keys(s:make_info)
        call neomake#CancelMake(make_id, bang)
    endfor
endfunction

" Remove any queued actions for a jobinfo or make_info object.
function! s:clean_action_queue(job_or_make_info) abort
    let len_before = len(s:action_queue)
    call filter(s:action_queue, 'v:val[1][1][0] != a:job_or_make_info')
    let removed = len_before - len(s:action_queue)
    if removed
        call s:clean_action_queue_augroup()
        call neomake#log#debug(printf(
                    \ 'Removed %d action queue entries.',
                    \ removed), a:job_or_make_info)
    endif
endfunction

" Returns 1 if a job was canceled, 0 otherwise.
function! neomake#CancelJob(job_id, ...) abort
    let job_id = type(a:job_id) == type({}) ? a:job_id.id : +a:job_id
    let remove_always = a:0 ? a:1 : 0
    let jobinfo = get(s:jobs, job_id, {})
    call neomake#log#debug('Cancelling job.', jobinfo)

    call s:clean_action_queue(empty(jobinfo) ? {'id': job_id} : jobinfo)

    if empty(jobinfo)
        call neomake#log#error('CancelJob: job not found: '.job_id.'.')
        return 0
    endif

    if get(jobinfo, 'canceled', 0)
        call neomake#log#info('Job was canceled already.', jobinfo)
        if remove_always
            call s:CleanJobinfo(jobinfo)
        endif
        return 0
    endif

    let ret = 0
    if get(jobinfo, 'finished')
        call neomake#log#debug('Removing already finished job.', jobinfo)
    elseif has_key(jobinfo, 'exit_code')
        call neomake#log#debug('Job exited already.', jobinfo)
    elseif s:async
        let job = has('nvim') ? jobinfo.nvim_job : jobinfo.vim_job
        call neomake#log#debug(printf('Stopping job: %s.', job), jobinfo)
        if has('nvim')
            try
                call jobstop(job)
                let ret = 1
            catch /^Vim\%((\a\+)\)\=:\(E474\|E900\):/
                call neomake#log#info(printf(
                            \ 'jobstop failed: %s.', v:exception), jobinfo)
            endtry
        else
            " Use ch_status here, since job_status might be 'dead' already,
            " without the exit handler being called yet.
            if job_status(job) !=# 'run'
                call neomake#log#info(
                            \ 'job_stop: job was not running anymore.', jobinfo)
            else
                " NOTE: might be "dead" already, but that is fine.
                call job_stop(job)
                let ret = 1
                if job_status(job) ==# 'run'
                    let timer = timer_start(1000, function('s:kill_vimjob_cb'))
                    let s:kill_vim_timers[timer] = jobinfo
                endif
            endif
        endif
    endif
    let jobinfo.canceled = 1

    if ret == 0 || remove_always
        call s:CleanJobinfo(jobinfo)
    endif
    return ret
endfunction

function! s:kill_vimjob_cb(timer) abort
    let jobinfo = s:kill_vim_timers[a:timer]
    let vim_job = jobinfo.vim_job
    if job_status(vim_job) ==# 'run'
        call neomake#log#debug('Forcefully killing still running Vim job.', jobinfo)
        call job_stop(vim_job, 'kill')
    endif
    unlet s:kill_vim_timers[a:timer]
endfunction

function! neomake#CancelJobs(bang) abort
    call neomake#log#debug(printf('Cancelling %d jobs.', len(s:jobs)))
    for job_id in keys(s:jobs)
        call neomake#CancelJob(job_id, a:bang)
    endfor
endfunction

function! s:handle_get_list_entries(jobinfo, ...) abort
    if !a:0
        return s:pcall('s:handle_get_list_entries', [a:jobinfo])
    endif
    let jobinfo = a:jobinfo
    let jobinfo.serialize = 0
    let maker = jobinfo.maker
    try
        let entries = maker.get_list_entries(jobinfo)
    catch /^\%(Vim\%((\a\+)\)\=:\%(E48\|E523\)\)\@!/  " everything, but E48/E523 (sandbox / not allowed here)
        if v:exception ==# 'NeomakeTestsException'
            throw v:exception
        endif
        call neomake#log#exception(printf(
                    \ 'Error during get_list_entries for %s: %s.',
                    \ jobinfo.maker.name, v:exception), jobinfo)
        call s:CleanJobinfo(jobinfo)
        return 1
    finally
        let jobinfo.finished = 1
    endtry

    if type(entries) != type([])
        call neomake#log#error(printf('The get_list_entries method for maker %s did not return a list, but: %s.', jobinfo.maker.name, string(entries)[:100]), jobinfo)
    elseif !empty(entries) && type(entries[0]) != type({})
        call neomake#log#error(printf('The get_list_entries method for maker %s did not return a list of dicts, but: %s.', jobinfo.maker.name, string(entries)[:100]), jobinfo)
    else
        call s:ProcessEntries(jobinfo, entries)
    endif
    call s:CleanJobinfo(jobinfo)
    return 1
endfunction

function! s:MakeJob(make_id, options) abort
    let job_id = s:job_id
    let s:job_id += 1

    " Optional:
    "  - serialize (default: 0 for async (and get_list_entries),
    "                        1 for non-async)
    "  - serialize_abort_on_error (default: 0)
    "  - exit_callback (string/function, default: 0)
    let jobinfo = extend(copy(g:neomake#jobinfo#base), extend({
        \ 'id': job_id,
        \ 'name': empty(get(a:options.maker, 'name', '')) ? 'neomake_'.job_id : a:options.maker.name,
        \ 'maker': a:options.maker,
        \ 'bufnr': a:options.bufnr,
        \ 'file_mode': a:options.file_mode,
        \ 'ft': a:options.ft,
        \ 'cwd': s:make_info[a:options.make_id].cwd,
        \ }, a:options))

    let maker = jobinfo.maker

    if has_key(maker, 'get_list_entries')
        call neomake#log#info(printf(
                    \ '%s: getting entries via get_list_entries.',
                    \ maker.name), jobinfo)
        let s:jobs[jobinfo.id] = jobinfo
        let s:make_info[a:make_id].active_jobs += [jobinfo]
        call s:handle_get_list_entries(jobinfo)
        return jobinfo
    endif

    call extend(jobinfo, {
        \ 'output_stream': a:options.maker.output_stream,
        \ 'buffer_output': a:options.maker.buffer_output,
        \ }, 'keep')

    let error = ''
    try
        " Change to job's cwd (before args, for relative filename).
        let cd_error = jobinfo.cd()
        if !empty(cd_error)
            throw printf("Neomake: %s: could not change to maker's cwd (%s): %s.",
                        \ maker.name, jobinfo.cd_from_setting, cd_error)
        endif
        let jobinfo.argv = maker._get_argv(jobinfo)

        call neomake#utils#hook('NeomakeJobInit', {'jobinfo': jobinfo})

        let start_msg = s:async ? 'Starting async job' : 'Starting'
        if type(jobinfo.argv) == type('')
            let start_msg .= ' [string]: '.jobinfo.argv
        else
            let start_msg .= ': '.join(map(copy(jobinfo.argv), 'neomake#utils#shellescape(v:val)'))
        endif
        call neomake#log#info(start_msg.'.', jobinfo)

        let cwd = jobinfo.cwd
        let changed = !empty(jobinfo.cd_back_cmd)
        if changed
            call neomake#log#debug('cwd: '.cwd.' (changed).', jobinfo)
        else
            call neomake#log#debug('cwd: '.cwd.'.', jobinfo)
        endif

        let base_job_opts = {}
        if has_key(jobinfo, 'filename')
            if s:can_use_env_in_job_opts
                let base_job_opts = {
                            \ 'env': {
                            \   'NEOMAKE_FILE': jobinfo.filename
                            \ }}
            else
                let save_env_file = exists('$NEOMAKE_FILE') ? $NEOMAKE_FILE : s:unset
                let $NEOMAKE_FILE = jobinfo.filename
            endif
        endif

        " Lock maker to make sure it does not get changed accidentally, but
        " only with depth=1, so that a postprocess object can change itself.
        lockvar 1 maker
        if s:async
            if has('nvim')
                if jobinfo.buffer_output
                    let opts = extend(base_job_opts, {
                                \ 'stdout_buffered': 1,
                                \ 'stderr_buffered': 1,
                                \ })
                    if s:nvim_can_buffer_output == 1
                        let opts.on_exit = function('s:nvim_exit_handler_buffered')
                    else
                        call extend(opts, {
                                \ 'on_stdout': function('s:nvim_output_handler'),
                                \ 'on_stderr': function('s:nvim_output_handler'),
                                \ })
                        let opts.on_exit = function('s:nvim_exit_handler')
                    endif
                    let jobinfo.jobstart_opts = opts
                else
                    let opts = {
                                \ 'on_stdout': function('s:nvim_output_handler'),
                                \ 'on_stderr': function('s:nvim_output_handler'),
                                \ 'on_exit': function('s:nvim_exit_handler'),
                                \ }
                endif
                if has_key(maker, 'nvim_job_opts')
                    call extend(opts, maker.nvim_job_opts)
                endif
                if !has('nvim-0.3.0')
                            \ && !neomake#utils#IsRunningWindows()
                            \ && !has_key(opts, 'detach')
                            \ && !has_key(opts, 'pty')
                    " Always use detach to trigger setsid() with older Neovim.
                    let opts.detach = 1
                endif
                try
                    let job = jobstart(jobinfo.argv, opts)
                catch
                    let error = printf('Failed to start Neovim job: %s: %s.',
                                \ string(jobinfo.argv), v:exception)
                endtry
                if empty(error)
                    if job == 0
                        let error = printf('Failed to start Neovim job: %s: %s.',
                                    \ 'Job table is full or invalid arguments given', string(jobinfo.argv))
                    elseif job == -1
                        let error = printf('Failed to start Neovim job: %s: %s.',
                                    \ 'Executable not found', string(jobinfo.argv))
                    else
                        let s:map_job_ids[job] = jobinfo.id
                        let jobinfo.nvim_job = job
                        let s:jobs[jobinfo.id] = jobinfo

                        if get(jobinfo, 'uses_stdin', 0)
                            call jobsend(job, s:make_info[a:make_id].buffer_lines)
                            call jobclose(job, 'stdin')
                        endif
                    endif
                endif
            else
                " vim-async.
                let opts = extend(base_job_opts, {
                            \ 'out_cb': function('s:vim_output_handler_stdout'),
                            \ 'err_cb': function('s:vim_output_handler_stderr'),
                            \ 'close_cb': function('s:vim_exit_handler'),
                            \ 'mode': 'raw',
                            \ })
                if has_key(maker, 'vim_job_opts')
                    call extend(opts, maker.vim_job_opts)
                endif
                try
                    let job = job_start(jobinfo.argv, opts)
                    " Get this as early as possible!
                    let channel_id = ch_info(job)['id']
                catch
                    " NOTE: not covered in tests. Vim seems to always return
                    " a job. Might be able to trigger this using custom opts?!
                    let error = printf('Failed to start Vim job: %s: %s.',
                                \ jobinfo.argv, v:exception)
                endtry
                if empty(error)
                    let jobinfo.vim_job = job
                    let s:map_job_ids[channel_id] = jobinfo.id
                    let s:jobs[jobinfo.id] = jobinfo
                    call neomake#log#debug(printf('Vim job: %s.',
                                \ string(job_info(job))), jobinfo)
                    call neomake#log#debug(printf('Vim channel: %s.',
                                \ string(ch_info(job))), jobinfo)

                    if get(jobinfo, 'uses_stdin', 0)
                        call ch_sendraw(job, join(s:make_info[a:make_id].buffer_lines, "\n"))
                        call ch_close_in(job)
                    endif
                endif
            endif

            " Bail out on errors.
            if !empty(error)
                throw 'Neomake: '.error
            endif

            call neomake#utils#hook('NeomakeJobStarted', {'jobinfo': jobinfo})
        else
            " vim-sync.
            " Use a temporary file to capture stderr.
            let stderr_file = tempname()
            let argv = jobinfo.argv . ' 2>'.stderr_file

            try
                if get(jobinfo, 'uses_stdin', 0)
                    " Pass stdin to system(), but only if non-empty.
                    " Otherwise it might cause E677 (vim74-trusty at least).
                    let stdin = join(s:make_info[a:make_id].buffer_lines, "\n")
                    if !empty(stdin)
                        let output = system(argv, stdin)
                    else
                        let output = system(argv)
                    endif
                else
                    let output = system(argv)
                endif
            catch /^Vim(let):E484:/
                throw printf('Neomake: Could not run %s: %s.', argv, v:exception)
            endtry

            let jobinfo.id = job_id
            let s:jobs[job_id] = jobinfo
            let s:make_info[a:make_id].active_jobs += [jobinfo]

            call s:output_handler(jobinfo, split(output, '\r\?\n', 1), 'stdout', 0)
            let stderr_output = readfile(stderr_file)
            if !empty(stderr_output)
                call s:output_handler(jobinfo, stderr_output, 'stderr', 1)
            endif
            call delete(stderr_file)

            call s:exit_handler(jobinfo, v:shell_error)
            return jobinfo
        endif
    finally
        call jobinfo.cd_back()
        if exists('save_env_file')
            call s:restore_env('NEOMAKE_FILE', save_env_file)
        endif
    endtry
    let s:make_info[a:make_id].active_jobs += [jobinfo]
    return jobinfo
endfunction

if !s:can_use_env_in_job_opts
    function! s:restore_env(var, value) abort
        " Cannot unlet environment vars without patch 8.0.1832.
        exe printf('let $%s = %s', a:var, string(a:value is s:unset ? '' : a:value))
    endfunction
endif

let s:command_maker_base = copy(g:neomake#core#command_maker_base)
" Check if a temporary file is used, and set it in s:make_info in case it is.
function! s:command_maker_base._get_tempfilename(jobinfo) abort dict
    if has_key(self, 'supports_stdin')
        if type(self.supports_stdin) == type(function('tr'))
            let supports_stdin = self.supports_stdin(a:jobinfo)
        else
            let supports_stdin = self.supports_stdin
        endif
        if supports_stdin
            let a:jobinfo.uses_stdin = 1
            return get(self, 'tempfile_name', '-')
        endif
    endif

    if has_key(self, 'tempfile_name')
        return self.tempfile_name
    endif

    let tempfile_enabled = neomake#utils#GetSetting('tempfile_enabled', self, 1, a:jobinfo.ft, a:jobinfo.bufnr)
    if !tempfile_enabled
        return ''
    endif

    let make_id = a:jobinfo.make_id
    if !has_key(s:make_info[make_id], 'tempfile_name')
        if !exists('s:pid')
            let s:pid = getpid()
        endif
        let slash = neomake#utils#Slash()
        let bufname = bufname(a:jobinfo.bufnr)
        if empty(bufname)
            let temp_file = tempname() . slash . 'neomaketmp.'.a:jobinfo.ft
        else
            " Use absolute path internally, which is important for removal.
            let orig_file = neomake#utils#fnamemodify(a:jobinfo.bufnr, ':p')
            if empty(orig_file)
                let dir = tempname()
                let filename = fnamemodify(bufname, ':t')
                let s:make_info[make_id].tempfile_dir = dir
            else
                let dir = fnamemodify(orig_file, ':h')
                if filewritable(dir) != 2
                    let dir = tempname()
                    let s:make_info[make_id].tempfile_dir = dir
                    call neomake#log#debug('Using temporary directory for non-writable parent directory.')
                endif
                let filename = fnamemodify(orig_file, ':t')
                            \ .'@neomake_'.s:pid.'_'.make_id
                let ext = fnamemodify(orig_file, ':e')
                if !empty(ext)
                    let filename .= '.'.ext
                endif
                " Use hidden files to make e.g. pytest not trying to import it.
                if filename[0] !=# '.'
                    let filename = '.' . filename
                endif
            endif
            let temp_file = dir . slash . filename
        endif
        let s:make_info[make_id].tempfile_name = temp_file
    endif
    return s:make_info[make_id].tempfile_name
endfunction

" Get the filename to use for a:jobinfo's make/buffer.
function! s:command_maker_base._get_fname_for_buffer(jobinfo) abort
    let bufnr = a:jobinfo.bufnr
    let bufname = bufname(bufnr)
    let temp_file = ''
    let _uses_stdin = neomake#utils#GetSetting('uses_stdin', a:jobinfo.maker, s:unset_dict, a:jobinfo.ft, bufnr)
    if _uses_stdin isnot s:unset_dict
        let a:jobinfo.uses_stdin = _uses_stdin
        let uses_stdin = _uses_stdin
        call neomake#log#debug(printf('Using uses_stdin (%s) from setting.',
                    \ a:jobinfo.uses_stdin), a:jobinfo)
        if a:jobinfo.uses_stdin
            let temp_file = neomake#utils#GetSetting('tempfile_name', a:jobinfo.maker, '-', a:jobinfo.ft, bufnr)
        endif
    else
        if empty(bufname)
            let temp_file = self._get_tempfilename(a:jobinfo)
            if !get(a:jobinfo, 'uses_stdin', 0) && empty(temp_file)
                throw 'Neomake: no file name.'
            endif
            let used_for = 'unnamed'
        elseif getbufvar(bufnr, '&modified')
            let temp_file = self._get_tempfilename(a:jobinfo)
            if !get(a:jobinfo, 'uses_stdin', 0) && empty(temp_file)
                call neomake#log#debug('warning: buffer is modified. You might want to enable tempfiles.',
                            \ a:jobinfo)
            endif
            let used_for = 'modified'
        elseif !filereadable(bufname)
            let temp_file = self._get_tempfilename(a:jobinfo)
            if !get(a:jobinfo, 'uses_stdin', 0) && empty(temp_file)
                " Using ':p' as modifier is unpredictable as per doc, but OK.
                throw printf('Neomake: file is not readable (%s)', fnamemodify(bufname, ':p'))
            endif
            let used_for = 'unreadable'
        else
            let bufname = fnamemodify(bufname, ':.')
            let used_for = ''
        endif

        let uses_stdin = get(a:jobinfo, 'uses_stdin', 0)

        if !empty(used_for)
            if uses_stdin
                call neomake#log#debug(printf(
                            \ 'Using stdin for %s buffer (%s).', used_for, temp_file),
                            \ a:jobinfo)
            elseif !empty(temp_file)
                call neomake#log#debug(printf(
                            \ 'Using tempfile for %s buffer: "%s".', used_for, temp_file),
                            \ a:jobinfo)
            endif
        endif
    endif

    let make_info = s:make_info[a:jobinfo.make_id]
    " Handle stdin when supports_stdin sets self.tempfile_name = ''.
    if uses_stdin
        if !has_key(make_info, 'buffer_lines')
            let make_info.buffer_lines = neomake#utils#get_buffer_lines(bufnr)
        endif
        let bufname = temp_file
    elseif !empty(temp_file)
        " Use relative path for args.
        let bufname = fnamemodify(temp_file, ':.')
        let temp_file = fnamemodify(temp_file, ':p')
        if !has_key(make_info, 'tempfiles')
            let make_info.tempfiles = [temp_file]
            let make_info.created_dirs = s:create_dirs_for_file(temp_file)
            call neomake#utils#write_tempfile(bufnr, temp_file)
        elseif temp_file !=# make_info.tempfiles[0]
            call extend(make_info.created_dirs, s:create_dirs_for_file(temp_file))
            call writefile(readfile(make_info.tempfiles[0], 'b'), temp_file, 'b')
            call add(make_info.tempfiles, temp_file)
        endif
        let a:jobinfo.tempfile = temp_file
    endif

    if !has_key(make_info, 'automake_tick')
        let tick = [getbufvar(a:jobinfo.bufnr, 'changedtick'),
                    \  a:jobinfo.ft]
        let make_info.automake_tick = tick
        call neomake#log#debug('Setting neomake_automake_tick.', a:jobinfo)
        call setbufvar(a:jobinfo.bufnr, 'neomake_automake_tick', tick)
    endif

    let a:jobinfo.filename = bufname
    return bufname
endfunction

function! s:create_dirs_for_file(fpath) abort
    let created_dirs = []
    let last_dir = a:fpath
    while 1
        let temp_dir = fnamemodify(last_dir, ':h')
        if isdirectory(temp_dir) || last_dir ==# temp_dir
            break
        endif
        call insert(created_dirs, temp_dir)
        let last_dir = temp_dir
    endwhile
    for dir in created_dirs
        call mkdir(dir, '', 0700)
    endfor
    return created_dirs
endfunction

function! s:command_maker_base._bind_args() abort dict
    " Resolve args, which might be a function or dictionary.
    if type(self.args) == type(function('tr'))
        let args = call(self.args, [])
    elseif type(self.args) == type({})
        let args = call(self.args.fn, [], self.args)
    else
        let args = copy(self.args)
    endif
    let self.args = args
    return self
endfunction

function! s:command_maker_base._get_argv(jobinfo) abort dict
    let filename = self._get_fname_for_args(a:jobinfo)
    let args_is_list = type(self.args) == type([])
    if args_is_list
        let args = neomake#utils#ExpandArgs(self.args)
        if !empty(filename)
            call add(args, filename)
        endif
    elseif !empty(filename)
        let args = copy(self.args)
        let args .= (empty(args) ? '' : ' ').neomake#utils#shellescape(filename)
    else
        let args = self.args
    endif
    return neomake#compat#get_argv(self.exe, args, args_is_list)
endfunction

function! s:GetMakerForFiletype(ft, maker_name) abort
    for config_ft in neomake#utils#get_config_fts(a:ft)
        call neomake#utils#load_ft_makers(config_ft)
        let f = 'neomake#makers#ft#'.config_ft.'#'.a:maker_name
        if exists('*'.f)
            let maker = call(f, [])
            return maker
        endif
    endfor
    return s:unset_dict
endfunction

function! neomake#get_maker_by_name(maker_name, ...) abort
    let for_ft = a:0 ? a:1 : 0
    let ft_config = for_ft is# 0 ? &filetype : for_ft
    let bufnr = bufnr('%')
    if a:maker_name !~# '\v^\w+$'
        throw printf('Neomake: Invalid maker name: "%s"', a:maker_name)
    endif

    let maker = neomake#utils#GetSetting('maker', {'name': a:maker_name}, s:unset_dict, ft_config, bufnr)
    if maker is# s:unset_dict
        if a:maker_name ==# 'makeprg'
            let maker = s:get_makeprg_maker()
        elseif for_ft isnot# 0
            let maker = s:GetMakerForFiletype(for_ft, a:maker_name)
        else
            call neomake#utils#load_global_makers()
            let f = 'neomake#makers#'.a:maker_name.'#'.a:maker_name
            if exists('*'.f)
                let maker = call(f, [])
            endif
        endif
    endif
    if type(maker) != type({})
        throw printf('Neomake: Got non-dict for maker %s: %s',
                    \ a:maker_name, maker)
    endif
    if maker isnot# s:unset_dict && !has_key(maker, 'name')
        let maker.name = a:maker_name
    endif
    return maker
endfunction

function! neomake#GetMaker(name_or_maker, ...) abort
    let for_ft = a:0 ? a:1 : 0
    let bufnr = bufnr('%')
    if type(a:name_or_maker) == type({})
        let maker = a:name_or_maker
        if !has_key(maker, 'name')
            let maker.name = 'unnamed_maker'
        endif
    else
        let maker = neomake#get_maker_by_name(a:name_or_maker, for_ft)
        if maker is# s:unset_dict
            if !a:0
                " Check &filetype if no args where provided.
                let maker = neomake#get_maker_by_name(a:name_or_maker, &filetype)
            endif
        endif
        if maker is# s:unset_dict
            if for_ft isnot# 0
                throw printf('Neomake: Maker not found (for %s): %s',
                            \ !empty(for_ft) ? 'filetype '.for_ft : 'empty filetype',
                            \ a:name_or_maker)
            else
                throw printf('Neomake: Maker not found (without filetype): %s',
                            \ a:name_or_maker)
            endif
        endif
    endif
    return neomake#create_maker_object(maker, a:0 ? a:1 : &filetype)
endfunction

" NOTE: uses ft and bufnr for config only.
function! neomake#create_maker_object(maker, ft) abort
    let [maker, ft, bufnr] = [a:maker, a:ft, bufnr('%')]

    " Create the maker object.
    let GetEntries = neomake#utils#GetSetting('get_list_entries', maker, -1, ft, bufnr)
    if GetEntries isnot# -1
        let maker = copy(maker)
        let maker.get_list_entries = GetEntries
    else
        let maker = extend(copy(s:command_maker_base), copy(maker))
    endif
    if !has_key(maker, 'get_list_entries')
        " Set defaults for command/job based makers.
        let defaults = extend(
                    \ copy(g:neomake#config#_defaults['maker_defaults']),
                    \ neomake#config#get('maker_defaults'))
        call extend(defaults, {
            \ 'exe': maker.name,
            \ 'args': [],
            \ })
        if !has_key(maker, 'process_output') && !has_key(maker, 'process_json')
            call extend(defaults, {
                \ 'errorformat': &errorformat,
                \ })
        endif
        for [key, default] in items(defaults)
            let maker[key] = neomake#utils#GetSetting(key, {'name': maker.name}, get(maker, key, default), ft, bufnr, 1)
            unlet default  " for Vim without patch-7.4.1546
        endfor
    endif
    if v:profiling
        call add(s:hack_keep_refs_for_profiling, maker)
    endif
    return maker
endfunction

if exists('*getcompletion')
    function! s:get_makers_for_pattern(pattern) abort
        " Get function prefix based on pattern, until the first backslash.
        let prefix = substitute(a:pattern, '\v\\.*', '', '')

        " NOTE: the pattern uses &ignorecase.
        let funcs = getcompletion(prefix.'[a-z]', 'function')
        call filter(funcs, 'v:val =~# a:pattern')
        " Remove prefix.
        call map(funcs, 'v:val['.len(prefix).':]')
        " Only keep lowercase function names.
        call filter(funcs, "v:val =~# '\\m^[a-z].*('")
        " Remove parenthesis and #.* (for project makers).
        return sort(map(funcs, "substitute(v:val, '\\v[(#].*', '', '')"))
    endfunction
else
    function! s:get_makers_for_pattern(pattern) abort
        let funcs_output = neomake#utils#redir('fun /'.a:pattern)
        return sort(map(split(funcs_output, '\n'),
                    \ "substitute(v:val, '\\v^.*#(.*)\\(.*$', '\\1', '')"))
    endfunction
endif

function! neomake#GetMakers(ft) abort
    " Get all makers for a given filetype.  This is used from completion.
    " XXX: this should probably use a callback or some other more stable
    " approach to get the list of makers (than looking at the lowercase
    " functions)?!

    let makers = []
    " Do not use 'b:neomake_jsx_javascript_foo_maker' twice for
    " ft=jsx.javascript.
    let used_vars = []
    for ft in neomake#utils#get_config_fts(a:ft)
        call neomake#utils#load_ft_makers(ft)

        " Add sorted list per filetype.
        let add = []

        let maker_names = s:get_makers_for_pattern('neomake#makers#ft#'.ft.'#\l')
        for maker_name in maker_names
            if index(makers, maker_name) == -1 && index(add, maker_name) == -1
                let add += [maker_name]
            endif
        endfor

        " Get makers from g:/b: variables.
        for v in sort(extend(keys(g:), keys(b:)))
            if index(used_vars, v) != -1
                continue
            endif
            let maker_name = matchstr(v, '\v^neomake_'.ft.'_\zs[0-9a-z_]+\ze_maker$')
            if !empty(maker_name)
                        \ && index(makers, maker_name) == -1
                        \ && index(add, maker_name) == -1
                let used_vars += [v]
                let add += [maker_name]
            endif
        endfor

        " Get makers from new-style config.
        for [maker_name, val] in items(neomake#config#get('ft.'.ft))
            if has_key(val, 'maker')
                        \ && index(makers, maker_name) == -1
                        \ && index(add, maker_name) == -1
                let add += [maker_name]
            endif
        endfor

        call sort(add)
        call extend(makers, add)
    endfor
    return makers
endfunction

function! neomake#GetProjectMakers() abort
    call neomake#utils#load_global_makers()
    return s:get_makers_for_pattern('neomake#makers#\(ft#\)\@!\l')
endfunction

function! neomake#GetEnabledMakers(...) abort
    let file_mode = a:0
    if !file_mode
        " If we have no filetype, use the global default makers.
        " This variable is also used for project jobs, so it has no
        " buffer local ('b:') counterpart for now.
        let enabled_makers = copy(get(g:, 'neomake_enabled_makers', []))
        if empty(enabled_makers)
            let makeprg_maker = s:get_makeprg_maker()
            if !empty(makeprg_maker)
                let makeprg_maker = neomake#GetMaker(makeprg_maker)
                let makeprg_maker.auto_enabled = 1
                let enabled_makers = [makeprg_maker]
            endif
        else
            call map(enabled_makers, "extend(neomake#GetMaker(v:val),
                        \ {'auto_enabled': 0}, 'error')")
        endif
    else
        let enabled_makers = []
        let makers = neomake#utils#GetSetting('enabled_makers', {}, s:unset_list, a:1, bufnr('%'))
        if makers is# s:unset_list
            let auto_enabled = 1
            for config_ft in neomake#utils#get_config_fts(a:1)
                call neomake#utils#load_ft_makers(config_ft)
                let fnname = 'neomake#makers#ft#'.config_ft.'#EnabledMakers'
                if exists('*'.fnname)
                    let makers = call(fnname, [])
                    break
                endif
            endfor
        else
            let auto_enabled = 0
        endif

        let makers = neomake#map_makers(makers, a:1, auto_enabled)
        for maker in makers
            let maker.auto_enabled = auto_enabled
            let enabled_makers += [maker]
        endfor
    endif
    return enabled_makers
endfunction

let s:ignore_automake_events = 0
function! s:HandleLoclistQflistDisplay(jobinfo, loc_or_qflist, ...) abort
    let open_val = a:0 ? a:1 : get(g:, 'neomake_open_list', 0)
    if !open_val
        return
    endif
    let height = get(g:, 'neomake_list_height', 10)
    if !height
        return
    endif
    let height = min([len(a:loc_or_qflist), height])
    if a:jobinfo.file_mode
        call neomake#log#debug('Handling location list: executing lwindow.', a:jobinfo)
        let cmd = 'lwindow'
    else
        call neomake#log#debug('Handling quickfix list: executing cwindow.', a:jobinfo)
        let cmd = 'cwindow'
    endif
    if open_val == 2
        let make_id = a:jobinfo.make_id
        let make_info = s:make_info[make_id]
        let s:ignore_automake_events += 1
        try
            call neomake#compat#save_prev_windows()

            let win_count = winnr('$')
            exe cmd height
            let new_win_count = winnr('$')
            if win_count == new_win_count
                " No new window, adjust height eventually.
                let found = 0

                if get(make_info, '_did_lwindow', 0)
                    for w in range(1, winnr('$'))
                        if getwinvar(w, 'neomake_window_for_make_id') == make_id
                            let found = w
                            break
                        endif
                    endfor
                    if found
                        let cmd = printf('%dresize %d', found, height)
                        call neomake#log#debug(printf(
                                    \ 'Resizing existing quickfix window: %s.',
                                    \ cmd), a:jobinfo)
                        exe cmd
                    else
                        call neomake#log#debug(
                                    \ 'Could not find corresponding quickfix window.',
                                    \ a:jobinfo)
                    endif
                endif
            elseif new_win_count > win_count
                if &filetype !=# 'qf'
                    call neomake#log#debug(printf(
                                \ 'WARN: unexpected filetype for new window: %s',
                                \ &filetype), a:jobinfo)
                else
                    call neomake#log#debug(printf(
                                \ 'list window has been opened (old count: %d, new count: %d).',
                                \ win_count, new_win_count), a:jobinfo)
                    let w:neomake_window_for_make_id = a:jobinfo.make_id
                endif
            else
                call neomake#log#debug(printf(
                            \ 'list window has been closed (old count: %d, new count: %d).',
                            \ win_count, new_win_count), a:jobinfo)
            endif
            call neomake#compat#restore_prev_windows()
            let make_info._did_lwindow = 1
        finally
            let s:ignore_automake_events -= 1
        endtry
    else
        exe cmd height
    endif
endfunction

" Experimental/private wrapper.
function! neomake#_handle_list_display(jobinfo, ...) abort
    if a:0
        let list = a:1
    else
        let list = a:jobinfo.file_mode ? getloclist(0) : getqflist()
    endif
    call s:HandleLoclistQflistDisplay(a:jobinfo, list, 2)
endfunction

" Queue an action to be processed later for autocmd a:event or through a timer
" for a:event=Timer.
" It will call a:data[0], with a:data[1] as args (where the first should be
" a jobinfo object).  The callback should return 1 if it was successful,
" with 0 it will be re-queued.
" When called recursively (queueing the same event/data again, it will be
" re-queued also).
function! s:queue_action(events, data) abort
    let job_or_make_info = a:data[1][0]
    if has_key(job_or_make_info, 'make_id')
        let jobinfo = job_or_make_info
        let log_context = jobinfo
    else
        let make_info = job_or_make_info
        let log_context = make_info.options
    endif
    call neomake#log#debug(printf('Queueing action: %s for %s.',
                \ a:data[0], join(a:events, ', ')), log_context)

    for event in a:events
        if event ==# 'Timer'
            if !exists('jobinfo.action_queue_timer_tries')
                let job_or_make_info.action_queue_timer_tries = {'count': 1, 'data': a:data[0]}
            else
                let job_or_make_info.action_queue_timer_tries.count += 1
            endif
            if has_key(s:action_queue_timer_timeouts, job_or_make_info.action_queue_timer_tries.count)
                let timeout = s:action_queue_timer_timeouts[job_or_make_info.action_queue_timer_tries.count]
            else
                throw printf('Neomake: Giving up handling Timer callbacks after %d attempts. Please report this. See :messages for more information.', len(s:action_queue_timer_timeouts))
            endif
            if has('timers')
                if exists('s:action_queue_timer')
                    call timer_stop(s:action_queue_timer)
                endif
                let s:action_queue_timer = timer_start(timeout, function('s:process_action_queue_timer_cb'))
                call neomake#log#debug(printf(
                            \ 'Retrying Timer event in %dms.', timeout), job_or_make_info)
            else
                call neomake#log#debug('Retrying Timer event on CursorHold(I).', job_or_make_info)
                if !exists('#neomake_event_queue#CursorHold')
                    let s:action_queue_registered_events += ['CursorHold', 'CursorHoldI']
                    augroup neomake_event_queue
                        exe 'autocmd CursorHold,CursorHoldI * call s:process_action_queue('''.event.''')'
                    augroup END
                endif
            endif
        else
            if !exists('#neomake_event_queue#'.event)
                let s:action_queue_registered_events += [event]
                augroup neomake_event_queue
                    exe 'autocmd '.event.' * call s:process_action_queue('''.event.''')'
                augroup END
            endif
        endif
    endfor
    call add(s:action_queue, [a:events, a:data])
endfunction

function! s:process_action_queue_timer_cb(...) abort
    call neomake#log#debug(printf(
                \ 'action queue: callback for Timer queue (%d).', s:action_queue_timer))
    unlet s:action_queue_timer
    call s:process_action_queue('Timer')
endfunction

function! s:process_action_queue(event) abort
    let queue = s:action_queue
    let q_for_this_event = []
    let i = 0
    for [events, v] in queue
        if index(events, a:event) != -1
            call add(q_for_this_event, [i, v])
        endif
        let i += 1
    endfor
    call neomake#log#debug(printf('action queue: processing for %s (%d items, winnr: %d).',
                \ a:event, len(q_for_this_event), winnr()), {'bufnr': bufnr('%')})

    let processed = []
    let removed = 0
    let abort = 0
    for [i, data] in q_for_this_event
        let job_or_make_info = data[1][0]
        let v = remove(queue, i - removed)
        let removed += 1
        if abort
            call add(queue, v)
            continue
        endif
        let log_context = has_key(job_or_make_info, 'make_id') ? job_or_make_info : job_or_make_info.options

        call neomake#log#debug(printf('action queue: calling %s.',
                    \ data[0]), log_context)
        try
            " Call the queued action.  On failure they should have requeued
            " themselves already.
            let rv = call(data[0], data[1])
        catch /^Neomake: /
            let error = substitute(v:exception, '^Neomake: ', '', '')
            call neomake#log#exception(error, log_context)

            " Cancel job in case its action failed to get re-queued after X
            " attempts.
            if has_key(job_or_make_info, 'id')
                call neomake#CancelJob(job_or_make_info.id)
            endif
            continue
        endtry
        if rv is# 1
            let processed += [data]
        elseif a:event !=# 'Timer' && has_key(job_or_make_info, 'action_queue_timer_tries')
            call neomake#log#debug('s:process_action_queue: decrementing timer tries for non-Timer event.', job_or_make_info)
            let job_or_make_info.action_queue_timer_tries.count -= 1
        endif
    endfor
    call neomake#log#debug(printf('action queue: processed %d items.',
                \ len(processed)), {'bufnr': bufnr('%')})

    call s:clean_action_queue_augroup()
endfunction


if has('timers')
    function! s:get_left_events() abort
        let r = {}
        for [events, _] in s:action_queue
            for event in events
                let r[event] = 1
            endfor
        endfor
        return keys(r)
    endfunction
else
    function! s:get_left_events() abort
        let r = {}
        for [events, _] in s:action_queue
            for event in events
                if event ==# 'Timer'
                    let r['CursorHold'] = 1
                    let r['CursorHoldI'] = 1
                else
                    let r[event] = 1
                endif
            endfor
        endfor
        return keys(r)
    endfunction
endif


function! s:clean_action_queue_augroup() abort
    if empty(s:action_queue_registered_events)
        return
    endif
    let left_events = s:get_left_events()

    if empty(left_events)
        autocmd! neomake_event_queue
        augroup! neomake_event_queue
    else
        let clean_events = []
        for event in s:action_queue_registered_events
            if index(left_events, event) == -1
                let clean_events += [event]
            endif
        endfor
        if !empty(clean_events)
            augroup neomake_event_queue
            for event in clean_events
                if exists('#neomake_event_queue#'.event)
                    exe 'au! '.event
                endif
            endfor
            augroup END
        endif
    endif
    let s:action_queue_registered_events = left_events
endfunction

" Get a maker for &makeprg.
" This could be cached, but needs to take into account / set &errorformat,
" and other settings that are handled by neomake#GetMaker.
function! s:get_makeprg_maker() abort
    if empty(&makeprg)
        return {}
    elseif &makeprg =~# '\s'
        let maker = neomake#utils#MakerFromCommand(&makeprg)
    else
        let maker = neomake#utils#MakerFromCommand([&makeprg])
    endif
    let maker.name = 'makeprg'
    " Do not append file.  &makeprg should contain %/# for this instead.
    let maker.append_file = 0
    return neomake#GetMaker(maker)
endfunction

function! s:Make(options) abort
    let is_automake = !empty(expand('<abuf>'))
    if is_automake
        if s:ignore_automake_events
            call neomake#log#debug(printf(
                        \ 'Ignoring Make through autocommand due to s:ignore_automake_events=%d.', s:ignore_automake_events), {'winnr': winnr()})
            return []
        endif
        let disabled = neomake#config#get_with_source('disabled', 0)
        if disabled[0]
            call neomake#log#debug(printf(
                        \ 'Make through autocommand disabled via %s.', disabled[1]))
            return []
        endif
    endif

    let s:make_id += 1
    let make_id = s:make_id
    let options = extend(copy(a:options), {
                \ 'file_mode': 1,
                \ 'bufnr': bufnr('%'),
                \ 'ft': &filetype,
                \ 'make_id': make_id,
                \ }, 'keep')
    let bufnr = options.bufnr
    let file_mode = options.file_mode

    let s:make_info[make_id] = {
                \ 'cwd': getcwd(),
                \ 'verbosity': get(g:, 'neomake_verbose', 1),
                \ 'active_jobs': [],
                \ 'finished_jobs': [],
                \ 'options': options,
                \ }
    let make_info = s:make_info[make_id]
    if &verbose
        let make_info.verbosity += &verbose
        call neomake#log#debug(printf(
                    \ 'Adding &verbose (%d) to verbosity level: %d.',
                    \ &verbose, make_info.verbosity), options)
    endif
    if make_info.verbosity >= 3
        call neomake#log#debug(printf(
                    \ 'Calling Make with options %s.',
                    \ string(filter(copy(options), "index(['bufnr', 'make_id'], v:key) == -1"))), {'make_id': make_id, 'bufnr': bufnr})
    endif

    " Use pre-compiled jobs (used with automake).
    if has_key(options, 'jobs')
        let jobs = map(copy(options.jobs), "extend(v:val, {'make_id': make_id})")
        unlet options.jobs
    else
        if has_key(options, 'enabled_makers')
            let makers = neomake#map_makers(options.enabled_makers, options.ft, 0)
            unlet options.enabled_makers
        else
            let makers = call('neomake#GetEnabledMakers', file_mode ? [options.ft] : [])
            if empty(makers)
                if file_mode
                    let msg = printf('Nothing to make: no enabled file mode makers (filetype=%s).', options.ft)
                    if is_automake
                        call neomake#log#debug(msg, options)
                    else
                        call neomake#log#warning(msg, options)
                    endif
                    unlet s:make_info[make_id]
                    return []
                endif
            endif
        endif
        let jobs = neomake#core#create_jobs(options, makers)
    endif

    if empty(jobs)
        call neomake#log#debug('Nothing to make: no valid makers.', options)
        call s:clean_make_info(make_info)
        return []
    endif

    let maker_info = join(map(copy(jobs),
                \ "v:val.maker.name . (get(v:val.maker, 'auto_enabled', 0) ? ' (auto)' : '')"), ', ')
    call neomake#log#debug(printf(
                \ 'Running makers: %s.', maker_info), options)

    let make_info.jobs_queue = jobs

    if file_mode
        " XXX: this clears counts for job's buffer only, but we add counts for
        " the entry's buffers, which might be different!
        call neomake#statusline#ResetCountsForBuf(bufnr)
        if g:neomake_place_signs
            call neomake#signs#Reset(bufnr, 'file')
        endif
    else
        call neomake#statusline#ResetCountsForProject()
        if g:neomake_place_signs
            call neomake#signs#ResetProject()
        endif
    endif

    let w:neomake_make_ids = add(get(w:, 'neomake_make_ids', []), make_id)

    " Cancel any already running jobs for the makers from these jobs.
    if !empty(s:jobs)
        " @vimlint(EVL102, 1, l:job)
        for job in jobs
            let running_already = values(filter(copy(s:jobs),
                        \ 'v:val.maker == job.maker'
                        \ .' && v:val.bufnr == job.bufnr'
                        \ ." && !get(v:val, 'canceled')"))
            if !empty(running_already)
                let jobinfo = running_already[0]
                call neomake#log#info(printf(
                            \ 'Cancelling already running job (%d.%d) for the same maker.',
                            \ jobinfo.make_id, jobinfo.id), {'make_id': make_id})
                call neomake#CancelJob(jobinfo.id, 1)
            endif
        endfor
    endif

    " Start all jobs in the queue (until serialized).
    let jobinfos = []
    while 1
        if empty(make_info.jobs_queue)
            break
        endif
        let jobinfo = s:handle_next_job({})
        if empty(jobinfo)
            break
        endif
        call add(jobinfos, jobinfo)
        if jobinfo.serialize
            " Break and continue through exit handler.
            break
        endif
    endwhile
    return jobinfos
endfunction

function! s:AddExprCallback(jobinfo, prev_list) abort
    if s:need_to_postpone_loclist(a:jobinfo)
        return s:queue_action(['BufEnter', 'WinEnter'], ['s:AddExprCallback',
                    \ [a:jobinfo, a:prev_list] + a:000])
    endif
    let maker = a:jobinfo.maker
    let file_mode = a:jobinfo.file_mode
    let list = file_mode ? getloclist(0) : getqflist()
    let prev_index = len(a:prev_list)
    let index = prev_index-1
    let Postprocess = neomake#utils#GetSetting('postprocess', maker, [], a:jobinfo.ft, a:jobinfo.bufnr)
    if type(Postprocess) != type([])
        let postprocessors = [Postprocess]
    else
        let postprocessors = Postprocess
    endif
    let debug = neomake#utils#get_verbosity(a:jobinfo) >= 3 || !empty(get(g:, 'neomake_logfile'))
    let maker_name = maker.name
    let make_info = s:make_info[a:jobinfo.make_id]
    let default_type = 'unset'

    let entries = []
    let changed_entries = {}
    let removed_entries = []
    let different_bufnrs = {}
    let llen = len(list)
    let bufnr_from_temp = {}
    let bufnr_from_stdin = {}
    let tempfile_bufnrs = has_key(make_info, 'tempfiles') ? map(copy(make_info.tempfiles), 'bufnr(v:val)') : []
    let uses_stdin = get(a:jobinfo, 'uses_stdin', 0)
    while index < llen - 1
        let index += 1
        let entry = list[index]
        let entry.maker_name = maker_name

        let before = copy(entry)
        " Handle unlisted buffers via tempfiles and uses_stdin.
        if file_mode && entry.bufnr && entry.bufnr != a:jobinfo.bufnr
                    \ && (!empty(tempfile_bufnrs) || uses_stdin)
            let map_bufnr = index(tempfile_bufnrs, entry.bufnr)
            if map_bufnr != -1
                let entry.bufnr = a:jobinfo.bufnr
                let map_bufnr = tempfile_bufnrs[map_bufnr]
                if !has_key(bufnr_from_temp, map_bufnr)
                    let bufnr_from_temp[map_bufnr] = []
                endif
                let bufnr_from_temp[map_bufnr] += [index+1]
            elseif uses_stdin
                if !buflisted(entry.bufnr) && bufexists(entry.bufnr)
                    if !has_key(bufnr_from_stdin, entry.bufnr)
                        let bufnr_from_stdin[entry.bufnr] = []
                    endif
                    let bufnr_from_stdin[entry.bufnr] += [index+1]
                    let entry.bufnr = a:jobinfo.bufnr
                endif
            endif
        endif
        if debug && entry.bufnr && entry.bufnr != a:jobinfo.bufnr
            if !has_key(different_bufnrs, entry.bufnr)
                let different_bufnrs[entry.bufnr] = 1
            else
                let different_bufnrs[entry.bufnr] += 1
            endif
        endif
        if !empty(postprocessors)
            let g:neomake_postprocess_context = {'jobinfo': a:jobinfo}
            try
                for F in postprocessors
                    if type(F) == type({})
                        call call(F.fn, [entry], F)
                    else
                        call call(F, [entry], maker)
                    endif
                    unlet! F  " vim73
                endfor
            finally
                unlet! g:neomake_postprocess_context  " Might be unset already with sleep in postprocess.
            endtry
        endif
        if entry != before
            let changed_entries[index] = entry
            if debug
                call neomake#log#debug(printf(
                  \ 'Modified list entry %d (postprocess): %s.',
                  \ index + 1,
                  \ string(neomake#utils#diff_dict(before, entry))),
                  \ a:jobinfo)
            endif
        endif

        if entry.valid <= 0
            if entry.valid < 0 || maker.remove_invalid_entries
                call insert(removed_entries, index)
                let entry_copy = copy(entry)
                call neomake#log#debug(printf(
                            \ 'Removing invalid entry: %s (%s).',
                            \ remove(entry_copy, 'text'),
                            \ string(entry_copy)), a:jobinfo)
                continue
            endif
        endif

        if empty(entry.type) && entry.valid
            if default_type ==# 'unset'
                let default_type = neomake#utils#GetSetting('default_entry_type', maker, 'W', a:jobinfo.ft, a:jobinfo.bufnr)
            endif
            if !empty(default_type)
                let entry.type = default_type
                let changed_entries[index] = entry
            endif
        endif
        call add(entries, entry)
    endwhile

    " Add marker for custom quickfix to the first (new) entry.
    if neomake#quickfix#is_enabled() && !empty(entries)
        let config = {
                    \ 'name': maker_name,
                    \ 'short': get(a:jobinfo.maker, 'short_name', maker_name[:3]),
                    \ }
        let marker_entry = copy(entries[0])
        let marker_entry.text .= printf(' nmcfg:%s', string(config))
        let changed_entries[prev_index] = marker_entry
    endif

    if !empty(changed_entries) || !empty(removed_entries)
        let list = file_mode ? getloclist(0) : getqflist()
        if !empty(changed_entries)
            for k in keys(changed_entries)
                let list[k] = changed_entries[k]
            endfor
        endif
        if !empty(removed_entries)
            for k in removed_entries
                call remove(list, k)
            endfor
        endif
        if file_mode
            call setloclist(0, list, 'r')
        else
            call setqflist(list, 'r')
        endif
    endif

    if !empty(bufnr_from_temp) || !empty(bufnr_from_stdin)
        if !has_key(make_info, '_wipe_unlisted_buffers')
            let make_info._wipe_unlisted_buffers = []
        endif
        let make_info._wipe_unlisted_buffers += keys(bufnr_from_stdin) + keys(bufnr_from_stdin)
        if !empty(bufnr_from_temp)
            for [tempbuf, entries_idx] in items(bufnr_from_temp)
                call neomake#log#debug(printf(
                            \ 'Used bufnr from temporary buffer %d (%s) for %d entries: %s.',
                            \ tempbuf,
                            \ bufname(+tempbuf),
                            \ len(entries_idx),
                            \ join(entries_idx, ', ')), a:jobinfo)
            endfor
        endif
        if !empty(bufnr_from_stdin)
            for [tempbuf, entries_idx] in items(bufnr_from_stdin)
                call neomake#log#debug(printf(
                            \ 'Used bufnr from stdin buffer %d (%s) for %d entries: %s.',
                            \ tempbuf,
                            \ bufname(+tempbuf),
                            \ len(entries_idx),
                            \ join(entries_idx, ', ')), a:jobinfo)
            endfor
        endif
    endif
    if !empty(different_bufnrs)
        call neomake#log#debug(printf('WARN: seen entries with bufnr different from jobinfo.bufnr (%d): %s, current bufnr: %d.', a:jobinfo.bufnr, string(different_bufnrs), bufnr('%')))
    endif

    return s:ProcessEntries(a:jobinfo, entries, a:prev_list)
endfunction

function! s:already_queued_actions(jobinfo) abort
    " Check if there are any queued actions for this job.
    let queued_actions = []
    for [_, v] in s:action_queue
        if v[1][0] == a:jobinfo
            let queued_actions += [v[0]]
        endif
    endfor
    return queued_actions
endfunction

function! s:CleanJobinfo(jobinfo, ...) abort
    if get(a:jobinfo, 'pending_output', 0) && !get(a:jobinfo, 'canceled', 0)
        call neomake#log#debug(
                    \ 'Output left to be processed, not cleaning job yet.', a:jobinfo)
        return
    endif

    let queued_actions = s:already_queued_actions(a:jobinfo)
    if !empty(queued_actions)
        call neomake#log#debug(printf(
                    \ 'Skipping cleaning of job info because of queued actions: %s.',
                    \ join(queued_actions, ', ')), a:jobinfo)
        return s:queue_action(['WinEnter'], ['s:CleanJobinfo', [a:jobinfo]])
    endif

    call neomake#log#debug('Cleaning jobinfo.', a:jobinfo)
    let a:jobinfo.finished = 1

    if !has_key(s:make_info, a:jobinfo.make_id)
        return
    endif
    let make_info = s:make_info[a:jobinfo.make_id]
    call filter(make_info.active_jobs, 'v:val != a:jobinfo')

    if has_key(s:jobs, get(a:jobinfo, 'id', -1))
        call remove(s:jobs, a:jobinfo.id)
        call filter(s:map_job_ids, 'v:val != a:jobinfo.id')

        if has_key(s:pending_outputs, a:jobinfo.id)
            unlet s:pending_outputs[a:jobinfo.id]
        endif
    endif

    if exists('s:kill_vim_timers')
        for [timer, job] in items(s:kill_vim_timers)
            if job == a:jobinfo
                call timer_stop(+timer)
                unlet s:kill_vim_timers[timer]
                break
            endif
        endfor
    endif

    if !get(a:jobinfo, 'canceled', 0)
                \ && !get(a:jobinfo, 'failed_to_start', 0)
        let make_info.finished_jobs += [a:jobinfo]
        call neomake#utils#hook('NeomakeJobFinished', {'jobinfo': a:jobinfo})
    endif

    " Trigger cleanup (and autocommands) if all jobs have finished.
    if empty(make_info.active_jobs) && empty(make_info.jobs_queue)
        call s:clean_make_info(make_info)
        return 1
    endif
endfunction

function! s:clean_make_info(make_info, ...) abort
    let make_id = a:make_info.options.make_id
    let bang = a:0 ? a:1 : 0
    if !bang && !empty(a:make_info.active_jobs)
        call neomake#log#debug(printf(
                    \ 'Skipping cleaning of make info: %d active jobs.',
                    \ len(a:make_info.active_jobs)), a:make_info.options)
        return
    endif

    " Assert: there should be no queued actions for jobs or makes.
    if s:is_testing
        let queued = []
        for [_, v] in s:action_queue
            if has_key(v[1][0], 'make_id')
                let jobinfo = v[1][0]
                if jobinfo.make_id == make_id && v[0] !=# 's:CleanJobinfo'
                    let queued += ['job '.jobinfo.id]
                endif
            else
                if v[1][0] == a:make_info
                    let queued += ['make '.make_id]
                endif
            endif
        endfor
        if !empty(queued)
            throw 'action queue is not empty: '.string(queued)
        endif
    endif

    if exists('*neomake#statusline#make_finished')
        call neomake#statusline#make_finished(a:make_info)
    endif

    if !empty(a:make_info.finished_jobs)
        " Clean old signs after all jobs have finished, so that they can be
        " reused, avoiding flicker and keeping them for longer in general.
        if g:neomake_place_signs
            if a:make_info.options.file_mode
                call neomake#signs#CleanOldSigns(a:make_info.options.bufnr, 'file')
            else
                call neomake#signs#CleanAllOldSigns('project')
            endif
        endif
        call s:clean_for_new_make(a:make_info)
        call neomake#EchoCurrentError(1)
        if get(a:make_info, 'canceled', 0)
            call neomake#log#debug('Skipping final processing for canceled make.', a:make_info)
            call s:do_clean_make_info(a:make_info)
        else
            call s:handle_locqf_list_for_finished_jobs(a:make_info)
        endif
    else
        call s:do_clean_make_info(a:make_info)
    endif
endfunction

function! s:do_clean_make_info(make_info) abort
    call neomake#log#debug('Cleaning make info.', a:make_info.options)
    let make_id = a:make_info.options.make_id

    " Remove make_id from its window.
    let [t, w] = s:GetTabWinForMakeId(make_id)
    let make_ids = neomake#compat#gettabwinvar(t, w, 'neomake_make_ids', [])
    let idx = index(make_ids, make_id)
    if idx != -1
        call remove(make_ids, idx)
        call settabwinvar(t, w, 'neomake_make_ids', make_ids)
    endif

    " Clean up temporary files and buffers.
    let wipe_unlisted_buffers = get(a:make_info, '_wipe_unlisted_buffers', [])
    let tempfiles = get(a:make_info, 'tempfiles')
    if !empty(tempfiles)
        for tempfile in tempfiles
            if delete(tempfile) == 0
                call neomake#log#debug(printf('Removing temporary file: "%s".',
                            \ tempfile))
            else
                call neomake#log#warning(printf('Failed to remove temporary file: "%s".',
                            \ tempfile))
            endif
            let bufnr_tempfile = bufnr(tempfile)
            if bufnr_tempfile != -1 && !buflisted(bufnr_tempfile)
                let wipe_unlisted_buffers += [bufnr_tempfile]
            endif
        endfor

        " Only delete the dir, if Vim supports it.
        if v:version >= 705 || (v:version == 704 && has('patch1107'))
            for dir in reverse(copy(get(a:make_info, 'created_dirs')))
                call delete(dir, 'd')
            endfor
        endif
    endif
    if !empty(wipe_unlisted_buffers)
        if !empty(wipe_unlisted_buffers)
            call neomake#compat#uniq(sort(wipe_unlisted_buffers))
        endif
        call neomake#log#debug(printf('Wiping out %d unlisted/remapped buffers: %s.',
                    \ len(wipe_unlisted_buffers),
                    \ string(wipe_unlisted_buffers)))
        exe (&report < 2 ? 'silent ' : '').'bwipeout '.join(wipe_unlisted_buffers)
    endif

    let buf_prev_makes = getbufvar(a:make_info.options.bufnr, 'neomake_automake_make_ids')
    if !empty(buf_prev_makes)
        call filter(buf_prev_makes, 'v:val != make_id')
        call setbufvar(a:make_info.options.bufnr, 'neomake_automake_make_ids', buf_prev_makes)
    endif

    unlet s:make_info[make_id]
endfunction

function! s:handle_locqf_list_for_finished_jobs(make_info) abort
    let file_mode = a:make_info.options.file_mode
    let create_list = !get(a:make_info, 'created_locqf_list', 0)

    let open_val = get(g:, 'neomake_open_list', 0)
    let height = open_val ? get(g:, 'neomake_list_height', 10) : 0
    if height
        let close_list = create_list || empty(file_mode ? getloclist(0) : getqflist())
    else
        let close_list = 0
    endif

    if file_mode
        if create_list && !bufexists(a:make_info.options.bufnr)
            call neomake#log#info('No buffer found for location list!', a:make_info.options)
            let create_list = 0
            let close_list = 0
        elseif (create_list || close_list)
            if index(get(w:, 'neomake_make_ids', []), a:make_info.options.make_id) == -1
                call neomake#log#debug(
                            \ 'Postponing final location list handling (in another window).',
                            \ {'make_id': a:make_info.options.make_id, 'winnr': winnr()})
                return s:queue_action(['WinEnter'], ['s:handle_locqf_list_for_finished_jobs',
                            \ [a:make_info] + a:000])
            endif

            " TODO: merge with s:need_to_postpone_output_processing.
            if neomake#compat#in_completion()
                call neomake#log#debug(
                            \ 'Postponing final location list handling during completion.',
                            \ a:make_info.options)
                return s:queue_action(['CompleteDone'], ['s:handle_locqf_list_for_finished_jobs',
                            \ [a:make_info] + a:000])
            endif
            let mode = neomake#compat#get_mode()
            if index(['n', 'i'], mode) == -1
                call neomake#log#debug(printf(
                            \ 'Postponing final location list handling for mode "%s".', mode),
                            \ a:make_info.options)
                return s:queue_action(['Timer'], ['s:handle_locqf_list_for_finished_jobs',
                            \ [a:make_info] + a:000])
            endif
        endif
    endif

    " Close empty list.
    if close_list
        if file_mode
            call neomake#log#debug('Handling location list: executing lclose.', {'winnr': winnr()})
            lclose
        else
            call neomake#log#debug('Handling quickfix list: executing cclose.')
            cclose
        endif
    endif

    if create_list
        if file_mode
            call neomake#log#debug('Cleaning location list.', {'make_id': a:make_info.options.make_id})
            call setloclist(0, [])
        else
            call neomake#log#debug('Cleaning quickfix list.', {'make_id': a:make_info.options.make_id})
            call setqflist([])
        endif
    endif

    let hook_context = {
                \ 'make_id': a:make_info.options.make_id,
                \ 'options': a:make_info.options,
                \ 'finished_jobs': a:make_info.finished_jobs,
                \ }
    call neomake#utils#hook('NeomakeFinished', hook_context)
    call s:do_clean_make_info(a:make_info)
    return 1
endfunction

function! neomake#VimLeave() abort
    call neomake#log#debug('Calling VimLeave.')
    for make_id in keys(s:make_info)
        call neomake#CancelMake(make_id)
    endfor
endfunction

" Create a location/quickfix list once per make run.
" Returns the current list (empty if it was created).
function! s:create_locqf_list(jobinfo) abort
    let make_info = s:make_info[a:jobinfo.make_id]
    if get(make_info, 'created_locqf_list', 0)
        return a:jobinfo.file_mode ? getloclist(0) : getqflist()
    endif
    let make_info.created_locqf_list = 1

    let file_mode = make_info.options.file_mode
    if file_mode
        call neomake#log#debug('Creating location list.', a:jobinfo)
        call setloclist(0, [])
    else
        call neomake#log#debug('Creating quickfix list.', a:jobinfo)
        call setqflist([])
    endif
    return []
endfunction

function! s:clean_for_new_make(make_info) abort
    if get(a:make_info, 'cleaned_for_make', 0)
        return
    endif
    let file_mode = a:make_info.options.file_mode
    " XXX: needs to handle buffers for list entries?!
    " See "get_list_entries: minimal example (from doc)" in
    " tests/makers.vader.
    if file_mode
        let bufnr = a:make_info.options.bufnr
        if has_key(s:current_errors['file'], bufnr)
            unlet s:current_errors['file'][bufnr]
        endif
        call neomake#highlights#ResetFile(bufnr)
        call neomake#log#debug('File-level errors cleaned.',
                    \ {'make_id': a:make_info.options.make_id, 'bufnr': bufnr})
    else
        " TODO: test
        for buf in keys(s:current_errors.project)
            unlet s:current_errors['project'][buf]
            call neomake#highlights#ResetProject(+buf)
        endfor
    endif
    let a:make_info.cleaned_for_make = 1
endfunction

" Change to a job's cwd, if any.
" Returns: a list:
"  - error (empty for success)
"  - directory changed into (empty if skipped)
"  - command to change back to the current workding dir (might be empty)

" Call a:fn with a:args and queue it, in case if fails with E48/E523.
function! s:pcall(fn, args) abort
    let jobinfo = a:args[0]
    try
        return call(a:fn, a:args + [1])
    catch /^\%(Vim\%((\a\+)\)\=:\%(E48\|E523\)\)/  " only E48/E523 (sandbox / not allowed here)
        call neomake#log#debug('Error during pcall: '.v:exception.'.', jobinfo)
        call neomake#log#debug(printf('(in %s)', v:throwpoint), jobinfo)
        " Might throw in case of X failed attempts.
        call s:queue_action(['Timer', 'WinEnter'], [a:fn, a:args])
    endtry
    return 0
endfunction

" Do we need to replace (instead of append) the location/quickfix list, for
" :lwindow to not open it with only invalid entries?!
" Without patch-7.4.379 this does not work though, and a new list needs to
" be created (which is not done).
" @vimlint(EVL108, 1)
let s:needs_to_replace_qf_for_lwindow = has('patch-7.4.379')
            \ && (!has('patch-7.4.1752') || (has('nvim') && !has('nvim-0.2.0')))
" @vimlint(EVL108, 0)

function! s:ProcessEntries(jobinfo, entries, ...) abort
    if s:need_to_postpone_loclist(a:jobinfo)
        return s:queue_action(['BufEnter', 'WinEnter'], ['s:ProcessEntries',
                    \ [a:jobinfo, a:entries] + a:000])
    endif
    if !a:0 || type(a:[len(a:000)]) != 0
        return s:pcall('s:ProcessEntries', [a:jobinfo, a:entries] + a:000)
    endif
    let file_mode = a:jobinfo.file_mode

    call neomake#log#debug(printf(
                \ 'Processing %d entries.', len(a:entries)), a:jobinfo)

    if a:0 > 1
        " Via errorformat processing, where the list has been set already.
        let prev_list = a:1
        let new_list = file_mode ? getloclist(0) : getqflist()
    else
        " Fix entries with get_list_entries/process_output/process_json.
        let maker_name = a:jobinfo.maker.name
        call map(a:entries, 'extend(v:val, {'
                    \ . "'bufnr': str2nr(get(v:val, 'bufnr', 0)),"
                    \ . "'lnum': str2nr(v:val.lnum),"
                    \ . "'col': str2nr(get(v:val, 'col', 0)),"
                    \ . "'vcol': str2nr(get(v:val, 'vcol', 0)),"
                    \ . "'type': get(v:val, 'type', 'E'),"
                    \ . "'nr': get(v:val, 'nr', -1),"
                    \ . "'maker_name': maker_name,"
                    \ . '})')

        let cd_error = a:jobinfo.cd()
        if !empty(cd_error)
            call neomake#log#debug(printf(
                        \ "Could not change to job's cwd (%s): %s.",
                        \ a:jobinfo.cd_from_setting, cd_error), a:jobinfo)
        endif

        let prev_list = s:create_locqf_list(a:jobinfo)

        try
            let list_entries = a:entries
            " Add marker for custom quickfix to the first (new) entry.
            if neomake#quickfix#is_enabled() && !empty(a:entries)
                let config = {
                            \ 'name': maker_name,
                            \ 'short': get(a:jobinfo.maker, 'short_name', maker_name[:3]),
                            \ }
                let marker_entry = copy(a:entries[0])
                let marker_entry.text .= printf(' nmcfg:%s', string(config))
                let list_entries = [marker_entry] + a:entries[1:]
            endif

            if file_mode
                if s:needs_to_replace_qf_for_lwindow
                    call setloclist(0, prev_list + list_entries, 'r')
                else
                    call setloclist(0, list_entries, 'a')
                endif
            else
                if s:needs_to_replace_qf_for_lwindow
                    call setqflist(prev_list + list_entries, 'r')
                else
                    call setqflist(list_entries, 'a')
                endif
            endif
        finally
            call a:jobinfo.cd_back()
        endtry
        let new_list = file_mode ? getloclist(0) : getqflist()
        let parsed_entries = new_list[len(prev_list):]
        let idx = 0
        for e in parsed_entries
            if a:entries[idx].bufnr != e.bufnr
                call neomake#log#debug(printf(
                            \ 'Updating entry bufnr: %s => %s.',
                            \ a:entries[idx].bufnr, e.bufnr))
                let a:entries[idx].bufnr = e.bufnr
            endif
            let idx += 1
        endfor
    endif
    call s:clean_for_new_make(s:make_info[a:jobinfo.make_id])

    let counts_changed = 0
    let maker_type = file_mode ? 'file' : 'project'
    let do_highlight = get(g:, 'neomake_highlight_columns', 1)
                \ || get(g:, 'neomake_highlight_lines', 0)
    let signs_by_bufnr = {}
    let debug = neomake#utils#get_verbosity(a:jobinfo) >= 3 || !empty(get(g:, 'neomake_logfile'))
    let entries_with_lnum_by_bufnr = {}
    let skipped_without_bufnr = []
    let skipped_without_lnum = []

    let idx = -1
    for entry in a:entries
        let idx += 1
        if !file_mode
            if neomake#statusline#AddQflistCount(entry)
                let counts_changed = 1
            endif
        endif

        if !entry.bufnr
            if debug
                let skipped_without_bufnr += [idx]
            endif
            continue
        endif

        if file_mode
            if neomake#statusline#AddLoclistCount(entry.bufnr, entry)
                let counts_changed = 1
            endif
        endif

        if !entry.lnum
            if debug
                let skipped_without_lnum += [idx]
            endif
            continue
        endif

        if !has_key(entries_with_lnum_by_bufnr, entry.bufnr)
            let entries_with_lnum_by_bufnr[entry.bufnr] = []
            let signs_by_bufnr[entry.bufnr] = []
            if !exists('s:current_errors[maker_type][entry.bufnr]')
                let s:current_errors[maker_type][entry.bufnr] = {}
            endif
        endif

        if do_highlight || g:neomake_place_signs
            " NOTE: only lnum/type required for signs.  Similar for do_highlight?!
            call add(entries_with_lnum_by_bufnr[entry.bufnr], entry)
        endif

        " Track all errors by buffer and line
        if !has_key(s:current_errors[maker_type][entry.bufnr], entry.lnum)
            let s:current_errors[maker_type][entry.bufnr][entry.lnum] = [entry]
        else
            call add(s:current_errors[maker_type][entry.bufnr][entry.lnum], entry)
        endif
    endfor

    " Handle placing signs and highlights.
    for [b, entries] in items(entries_with_lnum_by_bufnr)
        if g:neomake_place_signs
            call neomake#signs#PlaceSigns(b, entries, maker_type)
        endif
        if do_highlight
            for entry in entries
                call neomake#highlights#AddHighlight(entry, maker_type)
            endfor
        endif
    endfor

    if !empty(skipped_without_bufnr)
        call neomake#log#debug(printf('Skipped %d entries without bufnr: %s.',
                    \ len(skipped_without_bufnr),
                    \ string(map(skipped_without_bufnr, 'a:entries[v:val]'))), a:jobinfo)
    endif

    if !empty(skipped_without_lnum)
        call neomake#log#debug(printf(
                    \ 'Could not place signs for %d entries without line number: %s.',
                    \ len(skipped_without_lnum),
                    \ string(map(skipped_without_lnum, 'a:entries[v:val]'))), a:jobinfo)
    endif

    if !counts_changed
        let counts_changed = new_list != prev_list
    endif
    if counts_changed
        call neomake#utils#hook('NeomakeCountsChanged', {'reset': 0, 'jobinfo': a:jobinfo})
    endif

    if !empty(new_list)
        call s:HandleLoclistQflistDisplay(a:jobinfo, new_list)
    endif
    call neomake#highlights#ShowHighlights()
    return 1
endfunction

function! s:ProcessJobOutput(jobinfo, lines, source, ...) abort
    if s:need_to_postpone_loclist(a:jobinfo)
        return s:queue_action(['BufEnter', 'WinEnter'], ['s:ProcessJobOutput',
                    \ [a:jobinfo, a:lines, a:source]])
    endif
    if !a:0
        return s:pcall('s:ProcessJobOutput', [a:jobinfo, a:lines, a:source])
    endif

    let maker = a:jobinfo.maker
    let file_mode = a:jobinfo.file_mode
    call neomake#log#debug(printf(
                \ '%s: processing %d lines of output.',
                \ maker.name, len(a:lines)), a:jobinfo)
    try
        if has_key(maker, 'process_json') || has_key(maker, 'process_output')
            if has_key(maker, 'process_json')
                let method = 'process_json'
                let output = join(a:lines, "\n")
                try
                    let json = neomake#compat#json_decode(output)
                catch
                    let error = printf(
                                \ 'Failed to decode JSON: %s (output: %s).',
                                \ substitute(v:exception, '^Neomake: ', '', ''), string(output))
                    call neomake#log#exception(error, a:jobinfo)
                    return
                endtry
                call neomake#log#debug(printf(
                            \ "Calling maker's process_json method with %d JSON entries.",
                            \ len(json)), a:jobinfo)
                let entries = call(maker.process_json, [{
                            \ 'json': json,
                            \ 'source': a:source,
                            \ 'jobinfo': a:jobinfo}], maker)
            else
                call neomake#log#debug(printf(
                            \ "Calling maker's process_output method with %d lines of output on %s.",
                            \ len(a:lines), a:source), a:jobinfo)
                let method = 'process_output'
                let entries = call(maker.process_output, [{
                            \ 'output': a:lines,
                            \ 'source': a:source,
                            \ 'jobinfo': a:jobinfo}], maker)
            endif
            if type(entries) != type([])
                call neomake#log#error(printf('The %s method for maker %s did not return a list, but: %s.',
                            \ method, maker.name, string(entries)[:100]), a:jobinfo)
                return 0
            elseif !empty(entries) && type(entries[0]) != type({})
                call neomake#log#error(printf('The %s method for maker %s did not return a list of dicts, but: %s.',
                            \ method, maker.name, string(entries)[:100]), a:jobinfo)
                return 0
            endif
            return s:ProcessEntries(a:jobinfo, entries)
        endif

        " Old-school handling through errorformat.
        if has_key(maker, 'mapexpr')
            let l:neomake_bufname = bufname(a:jobinfo.bufnr)
            " @vimlint(EVL102, 1, l:neomake_bufdir)
            let l:neomake_bufdir = fnamemodify(neomake_bufname, ':h')
            " @vimlint(EVL102, 1, l:neomake_output_source)
            let l:neomake_output_source = a:source
            call map(a:lines, maker.mapexpr)
        endif

        let cd_error = a:jobinfo.cd()
        if !empty(cd_error)
            call neomake#log#debug(printf(
                        \ "Could not change to job's cwd (%s): %s.",
                        \ a:jobinfo.cd_from_setting, cd_error), a:jobinfo)
        endif

        let prev_list = s:create_locqf_list(a:jobinfo)

        if exists('g:loaded_qf')
            let vimqf_var = file_mode ? 'qf_auto_open_loclist' : 'qf_auto_open_quickfix'
            let vimqf_val = get(g:, vimqf_var, s:unset_dict)
            if vimqf_val isnot# 0
                let restore_vimqf = [vimqf_var, vimqf_val]
                let g:[vimqf_var] = 0
            endif
        endif
        let olderrformat = &errorformat
        let &errorformat = maker.errorformat
        try
            if file_mode
                laddexpr a:lines
            else
                caddexpr a:lines
            endif
        finally
            let &errorformat = olderrformat
            call a:jobinfo.cd_back()
            if exists('restore_vimqf')
                if restore_vimqf[1] is# s:unset_dict
                    unlet g:[restore_vimqf[0]]
                else
                    let g:[restore_vimqf[0]] = restore_vimqf[1]
                endif
            endif
        endtry

        call s:AddExprCallback(a:jobinfo, prev_list)
    catch /^\%(Vim\%((\a\+)\)\=:\%(E48\|E523\)\)\@!/  " everything, but E48/E523 (sandbox / not allowed here)
        if v:exception ==# 'NeomakeTestsException'
            throw v:exception
        endif
        call neomake#log#exception(printf(
                    \ 'Error during output processing for %s: %s.',
                    \ a:jobinfo.maker.name, v:exception), a:jobinfo)
        return
    endtry
    return 1
endfunction

function! s:process_pending_output(jobinfo, lines, source, ...) abort
    let retry_events = s:need_to_postpone_output_processing(a:jobinfo)
    if empty(retry_events)
        if s:ProcessPendingOutput(a:jobinfo, a:lines, a:source)
            return 1
        endif
        if a:0
            let retry_events = a:1
        else
            let retry_events = ['BufEnter', 'WinEnter']
        endif
    endif
    let a:jobinfo.pending_output = 1
    call s:queue_action(retry_events, ['s:process_pending_output', [a:jobinfo, a:lines, a:source, retry_events]])
endfunction

function! s:ProcessPendingOutput(jobinfo, lines, source) abort
    if a:jobinfo.file_mode
        let window_make_ids = get(w:, 'neomake_make_ids', [])
        if index(window_make_ids, a:jobinfo.make_id) == -1
            if !bufexists(a:jobinfo.bufnr)
                call neomake#log#info('No buffer found for output!', a:jobinfo)
                return 1
            endif

            if a:jobinfo.bufnr != bufnr('%')
                call neomake#log#debug('Skipped pending job output for another buffer.', a:jobinfo)
                return 0
            elseif s:GetTabWinForMakeId(a:jobinfo.make_id) != [-1, -1]
                call neomake#log#debug('Skipped pending job output (not in origin window).', a:jobinfo)
                return 0
            else
                call neomake#log#debug("Processing pending output for job's buffer in new window.", a:jobinfo)
                let w:neomake_make_ids = add(get(w:, 'neomake_make_ids', []), a:jobinfo.make_id)
            endif
        endif
    endif

    call s:ProcessJobOutput(a:jobinfo, a:lines, a:source)
    if get(a:jobinfo, 'pending_output', 0)
        call neomake#log#debug('Processed pending output.', a:jobinfo)
        let a:jobinfo.pending_output = 0
        call s:CleanJobinfo(a:jobinfo)
    endif
    return 1
endfunction

function! s:add_pending_output(jobinfo, source, lines) abort
    if !exists('s:pending_outputs[a:jobinfo.id]')
        let s:pending_outputs[a:jobinfo.id] = {}
    endif
    if !exists('s:pending_outputs[a:jobinfo.id][a:source]')
        let s:pending_outputs[a:jobinfo.id][a:source] = []
    endif
    call extend(s:pending_outputs[a:jobinfo.id][a:source], a:lines)
endfunction

" Get tabnr and winnr for a given make ID.
function! s:GetTabWinForMakeId(make_id) abort
    for t in [tabpagenr()] + range(1, tabpagenr()-1) + range(tabpagenr()+1, tabpagenr('$'))
        for w in range(1, tabpagewinnr(t, '$'))
            if index(neomake#compat#gettabwinvar(t, w, 'neomake_make_ids', []), a:make_id) != -1
                return [t, w]
            endif
        endfor
    endfor
    return [-1, -1]
endfunction

" Do we need to postpone location list processing (creation and :laddexpr)?
function! s:need_to_postpone_loclist(jobinfo) abort
    if !a:jobinfo.file_mode
        return 0
    endif
    if index(get(w:, 'neomake_make_ids', []), a:jobinfo.make_id) != -1
        return 0
    endif
    call neomake#log#debug('Postponing location list processing.', a:jobinfo)
    return 1
endfunction

" XXX: merge with s:handle_locqf_list_for_finished_jobs.
let s:has_getcmdwintype = exists('*getcmdwintype')
function! s:need_to_postpone_output_processing(jobinfo) abort
    " We can only process output (change the location/quickfix list) in
    " certain modes, otherwise e.g. the visual selection gets lost.
    if neomake#compat#in_completion()
        call neomake#log#debug('Not processing output during completion.', a:jobinfo)
        return ['CompleteDone']
    endif
    let mode = neomake#compat#get_mode()
    if index(['n', 'i'], mode) == -1
        call neomake#log#debug('Not processing output for mode "'.mode.'".', a:jobinfo)
        return ['BufEnter', 'WinEnter', 'InsertLeave', 'CursorHold', 'CursorHoldI']
    endif
    if s:has_getcmdwintype && !empty(getcmdwintype())
        call neomake#log#debug('Not processing output from command-line window "'.getcmdwintype().'".', a:jobinfo)
        return ['InsertLeave', 'CursorHold', 'CursorHoldI']
    endif
    " TODO: should be done in neomake#utils#hook directly instead, involves refactoring.
    if exists('g:neomake_hook_context')
        call neomake#log#debug('Not processing output during active hook processing.', a:jobinfo)
        return ['Timer', 'BufEnter', 'WinEnter', 'InsertLeave', 'CursorHold', 'CursorHoldI']
    endif
    return []
endfunction

function! s:RegisterJobOutput(jobinfo, lines, source) abort
    " Allow to filter output (storing the setting on the jobinfo lazily).
    if !has_key(a:jobinfo, 'filter_output')
        let a:jobinfo.filter_output = neomake#utils#GetSetting('filter_output', a:jobinfo.maker, '', a:jobinfo.ft, a:jobinfo.bufnr)
    endif
    if !empty(a:jobinfo.filter_output)
        call call(a:jobinfo.filter_output, [
                    \ a:lines, {'source': a:source, 'jobinfo': a:jobinfo}],
                    \ a:jobinfo.maker)
    endif

    if empty(a:lines)
        return
    endif

    if a:jobinfo.output_stream !=# 'both' && a:jobinfo.output_stream !=# a:source
        if !has_key(a:jobinfo, 'unexpected_output')
            let a:jobinfo.unexpected_output = {}
        endif
        if !has_key(a:jobinfo.unexpected_output, a:source)
            let a:jobinfo.unexpected_output[a:source] = []
        endif
        let a:jobinfo.unexpected_output[a:source] += a:lines
        return
    endif

    call s:process_pending_output(a:jobinfo, a:lines, a:source)
endfunction

function! s:vim_output_handler(channel, output, event_type) abort
    let channel_id = ch_info(a:channel)['id']
    let jobinfo = get(s:jobs, get(s:map_job_ids, channel_id, -1), {})
    if empty(jobinfo)
        call neomake#log#debug(printf("output [%s]: job '%s' not found.", a:event_type, a:channel))
        return
    endif
    let data = split(a:output, '\r\?\n', 1)
    call s:output_handler_queued(jobinfo, data, a:event_type, 0)
endfunction

function! s:vim_output_handler_stdout(channel, output) abort
    call s:vim_output_handler(a:channel, a:output, 'stdout')
endfunction

function! s:vim_output_handler_stderr(channel, output) abort
    call s:vim_output_handler(a:channel, a:output, 'stderr')
endfunction

function! s:vim_exit_handler(channel) abort
    let channel_id = ch_info(a:channel)['id']
    let jobinfo = get(s:jobs, get(s:map_job_ids, channel_id, -1), {})
    if empty(jobinfo)
        try
            let job_info = job_info(ch_getjob(a:channel))
        catch /^Vim(let):E916:/
            " Might happen with older Vim (8.0.69, but not 8.0.586).
            call neomake#log#debug(printf('exit: job not found: %s.', a:channel))
            return
        endtry
        call neomake#log#debug(printf('exit: job not found: %s (%s).', a:channel, job_info))
        return
    endif
    let job_info = job_info(ch_getjob(a:channel))

    " Handle failing starts from Vim here.
    let status = job_info['exitval']
    if status == 122  " Vim uses EXEC_FAILED, but only on Unix?!
        let jobinfo.failed_to_start = 1
        " The error is on stderr.
        let error = 'Vim job failed to run: '.substitute(join(jobinfo.stderr), '\v\s+$', '', '').'.'
        let jobinfo.stderr = []
        call neomake#log#error(error)
        call s:CleanJobinfo(jobinfo)
    else
        call s:exit_handler(jobinfo, status)
    endif
endfunction

" @vimlint(EVL108, 1)
if has('nvim-0.2.0')
" @vimlint(EVL108, 0)
    function! s:nvim_output_handler(job_id, data, event_type) abort
        let jobinfo = get(s:jobs, get(s:map_job_ids, a:job_id, -1), {})
        if empty(jobinfo)
            call neomake#log#debug(printf('output [%s]: job %d not found.', a:event_type, a:job_id))
            return
        endif
        if a:data == [''] && !exists('jobinfo[a:event_type]')
            " EOF in Neovim (see :h on_data).
            return
        endif
        call s:output_handler_queued(jobinfo, copy(a:data), a:event_type, 1)
    endfunction
else
    " Neovim: register output from jobs as quick as possible, and trigger
    " processing through a timer.
    " This works around https://github.com/neovim/neovim/issues/5889).
    let s:nvim_output_handler_queue = []
    function! s:nvim_output_handler(job_id, data, event_type) abort
        let jobinfo = get(s:jobs, get(s:map_job_ids, a:job_id, -1), {})
        if empty(jobinfo)
            call neomake#log#debug(printf('output [%s]: job %d not found.', a:event_type, a:job_id))
            return
        endif
        let args = [jobinfo, copy(a:data), a:event_type, 1]
        call add(s:nvim_output_handler_queue, args)
        if !exists('jobinfo._nvim_in_handler')
            let jobinfo._nvim_in_handler = 1
        else
            let jobinfo._nvim_in_handler += 1
        endif
        if !exists('s:nvim_output_handler_timer')
            let s:nvim_output_handler_timer = timer_start(0, function('s:nvim_output_handler_cb'))
        endif
    endfunction

    function! s:nvim_output_handler_cb(_timer) abort
        while !empty(s:nvim_output_handler_queue)
            let args = remove(s:nvim_output_handler_queue, 0)
            let jobinfo = args[0]
            call call('s:output_handler', args)
            let jobinfo._nvim_in_handler -= 1

            if !jobinfo._nvim_in_handler
                " Trigger previously delayed exit handler.
                unlet jobinfo._nvim_in_handler
                if exists('jobinfo._exited_while_in_handler')
                    call neomake#log#debug('Trigger delayed exit.', jobinfo)
                    call s:exit_handler(jobinfo, jobinfo._exited_while_in_handler)
                endif
            endif
        endwhile
        unlet! s:nvim_output_handler_timer
    endfunction
endif

" Exit handler for buffered output with Neovim.
" In this case the output gets stored on the jobstart-options dict.
function! s:nvim_exit_handler_buffered(job_id, data, _event_type) abort
    let jobinfo = get(s:jobs, get(s:map_job_ids, a:job_id, -1), {})
    if empty(jobinfo)
        call neomake#log#debug(printf('exit: job not found: %d.', a:job_id))
        return
    endif

    for stream in ['stdout', 'stderr']
        if has_key(jobinfo.jobstart_opts, stream)
            let data = copy(jobinfo.jobstart_opts[stream])
            call s:output_handler(jobinfo, data, stream, 1)
        endif
    endfor

    call s:exit_handler(jobinfo, a:data)
endfunction

function! s:nvim_exit_handler(job_id, data, _event_type) abort
    let jobinfo = get(s:jobs, get(s:map_job_ids, a:job_id, -1), {})
    if empty(jobinfo)
        call neomake#log#debug(printf('exit: job not found: %d.', a:job_id))
        return
    endif
    call s:exit_handler(jobinfo, a:data)
endfunction

function! s:exit_handler(jobinfo, data) abort
    let jobinfo = a:jobinfo
    let jobinfo.exit_code = a:data
    if get(jobinfo, 'canceled')
        call neomake#log#debug('exit: job was canceled.', jobinfo)
        call s:CleanJobinfo(jobinfo)
        return
    endif
    let maker = jobinfo.maker

    if exists('jobinfo._output_while_in_handler') || exists('jobinfo._nvim_in_handler')
        let jobinfo._exited_while_in_handler = a:data
        call neomake#log#debug(printf('exit (delayed): %s: %s.',
                    \ maker.name, string(a:data)), jobinfo)
        return
    endif
    call neomake#log#debug(printf('exit: %s: %s.',
                \ maker.name, string(a:data)), jobinfo)

    " Handle any unfinished lines from stdout/stderr callbacks.
    for event_type in ['stdout', 'stderr']
        if has_key(jobinfo, event_type)
            let lines = jobinfo[event_type]
            if !empty(lines)
                if lines[-1] ==# ''
                    call remove(lines, -1)
                endif
                if !empty(lines)
                    call s:RegisterJobOutput(jobinfo, lines, event_type)
                endif
                unlet jobinfo[event_type]
            endif
        endif
    endfor

    if !get(jobinfo, 'failed_to_start')
        let l:ExitCallback = neomake#utils#GetSetting('exit_callback',
                    \ extend(copy(jobinfo), maker), 0, jobinfo.ft, jobinfo.bufnr)
        if l:ExitCallback isnot# 0
            let callback_dict = { 'status': jobinfo.exit_code,
                                \ 'name': maker.name,
                                \ 'has_next': !empty(s:make_info[jobinfo.make_id].jobs_queue) }
            try
                if type(l:ExitCallback) == type('')
                    let l:ExitCallback = function(l:ExitCallback)
                endif
                call call(l:ExitCallback, [callback_dict], jobinfo)
            catch
                call neomake#log#error(printf(
                            \ 'Error during exit_callback: %s.', v:exception),
                            \ jobinfo)
            endtry
        endif
    endif

    if s:async
        if has('nvim') || jobinfo.exit_code != 122
            call neomake#log#debug(printf(
                        \ '%s: completed with exit code %d.',
                        \ maker.name, jobinfo.exit_code), jobinfo)
        endif
        let jobinfo.finished = 1
    endif

    if has_key(jobinfo, 'unexpected_output')
        redraw
        for [source, output] in items(jobinfo.unexpected_output)
            let msg = printf('%s: unexpected output on %s: ', maker.name, source)
            call neomake#log#debug(msg . join(output, '\n') . '.', jobinfo)

            echohl WarningMsg
            echom printf('Neomake: %s%s', msg, output[0])
            for line in output[1:-1]
                echom line
            endfor
            echohl None
        endfor
        call neomake#log#error(printf(
                    \ '%s: unexpected output. See :messages for more information.', maker.name), jobinfo)
    endif
    call s:handle_next_job(jobinfo)
endfunction

function! s:output_handler_queued(jobinfo, data, event_type, trim_CR) abort
    let jobinfo = a:jobinfo
    if exists('jobinfo._output_while_in_handler')
        call neomake#log#debug(printf('Queueing: %s: %s: %s.',
                    \ a:event_type, jobinfo.maker.name, string(a:data)), jobinfo)
        let jobinfo._output_while_in_handler += [[jobinfo, a:data, a:event_type, a:trim_CR]]
        return
    else
        let jobinfo._output_while_in_handler = []
    endif

    call s:output_handler(jobinfo, a:data, a:event_type, a:trim_CR)

    " Process queued events that might have arrived by now.
    " The attribute might be unset here, since output_handler might have
    " been interrupted.
    if exists('jobinfo._output_while_in_handler')
        while has_key(jobinfo, '_output_while_in_handler') && !empty(jobinfo._output_while_in_handler)
            let args = remove(jobinfo._output_while_in_handler, 0)
            call call('s:output_handler', args)
        endwhile
        unlet! jobinfo._output_while_in_handler
    endif
    " Trigger previously delayed exit handler.
    if exists('jobinfo._exited_while_in_handler')
        call neomake#log#debug('Trigger delayed exit.', jobinfo)
        call s:exit_handler(jobinfo, jobinfo._exited_while_in_handler)
    endif
endfunction

function! s:output_handler(jobinfo, data, event_type, trim_CR) abort
    let jobinfo = a:jobinfo
    call neomake#log#debug(printf('%s: %s: %s.',
                \ a:event_type, jobinfo.maker.name, string(a:data)), jobinfo)
    let data = copy(a:data)
    if a:trim_CR && !empty(a:data)
        call map(data, "substitute(v:val, '\\r$', '', '')")
    endif
    if get(jobinfo, 'canceled')
        call neomake#log#debug('Ignoring output (job was canceled).', jobinfo)
        return
    endif
    let last_event_type = get(jobinfo, 'event_type', a:event_type)

    " data is a list of 'lines' read. Each element *after* the first
    " element represents a newline.
    if has_key(jobinfo, a:event_type)
        let jobinfo[a:event_type][-1] .= data[0]
        call extend(jobinfo[a:event_type], data[1:])
    else
        let jobinfo[a:event_type] = data
    endif

    if !jobinfo.buffer_output || last_event_type !=# a:event_type
        let lines = jobinfo[a:event_type][:-2]
        let jobinfo[a:event_type] = jobinfo[a:event_type][-1:]

        if !empty(lines)
            call s:RegisterJobOutput(jobinfo, lines, a:event_type)
        endif
    endif
endfunction

function! s:abort_next_makers(make_id) abort
    let jobs_queue = s:make_info[a:make_id].jobs_queue
    if !empty(jobs_queue)
        let next_makers = join(map(copy(jobs_queue), 'v:val.maker.name'), ', ')
        call neomake#log#info('Aborting next makers: '.next_makers.'.', {'make_id': a:make_id})
        let s:make_info[a:make_id].jobs_queue = []
    endif
endfunction

function! s:handle_next_job(prev_jobinfo) abort
    let make_id = get(a:prev_jobinfo, 'make_id', s:make_id)
    if !has_key(s:make_info, make_id)
        return {}
    endif
    let make_info = s:make_info[make_id]

    if !empty(a:prev_jobinfo)
        let status = get(a:prev_jobinfo, 'exit_code', 0)
        if status != 0 && index([122, 127], status) == -1
            " TODO: mark maker.exe as non-executable with status 127, and
            "       maybe re-introduce a wrapper for `executable()` to handle it.
            "       Ref: https://github.com/neomake/neomake/issues/1699
            if neomake#utils#GetSetting('serialize_abort_on_error', a:prev_jobinfo.maker, 0, a:prev_jobinfo.ft, a:prev_jobinfo.bufnr)
                call s:abort_next_makers(make_id)
                call s:CleanJobinfo(a:prev_jobinfo)
                return {}
            endif
        endif
        call s:CleanJobinfo(a:prev_jobinfo)
        if !has_key(s:make_info, make_id)
            " Last job was cleaned.
            return {}
        endif
    endif

    " Create job from the start of the queue, returning it.
    while !empty(make_info.jobs_queue)
        let options = remove(make_info.jobs_queue, 0)
        let maker = options.maker
        if empty(maker)
            continue
        endif

        " Serialization of jobs, always for non-async Vim.
        if !has_key(options, 'serialize')
            if !s:async || neomake#utils#GetSetting('serialize', maker, 0, options.ft, options.bufnr)
                let options.serialize = 1
            else
                let options.serialize = 0
            endif
        endif
        try
            let jobinfo = s:MakeJob(make_id, options)
        catch /^Neomake: /
            let log_context = {'make_id': make_id}
            let error = substitute(v:exception, '^Neomake: ', '', '')
            call neomake#log#exception(error, log_context)

            if options.serialize
                if neomake#utils#GetSetting('serialize_abort_on_error', maker, 0, options.ft, options.bufnr)
                    call s:abort_next_makers(make_id)
                    break
                endif
            endif
            continue
        endtry
        if !empty(jobinfo)
            return jobinfo
        endif
    endwhile

    " Cleanup make info, but only if there are no queued actions.
    for [_, v] in s:action_queue
        if v[1][0] == make_info
            call neomake#log#debug('Skipping cleaning of make info for queued actions.', make_info)
            return {}
        endif
    endfor
    call s:clean_make_info(make_info)
    return {}
endfunction

function! neomake#get_nearest_error() abort
    let buf = bufnr('%')
    let ln = line('.')
    let ln_errors = []

    for maker_type in ['file', 'project']
        let buf_errors = get(s:current_errors[maker_type], buf, {})
        let ln_errors += get(buf_errors, ln, [])
    endfor

    if empty(ln_errors)
        return {}
    endif

    if len(ln_errors) > 1
        let ln_errors = copy(ln_errors)
        call sort(ln_errors, function('neomake#utils#sort_by_col'))
    endif
    return ln_errors[0]
endfunction

function! neomake#GetCurrentErrorMsg() abort
    let entry = neomake#get_nearest_error()
    if empty(entry)
        return ''
    endif
    let r = entry.maker_name . ': ' . entry.text
    let suffix = entry.type . (entry.nr != -1 ? entry.nr : '')
    if !empty(suffix)
        let r .= ' ('.suffix.')'
    endif
    return r
endfunction

function! neomake#EchoCurrentError(...) abort
    if !get(g:, 'neomake_echo_current_error', 1)
        return
    endif
    " a:1 might be a timer from the VimResized event.
    let force = a:0 ? a:1 : 0

    let message = neomake#GetCurrentErrorMsg()
    if empty(message)
        if exists('s:neomake_last_echoed_error')
            echon ''
            unlet s:neomake_last_echoed_error
        endif
        return
    endif
    if !force && exists('s:neomake_last_echoed_error')
                \ && s:neomake_last_echoed_error == message
        return
    endif
    let s:neomake_last_echoed_error = message
    call neomake#utils#WideMessage(message)
endfunction

function! neomake#CursorMoved() abort
    call neomake#EchoCurrentError()
endfunction

function! s:cursormoved_delayed_cb(...) abort
    if getpos('.') == s:cursormoved_last_pos
        call neomake#CursorMoved()
    endif
endfunction
function! neomake#CursorMovedDelayed() abort
    if exists('s:cursormoved_timer')
        call timer_stop(s:cursormoved_timer)
    endif
    let s:cursormoved_timer = timer_start(get(g:, 'neomake_cursormoved_delay', 100), function('s:cursormoved_delayed_cb'))
    let s:cursormoved_last_pos = getpos('.')
endfunction

function! neomake#Make(file_mode_or_options, ...) abort
    if type(a:file_mode_or_options) == type({})
        return s:Make(a:file_mode_or_options)
    endif

    let file_mode = a:file_mode_or_options
    let options = {'file_mode': file_mode}
    if file_mode
        let options.ft = &filetype
    endif
    if a:0
        if !empty(a:1)
            let maker_names = a:1
            " Split names on non-breaking space (annotation from completion).
            call map(maker_names, "type(v:val) == 1 ? split(v:val, ' (')[0] : v:val")
            let options.enabled_makers = a:1
        endif
        if a:0 > 1
            let options.exit_callback = a:2
        endif
    endif
    return map(copy(s:Make(options)), 'v:val.id')
endfunction

function! neomake#ShCommand(bang, sh_command, ...) abort
    let maker = neomake#utils#MakerFromCommand(a:sh_command)
    let maker.name = 'sh: '.a:sh_command
    let maker.errorformat = '%m'
    let maker.default_entry_type = ''
    let options = {
                \ 'enabled_makers': [maker],
                \ 'file_mode': 0,
                \ 'output_stream': 'both',
                \ 'buffer_output': !a:bang,
                \ }
    if a:0
        call extend(options, a:1)
    endif
    let jobinfos = s:Make(options)
    return empty(jobinfos) ? -1 : jobinfos[0].id
endfunction

function! neomake#Sh(sh_command, ...) abort
    " Deprecated, but documented.
    let options = a:0 ? { 'exit_callback': a:1 } : {}
    return neomake#ShCommand(0, a:sh_command, options)
endfunction

" Deprecated (2017-10-11).
function! neomake#DisplayInfo(...) abort
    call call('neomake#debug#display_info', a:000)
endfunction

function! neomake#map_makers(makers, ft, auto_enabled) abort
    let makers = []
    let errors = []
    for maker in a:makers
        try
            let m = neomake#GetMaker(maker, a:ft)
        catch /^Neomake: /
            call add(errors, substitute(v:exception, '^Neomake: ', '', '').'.')
            continue
        endtry
        call add(makers, m)
    endfor
    if !empty(errors)
        let log_context = get(get(s:make_info, s:make_id, {}), 'options', {})
        for error in errors
            if a:auto_enabled
                call neomake#log#debug(error, log_context)
            else
                call neomake#log#error(error, log_context)
            endif
        endfor
    endif
    return makers
endfunction
