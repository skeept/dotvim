
FZF_SHELL_DIR="$1"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${FZF_SHELL_DIR}/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "${FZF_SHELL_DIR}/key-bindings.bash"
