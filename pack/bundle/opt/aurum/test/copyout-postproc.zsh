#!/bin/zsh
function normpaths()
{
    [[ ${PREFIX[-4,-1]} == wine ]] && local -x TMPDIR='T:'
    local -x ETMPDIR=${${${TMPDIR//\//%-}//:/%.}//\\/%+}
    perl -p -i -e 's/\Q$ENV{"TMPDIR"}\E/%TMPDIR%/g;
                   s/\Q$ENV{"ETMPDIR"}\E/%ETMPDIR%/g;' $1
}
function normdates()
{
    local -x datemap=""
    for (( month=1 ; month<=12 ; month++ )) ; do
        datemap+="$(date --date="2000-${month}-01" +%b) $(LANG=C date --date="2000-${month}-01" +%b) "
    done
    setopt rcquotes
    local -x TZ=$(date +%z)
    perl -p -i -e \
    'BEGIN { our %dm=split/ /,$ENV{"datemap"} }
     $_="$1".
        (substr `LANG=C date --date="$2 $dm{$3} $4 $ENV{TZ}" -u +"%d %b %Y %H:%M"`, 0, -1).
        "$5" 
     if /^(.*? Commited )(\d+) (\S+) (.*?)( by .*)/s;' $1
    [[ $1 == *cmd-log.ok ]] && \
    perl -p -i -e \
    'BEGIN { our %dm=split/ /,$ENV{"datemap"} }
     $_="$1".
        `LANG=C date --date="$3 $dm{$2} $5 $4 $6" -u +"%a %b %d %X %Y %z"` 
     if /^(.*?:(?:\+\+\+|---) \S+\s+)\S+ (\S+) (\d+) (\S+) (\d+) (\S+)/;' $1
}
normpaths $@
normdates $@
