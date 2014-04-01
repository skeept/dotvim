#!/bin/bash

# create archive from another branch, delete some folders here and replace content

rm -rf bundle
rm -rf notused_plugins
rm -rf colors
rm -rf plugins
rm -rf autoload
rm -rf doc
rm -rf Ultisnips
rm -rf compiler
rm -rf spell
rm -rf syntax
rm -rf after
rm -rf indent

rm -rf localBitb.tar

git archive localBitb > localBitb.tar

tar xf localBitb.tar

# push localbitb to remote master:
# git push bitb localBitB:master
