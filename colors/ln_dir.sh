#!/bin/sh

dir=$1

if test -n "$dir"; then
  for file in $dir/* ; do
    echo "linking $file"
    ln -s $file .
  done
else
  echo "provide some folder as argument..."
fi
