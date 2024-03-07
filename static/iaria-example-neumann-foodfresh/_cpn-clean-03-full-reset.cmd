@echo off

rem ***************************************************************************
rem * author: Christoph P. Neumann
rem ***************************************************************************
cd /d "%~dp0"

latexmk -C

for %%I in (*.tex)  do (del "%%~dpnI.bbl" 2> nul)
for %%I in (*.tex)  do (del "%%~dpnI.upa" 2> nul)
for %%I in (*.tex)  do (del "%%~dpnI.upb" 2> nul)
for %%I in (*.tex)  do (del "%%~dpnI.run.xml" 2> nul)
for %%I in (*.tex)  do (del "%%~dpnI-blx.bib" 2> nul)
for %%I in (*.tex)  do (del "%%~dpnI.synctex.gz" 2> nul)
for %%I in (*.tex)  do (del "%%~dpnI.tps" 2> nul)

del selfref.bib  2> nul
del embedded.bib 2> nul

pause