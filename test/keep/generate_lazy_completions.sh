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

  # NOTE: We removed the auto-fix recursion logic because we no longer
  # create a wrapper function named "$cmd_name", so recursion is impossible.

  # Append the wrapper logic to the file
  cat <<EOF >>"$OUTPUT_FILE"

# --- Lazy completion for: $cmd_name ---
function _lazy_setup_${cmd_name}() {
    if ! declare -f $comp_func > /dev/null; then
        eval "\$($gen_cmd)"
        # Re-bind the command to the real completion function so this loader only runs once
        complete -F $comp_func -o bashdefault -o default $cmd_name
    fi
}

# The Completion Wrapper (Only runs when you press Tab)
function _lazy_loader_${cmd_name}() {
    _lazy_setup_${cmd_name}
    # Call the real completion function with all arguments passed by bash
    $comp_func "\$@"
}

# Bind the loader to the command
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
#
# -----------------------------------------------------------------------------
# Function 3: Add completion by SOURCING a file (like 'yazi')
# -----------------------------------------------------------------------------
function add_lazy_source() {
  local cmd_name="$1"
  local comp_func="$2"
  local source_file="$3"

  cat <<EOF >>"$OUTPUT_FILE"

# --- Lazy source: $cmd_name from $source_file ---
function _lazy_setup_${cmd_name}() {
    if ! declare -f $comp_func > /dev/null; then
        if [ -f "$source_file" ]; then
            source "$source_file"
        else
            echo "Error: Completion file not found: $source_file" >&2
            return 1
        fi

        # Re-bind to the real function
        complete -F $comp_func -o bashdefault -o default $cmd_name
    fi
}

function _lazy_loader_${cmd_name}() {
    _lazy_setup_${cmd_name}
    $comp_func "\$@"
}

complete -F _lazy_loader_${cmd_name} -o bashdefault -o default $cmd_name
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
add_lazy_completion bat _bat "bat --completion ${CURSHELL}"
add_lazy_completion rg _rg "rg --generate=complete-bash"
add_lazy_completion fd _fd "fd --gen-completions bash"
add_lazy_completion docker __start_docker "docker completion ${CURSHELL}"
add_lazy_completion xh _xh "xh --generate=complete-bash"

add_lazy_source yazi _yazi $HOME/bin/links/completions/yazi.bash
add_lazy_source fd fd_ $HOME/bin/links/completions/fd.bash
add_lazy_source zoxide _zoxide ${HOME}/bin/links/completions/zoxide.bash
add_lazy_source tmux _tmux ${SCRIPT_DIR}/completions/tmux.bash
add_lazy_source tm _tmux ${SCRIPT_DIR}/completions/tmux.bash

echo "Generated completions in $OUTPUT_FILE"
