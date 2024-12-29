#!/bin/bash


function initial_setup_copy()
{
  # copy all files in folder to ~
  local folder=$1
  local dest=${HOME}
  [ -n "$2" ] && dest="$2"
  if [ -z "${folder}" -o  ! -d "${folder}" ]; then
    echo "need to provide a folder with files to copy"
    return 1
  fi
  if [ -z "${dest}" -o  ! -d "${dest}" ]; then
    echo "target $dest doesn't exist or not a folder"
    return 1
  fi
  echo "input=$folder destination=$dest"
  local target
  local from
  local exists
  for fn in $(command ls -A $folder); do
    from="${folder}/${fn}"
    target="${dest}/${fn}"
    exists="="
    echo "processing $from"
    if [ -d "${from}" ]; then
      # can bash handle recursive?
      mkdir -p $target >& /dev/null
      initial_setup_copy "${from}" "${target}"
      exists="_"
    else
      if [ -e  "${target}" ]; then
        # it's a file and already exists
        exists="#"
      else
        cp -i "${from}" "${target}"
      fi
    fi
    if [ "${exists}" != "_" ]; then
      printf "%s %-40s => %s\n" $exists $from $target
    fi
  done
}

initial_setup_copy $@
