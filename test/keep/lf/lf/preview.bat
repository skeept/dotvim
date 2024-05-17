
@echo off
setlocal



SET mypath=%~dp0
python %mypath%\preview.py %1 %2 %3 %4 %5 %6

endlocal