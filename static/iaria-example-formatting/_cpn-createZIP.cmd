@echo off
setlocal enableDelayedExpansion

rem ***************************************************************************
rem * author: Christoph P. Neumann
rem ***************************************************************************
cd /D "%~dp0"
for %%i in (%CD%) do set BASEDIR=%%~ni
echo == %BASEDIR% ==

rem RESET
del "%BASEDIR%.zip" > nul 2> nul

rem CLEAN
latexmk -c
echo == Cleaning Extension ==
for %%I in (*.tex)  do (del "%%~dpnI.upa" 2> nul)
for %%I in (*.tex)  do (del "%%~dpnI.upb" 2> nul)
for %%I in (*.tex)  do (del "%%~dpnI.run.xml" 2> nul)
for %%I in (*.tex)  do (del "%%~dpnI-blx.bib" 2> nul)
for %%I in (*.tex)  do (del "%%~dpnI.synctex.gz" 2> nul)
for %%I in (*.tex)  do (del "%%~dpnI.tps" 2> nul)
rem for %%I in (*.tex)  do (del "%%~dpnI.pdf" 2> nul)

echo == Zipping ==
cd ..
7z a -xr@"%BASEDIR%\%~n0.lst" "%BASEDIR%.zip" .\%BASEDIR%\*
move "%BASEDIR%.zip" .\%BASEDIR%\
cd /D "%~dp0"

pause