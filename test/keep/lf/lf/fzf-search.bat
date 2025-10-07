@echo off
setlocal
set "RG_PREFIX=rg --column --line-number --no-heading --color=always --smart-case"
for /f "delims=: tokens=1" %%F in ('fzf --ansi --layout=reverse --header "Search in files" --bind "change:reload:%RG_PREFIX% {q} || true"') do (
    set "result=%%F"
)
if defined result (
    lf -remote "send %id% select \"%result%\""
)
