declare -A __WK_PATHS
declare -A __WK_TYPES
declare -A __WK_VENVS
__WK_LOADED=0

function __wk_load_config() {
  [[ "$__WK_LOADED" -eq 1 ]] && return 0
  local config="$HOME/.wk_config.yaml"
  [[ ! -f "$config" ]] && return 1

  local def_py=$(yq -r '.settings.default_python // "python3"' "$config")

  # 1. Recursive Scan
  local scan_paths=$(yq -r '.folders[] | select(kind == "scalar")' "$config")
  for dir in $scan_paths; do
    [[ ! -d "$dir" ]] && continue
    local cmd
    if command -v fd >/dev/null 2>&1; then
      cmd="fd -e py --exclude '__init__.py' . '$dir'"
    else
      cmd="find '$dir' -name '*.py' ! -name '__init__.py'"
    fi

    while IFS= read -r file_path; do
      local name=$(basename "$file_path" .py)
      __WK_PATHS["$name"]="$file_path"
      __WK_TYPES["$name"]="direct"
      __WK_VENVS["$name"]="$def_py"
    done < <(eval "$cmd")
  done

  # 2. Process Overrides
  local overrides=$(yq -r '.folders[] | select(kind == "map") | to_entries | .[] | .key + "|" + .value.path + "|" + (.value.method // "direct") + "|" + (.value.python // "'"$def_py"'")' "$config")
  while IFS="|" read -r ovr_key ovr_path method venv; do
    local base_name=$(basename "$ovr_path" .py)
    unset "__WK_PATHS[$base_name]"
    __WK_PATHS["$ovr_key"]="$ovr_path"
    __WK_TYPES["$ovr_key"]="$method"
    __WK_VENVS["$ovr_key"]="$venv"
  done <<<"$overrides"

  # 3. Process Aliases
  local aliases=$(yq -r '.aliases | to_entries | .[] | .key + "|" + .value' "$config" 2>/dev/null)
  if [[ -n "$aliases" ]]; then
    while IFS="|" read -r alias_name target_key; do
      if [[ -n "${__WK_PATHS[$target_key]}" ]]; then
        __WK_PATHS["$alias_name"]="${__WK_PATHS[$target_key]}"
        __WK_TYPES["$alias_name"]="${__WK_TYPES[$target_key]}"
        __WK_VENVS["$alias_name"]="${__WK_VENVS[$target_key]}"
      fi
    done <<<"$aliases"
  fi
  __WK_LOADED=1
}

__wk_run_pym() {
  local script_path="$1"
  local python_bin="$2"
  local dry_run="$3"
  shift 3
  local abs_script=$(realpath "$script_path")
  local pkg_root="$abs_script"

  while [[ "$pkg_root" != "/" && "$(basename "$pkg_root")" != "src" ]]; do
    pkg_root=$(dirname "$pkg_root")
  done

  local env_path
  local cmd_line
  if [[ "$(basename "$pkg_root")" != "src" ]]; then
    env_path="$(dirname "$abs_script"):$PYTHONPATH"
    cmd_line="PYTHONPATH=\"$env_path\" \"$python_bin\" \"$abs_script\" $*"
    [[ "$dry_run" == "1" ]] && {
      echo "++ $cmd_line" >&2
      return 0
    }
    PYTHONPATH="$env_path" "$python_bin" "$abs_script" "$@"
  else
    local module_path="${abs_script#$pkg_root/}"
    module_path="${module_path%.py}"
    module_path="${module_path//\//.}"
    cmd_line="PYTHONPATH=\"$pkg_root:$PYTHONPATH\" \"$python_bin\" -m \"$module_path\" $*"
    [[ "$dry_run" == "1" ]] && {
      echo "++ $cmd_line" >&2
      return 0
    }
    PYTHONPATH="$pkg_root:$PYTHONPATH" "$python_bin" -m "$module_path" "$@"
  fi
}

function wk2() {
  local dry_run=0
  # Check for dry-run flag at any position or specifically first/second
  if [[ "$1" == "--dry-run" ]]; then
    dry_run=1
    shift
  fi

  __wk_load_config
  local key=$1
  [[ -z "$key" ]] && {
    echo "Available commands:"
    printf "  %s\n" "${!__WK_PATHS[@]}" | sort | column
    return
  }
  shift

  if [[ -n "${__WK_PATHS[$key]}" ]]; then
    local path="${__WK_PATHS[$key]}"
    local type="${__WK_TYPES[$key]}"
    local venv="${__WK_VENVS[$key]}"
    if [[ "$type" == "pym" ]]; then
      __wk_run_pym "$path" "$venv" "$dry_run" "$@"
    else
      [[ "$dry_run" == "1" ]] && {
        echo "++ \"$venv\" \"$path\" $*" >&2
        return 0
      }
      "$venv" "$path" "$@"
    fi
  else
    echo "Script '$key' not found."
    return 1
  fi
}

function _wk_comp2() {
  local cur prev
  _get_comp_words_by_ref -n : cur prev
  __wk_load_config

  # Suggest --dry-run and keys for the first real argument
  if [[ $COMP_CWORD -eq 1 ]]; then
    COMPREPLY=($(compgen -W "--dry-run ${!__WK_PATHS[*]}" -- "$cur"))
  elif [[ $COMP_CWORD -eq 2 && "${COMP_WORDS[1]}" == "--dry-run" ]]; then
    COMPREPLY=($(compgen -W "${!__WK_PATHS[*]}" -- "$cur"))
  else
    _filedir
  fi
}

complete -F _wk_comp2 -o default -o bashdefault wk2
