#!/bin/bash

# I want to use git when it matters 

THIS_SCRIPT="$0"


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
      GIT_SSL_NO_VERIFY=true git pull origin master
    fi
    if test -d .hg ; then 
      printf "\n>>> hg >>>   %s\n" $(basename $PWD)
      hg pull -u
    fi
    cd ..
  fi
done
}

function do_git_update2()
{
  git_folders=""
  hg_folders=""
  bz_folders=""
  for folder in * ; do 
    if test -d $folder; then 
      mv ${folder}/._git ${folder}/.git >& /dev/null 
      if test -d ${folder}/.git; then 
        git_folders="$git_folders $folder"
      fi
      if test -d ${folder}/.hg ; then 
        hg_folders="${hg_folders} $folder"
      fi
      if test -d ${folder}/.bzr ; then 
        bzr_folders="${bzr_folders} $folder"
      fi
    fi
  done

  #can we do it multiline?
  git_cmd=$(cat << EOF
cd {} >& /dev/null
echo ">>> git >>> {}";
GIT_SSL_NO_VERIFY=true git pull 2>&1 |\
  grep -v "Already up-to-date" |\
  grep -v "Already up to date" |\
  grep -v "github.com" |\
  grep -v "Updating " |\
  grep -v "Fast-forward" |\
  grep -v "^From " |\
  grep -v "in responses" |\
  grep -v -i "FETCH_HEAD"
EOF
)
  #printf "$git_cmd"

  hg_cmd=$(cat << EOF
cd {} >& /dev/null
echo ">>> hg >>> {}";
hg pull -u 2>&1 |\
  grep -v "searching for changes" |\
  grep -v "all remote heads known locally" |\
  grep -v "no changes found" |\
  grep -v "in responses" |\
  grep -v "pulling from"
EOF
)

  bzr_cmd=$(cat << EOF
cd {} >& /dev/null
echo ">>> bzr >>> {}";
bzr pull 2>&1 |\
  grep -v "All changes applied successfully" |\
  grep -v "Now on revision" |\
  grep -v "Using saved parent location" |\
  grep -v "No revisions or tags to pull" |\
  grep -v "No revisions to pull"
EOF
)

#num parallel jobs
num_parallel=3
verbose_cmd=pwd

  if test -n "$git_folders"; then
    #parallel -j 20 "cd {}; echo \">>> git  >>> {} \" ; GIT_SSL_NO_VERIFY=true git pull origin master" ::: $git_folders
    parallel -j $num_parallel "bash $THIS_SCRIPT update_cmd git {}" ::: $git_folders
  fi
  if test -n "$hg_folders"; then
    :
    #parallel -j 20 "cd {}; echo \">>> hg   >>> {} \" ; hg pull -u" ::: $hg_folders
    #parallel -j 20 "${hg_cmd}" ::: $hg_folders
    #parallel -j $num_parallel "bash $THIS_SCRIPT update_cmd hg {}" ::: $hg_folders
  fi
  if test -n "$bzr_folders"; then
    :
    #parallel -j 20 "${bzr_cmd}" ::: $bzr_folders
    #parallel -j $num_parallel "bash $THIS_SCRIPT update_cmd bzr {}" ::: $bzr_folders
  fi
}


function update_cmd()
{
  #curdir=${PWD}
  if test "$1" = "git"; then
    prog="git"
    cd "$2" 2>&1 > /dev/null
    $verbose_cmd
    output=$(GIT_SSL_NO_VERIFY=true git pull 2>&1 |\
      grep -v "Already up-to-date" |\
      grep -v "Already up to date" |\
      grep -v "github.com" |\
      grep -v "Updating " |\
      grep -v "Fast-forward" |\
      grep -v "^From " |\
      grep -v -i "FETCH_HEAD"
    )
  fi

  if test "$1" = "hg"; then
    prog="hg"
    cd "$2" 2>&1 > /dev/null
    $verbose_cmd
    output=$(hg pull -u 2>&1 |\
      grep -v "searching for changes" |\
      grep -v "all remote heads known locally" |\
      grep -v "no changes found" |\
      grep -v "pulling from"
    )
  fi

  if test "$1" = "bzr"; then
    prog="bzr"
    cd "$2" 2>&1 > /dev/null
    $verbose_cmd
    output=$(bzr pull 2>&1 |\
      grep -v "All changes applied successfully" |\
      grep -v "Now on revision" |\
      grep -v "Using saved parent location" |\
      grep -v "No revisions or tags to pull" |\
      grep -v "No revisions to pull"
    )
  fi

  if test -n "$output"; then
    echo ">>> ${prog}: $2"
    echo "$output"
  fi
}

function usage()
{
  echo "$0 -s : move .git to ._git"
  echo "$0 -u : update .git"
}

function main()
{
  if test "$#" -eq 0; then
    do_git_update2
    exit
  elif test "$1" = "-h"; then
    usage
    exit
  elif test "$1" = "update_cmd"; then
    shift
    update_cmd "$@"
    exit
  fi
}

main "$@"
