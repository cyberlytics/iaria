@echo off

rem ***************************************************************************
rem * author: Christoph P. Neumann
rem ***************************************************************************
cd /d "%~dp0"

rem OPTIONS:
rem     -f, --flags <flags>
rem             Regex flags. May be combined (like `-f mc`).
rem 
rem             c - case-sensitive
rem             e - disable multi-line matching
rem             i - case-insensitive
rem             m - multi-line matching
rem             s - make `.` match newlines
rem             w - match full words only
rem    -s, --string-mode
rem            Treat expressions as non-regex strings
			
type "%~n0.pre" > "%~n1.cls"

type "%~nx1" | sd -s "usepackage" "RequirePackage" >> "%~n1.cls"
rem type "%~nx1" | sd -f ec "(\w+)\s+\+(\w+)\s+(\w+)" "cmd: $1, channel: $2, subcmd: $3" > "%%~n1.ind"

type "%~n0.post" >> "%~n1.cls"

pause