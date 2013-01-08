#!/bin/bash

# use this to temporaraly move .git folder to a new folder
# and commit the files in that plugin, which whill be later tracked by git
# anyway


original_name=$1

mv $original_name ${original_name}_
mv ${original_name}_/.git ${original_name}_/._git >& /dev/null

git add .
git commit -a -m "${original_name}_"
mv ${original_name}_ ${original_name}
git add .
git commit -a -m "${original_name}_ --> ${original_name}"
mv ${original_name}/_.git ${original_name}/.git >& /dev/null
