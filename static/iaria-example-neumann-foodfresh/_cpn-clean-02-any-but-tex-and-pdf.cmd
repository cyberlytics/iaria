@echo off

rem ***************************************************************************
rem * author: Christoph P. Neumann
rem ***************************************************************************
cd /d "%~dp0"

for %%I in (*.tex)  do (
	echo == %%I ==
	mv "%%~I" "%%~nI_save.tex"
	mv "%%~nI.pdf" "%%~nI_save.pdf" 2> nul
	del "%%~nI.*" 2> nul
	mv "%%~nI_save.tex" "%%~I" 
	mv "%%~nI_save.pdf" "%%~nI.pdf" 2> nul
)

pause