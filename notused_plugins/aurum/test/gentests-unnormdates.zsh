#!/bin/zsh
() {
    perl -p -i -e \
    '$_="$1".
        (substr `date --date="$2 UTC" +"%d %b %Y %H:%M"`, 0, -1).
        "$3" 
     if /^(.*? Commited )(.*?)( by .*)/s;' *.ok
    perl -p -i -e \
    '$_="$1".
        `date --date="$3 $2 $5 $4 $6" +"%a %b %d %X %Y %z"` 
     if /^(.*?:(?:\+\+\+|---) \S+\s+)\S+ (\S+) (\d+) (\S+) (\d+) (\S+)/;' \
         cmd-log.ok
}
