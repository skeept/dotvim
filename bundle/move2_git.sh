#!/bin/bash

# I want to use git when it matters 

function do_git2_()
{
for folder in * ; do 
  if test ! -d $folder ; then continue; fi
  if mv $folder/.git $folder/._git >& /dev/null; then 
    printf "%30s: OK\n" $folder
  else
    printf "%-30s: no .git\n" $folder
  fi
done
}

function do_git_update()
{
for folder in * ; do 
  if test -d $folder; then 
    cd "$folder" >& /dev/null
    mv ._git .git >& /dev/null 
    if test -d .git; then 
      printf "\n>>> git >>>  %s\n" $(basename $PWD)
      GIT_SSL_NO_VERIFY=true git pull
    fi
    if test -d .hg ; then 
      printf "\n>>> hg >>>   %s\n" $(basename $PWD)
      hg pull -u
    fi
    cd ..
  fi
done
}

function main()
{
  if test -z "$@"; then
    echo "$0 -s : move .git to ._git"
    echo "$0 -u : update .git"
    echo -e "\n\n"
    do_git_update
    exit
  fi
  DO_UPDATE=0
  while getopts "us" flag
  do
    case $flag in 
      u) DO_UPDATE=1 ;;
    esac
  done
  if test $DO_UPDATE -eq 1 ; then
    do_git_update
  else
    do_git2_
  fi
}

main "$@"
