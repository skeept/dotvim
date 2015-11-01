function! magit#state#is_file_visible() dict
	return self.visible
endfunction

function! magit#state#set_file_visible(val) dict
	let self.visible = a:val
endfunction

function! magit#state#toggle_file_visible() dict
	let self.visible = ( self.visible == 0 ) ? 1 : 0
endfunction

function! magit#state#is_file_dir() dict
	return self.dir != 0
endfunction

function! magit#state#get_files(mode) dict
	return self.dict[a:mode]
endfunction

function! magit#state#must_be_added() dict
	return ( self.empty == 1 ||
		\ self.symlink != '' ||
		\ self.dir != 0 ||
		\ self.binary == 1 ||
		\ self.submodule == 1 )
endfunction

" magit#state#file_get_hunks: function accessor for hunks objects
" return: List of List of hunks lines
function! magit#state#file_get_hunks() dict
	return self.diff.hunks
endfunction

" magit#state#file_get_flat_hunks: function accessor for hunks lines
" return: all hunks lines of a file, including hunk headers
function! magit#state#file_get_flat_hunks() dict
	let hunks = self.diff.hunks
	let lines = []
	for hunk in hunks
		call add(lines, hunk.header)
		call add(lines, hunk.lines)
	endfor
	return lines
endfunction

" s:hunk_template: template for hunk object (nested in s:diff_template)
" WARNING: this variable must be deepcopy()'ied
let s:hunk_template = {
\	'header': '',
\	'lines': [],
\	'marks': [],
\}

" s:diff_template: template for diff object (nested in s:file_template)
" WARNING: this variable must be deepcopy()'ied
let s:diff_template = {
\	'header': [],
\	'hunks': [s:hunk_template],
\}

" s:file_template: template for file object
" WARNING: this variable must be deepcopy()'ied
let s:file_template = {
\	'exists': 0,
\	'filename': '',
\	'status': '',
\	'empty': 0,
\	'dir': 0,
\	'binary': 0,
\	'submodule': 0,
\	'symlink': '',
\	'diff': s:diff_template,
\	'is_dir': function("magit#state#is_file_dir"),
\	'is_visible': function("magit#state#is_file_visible"),
\	'set_visible': function("magit#state#set_file_visible"),
\	'toggle_visible': function("magit#state#toggle_file_visible"),
\	'must_be_added': function("magit#state#must_be_added"),
\	'get_header': function("magit#state#file_get_header"),
\	'get_hunks'      : function("magit#state#file_get_hunks"),
\	'get_flat_hunks' : function("magit#state#file_get_flat_hunks"),
\	'get_filename_header' : function("magit#state#file_get_filename_header"),
\}

" magit#state#get_file: function accessor for file
" param[in] mode: can be staged or unstaged
" param[in] filename: filename to access
" param[in] create: boolean. If 1, non existing file in Dict will be created.
" if 0, 'file_doesnt_exists' exception will be thrown
" return: Dict of file
function! magit#state#get_file(mode, filename, ...) dict
	let file_exists = has_key(self.dict[a:mode], a:filename)
	let create = ( a:0 == 1 ) ? a:1 : 0
	if ( file_exists == 0 && create == 1 )
		let self.dict[a:mode][a:filename] = deepcopy(s:file_template)
		let self.dict[a:mode][a:filename].visible = b:magit_default_show_all_files
		let self.dict[a:mode][a:filename].filename = a:filename
	elseif ( file_exists == 0 && create == 0 )
		throw 'file_doesnt_exists'
	endif
	return self.dict[a:mode][a:filename]
endfunction

" magit#state#file_get_header: function accessor for diff header
" param[in] mode: can be staged or unstaged
" param[in] filename: header of filename to access
" return: List of diff header lines
function! magit#state#file_get_header() dict
	return self.diff.header
endfunction

function! magit#state#file_get_filename_header() dict
	if ( self.status == 'L' )
		return g:magit_git_status_code.L . ': ' . self.filename . ' -> ' . self.symlink
	else
		return g:magit_git_status_code[self.status] . ': ' . self.filename
	endif
endfunction

