declare -A __WK_PATHS
declare -A __WK_TYPES
declare -A __WK_VENVS
__WK_LOADED=0

function __wk_load_config() {
  [[ "$__WK_LOADED" -eq 1 ]] && return 0
  local config_file="$HOME/.wk_config.yaml"
  [[ ! -f "$config_file" ]] && return 1

  # 0. Pre-process YAML
  local raw_yaml
  raw_yaml=$(sed "s|~|$HOME|g" "$config_file" | envsubst)

  local def_py
  # def_py=$(echo "$raw_yaml" | yq -r '.settings.default_python // "py"')
  def_py=$(echo "$raw_yaml" | yq -r '.settings.python_location // .settings.default_python // "py"')

  # ==========================================
  # 1. Recursive Scan (Scalars in 'folders')
  # ==========================================
  local scan_paths
  scan_paths=$(echo "$raw_yaml" | yq -r '.folders[] | select(kind == "scalar")' 2>/dev/null)

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

  # ==========================================
  # 2. Explicit Definitions (Maps in 'folders')
  # ==========================================
  local explicit_defs
  explicit_defs=$(echo "$raw_yaml" | yq -r '
    .folders[] | select(kind == "map") | to_entries[] |
    .key + "?" + (.value.path // "") + "?" + (.value.method // "direct") + "?" + (.value.python // "'"$def_py"'")
  ' 2>/dev/null)

  while IFS="?" read -r def_key def_path method venv; do
    [[ -z "$def_key" || -z "$def_path" ]] && continue

    local base_name=$(basename "$def_path" .py)
    # Clear auto-discovered entry if it conflicts with a custom named definition
    if [[ "$base_name" != "$def_key" ]]; then
      unset "__WK_PATHS[$base_name]"
      unset "__WK_TYPES[$base_name]"
      unset "__WK_VENVS[$base_name]"
    fi

    __WK_PATHS["$def_key"]="$def_path"
    __WK_TYPES["$def_key"]="$method"
    __WK_VENVS["$def_key"]="$venv"
  done <<<"$explicit_defs"

  # ==========================================
  # 3. Apply Overrides
  # ==========================================
  local overrides
  overrides=$(echo "$raw_yaml" | yq -r '
    .overrides | select(. != null) | to_entries[] |
    .key + "?" + (.value.method // "") + "?" + (.value.python // "")
  ' 2>/dev/null)

  while IFS="?" read -r ovr_key method venv; do
    [[ -z "$ovr_key" ]] && continue

    # Only apply overrides if the script was actually found in steps 1 or 2
    if [[ -n "${__WK_PATHS[$ovr_key]}" ]]; then
      [[ -n "$method" ]] && __WK_TYPES["$ovr_key"]="$method"
      [[ -n "$venv" ]] && __WK_VENVS["$ovr_key"]="$venv"
    fi
  done <<<"$overrides"

  # ==========================================
  # 4. Process Aliases
  # ==========================================
  local aliases
  aliases=$(echo "$raw_yaml" | yq -r '.aliases | select(. != null) | to_entries[] | .key + "?" + .value' 2>/dev/null)

  while IFS="?" read -r alias_name target_key; do
    [[ -z "$alias_name" ]] && continue
    if [[ -n "${__WK_PATHS[$target_key]}" ]]; then
      __WK_PATHS["$alias_name"]="${__WK_PATHS[$target_key]}"
      __WK_TYPES["$alias_name"]="${__WK_TYPES[$target_key]}"
      __WK_VENVS["$alias_name"]="${__WK_VENVS[$target_key]}"
    fi
  done <<<"$aliases"

  __WK_LOADED=1
}

__wk_run_pym() {
  local script_path="$1"
  local python_bin="$2"
  local dry_run="$3"
  shift 3

  local abs_script
  abs_script=$(realpath "$script_path")

  # IMPROVED: Upward search for 'src' folder with safety break
  local pkg_root="$abs_script"
  local found_src=0

  while [[ "$pkg_root" != "/" ]]; do
    if [[ "$(basename "$pkg_root")" == "src" ]]; then
      found_src=1
      break
    fi
    pkg_root=$(dirname "$pkg_root")
  done

  local cmd_line
  local env_path

  if [[ $found_src -eq 1 ]]; then
    # Found a 'src' directory, run as module
    local module_path="${abs_script#$pkg_root/}"
    module_path="${module_path%.py}"
    module_path="${module_path//\//.}"
    env_path="$pkg_root:$PYTHONPATH"

    cmd_line="PYTHONPATH=\"$env_path\" \"$python_bin\" -m \"$module_path\" $*"
    [[ "$dry_run" == "1" ]] && {
      echo "++ $cmd_line" >&2
      return 0
    }

    PYTHONPATH="$env_path" "$python_bin" -m "$module_path" "$@"
  else
    # No 'src' found, run as direct script
    env_path="$(dirname "$abs_script"):$PYTHONPATH"

    cmd_line="PYTHONPATH=\"$env_path\" \"$python_bin\" \"$abs_script\" $*"
    [[ "$dry_run" == "1" ]] && {
      echo "++ $cmd_line" >&2
      return 0
    }

    PYTHONPATH="$env_path" "$python_bin" "$abs_script" "$@"
  fi
}

function wk2() {
  local dry_run=0
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

  if [[ $COMP_CWORD -eq 1 ]]; then
    COMPREPLY=($(compgen -W "--dry-run ${!__WK_PATHS[*]}" -- "$cur"))
  elif [[ $COMP_CWORD -eq 2 && "${COMP_WORDS[1]}" == "--dry-run" ]]; then
    COMPREPLY=($(compgen -W "${!__WK_PATHS[*]}" -- "$cur"))
  else
    _filedir
  fi
}

complete -F _wk_comp2 -o default -o bashdefault wk2
