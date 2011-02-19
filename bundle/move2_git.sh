#!/bin/bash

# I want to use git when it matters 

function do_git2_()
{
for folder in * ; do 
  mv $folder/.git $folder/._git
done
}

function do_git_from_()
{
for folder in * ; do 
  mv $folder/._git $folder/.git
done
}


#do_git2_
do_git2_
