#!/bin/zsh
emulate zsh
setopt rcquotes
from=${1:-frawor.vim}
perl -p -i -e \
'if((/s:_messages.*{$/ .. /^\s*\\\}/) && /^\s+\\\s*''([^'']+)'':/) {
    $_="$1\n";
}
else {
    undef $_;
}' < ../plugin/$from | \
    sort | \
    uniq | \
    while read mes ; do
        grep -qFr :$mes *.ok || echo $mes
    done
