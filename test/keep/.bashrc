

# bashrc is read when executing exec bash or when executing ssh hostname <cmd>

if [[ $- == *i* ]]; then
  source ${HOME}/.bashrc1
fi
