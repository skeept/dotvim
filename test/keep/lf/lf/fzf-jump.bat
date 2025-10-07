@echo off
setlocal
for /f "usebackq tokens=*" %%F in (`fd --hidden --exclude .git ^| fzf --reverse --preview "bat --color=always --style=plain {}"`) do (
    set "res=%%F"
)
if defined res (
    if exist "%res%\" (
        set "cmd=cd"
    ) else (
        set "cmd=select"
    )
    lf -remote "send %id% %cmd% \"%res%\""
)
