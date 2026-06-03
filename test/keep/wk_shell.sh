function wk() {
  # Requires Python 3.11+ for tomllib.
  python3 "${CONFIG_HOME}/wk_core.py" "$@"
}

# Cached completion list; invalidated when config mtime changes
_WK_COMP_CACHE=""
_WK_COMP_CACHE_MTIME=""

function _wk_comp() {
  local cur commands config_file config_mtime i w keyword_found
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

  # Scan all words up to the cursor to see if a keyword was already entered
  keyword_found=""
  for ((i = 1; i < COMP_CWORD; i++)); do
    w="${COMP_WORDS[i]}"
    if [[ "$w" != -* ]]; then
      keyword_found="$w"
      break
    fi
  done

  if [[ -n "$keyword_found" ]]; then
    # 3. If a keyword is specified -> complete with files from current folder
    COMPREPLY=($(compgen -f -- "${cur}"))
  else
    # 1 & 2. If no keyword yet -> complete keywords or dash options
    local flags="--dry-run -v --verbose -i --info -h --help"
    COMPREPLY=($(compgen -W "${flags} ${commands}" -- "${cur}"))
  fi
}

complete -F _wk_comp wk
