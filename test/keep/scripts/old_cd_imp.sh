
if false; then
elif test ${BASH_VERSION:0:1} -ge 4 ; then
  if test -z "${_my_dirs_data}" ; then declare -A _my_dirs_data; fi

  function d()
  {
    # get current folders in _my_dirs_data and dirs -v
    # will list each key followed by dirs
    local key
    local dkey
    local -A ff_tag
    local -A ff_dirs
    local -a mdirs
    local one_dir_key

    for key in "${!_my_dirs_data[@]}" ; do
      dkey="${_my_dirs_data[${key}]}"
      if test -z "${ff_tag[${dkey}]}";  then
        ff_tag[${dkey}]="${key}"
      else
        ff_tag[${dkey}]="${ff_tag[${dkey}]}:${key}"
      fi
    done

    mdirs=($(dirs -l -p))
    local idx=-1
    for dkey in "${mdirs[@]}"; do
      let idx++
      if test $idx -eq 0; then continue; fi
      if test -z "${ff_dirs[${dkey}]}";  then
        ff_dirs[${dkey}]="${idx}"
      else
        ff_dirs[${dkey}]="${ff_dirs[${dkey}]}:${idx}"
      fi
    done

    if test $# -eq 0; then
      for key in "${!ff_tag[@]}"; do
        one_dir_key=${ff_dirs[${key}]}
        one_dir_key=(${one_dir_key//:/ })
        one_dir_key=${one_dir_key[0]}
        printf "%-10s %2s %-s\n" "${ff_tag[${key}]}" "${one_dir_key}" "${key/${HOME}/~}"
      done
      for key in "${!ff_dirs[@]}"; do
        if test -n "${ff_tag[${key}]}"; then continue; fi
        one_dir_key=${ff_dirs[${key}]}
        one_dir_key=(${one_dir_key//:/ })
        one_dir_key=${one_dir_key[0]}
        printf "%-10s %2s %-s\n" " " "${one_dir_key}" "${key/${HOME}/~}"
      done
      return
    fi

    local curdir=${PWD}

    if test "$1" = "-"; then
      command cd -
      return
    fi

    local -a tmp_arr

    if test "$1" = "--"; then
      local deldir
      if test -z "$2"; then
        deldir="${curdir}"
      elif test -n "${_my_dirs_data[${2}]}"; then
        deldir="${_my_dirs_data[${2}]}"
      elif test "$2" -ge 0 >& /dev/null; then
        deldir=$(eval "dirs -l +${2}")
      else
        deldir=$(realpath "$2")
      fi
      if test -n "${ff_tag[${deldir}]}"; then
        IFS=':' read -a tmp_arr <<< ${ff_tag[${deldir}]}
        tmp_arr=(${tmp_arr})
        for i in "${tmp_arr[@]}"; do
          unset _my_dirs_data[${i}]
        done
      fi

      if test -n "${ff_dirs[${deldir}]}"; then
        IFS=':' read -a tmp_arr <<< ${ff_dirs[${deldir}]}
        tmp_arr=(${tmp_arr})
        for((i=${#tmp_arr[@]}-1; i>=0; i--)); do
          eval "popd -n +${tmp_arr[$i]}" > /dev/null
        done
      fi
      return
    fi

    if test "$1" = "+"; then
      # add folder to dirs even it exists already
      if test -n "$2"; then
        pushd "$2" > /dev/null
        pushd -n +1
      else
        pushd "${curdir}" > /dev/null
        pushd -n +1
      fi
      return
    fi

    if test "${1:0:1}" = "+"; then
      # add tag (bookmark)
      local tag
      tag="${1:1}"
      if test -n "$2"; then
        pushd "$2" > /dev/null
        pushd -n +1
      else
        pushd "${PWD}" > /dev/null
        pushd -n +1
      fi
      _my_dirs_data[${tag}]=$(realpath "${PWD}")
      return
    fi

    # when to add info to the correct hash array
    # finally cd to the current folder
    if test -n "${_my_dirs_data[${1}]}"; then
      eval "cd ${_my_dirs_data[${1}]}"
      __save_folder_hist "$PWD"
    elif test "$1" -ge 0 >& /dev/null; then
      eval "cd $(dirs +$1)"
      __save_folder_hist "$PWD"
    else
      cd $1
      __save_folder_hist "$PWD"
    fi
    return
  }

  __list_folder_hist()
  {
    # first argument is folder to be kept in history.
    # history will not be deleted so don't need much manipulation
    let i=0
    for key in "${__my_dirs_history[@]}"; do
      printf "%-30s   --  %s\n" "${key/${HOME}/~}" "$i"
      let i+=1
    done
  }
  __save_folder_hist()
  {
    local cand=$1
    for key in "${__my_dirs_history[@]}"; do
      if test "${cand}" = "${key}"; then
        return
      fi
    done
    # got here just add it to end of list
    __my_dirs_history+=("${cand}")
  }
  __change_folder_hist()
  {
    # change to a folder in history specifying a key
    # we assume the key will be valid
    if test "$1" -ge "${#__my_dirs_history[@]}" >& /dev/null; then
      return
    fi
    d "${__my_dirs_history[$1]}"
  }
  #interface function
  dh() {
    if test "a$1" = "a"; then
      __list_folder_hist
    else
      __change_folder_hist "$1"
    fi
  }

  function _d()
  {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(eval "compgen -W \"${!_my_dirs_data[@]}\" -- $cur") )
  }
  complete -o plusdirs -o nospace -F _d d

  function __d_add_folder()
  {
    #echo --1=$1-- --2=$2--
    # usage: $0 destination tag
    if test "a$1" = "a"; then return; fi
    # check if key already added, to many for push/popd
    existing=0
    for key in ${_my_dirs_data[@]}; do
      if test "$key" = "$1"; then
        existing=1;
        break;
      fi
    done
    if test "$existing" = "0"; then
      pushd -n "$1" > /dev/null
    fi
    if test "a$2" = "a"; then return; fi
    _my_dirs_data["$2"]="$1"
  }
else
  function d()
  {
    if test $# -eq 0; then
      dirs -v
    else
      if test $1 -ge 1 -o $1 -le 20 >& /dev/null; then
        eval "cd ~$1"
      else
        if test "$1" = "-"; then
          cd -
        else
          pushd $1 >& /dev/null
          if test $? -ne 0; then pushd $1 ; fi
        fi
      fi
    fi
  }
fi
