#!/bin/bash

# I want to use git when it matters 

function do_git2_()
{
for folder in * ; do 
  if mv $folder/.git $folder/._git >& /dev/null; then 
    printf "%30s: OK\n" $folder
  else
    printf "%-30s: no .git\n" $folder
  fi
done
}

function do_git_from_()
{
for folder in * ; do 
  if mv $folder/._git $folder/.git >& /dev/null; then 
    echo -n "."
  else
    echo -n "#"
  fi
done
}


#do_git2_
do_git2_
