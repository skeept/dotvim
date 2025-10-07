@echo off
setlocal

:: Get the directory where this batch script is located
SET "mypath=%~dp0"

:: The first argument passed by lf is the filename.
:: We use %* to pass all arguments (filename, width, height, etc.) to the python script.
python "%mypath%preview.py" %*

endlocal
