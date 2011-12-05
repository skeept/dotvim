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
      GIT_SSL_NO_VERIFY=true git pull origin master &
    fi
    if test -d .hg ; then 
      printf "\n>>> hg >>>   %s\n" $(basename $PWD)
      hg pull -u &
    fi
    cd ..
  fi
done
}
function do_git_update2()
{
git_folders=""
for folder in * ; do 
  if test -d $folder; then 
    mv ${folder}/._git ${folder}/.git >& /dev/null 
    if test -d ${folder}/.git; then 
      git_folders="$git_folders $folder"
    fi
    if test -d ${folder}/.hg ; then 
      hg_folders="${hg_folders} $folder"
    fi
  fi
done
parallel -j 20 "cd {}; echo \">>> git  >>> {} \" ; GIT_SSL_NO_VERIFY=true git pull origin master" ::: $git_folders
parallel -j 20 "cd {}; echo \">>> hg   >>> {} \" ; hg pull -u                                   " ::: $hg_folders
echo "git_folders #$git_folders#"
echo "hg_folders #$hg_folders#"
}

function main()
{
  if test -z "$@"; then
    echo "$0 -s : move .git to ._git"
    echo "$0 -u : update .git"
    echo -e "\n"
    do_git_update2
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
