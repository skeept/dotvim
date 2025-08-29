# prompt related functions and settings

#---------------
# Shell prompt
#---------------

if false; then
  function fastprompt() {
    unset PROMPT_COMMAND
    case $TERM in
    *term | rxvt)
      PS1="[\h] \W > \[\033]0;[\u@\h] \w\007\]"
      ;;
    *)
      PS1="[\h] \W > "
      ;;
    esac
  }

  MYHOST=$(hostname)
  function powerprompt() {
    _powerprompt() {
      LOAD=$(uptime | sed -e "s/.*: \([^,]*\).*/\1/" -e "s/ //g")
      TIME=$(date +%H:%M)
    }

    PROMPT_COMMAND=_powerprompt
    case $TERM in
    *term | rxvt)
      #            PS1="$USER\w> \[\033]0;[\u@\h] \w\007\]" ;;
      PS1="[$MYHOST\w]> \[\033]0;[\u@\h] \w\007\]"
      ;;
    linux)
      PS1="$USER\w> "
      ;;
    *)
      PS1="$USER\w> "
      ;;
    esac
  }

  #powerprompt     # this is the default prompt - might be slow
  # If too slow, use fastprompt instead....

  function __my_git_ps1() {
    if type -t __git_ps1 >&/dev/null; then
      __git_ps1
    fi
  }
  PS1='[\u@\h \W$(__my_git_ps1 " (%s)")]\$ '
fi

star() {
  # reset PROMPT_COMMAND
  [ -n "${PROMPT_COMMAND_BEFORE_LOAD_NIX_BASHCR}" ] && export PROMPT_COMMAND="${PROMPT_COMMAND_BEFORE_LOAD_NIX_BASHCR}"
  if [ -z "${1}" ]; then
    eval "$(starship init bash)"
  elif [ "$1" = "s2" ]; then
    PS1="\[\e[1;32m\]\u\[\e[0;39m\]@\[\e[1;36m\]nix-shell\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]\[\e[1;35m\]$(__git_ps1 " (%s)")\[\e[0;39m\]$ "
  else
    eval "$(posh prompt init bash --config ~/.vim/test/keep/posh-themes/my_negligible.omp.json)"
  fi
}

# avoid calling again when sourcing bashrc
if [ -z "${DID_PROMPT_SET+x}" ]; then
  star
  export DID_PROMPT_SET=1
fi
