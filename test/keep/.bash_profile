# change DEFAULT_TERM to suit your needs
#
#
DEFAULT_TERM="xterm"
#
#
#
# -----------------------------------------------------------
# now run standard profile
# -----------------------------------------------------------
#

alias b="exec bash"

test -f ${HOME}/.bashrc1 && source ${HOME}/.bashrc1

unset DOT_BASHRC_READ

set read_bash_profile
