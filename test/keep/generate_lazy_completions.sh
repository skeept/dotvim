#!/bin/bash

# Output file path
OUTPUT_FILE="$HOME/.cache/lazy_shell_completions.sh"

# Start the file
echo "# Lazy completion wrappers generated on $(date)" >"$OUTPUT_FILE"

# -----------------------------------------------------------------------------
# Function 1: Add completion to an EXISTING command (like 'uv')
# -----------------------------------------------------------------------------
function add_lazy_completion() {
  local cmd_name="$1"
  local comp_func="$2"
  local gen_cmd="$3"

  # Auto-fix recursion: if the generation command starts with the tool name,
  # prepend 'command' so the wrapper doesn't call itself.
  if [[ "${gen_cmd%% *}" == "$cmd_name" ]]; then
    gen_cmd="command $gen_cmd"
  fi

  # Append the wrapper logic to the file
  cat <<EOF >>"$OUTPUT_FILE"

# --- Lazy completion for: $cmd_name ---
function _lazy_setup_${cmd_name}() {
    if ! declare -f $comp_func > /dev/null; then
        eval "\$($gen_cmd)"
        complete -F $comp_func -o bashdefault -o default $cmd_name
    fi
}

function $cmd_name() {
    _lazy_setup_${cmd_name}
    command $cmd_name "\$@"
}

function _lazy_loader_${cmd_name}() {
    _lazy_setup_${cmd_name}
    $comp_func
}

complete -F _lazy_loader_${cmd_name} -o bashdefault -o default $cmd_name
EOF
}

# -----------------------------------------------------------------------------
# Function 2: Add alias with SHARED completion (like 'zl' -> 'zellij')
# -----------------------------------------------------------------------------
function add_lazy_alias() {
  local alias_name="$1"
  local original_cmd="$2"
  local comp_func="$3"
  local gen_cmd="$4"

  cat <<EOF >>"$OUTPUT_FILE"

# --- Lazy alias: $alias_name -> $original_cmd ---
function _lazy_setup_${alias_name}() {
    if ! declare -f $comp_func > /dev/null; then
        eval "\$($gen_cmd)"
        # Apply completion to both alias and original
        complete -F $comp_func -o bashdefault -o default $alias_name
        complete -F $comp_func -o bashdefault -o default $original_cmd
    fi
}

function $alias_name() {
    _lazy_setup_${alias_name}
    command $original_cmd "\$@"
}

function _lazy_loader_${alias_name}() {
    _lazy_setup_${alias_name}
    $comp_func
}

# Bind the loader to both commands
complete -F _lazy_loader_${alias_name} -o bashdefault -o default $alias_name
complete -F _lazy_loader_${alias_name} -o bashdefault -o default $original_cmd
EOF
}

# -----------------------------------------------------------------------------
# YOUR CONFIGURATION HERE
# -----------------------------------------------------------------------------

# 1. Zellij (Alias 'zl' + shared completion)
add_lazy_alias "zl" "zellij" "_zellij" "zellij setup --generate-completion bash"

# 2. UV (Standard completion)
add_lazy_completion "uv" "_uv" "uv generate-shell-completion bash"
add_lazy_completion "starship" "_starship" "starship completions ${CURSHELL}"
add_lazy_completion "atuin" "_atuin" "atuin gen-completions --shell ${CURSHELL}"
add_lazy_completion "procs" "_procs" "procs --gen-completion-out ${CURSHELL}"

echo "Generated completions in $OUTPUT_FILE"
