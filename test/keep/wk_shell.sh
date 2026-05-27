function wk() {
  # Forward all arguments directly to the Python core script.
  # Requires Python 3.11+ for tomllib.
  python3 "${CONFIG_HOME}/wk_core.py" "$@"
}

# Cached completion list; invalidated when config mtime changes
_WK_COMP_CACHE=""
_WK_COMP_CACHE_MTIME=""

function _wk_comp() {
  local cur commands config_file config_mtime
  cur="${COMP_WORDS[COMP_CWORD]}"
  config_file="$HOME/.wk_config.toml"

  # Invalidate cache if config has changed
  if [[ -f "$config_file" ]]; then
    config_mtime=$(stat -c %Y "$config_file" 2>/dev/null)
    if [[ "$config_mtime" != "$_WK_COMP_CACHE_MTIME" || -z "$_WK_COMP_CACHE" ]]; then
      _WK_COMP_CACHE=$(python3 "${CONFIG_HOME}/wk_core.py" --_complete 2>/dev/null)
      _WK_COMP_CACHE_MTIME="$config_mtime"
    fi
  fi
  commands="$_WK_COMP_CACHE"

  if [[ ${COMP_CWORD} -eq 1 ]]; then
    COMPREPLY=($(compgen -W "--dry-run -v -h --help ${commands}" -- "${cur}"))
  elif [[ ${COMP_CWORD} -eq 2 && "${COMP_WORDS[1]}" == "--dry-run" ]]; then
    COMPREPLY=($(compgen -W "-v ${commands}" -- "${cur}"))
  elif [[ ${COMP_CWORD} -eq 2 && "${COMP_WORDS[1]}" == "-v" ]]; then
    COMPREPLY=($(compgen -W "${commands}" -- "${cur}"))
  else
    COMPREPLY=()
  fi
}

complete -F _wk_comp wk
