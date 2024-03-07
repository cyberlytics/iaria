@echo off

rem ***************************************************************************
rem * author: Christoph P. Neumann
rem ***************************************************************************
cd /d "%~dp0"
if "%~1"=="" goto usage

latexmk -pdf "%~nx1"

pause
goto :eof
:usage
@echo Usage: %0 ^<tex-file^>
exit /B 1