let s:TYPE = g:which_key#util#TYPE

function! s:get_raw_key_mapping(key) abort
  let readmap = ''
  redir => readmap
  silent execute 'map' a:key
  redir END
  return split(readmap, "\n")
endfunction

function! which_key#map#parse(key, dict, visual) " {{{
  let key = a:key ==? ' ' ? "<Space>" : a:key
  let visual = a:visual

  let lines = s:get_raw_key_mapping(key)

  for line in lines
    let mapd = maparg(split(line[3:])[0], line[0], 0, 1)
    if mapd.lhs =~? '<Plug>.*' || mapd.lhs =~? '<SNR>.*'
      continue
    endif

    let mapd.display = call(g:WhichKeyFormatFunc, [mapd.rhs])

    let mapd.lhs = substitute(mapd.lhs, key, '', '')
    " FIXME: <Plug>(easymotion-prefix)
    if mapd.lhs ==? '<Space>'
      continue
    endif

    let mapd.lhs = substitute(mapd.lhs, "<Space>", " ", "g")
    let mapd.lhs = substitute(mapd.lhs, "<Tab>", "<C-I>", "g")

    let mapd.rhs = substitute(mapd.rhs, "<SID>", "<SNR>".mapd['sid']."_", "g")

    if mapd.lhs != '' && mapd.display !~# 'WhichKey.*'
      if (visual && match(mapd.mode, "[vx ]") >= 0) ||
            \ (!visual && match(mapd.mode, "[vx]") == -1)
        let mapd.lhs = which_key#util#string_to_keys(mapd.lhs)
        call s:add_map_to_dict(mapd, 0, a:dict)
      endif
    endif
  endfor
endfunction

function! s:add_map_to_dict(map, level, dict) " {{{
  if len(a:map.lhs) > a:level+1
    let curkey = a:map.lhs[a:level]
    let nlevel = a:level+1

    if !has_key(a:dict, curkey)
      let a:dict[curkey] = { 'name' : g:which_key_default_group_name }
    " mapping defined already, flatten this map
    elseif type(a:dict[curkey]) == s:TYPE.list && g:which_key_flatten
      let cmd = which_key#util#escape_mappings(a:map)
      let curkey = join(a:map.lhs[a:level+0:], '')
      let nlevel = a:level
      if !has_key(a:dict, curkey)
        let a:dict[curkey] = [cmd, a:map.display]
      endif
    elseif type(a:dict[curkey]) == s:TYPE.list && g:which_key_flatten == 0
      let cmd = which_key#util#escape_mappings(a:map)
      let curkey = curkey.'m'
      if !has_key(a:dict, curkey)
        let a:dict[curkey] = { 'name' : g:which_key_default_group_name }
      endif
    endif
    " next level
    if type(a:dict[curkey]) == s:TYPE.dict
      call s:add_map_to_dict(a:map, nlevel, a:dict[curkey])
    endif
  else
    let cmd = which_key#util#escape_mappings(a:map)
    if !has_key(a:dict, a:map.lhs[a:level])
      let a:dict[a:map.lhs[a:level]] = [cmd, a:map.display]
    " spot is taken already, flatten existing submaps
    elseif type(a:dict[a:map.lhs[a:level]]) == s:TYPE.dict && g:which_key_flatten
      let childmap = s:flattenmap(a:dict[a:map.lhs[a:level]], a:map.lhs[a:level])
      for it in keys(childmap)
        let a:dict[it] = childmap[it]
      endfor
      let a:dict[a:map.lhs[a:level]] = [cmd, a:map.display]
    endif
  endif
endfunction

function! s:flattenmap(dict, str) abort " {{{
  let ret = {}
  for kv in keys(a:dict)
    if type(a:dict[kv]) == s:TYPE.list
      let toret = {}
      let toret[a:str.kv] = a:dict[kv]
      return toret
    elseif type(a:dict[kv]) == s:TYPE.dict
      let strcall = a:str.kv
      call extend(ret, s:flattenmap(a:dict[kv], a:str.kv))
    endif
  endfor
  return ret
endfunction
