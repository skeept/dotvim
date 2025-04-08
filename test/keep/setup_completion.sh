# vim: set ft=bash:

#=========================================================================
#
# PROGRAMMABLE COMPLETION - ONLY SINCE BASH-2.04
# (Most are taken from the bash 2.05 documentation)
# You will in fact need bash-2.05 for some features
#
#=========================================================================

mtimer completion start

shopt -s extglob        # necessary
set +o nounset          # otherwise some completions will fail

complete -A hostname   rsh rcp telnet rlogin r ftp ping disk
complete -A command    nohup exec eval trace gdb ddd
complete -A command    command type which
complete -A export     printenv
complete -A variable   export local readonly unset
complete -A enabled    builtin
complete -A alias      alias unalias
complete -A function   function
complete -A user       su mail finger

complete -A helptopic  help     # currently same as builtins
complete -A shopt      shopt
complete -A stopped -P '%' bg
complete -A job -P '%'     fg jobs disown

complete -A directory  mkdir rmdir
complete -A directory   -o default cd d

complete -f -d -X '*.gz'  gzip tar
complete -f -d -X '*.bz2' bzip2 tar
complete -f -d -X '*.rar' unrar
complete -f -o default -X '!*.gz'  gunzip tar
complete -f -o default -X '!*.bz2' bunzip2 tar
complete -f -o default -X '!*.zip' unzip
complete -f -o default -X '!*.tar' tar
complete -f -o default -X '!*.py' vim vi gvim emacs xemacs nedit joe jed kate kwrite gedit \
  py.exe py python python.exe ipython wpy wpy.exe \
  epy
  complete -f -o default -X '!*.sh' bash sh
  complete -A variable path dupremove pre


# This is a 'universal' completion function - it works when commands have
# a so-called 'long options' mode , ie: 'ls --all' instead of 'ls -a'
_universal_func ()
{
  case "$2" in
    -*)     ;;
    *)      return ;;
  esac

  case "$1" in
    \~*)    eval cmd=$1 ;;
    *)      cmd="$1" ;;
  esac
  COMPREPLY=( $("$cmd" --help | sed  -e '/--/!d' -e 's/.*--\([^ ]*\).*/--\1/'| \
    grep ^"$2" |sort -u) )
  }
  complete  -o default -F _universal_func ldd wget bash id info


if false; then
  _make_targets ()
  {
    local mdef makef gcmd cur prev i

    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    # if prev argument is -f, return possible filename completions.
    # we could be a little smarter here and return matches against
    # `makefile Makefile *.mk', whatever exists
    case "$prev" in
      -*f)    COMPREPLY=( $(compgen -f $cur ) ); return 0;;
    esac

    # if we want an option, return the possible posix options
    case "$cur" in
      -)      COMPREPLY=(-e -f -i -k -n -p -q -r -S -s -t); return 0;;
    esac

    # make reads `makefile' before `Makefile'
    if [ -f makefile ]; then
      mdef=makefile
    elif [ -f Makefile ]; then
      mdef=Makefile
    else
      mdef=*.mk               # local convention
    fi

    # before we scan for targets, see if a makefile name was specified
    # with -f
    for (( i=0; i < ${#COMP_WORDS[@]}; i++ )); do
      if [[ ${COMP_WORDS[i]} == -*f ]]; then
        eval makef=${COMP_WORDS[i+1]}       # eval for tilde expansion
        break
      fi
    done

    [ -z "$makef" ] && makef=$mdef

    # if we have a partial word to complete, restrict completions to
    # matches of that word
    if [ -n "$2" ]; then gcmd='grep "^$2"' ; else gcmd=cat ; fi

    # if we don't want to use *.mk, we can take out the cat and use
    # test -f $makef and input redirection
    COMPREPLY=( $(cat $makef 2>/dev/null | awk 'BEGIN {FS=":"} /^[^.#   ][^=]*:/ {print $1}' | tr -s ' ' '\012' | sort -u | eval $gcmd ) )
  }
fi

complete -F _make_targets -X '+($*|*.[cho])' make gmake pmake

_configure_func ()
{
  case "$2" in
    -*)     ;;
    *)      return ;;
  esac

  case "$1" in
    \~*)    eval cmd=$1 ;;
    *)      cmd="$1" ;;
  esac

  COMPREPLY=( $("$cmd" --help | awk '{if ($1 ~ /--.*/) print $1}' | grep ^"$2" | sort -u) )
}