" magit#state#add_file: method to add a file with all its
" properties (filename, exists, status, header and hunks)
" param[in] mode: can be staged or unstaged
" param[in] status: one character status code of the file (AMDRCU?)
" param[in] filename: filename
function! magit#state#add_file(mode, status, filename, depth) dict
	let dev_null = ( a:status == '?' ) ? " /dev/null " : " "
	let staged_flag = ( a:mode == 'staged' ) ? " --staged " : " "
	let diff_cmd="git diff --no-ext-diff " . staged_flag .
				\ "--no-color --patch -- " . dev_null . " "
				\ .  magit#utils#add_quotes(a:filename)
	let diff_list=magit#utils#systemlist(diff_cmd)
	if ( empty(diff_list) )
		echoerr "diff command \"" . diff_cmd . "\" returned nothing"
	endif
	let file = self.get_file(a:mode, a:filename, 1)
	let file.exists = 1

	let file.status = a:status
	let file.depth = a:depth

	if ( a:status == '?' && getftype(a:filename) == 'link' )
		let file.status = 'L'
		let file.symlink = resolve(a:filename)
		let file.diff.hunks[0].header = 'New symbolic link file'
	elseif ( magit#utils#is_submodule(a:filename))
		let file.status = 'S'
		let file.submodule = 1
		let file.diff.hunks[0].header = ''
		let file.diff.hunks[0].lines = diff_list
		if ( file.is_visible() )
			let self.nb_diff_lines += len(diff_list)
		endif
	elseif ( a:status == '?' && isdirectory(a:filename) == 1 )
		let file.status = 'N'
		let file.dir = 1
		for subfile in magit#utils#ls_all(a:filename)
			call self.add_file(a:mode, a:status, subfile, a:depth + 1)
		endfor
	elseif ( a:status == '?' && getfsize(a:filename) == 0 )
		let file.status = 'E'
		let file.empty = 1
		let file.diff.hunks[0].header = 'New empty file'
	elseif ( magit#utils#is_binary(magit#utils#add_quotes(a:filename)))
		let file.binary = 1
		let file.diff.hunks[0].header = 'Binary file'
	else
		let line = 0
		" match(
		while ( line < len(diff_list) && diff_list[line] !~ "^@.*" )
			call add(file.diff.header, diff_list[line])
			let line += 1
		endwhile

		if ( line < len(diff_list) )
			let hunk = file.diff.hunks[0]
			let hunk.header = diff_list[line]

			for diff_line in diff_list[line+1 : -1]
				if ( diff_line =~ "^@.*" )
					let hunk = deepcopy(s:hunk_template)
					call add(file.diff.hunks, hunk)
					let hunk.header = diff_line
					continue
				endif
				call add(hunk.lines, diff_line)
			endfor
		endif
		if ( file.is_visible() )
			let self.nb_diff_lines += len(diff_list)
		endif
	endif
endfunction

" magit#state#update: update self.dict
" if a file does not exists anymore (because all its changes have been
" committed, deleted, discarded), it is removed from g:mg_diff_dict
" else, its diff is discarded and regenrated
" what is resilient is its 'visible' parameter
function! magit#state#update() dict
	let self.nb_diff_lines = 0
	for diff_dict_mode in values(self.dict)
		for file in values(diff_dict_mode)
			let file.exists = 0
			" always discard previous diff
			let file.diff = deepcopy(s:diff_template)
		endfor
	endfor

	let dir = getcwd()
	try
		call magit#utils#lcd(magit#utils#top_dir())
		call magit#utils#refresh_submodule_list()
		for [mode, diff_dict_mode] in items(self.dict)
			let status_list = magit#git#get_status()
			for file_status in status_list
				let status=file_status[mode]

				" untracked code apperas in staged column, we skip it
				if ( status == ' ' || ( ( mode == 'staged' ) && status == '?' ) )
					continue
				endif
				call self.add_file(mode, status, file_status.filename, 0)
			endfor
		endfor
	finally
		call magit#utils#lcd(dir)
	endtry

	" remove files that have changed their mode or been committed/deleted/discarded...
	for diff_dict_mode in values(self.dict)
		for [key, file] in items(diff_dict_mode)
			if ( file.exists == 0 )
				unlet diff_dict_mode[key]
			endif
		endfor
	endfor
endfunction

function! magit#state#set_files_visible(is_visible) dict
	for diff_dict_mode in values(self.dict)
		for file in values(diff_dict_mode)
			call file.set_visible(a:is_visible)
		endfor
	endfor
endfunction

" dict: structure containing all diffs
" It is formatted as follow
" {
"   'staged': {
"       'filename': s:file_template,
"       'filename': s:file_template,
"       ...
"   },
"   'unstaged': {
"       'filename': s:file_template,
"       'filename': s:file_template,
"       ...
"   },
" }
let magit#state#state = {
			\ 'nb_diff_lines': 0,
			\ 'get_file': function("magit#state#get_file"),
			\ 'get_files': function("magit#state#get_files"),
			\ 'add_file': function("magit#state#add_file"),
			\ 'set_files_visible': function("magit#state#set_files_visible"),
			\ 'update': function("magit#state#update"),
			\ 'dict': { 'staged': {}, 'unstaged': {}},
			\ }

