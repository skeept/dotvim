#!/bin/zsh
# Omit errors caused by tempnames clash
(( ISWINE )) && typeset -rix MAXJOBS=1