complete -F _configure_func configure


_killall ()
{
  local cur prev
  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}

  # get a list of processes (the first sed evaluation
  # takes care of swapped out processes, the second
  # takes care of getting the basename of the process)
  COMPREPLY=( $( ps -u $USER -o comm  | \
    sed -e '1,1d' -e 's#[]\[]##g' -e 's#^.*/##'| \
    awk '{if ($0 ~ /^'$cur'/) print $0}' ))

  return 0
}

complete -F _killall killall killps

# completion for vim
function _vim()
{
  local cur prev idx ext

  COMPREPLY=()
  _get_comp_words_by_ref cur prev

  case $prev in
    -h|--help|-v|--version)
      return 0
      ;;
  esac

  if [[ "$cur" == -* ]] ; then
    local _vopts='-v -e -E -s -d -y -R -Z -m -M -b -l -C'
    _vopts="${_vopts} -N -V -D -n -r -r -L -A -H -F -T -u"
    _vopts="${_vopts} --noplugin -p -o -O --cmd -c -S -s -w -W"
    _vopts="${_vopts} -x -X --remote --remote-silent --remote-wait"
    _vopts="${_vopts} --remote-wait-silent --remote-tab --remote-send"
    _vopts="${_vopts} --remote-expr --serverlist --servername"
    _vopts="${_vopts} --startuptime -i -h --help --version"
    COMPREPLY=( $( compgen -W "${_vopts}" \
      -- "$cur" ) )
          return 0
  fi

  local _VIM_IGNORE=(pdf xdvi jpg pyc exe tar zip ps)
  _filedir
  for idx in ${!COMPREPLY[@]}; do
    ext=${COMPREPLY[$idx]}
    ext=${ext##*.}
    for iext in ${_VIM_IGNORE[@]}; do
      if test "$ext" = "$iext"; then
        unset -v COMPREPLY[$idx]
        break
      fi
    done
  done
  return 0
}
complete -F _vim vim vi v gv gvi vd va

#function just()
#{
#unset -f just
#eval "$(command just --completions bash)"
#just "$@"
#}

function setcomps
{
  local start=$(date +%s%3N)
  folders=(
    $HOME/bin/links/completions
    ${CONFIG_HOME}/completions
  )
  for folder in ${folders[@]}; do
    [ ! -e "${folder}" ] && continue
    for file in ${folder}/*; do
      . $file
    done
  done

  # several completions that we get from command line
  complete -o default _F __start_kubectl kc
  complete -o default -F __start_oh-my-posh posh

  _eval_cmd_expression_if_exists just --completions ${CURSHELL}
  _eval_cmd_expression_if_exists command just --completions ${CURSHELL}
  _eval_cmd_expression_if_exists atuin gen-completions --shell ${CURSHELL}
  _eval_cmd_expression_if_exists posh completion ${CURSHELL}
  _eval_cmd_expression_if_exists starship completions ${CURSHELL}
  _eval_cmd_expression_if_exists procs --gen-completion-out ${CURSHELL}
  _eval_cmd_expression_if_exists uv generate-shell-completion ${CURSHELL}

  local end=$(date +%s%3N)
  local duration=$((end - start))

  if [ "$MTIMER_ENABLED" == "1" ]; then
    echo "Elapsed time setcomps: ${duration} milliseconds"
  fi
}
setcomps

test -e ~/.local/bash-completion/etc/profile.d/bash_completion.sh && source ~/.local/bash-completion/etc/profile.d/bash_completion.sh


# fzf-completion
if test -d ~/tmp/gclones/fzf-tab-completion; then
  source ~/tmp/gclones/fzf-tab-completion/bash/fzf-bash-completion.sh
  bind -x '"\C-f": fzf_bash_completion'
fi

mtimer "completion end"
