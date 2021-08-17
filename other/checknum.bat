rem @echo off
SetLocal EnableExtensions

rem test if no or void parameter (variable)
if "%~1" == "" (
	echo No arguments. Use  "%~n0%~x0  <test pattern>"
	exit /b 1
)

set INP=%~1

rem remove leader zero's
for /f "tokens=* delims=0" %%a in ("%INP%") do set INP=%%a
if "%INP%" == "" (
	set INP=0
)

rem number or not number
set /a "TINP=INP*1"
if NOT %TINP% == %INP% (
	echo Not number!
	exit /b 2
)

rem number type
if %INP% GEQ 0 (
	echo Positive integer
	exit /b 0
)
if %INP% LSS 0 (
	echo Negative integer
	exit /b 0
)