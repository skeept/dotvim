#!/bin/bash

echo "Run script inside tmux. Should have 2 panes created. Run this from first pane. folder with themes"
[ -n "$1" ] && tmux_pane=$1 || tmux_pane=1
for fn in *.omp.json; do
  echo $fn
  fn="$(realpath $fn)"
  v="tmux send-keys -t $tmux_pane 'eval \"\$(posh prompt init bash --config $fn)\"' enter false enter '\\' enter '\\' enter"
  eval "$v"
  read a
done
